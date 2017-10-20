From: Matt Turner <mattst88@gmail.com>
Subject: Re: Do any Alpha systems include InfiniBand?
Date: Fri, 20 Oct 2017 13:00:14 -0700
Message-ID: <CAEdQ38FosVOEXrawAFzaFjhVPiEwzJVetV1PuiY2Kku8c6Ft0Q@mail.gmail.com>
References: <20171020194832.GA19016@linux.vnet.ibm.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=TGegd6DNq+tzfyktlx+kth2D+I3O+cKBGAwevQtrPOw=;
        b=PNjysSwaHp2WZnG5/aa1CezUK5nXBIQGP0KYh9fEJJcyYFfWc1aR4cSsBzdsj4JExf
         Cc69o7y6RykbGc+lQNiQ/j2kbZSnKMPfirJ6zVItpM0kTcvRTtgQp28iCjnBQgzq8JgL
         JAKvsXOAETvvbaABNdeHOJNR3QLmFZobUaVl0qnJzPTXHULuQ833pq8LkNC5oISXmN10
         OGqGJMckBDmCJCKTLXV4TVvm4V0OyC6rwynJupD70eK6EIGWHhoMp6Vm88dtdK6zP4MY
         /Flx9bg99EwrKqsPczizZQcWesoBHTaqIQHVw3eQxefAPLmRuwr2ysovlNYB8xnCAfFb
         LI7A==
In-Reply-To: <20171020194832.GA19016@linux.vnet.ibm.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Michael Cree <mcree@orcon.net.nz>, parri.andrea@gmail.com, Will Deacon <will.deacon@arm.com>, linux-alpha <linux-alpha@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, mark.rutland@arm.com

On Fri, Oct 20, 2017 at 12:48 PM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> Hello, Michael,
>
> Do any of the DEC Alpha systems that run recent kernels have InfiniBand?
> Given my understanding of the history, I believe the answer to be "no".
> If I am wrong, please let me know, as I will otherwise interpret silence
> as assent.  ;-)

I'm not aware of any shipping with Infiniband, and I haven't heard of
anyone putting Infiniband in an Alpha.

Why do you ask? :)
