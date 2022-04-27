From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH 14/30] panic: Properly identify the panic event to the
 notifiers' callbacks
Date: Wed, 27 Apr 2022 19:49:08 -0300
Message-ID: <20220427224924.592546-15-gpiccoli@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4xxU1ct6EY0yT6BjAkP3bi4qTmhWag2Ix2EsvqSo4vI=; b=AYs+UD4ZljWKjh
	8fuqkINgKlFnlMQBiPBrf82I5Sny//Dc2gmet6N24/LO8lllZ2UpfZTHznI0SJxmCbI+OPW6AMN4E
	MU4I5srpowrmhjg1w6XOUycNPKnaNXueQS60tAi332XxJyTG0aXm4SpqEriebwY1JZp/vv7gb7t+u
	SKCQrvujlNY4ujTtere7YQeVKAr8ojgySDeZZFIlpE6TAwLxTBBcQiTSmxKJWnyIodyuTXnh91Kt3
	aOuQOXaghExm3p4VR7hHMHjVKUvtKsiZZ4B5yircs8DjU2A2rm4rC1QvzFXCCixOj8RTSGuo9nRve
	78lU57GQs7nDRNArfALw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mOzFWStqo1l1SFAwioSEW9cov+DtDc5WSMbZaYL5OFk=; b=jORyziNh7Mp7CJnb2ldBvIVUYT
 miqK/KwxTCDE0PrnGOVoO5V4xtjW+TEXZOKHxzyxZAzEuCslLE//gxMpeQbei+ydr8zg3pnWZUWxE
 L40pn68w+NUbAHLuqvLt2UI0hgcbpQZODu83KlzMI8qRKWoyX30oYob/b9pQLrf+6HFREi99ePbwb
 zW4TblodvYrIgJCYkkWUlwk3Cl/V3uSBOUWLD/GIZmkaB62kyu6wuslAaH0LxO2Qqyrw8rvwJQSXp
 vohmbyikfHUVSRBgOx4Bv9HUeJbAvmB/X4rw1kDURxjWp8eCgUztnLBZm1GN+7lilt+TPvGD7Gymp
 FQwd7uqA==;
In-Reply-To: <20220427224924.592546-1-gpiccoli@igalia.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-um/>
List-Post: <mailto:linux-um@lists.infradead.org>
List-Help: <mailto:linux-um-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=subscribe>
Sender: "linux-um" <linux-um-bounces@lists.infradead.org>
Errors-To: linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org
To: akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, gpiccoli@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com, andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.

The notifiers infrastructure provides a way to pass an "id" to the
callbacks to determine what kind of event happened, i.e., what is
the reason behind they getting called.

The panic notifier currently pass 0, but this is soon to be
used in a multi-targeted notifier, so let's pass a meaningful
"id" over there.

Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 include/linux/panic_notifier.h | 5 +++++
 kernel/panic.c                 | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/panic_notifier.h b/include/linux/panic_notifier.h
index 41e32483d7a7..07dced83a783 100644
--- a/include/linux/panic_notifier.h
+++ b/include/linux/panic_notifier.h
@@ -9,4 +9,9 @@ extern struct atomic_notifier_head panic_notifier_list;
 
 extern bool crash_kexec_post_notifiers;
 
+enum panic_notifier_val {
+	PANIC_UNUSED,
+	PANIC_NOTIFIER = 0xDEAD,
+};
+
 #endif	/* _LINUX_PANIC_NOTIFIERS_H */
diff --git a/kernel/panic.c b/kernel/panic.c
index eb4dfb932c85..523bc9ccd0e9 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -287,7 +287,7 @@ void panic(const char *fmt, ...)
 	 * Run any panic handlers, including those that might need to
 	 * add information to the kmsg dump output.
 	 */
-	atomic_notifier_call_chain(&panic_notifier_list, 0, buf);
+	atomic_notifier_call_chain(&panic_notifier_list, PANIC_NOTIFIER, buf);
 
 	panic_print_sys_info(false);
 
-- 
2.36.0
