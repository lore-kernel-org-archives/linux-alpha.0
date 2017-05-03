From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 0/3] alpha: improvements of arch/alpha/lib/Makefile
Date: Wed, 3 May 2017 14:18:40 +0900
Message-ID: <CAK7LNAR_FYxXObYNim+Ee+=KGWNWhhgg2Q8ywO4vzNukiT-NdQ@mail.gmail.com>
References: <1473579736-16139-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com v435Iflv011111
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1493788722;
        bh=GUO9d8eU9qBCzugLCGM/qgkmtwAa/VqeV2fqXHJtErw=;
        h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
        b=PVoM2UF5FpwPphajndsNdY65L3QLAYnPpAlvq9tRnU75vqTQOy3mHeQE7vhJAMkxC
         YmBmUUY5NTXJpCl7sUK84MZyZmzmYqO01FhNoFTfDAVeBtuZWw2YkkRPn1kyscD7Cn
         AE4kax9WWzWWvNcs41gZFWAKMnuS9QYAAJFMWrGxQgId5Wq2n8Gy/0UyYLFi287vLP
         xwbcp1NBpRGwJSTVfRw03yTyiP2TScmOiiaGQ6sNAmt+sbbTetVLUMjZWOG8L4eb6r
         B8DuyC6hz0H6rfs/6IaX3T7eoBHAEYGK9I7G2J0TFeHaEgaqX4uDGlhvDxFPLCQbqd
         bfzHWp9105IVA==
In-Reply-To: <1473579736-16139-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matt Turner <mattst88@gmail.com>

2016-09-11 16:42 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> While building for Alpha architecture, I noticed ugly long log
> for division routines.  So, I took a look at the Makefile.
> Here is a series of build rule cleanups.
>
>
> Masahiro Yamada (3):
>   alpha: add $(src)/ rather than $(obj)/ to make source file path
>   alpha: merge build rules of division routines
>   alpha: make short build log available for division routines
>
>  arch/alpha/lib/Makefile | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>

No response for a long time
(probably because the maintainer status is Odd Fixes.)

Applied to linux-kbuild.



-- 
Best Regards
Masahiro Yamada
