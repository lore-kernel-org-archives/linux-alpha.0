From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH REPOST] alpha: Replace bogus in_interrupt()
Date: Fri, 13 Nov 2020 16:25:35 -0800
Message-ID: <20201113162535.92435b319c69b435f379ddbe@linux-foundation.org>
References: <20201113135832.2202833-1-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605313535;
        bh=G4wbIA6U5sagP0DSycw0J5zEgOwYyErMorMIAwSJync=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tJGU2tTaLn9JZy+bWM0x4SWs9lj6PBmf/6ZAv+XrsRnBj4Mgf/kaiIX5GJNDk72fd
         k0HiytGrsNE0Q54WcVQ1Wnb544RLgEv9SA/sQdYzV8iJq9Va5QodhRYtWa0pj5/bdl
         xaTzz5flOGYyGiIDKds4p/eQojRay2m2z0UhSva0=
In-Reply-To: <20201113135832.2202833-1-bigeasy@linutronix.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-alpha@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Richard Henderson <rth@twiddle.net>, Matt Turner <mattst88@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

On Fri, 13 Nov 2020 14:58:32 +0100 Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:

> From: Thomas Gleixner <tglx@linutronix.de>
> 
> in_interrupt() is true for a variety of things including bottom half
> disabled regions. Deducing hard interrupt context from it is dubious at
> best.
> 
> Use in_irq() which is true if called in hard interrupt context. Otherwise
> calling irq_exit() would do more harm than good.
> 

Gee, how to test it.  Does anyone run current kernels on alpha?
