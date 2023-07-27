From: Christian Brauner <brauner-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/5] fs: Add fchmodat2()
Date: Thu, 27 Jul 2023 12:26:59 +0200
Message-ID: <20230727-mitkommen-deck-2db8197421bd@brauner>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
 <f2a846ef495943c5d101011eebcf01179d0c7b61.1689092120.git.legion@kernel.org>
 <njnhwhgmsk64e6vf3ur7fifmxlipmzez3r5g7ejozsrkbwvq7w@tu7w3ieystcq>
 <ZMEjlDNJkFpYERr1@example.org>
Mime-Version: 1.0
Return-path: <linux-api-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690453633;
        bh=R/FYmp9MZEn+gyMq0ULNxE++Cfcy5PFI0h0gHoMCEaU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QIRxzFuZRUpzkkFGKnnORGNBJ80AiPRF99WZpuM+vb47BufRaRCX0nIyujfGYNZQe
         NeYMFGrUe3lvpoUWfgZe9pK/BpocYz7rTImYpnueNbLJ8q5lyHeeW1TAJF5SI/w+Zt
         VsP5DmcMZq6gKczQX/HTSDSpbLUYeJemvT+46ZRPtId5YN+FAuc5U7zjXDXBTiUhES
         KLHJnbCE6Y8IrNHY5cY5wkkgFPDXeJZi3CjVnYPpYgTUMnxr2+kPa96nXV92DuNGtT
         2wPdCtmvz6aPl0zP7CxK5fM5OA63Ga+2qGCzHv/Dp/yIidvhBQEYCQ8rZQpRIqiDJP
         d13GHDccbk2Cg==
Content-Disposition: inline
In-Reply-To: <ZMEjlDNJkFpYERr1-hcDgGtZH8xNAfugRpC6u6w@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Gladkov <legion-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Aleksa Sarai <cyphar-gVpy/LI/lHzQT0dZR+AlfA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-api-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org, James.Bottomley-JuX6DAaQMKPCXq6kfMZ53/egYHeGw8Jk@public.gmane.org, acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, borntraeger-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, christian-STijNZzMWpgWenYVfaLwtA@public.gmane.org, dalias-8zAoT0mYgF4@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, deepa.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, deller-Mmb7MZpHnFY@public.gmane.org, dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, fenghua.yu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, glebfm-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org, gor-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org, hare-IBi9RG/b67k@public.gmane.org, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org, jhogan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kim.phillips-5wv7dgnIgG8@public.gmane.org, ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arch-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux

> > I think it'd be much neater to do the conversion of AT_ flags here and
> > pass 0 as a flags argument for all of the wrappers (this is how most of
> > the other xyz(), fxyz(), fxyzat() syscall wrappers are done IIRC).

I've fixed that up in-tree.
