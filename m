From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v0 00/42] notifiers: Return an error when callback is
 already registered
Date: Mon, 8 Nov 2021 15:35:50 +0100
Message-ID: <YYk1xi3eJdMJdjHC@zn.tnic>
References: <20211108101157.15189-1-bp@alien8.de>
 <20211108101924.15759-1-bp@alien8.de>
 <20211108141703.GB1666297@rowland.harvard.edu>
 <YYkzJ3+faVga2Tl3@zn.tnic>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1636382156;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=B6oOQ1q4gjLTOu5usgfET43xDRmf4tLazw1TZ6CRXFw=;
        b=Upd25HzfEqhrG5TAXmV4X7VLTXjG+2mbIZvAcNaA5XdFGwWxC22cjGdH367SqKuC2YI35V
        XePkT+plNO8Rcdx9qRLbflORPHDjzc4q/HfinrM2oVoUmKJ3f3FbXqZbeiIVI7zzNRafCc
        NDGlsVX5pxz7i7hCYlNzvvCrAxbHbAs=
Content-Disposition: inline
In-Reply-To: <YYkzJ3+faVga2Tl3@zn.tnic>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern@rowland.harvard.edu>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ayush Sawal <ayush.sawal@chelsio.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rohit Maheshwari <rohitm@chelsio.com>, Steven Rostedt <rostedt@goodmis.org>, Vinay Kumar Yadav <vinay.yadav@chelsio.com>, alsa-devel@alsa-project.org, bcm-kernel-feedback-list@broadcom.com, intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-iio@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linuxppc-dev@lists

On Mon, Nov 08, 2021 at 03:24:39PM +0100, Borislav Petkov wrote:
> I guess I can add another indirection to notifier_chain_register() and
> avoid touching all the call sites.

IOW, something like this below.

This way I won't have to touch all the callsites and the registration
routines would still return a proper value instead of returning 0
unconditionally.

---
diff --git a/kernel/notifier.c b/kernel/notifier.c
index b8251dc0bc0f..04f08b2ef17f 100644
--- a/kernel/notifier.c
+++ b/kernel/notifier.c
@@ -19,14 +19,12 @@ BLOCKING_NOTIFIER_HEAD(reboot_notifier_list);
  *	are layered on top of these, with appropriate locking added.
  */
 
-static int notifier_chain_register(struct notifier_block **nl,
-		struct notifier_block *n)
+static int __notifier_chain_register(struct notifier_block **nl,
+				     struct notifier_block *n)
 {
 	while ((*nl) != NULL) {
-		if (unlikely((*nl) == n)) {
-			WARN(1, "double register detected");
-			return 0;
-		}
+		if (unlikely((*nl) == n))
+			return -EEXIST;
 		if (n->priority > (*nl)->priority)
 			break;
 		nl = &((*nl)->next);
@@ -36,6 +34,18 @@ static int notifier_chain_register(struct notifier_block **nl,
 	return 0;
 }
 
+static int notifier_chain_register(struct notifier_block **nl,
+				   struct notifier_block *n)
+{
+	int ret = __notifier_chain_register(nl, n);
+
+	if (ret == -EEXIST)
+		WARN(1, "double register of notifier callback %ps detected",
+			n->notifier_call);
+
+	return ret;
+}
+
 static int notifier_chain_unregister(struct notifier_block **nl,
 		struct notifier_block *n)
 {


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
