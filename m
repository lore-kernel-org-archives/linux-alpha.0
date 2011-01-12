From: Matt Turner <mattst88@gmail.com>
Subject: Please test my alpha tree
Date: Wed, 12 Jan 2011 05:29:50 +0000
Message-ID: <AANLkTinLCqS+E8CXmAfs51sWuPS1JtNguA2VcoKK4g4f@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:from:date:message-id:subject:to:cc
         :content-type;
        bh=JIJ+ebrbiKIRCfPjPNfxEah9aKjtSZxdZ0ClXLAOOho=;
        b=FGWty2aXM0WoDmccOEWsxB+q1s1WXh684G37e0f/tA4uUqzvlRVu5/DNS8X6dMoLvv
         OmY2AOgzAUyph1XcvojUfd8IHaVr9/PFlQmtzGMTKDwwq9jubdxmTdiVTI02qn2SCKs6
         Ci6+7MOfLszKmap5axm7lzgkeD28V2pfHbtpA=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org
Cc: Kyle McMartin <kyle@redhat.com>, Michael Cree <mcree@orcon.net.nz>

After a few weeks of no work on the kernel, I've vacuumed up the
outstanding patches.

They include the removal of __do_IRQ, so please give it a test on your hardware.

On boot-up of my UP1500, I see

HWRPB cycle frequency bogus.  Estimated 796423805 Hz
Trying to install interrupt handler for IRQ8
------------[ cut here ]------------
WARNING: at kernel/softirq.c:138 __local_bh_enable+0xa8/0xc0()
Modules linked in:
fffffc0000973cf0 ffffffffffffffff fffffc000032ff78 0000000000000200
       0000000000000008 0000000000000008 0000000000000001 0000000000000001
       fffffc00003306e8 fffffc000099be18 fffffc0000315604 fffffc000035fab0
       fffffc00003157a4 fffffc000097bd38 0000000000000000 fffffc0002c08240
       fffffc0000310e10 fffffc0000974f48 fffffc000096e5c0 0000000000000038
       0000000000000001 0000000000000007 0000000000000000 0000000000000005
Trace:
[<fffffc000032ff78>] __local_bh_enable+0xa8/0xc0
[<fffffc00003306e8>] irq_enter+0x68/0x90
[<fffffc0000315604>] handle_irq+0x64/0xf0
[<fffffc000035fab0>] handle_bad_irq+0x0/0x390
[<fffffc00003157a4>] do_entInt+0xc4/0x1e0
[<fffffc0000310e10>] ret_from_sys_call+0x0/0x10
[<fffffc00004e694c>] vgacon_startup+0x1cc/0x450
[<fffffc00003309c0>] request_resource+0x0/0x30
[<fffffc00004e6980>] vgacon_startup+0x200/0x450
[<fffffc000031001c>] _stext+0x1c/0x20

---[ end trace 4eaa2a86a8e2da22 ]---
Console: colour VGA+ 80x25
console [ttyS0] enabled

So something else needs to be done.

Ivan, the last patch in my tree is a breakage fix that you proposed.
It seems fine to me; can you please give your sign-off?

Thanks,
Matt
