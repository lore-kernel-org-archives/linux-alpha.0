From: Matt Turner <mattst88@gmail.com>
Subject: Need help fixing Alpha/DRM out of memory failure
Date: Tue, 22 Sep 2009 14:58:00 -0400
Message-ID: <b4198de60909221158o4b5cfb3ej2df8becda8381b82@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:cc:content-type;
        bh=CEPHCnEXTTx9EyEmZfHDRcsqG/xcNuZ3EXzdS9C/oUs=;
        b=gIbsoBh5bBrcXRj8Efr/rlMk/YkdilZL5DmomYTnK9uHaUjP3IcI8arE5sG8kbmFTK
         zYAGsFH/4If1VoMjGs6AC9l6B7KHs3eyoAJ0KqOc/8MfVEhMqQhFSYRNQjOynvliCFsw
         I3YMQstIBHPclcGUU8z1AA0Cs3TFdu2wN/XrQ=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jay Estabrook <jay.estabrook@hp.com>
Cc: linux-alpha@vger.kernel.org

I'm seeing a DRM-related out of memory failure. I've filed a bug at
freedesktop.org [0], but no luck. Xserver-1.7 is near, and I'd like to
get this fixed before they make a major release.

When starting up X with a Radeon graphics card, X dies with an out of
memory error. See attached dmesg in bug report and small excerpt.

Trace:
[<fffffc0000384158>] __vmalloc_area_node+0xb8/0x1b0
[<fffffc00005248a0>] drm_sg_alloc+0x1c0/0x340
[<fffffc000051d7ac>] drm_ioctl+0x18c/0x3f0
[<fffffc0000524a20>] drm_sg_alloc_ioctl+0x0/0x20
[<fffffc00003a093c>] vfs_ioctl+0x6c/0x90
[<fffffc00003435e0>] autoremove_wake_function+0x0/0x60
[<fffffc00003a0b14>] do_vfs_ioctl+0xb4/0x6b0
[<fffffc00003a1214>] SyS_ioctl+0x104/0x110
[<fffffc000038f588>] SyS_write+0x68/0xe0
[<fffffc00003a117c>] SyS_ioctl+0x6c/0x110
[<fffffc0000310d14>] entSys+0xa4/0xc0

Using Option "DRI" "false" works around the problem.

I'd really appreciate any help.

Thanks,
Matt Turner

[0] http://bugs.freedesktop.org/show_bug.cgi?id=23671
