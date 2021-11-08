From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v0 42/42] notifier: Return an error when
 callback is already registered
Date: Mon, 8 Nov 2021 22:18:47 +0100
Message-ID: <YYmUN69Y7z9xITas@zn.tnic>
References: <20211108101157.15189-1-bp@alien8.de>
 <20211108101157.15189-43-bp@alien8.de>
 <CAMuHMdWH+txiSP_d7Jc4f_bU8Lf9iWpT4E3o5o7BJr-YdA6-VA@mail.gmail.com>
 <YYkyUEqcsOwQMb1S@zn.tnic>
 <CAMuHMdXiBEQyEXJagSfpH44hxVA2t0sDH7B7YubLGHrb2MJLLA@mail.gmail.com>
 <YYlJQYLiIrhjwOmT@zn.tnic>
 <CAMuHMdXHikGrmUzuq0WG5JRHUUE=5zsaVCTF+e4TiHpM5tc5kA@mail.gmail.com>
 <YYlOmd0AeA8DSluD@zn.tnic>
 <20211108205926.GA1678880@rowland.harvard.edu>
Mime-Version: 1.0
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1636406333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=AU7V4fSHGUK4yNvIX3QFWGgL2mpvsQwlJrzk1EYTZE4=;
 b=HI4wHVqdPFUaTmLfTawRP0YuILjCSvy0XvR7UY6GhjpkLZ7Jcpensq3GPz/wKuSVQPh/ah
 JjfisFcmsOLL77YybjTfUcF4SOtfsMptjoCY2iNpL/QAVX8IlmhT4tll2zqUciAF4fFC2q
 GhOxoJIWWV9UKbtfg9ziQ2wDV7UERPU=
Content-Disposition: inline
In-Reply-To: <20211108205926.GA1678880@rowland.harvard.edu>
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
To: Alan Stern <stern@rowland.harvard.edu>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>, the arch/x86 maintainers <x86@kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, linux-iio@vger.kernel.org, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, linux-hyperv@vger.kernel.org, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, netdev <netdev@vger.kernel.org>, Ayush Sawal <ayush.sawal@chelsio.com>, sparclinux <sparclinux@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, linux-leds <linux-leds@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>, Rohit Maheshwari <rohitm@chelsio.com>, linux-staging@lists.linux.dev, Geert Uytterhoeven <geert@linux-m68k.org>, openipmi-developer@lists.sourceforge.net, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, open list:TENSILICA XTENSA PORT (

On Mon, Nov 08, 2021 at 03:59:26PM -0500, Alan Stern wrote:
> Is there really any reason for returning an error code?  For example, is 
> it anticipated that at some point in the future these registration calls 
> might fail?
> 
> Currently, the only reason for failing...

Right, I believe with not making it return void we're leaving the door
open for some, *hypothetical* future return values if we decide we need
to return them too, at some point.

Yes, I can't think of another fact to state besides that the callback
was already registered or return success but who knows what we wanna do
in the future...

And so if we change them all to void now, I think it'll be a lot more
churn to switch back to returning a non-void value and having the
callers who choose to handle that value, do so again.

So, long story short, keeping the retval - albeit not very useful right
now - is probably easier.

I hope I'm making some sense here.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
