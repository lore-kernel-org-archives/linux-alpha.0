From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] Alpha: Remove redundant local asm header redirections
Date: Thu, 14 Apr 2022 16:06:17 -0700
Message-ID: <CAEdQ38EpBMnkP-PNZnwaoO4poFJQO5YSFJeZgiQ-obJmjogBFQ@mail.gmail.com>
References: <alpine.DEB.2.21.2202131944000.34636@angie.orcam.me.uk>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FWv6HfHgguUI/DkyUK/M7ub8F2Hnwf3DDEuvQm5kh6I=;
        b=jVw4GOcH3RcqMdY546tIfnHKAzKSFVrfdcuyiuXhRJIGn3nRu3J2PWpR+iHQpxNCTY
         jQ+0GaJtldFjCISeshgIIbBqo4oIUDlIb2qyJuoM95LzxDapZG3cPvzVonUy6xEh/i/W
         HT3l3O5uRTjYEK74yI6QMkszUHbK7FxncW1YiS4MXVD82YEfd+o7h7CYbke3vwYkAEXp
         8iCVEpE2NEUhRNGFRzsTDyxZikHEbFp3EcSb61jiQ+HnVFLDMMMVA5lV5M88Ym/c/Y2Q
         jTJREQhCH+nOyy+EB2bqJ7wdOuEGmLUZAr809Jwb1ijz5rROe9L/UeH3noCgbUKxb6+f
         O3Vw==
In-Reply-To: <alpine.DEB.2.21.2202131944000.34636@angie.orcam.me.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha <linux-alpha@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Sun, Feb 13, 2022 at 12:01 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
> Remove a number of asm headers locally redirected to the respective
> generic or generated versions.
>
> For asm-offsets.h all that is needed is a Kbuild entry for the generic
> version, and for div64.h, irq_regs.h and kdebug.h nothing is needed as
> in their absence they will be redirected automatically according to
> include/asm-generic/Kbuild.
>
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> ---
> Hi,
>
>  Noticed while fiddling with Kbuild for PARPORT_PC.  Please apply.
>
>   Maciej


Sorry for the delay. I'll apply this. I just haven't had much time for
alphas lately.

Maybe now's a good time to remind you that I'm still waiting on you to
upstream the m41t80/SWARM/i2c/smbus patches? It's been more than 11
years now, so it seems long enough for a ping :)
