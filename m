From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v0 42/42] notifier: Return an error when
 callback is already registered
Date: Mon, 8 Nov 2021 15:21:04 +0100
Message-ID: <YYkyUEqcsOwQMb1S@zn.tnic>
References: <20211108101157.15189-1-bp@alien8.de>
 <20211108101157.15189-43-bp@alien8.de>
 <CAMuHMdWH+txiSP_d7Jc4f_bU8Lf9iWpT4E3o5o7BJr-YdA6-VA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1636381269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=oWsCJGhsvF17zUFafKKKz1XGvPrCUoTgLb0x72qzY0w=;
 b=DvalVyPWlBMIVGIell7SDhnTX9Q86iHxoTdmXzPxorrW7sqlHpzQzwtFgZEI1KmHXq30Gs
 yOE/y0FWs3djKZaj7cQDtIyWYYD5AKtdhjFE5l3EWLo8DNcP+YE1HL9C5d3kHwZrzRPHP8
 xiS/nYCk2AFbtbv/wLq5RqiIdGlMN38=
Content-Disposition: inline
In-Reply-To: <CAMuHMdWH+txiSP_d7Jc4f_bU8Lf9iWpT4E3o5o7BJr-YdA6-VA@mail.gmail.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>, the arch/x86 maintainers <x86@kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, linux-iio@vger.kernel.org, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, linux-hyperv@vger.kernel.org, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, netdev <netdev@vger.kernel.org>, Ayush Sawal <ayush.sawal@chelsio.com>, sparclinux <sparclinux@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, linux-leds <linux-leds@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>, Rohit Maheshwari <rohitm@chelsio.com>, linux-staging@lists.linux.dev, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, openipmi-developer@lists.sourceforge.net, xen-devel@lists.xenproject.org, "open list:TENSILICA XTENSA PORT (xtensa)" <l>

On Mon, Nov 08, 2021 at 03:07:03PM +0100, Geert Uytterhoeven wrote:
> I think the addition of __must_check is overkill, leading to the
> addition of useless error checks and message printing.

See the WARN in notifier_chain_register() - it will already do "message
printing".

> Many callers call this where it cannot fail, and where nothing can
> be done in the very unlikely event that the call would ever start to
> fail.

This is an attempt to remove this WARN() hack in
notifier_chain_register() and have the function return a proper error
value instead of this "Currently always returns zero." which is bad
design.

Some of the registration functions around the tree check that retval and
some don't. So if "it cannot fail" those registration either should not
return a value or callers should check that return value - what we have
now doesn't make a whole lot of sense.

Oh, and then fixing this should avoid stuff like:

+	if (notifier_registered == false) {
+		mce_register_decode_chain(&amdgpu_bad_page_nb);
+		notifier_registered = true;
+	}

from propagating in the code.

The other idea I have is to add another indirection in
notifier_chain_register() which will check the *proper* return value of
a lower level __notifier_chain_register() and then issue that warning.
That would definitely avoid touch so many call sites.

Bottom line is: what we have now needs cleaning up.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
