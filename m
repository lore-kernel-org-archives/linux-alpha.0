From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH] arch/alpha: Remove dead code
Date: Sun, 4 Aug 2019 01:20:04 +0530
Message-ID: <CAFqt6zb5phXBZCVwLVcRBQ8hqdMQ-SLX0q4jgTJu-vwHXH_A1A@mail.gmail.com>
References: <1564859856-5916-1-git-send-email-jrdr.linux@gmail.com> <20190803192051.GC1131@ZenIV.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iSfWQiyPm4CSNo1QZhxcFsbnyy4ONPqQIsRIrlI2JSU=;
        b=sq65spdvfcqDWMWURm2mHPrMbeRMwOYn/2PNDwct/VRghQiSBcMoest3DKnfTtoV2s
         Ytl22OOHj5muQD/Q2wrKOfyZYeWRiiOCoVmXdCOYvyRcSHB57cgnBRgHAy6FE9Z5BB5V
         S1/OuUP1EHY+5YIvOfmZrOlVVgqIat8jGpyAonoN9UuteEv7l0U7wRFs7QjeGZ3AQs4/
         2yyKPl7LprUPS5jwY3oMmin9CXG/YjwlzZRNis2M8U7GFQv/XDWhdTMStl9UUOMPW91h
         79ckcXtRwqrPpVNUHepG4ua9qsG59MvKyaYlYD2vJVB6YPEp8/6PO8WyFshRCqc8tpAp
         xKew==
In-Reply-To: <20190803192051.GC1131@ZenIV.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, Matt Turner <mattst88@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, rppt@linux.vnet.ibm.com, Michal Hocko <mhocko@suse.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Michael Ellerman <mpe@ellerman.id.au>, Paul Burton <paul.burton@mips.com>, Colin King <colin.king@canonical.com>, Greg KH <gregkh@linuxfoundation.org>, rfontana@redhat.com, Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>, firoz.khan@linaro.org, Jann Horn <jannh@google.com>, namit@vmware.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Aug 4, 2019 at 12:50 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Sun, Aug 04, 2019 at 12:47:36AM +0530, Souptick Joarder wrote:
> > These are dead code since 2.6.11. If there is no plan to use
> > it further, this can be removed forever.
>
> What's the point in removing ifdefed-out debugging printks?

If those debugging printks are kept under "#if 0" purposefully, then those
can be left as it is. Other parts are under "if 0" can be removed as those are
not used since 2.6.11.

How about keeping those debugging printk under some CONFIG_*_DEBUG option ?

While browsing source code, I figure out there are huge amount of dead
code under
'#if 0"  and some of them are maintained since 2.6.* . I send few
similar patches for fbdev
driver and those are merged to linux-next.
But how about cleaning it in entire tree ( module wise) ? Does it make sense ?
