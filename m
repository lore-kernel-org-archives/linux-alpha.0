From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH 0/2] alpha: implement missing syscalls
Date: Mon, 26 Sep 2011 10:41:34 -0400
Message-ID: <CAEdQ38GMtvqU7BN-EUg+Hy77ZLA=+A2oFpkv1EQQJthwRBhBsA@mail.gmail.com>
References: <1317028849-13198-1-git-send-email-mcree@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=jwzf5n0QVNTRcibTUTEBdZWVCJEBIeXtnO2b0uPIsbU=;
        b=Q59D8UykjX8xyP9S0QjoQiISEDuo/4R6bDOL6pDj0gWlQqCknx2UMElUnHwdNjQ5f8
         A1mZzNdrUj5l2Vxt9G7CdWRJZwh/DbgWkocyQo6OjCbzTg8bpHaAeC/4IAiJ4/y8AY/d
         W3f5d/qTLUulGs3Vc6zweL6QwaUfelsphIFN0=
In-Reply-To: <1317028849-13198-1-git-send-email-mcree@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michael Cree <mcree@orcon.net.nz>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

On Mon, Sep 26, 2011 at 5:20 AM, Michael Cree <mcree@orcon.net.nz> wrot=
e:
> Andrew,
>
> Patches to implement missing syscalls on Alpha follow. =A0I am sendin=
g to you
> as the first one (the accept4 syscall) is really urgent and I am assu=
ming
> that Matt's alpha-next repository is out of action at the moment. =A0=
If
> acceptable please forward to Linus.
>
> I have tested the accept4 syscall with the test code in commit
> de11defebf0000.
>
> The accept4 patch should also be sent to the stable queue. It would b=
e good
> to get that into 3.0.x as that is the kernel currently in Debian Unst=
able
> where the missing accept4 syscall is starting to cause havoc.
>
> Cheers
> Michael.
>
> Michael Cree (2):
> =A0alpha: Wire up accept4 syscall.
> =A0alpha: Wire up sendmmsg syscall
>
> =A0arch/alpha/include/asm/unistd.h | =A0 =A04 +++-
> =A0arch/alpha/kernel/systbls.S =A0 =A0 | =A0 =A02 ++
> =A02 files changed, 5 insertions(+), 1 deletions(-)
>
> --

Both patches are
Reviewed-by: Matt Turner <mattst88@gmail.com>

Andrew, if you'd be so kind to take these, I'd be grateful.

Thanks,
Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
