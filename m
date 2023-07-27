From: Christian Brauner <brauner-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 3/5] arch: Register fchmodat2, usually as syscall 452
Date: Thu, 27 Jul 2023 12:37:58 +0200
Message-ID: <20230727-fangen-olympiade-85fcbdaf03d7@brauner>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
 <a677d521f048e4ca439e7080a5328f21eb8e960e.1689092120.git.legion@kernel.org>
 <nbtxxotfsotuiepm7r4tegc4hy5qxe4dfjuqq7rm6qkkevooxh@4hacgjwit4or>
Mime-Version: 1.0
Return-path: <linux-api-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690454292;
        bh=wh4ycVHyDy/meMpcFy2ujkA7FnfZIbKiF964oBpVy5w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=la4Lmi/DhdfArnUIJ/DbZ78SFqaneHcZNAsl7vyC6Bp1sh+e4HQI8e4jBnieO39j6
         Rmq90io/GLqGoqqH4KkgjJEuKDDwP558rmmvSt0FVF7KhEbTHcezlFb9UppkdHYSda
         jhi/dMRwdDkMKonZJKiGKFXJNLOHTIEijgJrGqqlhNsPV0MkiTVFgniC59vxFaHMe+
         /PgQ2nYibh/PpeGMNXJPhBkYhxE3bGCCuiviuqMrlry/Jp24MyFm3S6udZz5sJhaZ+
         s1t/etXhC/mU8K1VZK7pw57PG4j5iKPd/L4jWewp3rgGuvPk9cYY28p/tSjAv5ikoK
         B2c9Xn3Ycs/Lg==
Content-Disposition: inline
In-Reply-To: <nbtxxotfsotuiepm7r4tegc4hy5qxe4dfjuqq7rm6qkkevooxh@4hacgjwit4or>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aleksa Sarai <cyphar-gVpy/LI/lHzQT0dZR+AlfA@public.gmane.org>
Cc: Alexey Gladkov <legion-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-api-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org, Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>, James.Bottomley-JuX6DAaQMKPCXq6kfMZ53/egYHeGw8Jk@public.gmane.org, acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, borntraeger-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, christian-STijNZzMWpgWenYVfaLwtA@public.gmane.org, dalias-8zAoT0mYgF4@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, deepa.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, deller-Mmb7MZpHnFY@public.gmane.org, dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, fenghua.yu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, glebfm-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org, gor-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org, hare-IBi9RG/b67k@public.gmane.org, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org, jhogan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kim.phillips-5wv7dgnIgG8@public.gmane.org, ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org, linux-alpha-u79uwXL29TasMV2rI37PzA@public.gmane.org

On Wed, Jul 26, 2023 at 02:43:41AM +1000, Aleksa Sarai wrote:
> On 2023-07-11, Alexey Gladkov <legion-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > From: Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
> > 
> > This registers the new fchmodat2 syscall in most places as nuber 452,
> > with alpha being the exception where it's 562.  I found all these sites
> > by grepping for fspick, which I assume has found me everything.
> 
> Shouldn't this patch be squashed with the patch that adds the syscall?
> At least, that's how I've usually seen it done...

Depends. Iirc, someone said they'd prefer for doing it in one patch
in some circumstances on some system call we added years ago. But otoh,
having the syscall wiring done separately makes it easy for arch
maintainers to ack only the wiring up part. Both ways are valid imho.
(cachestat() did it for x86 and then all the others separately. So
really it seems a bit all over the place depending on the scenario.)
