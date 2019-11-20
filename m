From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 11/13] powerpc: Remove comment about read_barrier_depends()
Date: Wed, 20 Nov 2019 21:37:52 +1100
Message-ID: <87imnebzpb.fsf@mpe.ellerman.id.au>
References: <20191108170120.22331-1-will@kernel.org> <20191108170120.22331-12-will@kernel.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1574246278;
        bh=3p1/+Y2XGImhWJp2Nfr1Vtn9hbxxW6xCuiO/qlCWHs8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=rRRCPct7qxNjUoAWjW+qjiY8Kr3Tw3xNCLARmyKqEVyL++OKOBFQIJamuKslc0nbo
         ZbfwIM3mtOBt0P5b1BPx1hd8ea3qB7nXXlIUjCBwq55BHhkEsiYXW0SXEUy1hSxZRG
         kzq9gZZOYdY5PQQpTmZVSW8UKRV/ENRAOwNibjCo7M4XgZrbk6oHYO1hCmftgt5el4
         hgIkt5tj1sDdv2h4MRNYO4VF0OR5fRbpkWD9HaxhR81lLDChjbUl4D3IQ+l2cbl5d/
         bwmb8hjNZt/PcpvEcjt0VG1nBWGFp8wr9tyiJiT0/YN4zp/7RinHLSE7+CkjcEIhlN
         fgIV931xHcIGw==
In-Reply-To: <20191108170120.22331-12-will@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Cc: Will Deacon <will@kernel.org>, Yunjae Lee <lyj7694@gmail.com>, SeongJae Park <sj38.park@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Josh Triplett <josh@joshtriplett.org>, Matt Turner <mattst88@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Richard Henderson <rth@twiddle.net>, Peter Zijlstra <peterz@infradead.org>, Alan Stern <stern@rowland.harvard.edu>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Joe Perches <joe@perches.com>, Boqun Feng <boqun.feng@gmail.com>, linux-alpha@vger.kernel.org, virtualization@lists.linux-foundation.org

Will Deacon <will@kernel.org> writes:
> 'read_barrier_depends()' doesn't exist anymore so stop talking about it.
>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/powerpc/include/asm/barrier.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
> index fbe8df433019..123adcefd40f 100644
> --- a/arch/powerpc/include/asm/barrier.h
> +++ b/arch/powerpc/include/asm/barrier.h
> @@ -18,8 +18,6 @@
>   * mb() prevents loads and stores being reordered across this point.
>   * rmb() prevents loads being reordered across this point.
>   * wmb() prevents stores being reordered across this point.
> - * read_barrier_depends() prevents data-dependent loads being reordered
> - *	across this point (nop on PPC).

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
