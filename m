From: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Subject: Re: [patch V3] lib: GCD: add binary GCD algorithm
Date: Thu, 28 Apr 2016 21:54:06 +0200
Message-ID: <20160428195326.GB29802@ravnborg.org>
References: <1461843824-19853-1-git-send-email-zengzhaoxiu@163.com>
 <20160428164856.10120.qmail@ns.horizon.com>
Mime-Version: 1.0
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160428164856.10120.qmail-HzZAx2gCgqrSUeElwK9/Pw@public.gmane.org>
Sender: linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, zengzhaoxiu-9Onoh4P/yGk@public.gmane.org, dalias-8zAoT0mYgF4@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, deller-Mmb7MZpHnFY@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, jejb-6jwH94ZQLHl74goWV3ctuw@public.gmane.org, jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org, lennox.wu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-m68k-cunTk1MwBs8S/qaLPR03pWD2FQJk+8+b@public.gmane.org, linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, liqin.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, nios2-dev-g9ZBwUv/Ih/yUk5EbOjzuce+I+R0W71w@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, uclinux-h8-devel-5NWGOfrQmneRv+LV9MX5uooqe+aC9MnS@public.gmane.org, ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org, zhaoxiu.zeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

> __ffs on the available architectures:
> 	Alpha: sometimes (CONFIG_ALPHA_EV6, CONFIG_ALPHA_EV67)
> 	ARC: sometimes (!CONFIG_ISA_ARCOMPACT)
> 	ARM: sometimes (V5+)
> 	ARM64: NO, could be written using RBIT and CLZ
> 	AVR: yes
> 	Blackfin: NO, could be written using hweight()
> 	C6x: yes
> 	CRIS: NO
> 	FR-V: yes
> 	H8300: NO
> 	Hexagon: yes
> 	IA64: yes
> 	M32R: NO
> 	M68k: sometimes
> 	MetaG: NO
> 	Microblaze: NO
> 	MIPS: sometimes
> 	MN10300: yes
> 	OpenRISC: NO
> 	PA-RISC: NO?  Interesting code, but I think it's a net loss.
> 	PowerPC: yes
> 	S390: sometimes (CONFIG_HAVE_MARCH_Z9_109_FEATURES)
> 	Score: NO
> 	SH: NO
> 	SPARC: NO
SPARC: sparc64: YES, sparc32: NO
Patch needs to be updated to refelct this.

	Sam
