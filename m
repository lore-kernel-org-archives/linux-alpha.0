From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] net: unexport csum_and_copy_{from,to}_user
Date: Sat, 23 Apr 2022 23:42:30 +1000
Message-ID: <87o80r9ard.fsf@mpe.ellerman.id.au>
References: <20220421070440.1282704-1-hch@lst.de>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1650721357;
        bh=3C84ccftDy9PVflkyViujWf+bf2fZBGJWRvoGbxG78Y=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=E8Qf0rsbg2AmYN3VZ5Qbq04Kd93P+e7QcYX938BlW0MGhPm7LSsGT709miZJvRR4K
         VGur63wHMpRA6g2+DdVY9c9eh7Z1RIDpHE+d5KVLGIw9z6EKB6cEJBHgonac988AfC
         MusaEn47ZdylpoKSs2n1v7EQwmJS3qeh1IZAsUhmQH62RHZ3KUBnQPRuANhw21p2E0
         GBvaOSV3I+fSP/rQHzIMn8OkNCyazaf8XVwl+4G1Y7Iqmit4msjPaMSaQPuu05OIuW
         DDNdQdKQhZROfPopqfJlMnwyPMEwmeFV2uXvxiZjACOMVxJ8XGuPWGDBSdMYHFXWEc
         veJEk/csNuIIw==
In-Reply-To: <20220421070440.1282704-1-hch@lst.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>, akpm@linux-foundation.org
Cc: x86@kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org

Christoph Hellwig <hch@lst.de> writes:
> csum_and_copy_from_user and csum_and_copy_to_user are exported by
> a few architectures, but not actually used in modular code.  Drop
> the exports.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/alpha/lib/csum_partial_copy.c   | 1 -
>  arch/m68k/lib/checksum.c             | 2 --
>  arch/powerpc/lib/checksum_wrappers.c | 2 --
>  arch/x86/lib/csum-wrappers_64.c      | 2 --
>  4 files changed, 7 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
