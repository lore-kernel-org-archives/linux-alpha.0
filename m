From: "Dialup Jon Norstog" <thursday@allidaho.com>
Subject: Re: Kernel 2.6.30.1 Oops on Alpha Architecture when starting Xserver
Date: Sat, 25 Jul 2009 19:26:32 -0600
Message-ID: <20090726012112.M10928@allidaho.com>
References: <4A5DB243.2000100@orcon.net.nz>	 <21d7e9970907152016u3b213beet9090ee3b34f6d8b1@mail.gmail.com>	 <4A6ACE7C.9090409@orcon.net.nz> <21d7e9970907251554m18e4fca5p69b758e36fddc7d9@mail.gmail.com> <4A6B9DCB.1090001@orcon.net.nz>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <4A6B9DCB.1090001@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>, Dave Airlie <airlied@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, xorg@lists.freedesktop.org

My experience:

I have loaded linux on a number of Alphamachines, including the PWS series,
XP100 and UP2000/+.  Sometimes the X-erver doesn't work.  And it trashes the
whole install. Once that happens, you can chaNGE graphics cards but the
X-serve will not recover, maybe because the kernel is implicated in the whole
train wreck.

I usually just wipe everything clean and re-install with a known good graphics
card.

It wasn't a problem back when Compaq was paying Red Hat to put together the
7.1 and 7.2 distros.  There just aren't enough people working on Linux Alpha,
and the whole thing has gotten rickety.  IMHO

jn


---------- Original Message -----------
From: Michael Cree <mcree@orcon.net.nz>
To: Dave Airlie <airlied@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
xorg@lists.freedesktop.org
Sent: Sun, 26 Jul 2009 12:05:31 +1200
Subject: Re: Kernel 2.6.30.1 Oops on Alpha Architecture when starting Xserver

> Dave Airlie wrote:
> >>>> The kernel oops is:
> >>>>
> >>>>         
> >>> So its a machine check,
> >>>
> >>>       
> >> So, does this indicate a software fault (e.g. inconsistencies in kernel data
> >> structures) or does it imply a hardware fault?
> >>
> >>     
> >>> Well X is trying to post the graphics card you have installed, and the
> >>> machine
> >>> is falling over when it does it.
> >>>
> >>>       
> >> SRM (the equivalent of a BIOS) cannot post the card on startup.  But I have
> >> had the card (radeon rv610) post correctly and working in the past when I
> >> compiled the complete 1.5.3 Xserver myself.  I had it working with both the
> >> radeon and radeonhd drivers and a 2.6.29.x kernel patched to support
> >> libpciaccess.
> >>     
> >
> > There is no -ati card in that machine, its got some SiS card which is
> > completely
> > different, maybe its some onboard card or something.
> >
> 
> No, you have misunderstood.   I removed that Radeon rv610 card (that 
> caused the kernel oops) from the machine and replaced it with an old 
> SiS card I have.  The behaviour changed: now the Xserver locks up on 
> initialisation and consumes 100% CPU.  The backtrace I provided is 
> with the SiS card only.  I thought it might be helpful to locate the 
> problem 
> (assuming that we are seeing a different symptom of the same 
> underlying problem).
> 
> BTW, my attempt to CC the xorg mailing list failed.  It would seem 
> that they are too exclusive to allow posting to their email list 
> without subscription.  Putting up such barriers means they won't get 
> bug reports from such people as myself.  Their loss.
> 
> Cheers
> Michael
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-
> alpha" in the body of a message to majordomo@vger.kernel.org More 
> majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> -- 
> This message has been scanned for viruses and
> dangerous content by MailScanner, and is
> believed to be clean.
------- End of Original Message -------

