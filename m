From: Andrea Parri <parri.andrea@gmail.com>
Subject: Re: [PATCH] locking/xchg/alpha: Remove memory barriers from the
 _local() variants
Date: Wed, 28 Feb 2018 12:26:09 +0100
Message-ID: <20180228112609.GA32523@andrea>
References: <1519704058-13430-1-git-send-email-parri.andrea@gmail.com>
 <20180227200830.GA3164@andrea>
 <20180228105810.GB7681@arm.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=duvKUW6jLl5q9FR3faVYUjszcuHxxZYmjnJXmvaBrjY=;
        b=vgUg/LTmMjpzloJKeVDb43auoUS8XmPpwFzS47z/kGHFiHJKgQRhG3sxzhp7qG0apL
         1lz4iueVON+aRyjXRciky6nvKybzaKPcmj/vIBbM8Sqpe3yb8S8cRKQQbwFbw+d+AKPO
         MwyjwOFX8evP61wKnDD3J6geXmIU2BvAE6QucuQg76vU14JYAiPbdwWGbOXlTObREua4
         ETHdU2GYh9Mp3FMAOvN1SkOHifDvNxU2acqh4YMsSJxLhhmvJkoKOlyTR7KMv/ryq8tf
         fPnojMWbKaxcoAdYH2WErkFyyVSVTyHb7C9ZqAAe0n9BDXsYJwE2SRPQonCtMmYu+0NC
         qwTA==
Content-Disposition: inline
In-Reply-To: <20180228105810.GB7681@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Will Deacon <will.deacon@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, "Paul E . McKenney" <paulmck@linux.vnet.ibm.com>, Alan Stern <stern@rowland.harvard.edu>, Andrew Morton <akpm@linux-foundation.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Linus Torvalds <torvalds@linux-foundation.org>, Matt Turner <mattst88@gmail.com>, Richard Henderson <rth@twiddle.net>, Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org

On Wed, Feb 28, 2018 at 10:58:11AM +0000, Will Deacon wrote:
> On Tue, Feb 27, 2018 at 09:08:31PM +0100, Andrea Parri wrote:
> > [+ Will]
> > 
> > I'm not sure how this happened; Will, you at least figure as Reported-by: ;-)
> 
> Thanks, this looks better to me. Have you build an Alpha kernel to check
> that the various cmpxchg variants are producing the expected asm?

Indeed.  Compile tested (only).

  Andrea


> 
> Will
