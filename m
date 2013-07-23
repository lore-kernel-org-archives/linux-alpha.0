From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 0/7] Minor Alpha updates for 3.11
Date: Tue, 23 Jul 2013 07:20:22 -0800
Message-ID: <51EE9F36.7050402@twiddle.net>
References: <20130717000347.GB2483@stolen.phys.waikato.ac.nz> <1374546701.3719.33@driftwood> <20130723032511.GA18086@stolen.phys.waikato.ac.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=z05+BxZZBmsyQjWw/zyV6zLUesi91WhaJhy9pDs9/nc=;
        b=JWLAcwDAdwkpu05tf0vaSSvV7h9xFBiqY40dRuPA7fccRQ5B6LkT68GKqppAYEyn8k
         AiPFLoZRn1cGQ/0zTsc4hjd3JgfzfdIeUGDGaFPXNpXxJYg85BgV2qIox4lC36eVcRmN
         ZlcJOlB+q5qZTqFzKAT41jA4oCLeFf5Ww+WLtvbFyt+fUJfnStyTJZ4KKBwehRazu4Re
         qNEjX/asgm4t31UxxQ/K/WU5O0jNDHOIsbeVMECW6WYQhqFy4M6lHh4yTDQIGE3h55F+
         de12gK+enYrvf2dDpqOk3zEgxhmslwYXBlHDitJbaEfvXTqS+soBVf58IDNDYiK7rNHz
         cGig==
In-Reply-To: <20130723032511.GA18086@stolen.phys.waikato.ac.nz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Cree <cree@waikato.ac.nz>
Cc: Rob Landley <rob@landley.net>, linux-kernel@vger.kernel.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

On 07/22/2013 07:25 PM, Michael Cree wrote:
> I wondered if your proposal will break glibc as glibc checks for
> __NR_oldumount and does different things based on that.  But maybe your
> fix will not adversely affect glibc (I did not look particularly closely
> to see if so), but even so, there is no guarantee that other software does
> not directly access the oldumount syscall when compiled on Alpha, and your
> change would likely break any such software.

It won't break glibc.  While there are conditionals for oldumount,
they do pretty much exactly the umount/umount2 dance you'd expect.

I'm for the patch, because anything that makes us match x86 more
closely has got to be a good thing from a portability standpoint.


r~
