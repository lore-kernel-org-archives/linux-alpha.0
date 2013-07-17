From: Michael Cree <cree@waikato.ac.nz>
Subject: Re: [PATCH 0/7] Minor Alpha updates for 3.11
Date: Wed, 17 Jul 2013 12:03:47 +1200
Message-ID: <20130717000347.GB2483@stolen.phys.waikato.ac.nz>
References: <1373994280-12047-1-git-send-email-rth@twiddle.net>
 <1374017707.3719.11@driftwood>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1374017707.3719.11@driftwood>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Landley <rob@landley.net>
Cc: Richard Henderson <rth@twiddle.net>, linux-kernel@vger.kernel.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

On Tue, Jul 16, 2013 at 06:35:07PM -0500, Rob Landley wrote:
> On 07/16/2013 12:04:33 PM, Richard Henderson wrote:
> >Here's a set of minor updates for arch/alpha that should not
> >be controversial.
> 
> I also note that I had to do this to get busybox to build against
> uClibc:
> -#define __NR_umount		 22
> +#define __NR_umount2		 22
> -#define __NR_oldumount		321
> +#define __NR_umount		321

I anticipate that this will likely break userspace.

busybox should be fixed to test for __NR_oldumount and then call the
correct functions, namely oldumount and umount if __NR_oldumount is defined
and umount and umount2 if it is not defined.

Cheers
Michael.
