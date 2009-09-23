From: Jay Estabrook <Jay.Estabrook@hp.com>
Subject: Re: Need help fixing Alpha/DRM out of memory failure
Date: Tue, 22 Sep 2009 22:35:45 -0400
Message-ID: <4AB98981.1020201@hp.com>
References: <b4198de60909221158o4b5cfb3ej2df8becda8381b82@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <b4198de60909221158o4b5cfb3ej2df8becda8381b82@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>

Hi, Matt,

Looks like you're running out of DMA memory for some reason.

On Nautilus, the DMA "zone" is configured to be 16MB
(see arch/alpha/include/asm/dma.h), since there's not the usual
scatter/gather support in the Irongate core logic, AFAICT.

If somethings have taken a big chunk of that, say mapping regs or fbmem
or some such, there may not be much left for others, even if it's only
a single DMA-able page (where the "page allocation failure" message
came from).

I'm really unfamiliar with the code in those files (sys_nautilus.c
and core_irongate.c), so I hope you can find someone more knowledgeable.

Sorry.

Good luck.

--Jay++

Matt Turner wrote:
> I'm seeing a DRM-related out of memory failure. I've filed a bug at
> freedesktop.org [0], but no luck. Xserver-1.7 is near, and I'd like to
> get this fixed before they make a major release.
> 
> When starting up X with a Radeon graphics card, X dies with an out of
> memory error. See attached dmesg in bug report and small excerpt.
> 
> Trace:
> [<fffffc0000384158>] __vmalloc_area_node+0xb8/0x1b0
> [<fffffc00005248a0>] drm_sg_alloc+0x1c0/0x340
> [<fffffc000051d7ac>] drm_ioctl+0x18c/0x3f0
> [<fffffc0000524a20>] drm_sg_alloc_ioctl+0x0/0x20
> [<fffffc00003a093c>] vfs_ioctl+0x6c/0x90
> [<fffffc00003435e0>] autoremove_wake_function+0x0/0x60
> [<fffffc00003a0b14>] do_vfs_ioctl+0xb4/0x6b0
> [<fffffc00003a1214>] SyS_ioctl+0x104/0x110
> [<fffffc000038f588>] SyS_write+0x68/0xe0
> [<fffffc00003a117c>] SyS_ioctl+0x6c/0x110
> [<fffffc0000310d14>] entSys+0xa4/0xc0
> 
> Using Option "DRI" "false" works around the problem.
> 
> I'd really appreciate any help.
> 
> Thanks,
> Matt Turner
> 
> [0] http://bugs.freedesktop.org/show_bug.cgi?id=23671
> 

