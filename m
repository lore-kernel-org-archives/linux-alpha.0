From: Petr Mladek via Openipmi-developer
 <openipmi-developer@lists.sourceforge.net>
Subject: Re: [PATCH 14/30] panic: Properly identify the
 panic event to the notifiers' callbacks
Date: Tue, 10 May 2022 17:16:01 +0200
Message-ID: <YnqBsXBImU64PAOL@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-15-gpiccoli@igalia.com>
Reply-To: Petr Mladek <pmladek@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <openipmi-developer-bounces@lists.sourceforge.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OZqtmv8UjkqRBSiOYZ6ar9KDyJT6hDNxXl9SSULCXTQ=; b=kGXTZN3SVFCCRJKz01Aq+de5CR
 hFMBlZHdy6+GrqAbksIo3EIEl5HrUUakgog2ECGGCKaNTPybpnBB3M6WsxnyaXIEuzHIgJ/G7yBVM
 xfkBnEp52eWxBM7vCVCaDcE4APkJsWg7A+INjvKfbvpZgb7iOGwXF1RvhXI0AcgXM1cE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OZqtmv8UjkqRBSiOYZ6ar9KDyJT6hDNxXl9SSULCXTQ=; b=egzUJgnu/FUTzqnBV6qNcmxF8R
 TK8zzXA0XNGiiTCFbQdP+bSJhhNz73TNVLWCU+mpKoe+pW9y2zoc52nn5BTmoDF98WVagdTPoecbp
 yAblx8MRVDx6QSD7BQAQtY3OzL67Q6Hst4C37xcJswYpXU1mSX4zKZLFPSzaPhonlHuk=;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1652195767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OZqtmv8UjkqRBSiOYZ6ar9KDyJT6hDNxXl9SSULCXTQ=;
 b=fGhdvJlPt//dq0KQAtVijfj/ESEJ/OC2EKpevE2XN9mzQ9A1L9iCAxeXNQ+pUyb1Mv1UlE
 HCruB1nKt1ZaJRQk1txzbCvkQt9XnVOQap2jC6oxObMWliWuUvAfiBCulbtCmC4sio8+xa
 +ZqWsGMsijF1KXpHWJf4ANyjUo2sNOU=
Content-Disposition: inline
In-Reply-To: <20220427224924.592546-15-gpiccoli@igalia.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/openipmi-developer>, 
 <mailto:openipmi-developer-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=openipmi-developer>
List-Post: <mailto:openipmi-developer@lists.sourceforge.net>
List-Help: <mailto:openipmi-developer-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/openipmi-developer>, 
 <mailto:openipmi-developer-request@lists.sourceforge.net?subject=subscribe>
Errors-To: openipmi-developer-bounces@lists.sourceforge.net
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-hyperv@vger.kernel.org, halves@canonical.com, gregkh@linuxfoundation.org, peterz@infradead.org, alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org, feng.tang@intel.com, linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com, sparclinux@vger.kernel.org, will@kernel.org, tglx@linutronix.de, linux-leds@vger.kernel.org, linux-s390@vger.kernel.org, mikelley@microsoft.com, john.ogness@linutronix.de, bhe@redhat.com, corbet@lwn.net, paulmck@kernel.org, fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org, dyoung@redhat.com, vgoyal@redhat.com, linux-xtensa@linux-xtensa.org, dave.hansen@linux.intel.com, keescook@chromium.org, arnd@arndb.de, linux-pm@vger.kernel.org, coresight@lists.linaro.org, linux-um@lists.infradead.org, rostedt@goodmis.org, rcu@vger.kernel.org, bp@alien8.de, luto@ke

On Wed 2022-04-27 19:49:08, Guilherme G. Piccoli wrote:
> The notifiers infrastructure provides a way to pass an "id" to the
> callbacks to determine what kind of event happened, i.e., what is
> the reason behind they getting called.
> 
> The panic notifier currently pass 0, but this is soon to be
> used in a multi-targeted notifier, so let's pass a meaningful
> "id" over there.
>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
>  include/linux/panic_notifier.h | 5 +++++
>  kernel/panic.c                 | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/panic_notifier.h b/include/linux/panic_notifier.h
> index 41e32483d7a7..07dced83a783 100644
> --- a/include/linux/panic_notifier.h
> +++ b/include/linux/panic_notifier.h
> @@ -9,4 +9,9 @@ extern struct atomic_notifier_head panic_notifier_list;
>  
>  extern bool crash_kexec_post_notifiers;
>  
> +enum panic_notifier_val {
> +	PANIC_UNUSED,
> +	PANIC_NOTIFIER = 0xDEAD,
> +};

Hmm, this looks like a hack. PANIC_UNUSED will never be used.
All notifiers will be always called with PANIC_NOTIFIER.

The @val parameter is normally used when the same notifier_list
is used in different situations.

But you are going to use it when the same notifier is used
in more lists. This is normally distinguished by the @nh
(atomic_notifier_head) parameter.

IMHO, it is a bad idea. First, it would confuse people because
it does not follow the original design of the parameters.
Second, the related code must be touched anyway when
the notifier is moved into another list so it does not
help much.

Or do I miss anything, please?

Best Regards,
Petr
