From: Richard Henderson <rth@twiddle.net>
Subject: Re: [RFC] alpha: hack objstrip.c to make it compile.
Date: Tue, 30 Mar 2010 07:59:02 -0700
Message-ID: <4BB211B6.2060300@twiddle.net>
References: <1269913795-1852-1-git-send-email-mattst88@gmail.com>	 <4BB20AAB.7000909@twiddle.net> <b4198de61003300749s7344f4f7o9070fafb142eb5b4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <b4198de61003300749s7344f4f7o9070fafb142eb5b4@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, ang@brigante.org

On 03/30/2010 07:49 AM, Matt Turner wrote:
> The problem is that, at least with my distribution, probably others
> too, the headers installed into /usr/include/linux/ are stripped of
> anything inside #ifdef __KERNEL__.

I thought this was built with kernel header files?  It used to be.

If it's built with system header files now, you might as well convert
the thing to use <elf.h> instead.  Which shouldn't be too much different
from what you've done already.  Although I wouldn't bother with the
#defines... just propagate the name changes into the source proper.


r~
