From: Richard Henderson <rth@twiddle.net>
Subject: Re: [RFC PATCH 00/10] Alpha support for QEMU
Date: Thu, 18 Jul 2013 06:38:14 -0700
Message-ID: <51E7EFC6.6070003@twiddle.net>
References: <1373996058-13399-1-git-send-email-rth@twiddle.net> <20130718011435.GA20007@stolen.phys.waikato.ac.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:x-enigmail-version:content-type
         :content-transfer-encoding;
        bh=20JZucbPzmgTAscHhXz2X/O9b/Wnv8hDZypgGVA6Kw0=;
        b=XgdlI278iSKtiC4jqyg2mhT4kUXmtFzRtpjJgFxaANeP/3UJSIaMkYr6gek0qRGyuE
         jfvL2igjwP/pebg3GO8Ufd7RvXQBSWwmQTEyXJzwtHga+AGOrQHglLOuKe0z0zgSHHet
         r3UmSU3bLGbVky+Z2O4TsJw3hGFWG8PmpvBK20NRd+zK2ylle2HckZCbPGeK3Nudm1+D
         TlEIKL1LK/VQFP06uSPqx2YN6WoyEB2WLsKe6TESqrc54XxZsVeL1eCxenE7nYY4Zfw7
         Op5m0LaY5Ut0rZwraewGuUscuGHdhTTh+DS7yvp9bm+M8y9T23VJcvuNbxdBz2XskhSX
         ZRwA==
In-Reply-To: <20130718011435.GA20007@stolen.phys.waikato.ac.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Cree <cree@waikato.ac.nz>
Cc: linux-kernel@vger.kernel.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

On 07/17/2013 06:14 PM, Michael Cree wrote:
> Tested the patch series applied against 3.10.1 on a 3-CPU ES45.  System came
> up fine but I noticed date was wrong and had been reset back to the start
> of the epoch (Jan 1 1970).  Appears it is not reading hardware clock
> correctly on boot.

Please scan the dmesg for the "Using epoch 2000 for rtc year 13" line,
and compare vs a similar message on the previous kernel.

> I manually set the clock to the correct time but noticed it is running slow,
> indeed in a period of 60s the system clock incremented by 21s (+/-1s) so
> would appear clock is running slow by a factor given by the number of CPUs.

That's curious.  I wonder if somehow I botched the smp changes, and I'm
not getting the timer interrupt either (1) enabled or (2) registered on
the secondary cpus...

Perhaps /proc/interrupts will confirm or deny this?


r~

