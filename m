From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH 12/22] powerpc/cpu: Mark start_secondary_resume()
 __noreturn
Date: Mon, 6 Feb 2023 14:22:02 -0800
Message-ID: <20230206222202.zreg3pyhynhvyggy@treble>
References: <cover.1675461757.git.jpoimboe@kernel.org>
 <b5d065218265e79daa23f82bb84efc6a7ea120fc.1675461757.git.jpoimboe@kernel.org>
 <87v8kfdp7l.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Return-path: <sparclinux-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675722127;
        bh=g8nY4KWQRGHZ+UEBU3IfsGHHp9POeugLWf+ks7MhlYI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ku27bb49TXnifj4vDKUwLt//IhS+AuKgNZHjSBzmgIygXsWngoTvqzjsyI4aaPcuH
         Ne/GMb6QblTp2Jv681blYtCgjkXaPsQUgkrsec8L+xRVWuKD28hd8t9BRChWBzJwZK
         gFEWXSU7jaZZgPnPMEvOqqaXTfNHVDYUbsIUYWKlmuEb7nAEqsRD53T6hGhLZYqx/u
         DQUcYnhTaFCk/Smt9vORx+U2SLIPq7vHqyxTh+SxZ9//C/gkazIzBXyvCtcwtDa+nk
         Ec2/QPURQbIa9r42wgKqNXQHC6PZxrciIKrlgpzWDw6z2c/ntsIbU896+w3wVQ78cR
         a9GpVI+CKZooA==
Content-Disposition: inline
In-Reply-To: <87v8kfdp7l.fsf@mpe.ellerman.id.au>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-kernel@vger.kernel.org, jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alie

On Mon, Feb 06, 2023 at 10:10:22PM +1100, Michael Ellerman wrote:
> Josh Poimboeuf <jpoimboe@kernel.org> writes:
> > start_secondary_resume() doesn't return.  Annotate it as such.  By
> > extension this also makes arch_cpu_idle_dead() noreturn.
> 
> Can we also mark arch_cpu_idle_dead() (the C function) __noreturn ?
> 
> Seems like it would be good documentation, even if it's not required
> once the generic prototype is __noreturn.

Yeah, agreed.  Maybe I'll do that (for all the implementations) with
patch 22.

> But not a show-stopper.
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

Thanks!

-- 
Josh
