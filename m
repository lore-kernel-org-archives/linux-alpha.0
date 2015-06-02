From: Meelis Roos <mroos@linux.ee>
Subject: WARNING at __local_bh_enable_ip (VFS vs Alpha SRM irq)
Date: Tue, 2 Jun 2015 11:12:00 +0300 (EEST)
Message-ID: <alpine.LRH.2.11.1506021107170.17837@math.ut.ee>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Kernel list <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

Tried 4.1-rc6 on AlphaPC164 with SRM console. Got this warning during 
bootup:

[   26.446275] ------------[ cut here ]------------
[   26.446275] WARNING: CPU: 0 PID: 404 at kernel/softirq.c:150 __local_bh_enable_ip+0xbc/0x110()
[   26.446275] Modules linked in:
[   26.446275] CPU: 0 PID: 404 Comm: runscript.sh Not tainted 4.1.0-rc6-dirty #2
[   26.446275] fffffc000f4cba30 0000000000000009 fffffc00003304b8 fffffc0000333c7c 
       fffffc0000333c7c 0000000000000200 fffffc00009d0190 fffffc00009d4bc5 
       0000000000000100 0000000000000009 fffffc000036c9f0 fffffc000f4b6500 
       fffffc000036c9e0 0000000000000fff fffffc000036ca90 fffffc0000a0ce80 
       0000000000000009 000000000000000a fffffc00003338b8 fffffc00009d8a38 
       fffffc0000333e48 0000000000000012 fffffc00009d8a38 0000000000000012 
[   26.446275] Trace:
[   26.446275] [<fffffc00003304b8>] warn_slowpath_common+0xc8/0x130
[   26.446275] [<fffffc0000333c7c>] __local_bh_enable_ip+0xbc/0x110
[   26.446275] [<fffffc0000333c7c>] __local_bh_enable_ip+0xbc/0x110
[   26.446275] [<fffffc000036c9f0>] __rcu_process_callbacks+0xa0/0x120
[   26.446275] [<fffffc000036c9e0>] __rcu_process_callbacks+0x90/0x120
[   26.446275] [<fffffc000036ca90>] rcu_process_callbacks+0x20/0x50
[   26.446275] [<fffffc00003338b8>] __do_softirq+0xf8/0x310
[   26.446275] [<fffffc0000333e48>] irq_exit+0xb8/0xf0
[   26.446275] [<fffffc00003162e4>] handle_irq+0xa4/0x110
[   26.446275] [<fffffc0000328bc4>] srm_device_interrupt+0x24/0x40
[   26.446275] [<fffffc0000325068>] pc164_srm_device_interrupt+0x38/0x60
[   26.446275] [<fffffc00003164e0>] do_entInt+0x140/0x200
[   26.446275] [<fffffc00003114f0>] ret_from_sys_call+0x0/0x10
[   26.446275] [<fffffc000033b11c>] __sigqueue_free.part.20+0x3c/0x70
[   26.446275] [<fffffc000033b138>] __sigqueue_free.part.20+0x58/0x70
[   26.446275] [<fffffc00003f94dc>] path_lookupat+0x3c/0x8c0
[   26.446275] [<fffffc00003f8fa0>] path_init+0x0/0x500
[   26.446275] [<fffffc00003f91e4>] path_init+0x244/0x500
[   26.446275] [<fffffc00003f94dc>] path_lookupat+0x3c/0x8c0
[   26.446275] [<fffffc00003c2b50>] do_wp_page.isra.92+0x1d0/0x510
[   26.446275] [<fffffc00003f9da0>] filename_lookup+0x40/0xe0
[   26.446275] [<fffffc00003fcc44>] getname_flags+0x54/0x230
[   26.446275] [<fffffc00003fe348>] user_path_at_empty+0x48/0xf0
[   26.446275] [<fffffc00003fe380>] user_path_at_empty+0x80/0xf0
[   26.446275] [<fffffc00003ef18c>] vfs_fstatat+0x7c/0x110
[   26.446275] [<fffffc00003c7eac>] find_vma+0x2c/0xc0
[   26.446275] [<fffffc000031112c>] entMM+0x9c/0xc0
[   26.446275] [<fffffc00003ef804>] SYSC_stat64+0x34/0x70
[   26.446275] [<fffffc00003114d4>] entSys+0xa4/0xc0
[   26.446275] ---[ end trace 613e3a954cbbda7f ]---

-- 
Meelis Roos (mroos@linux.ee)
