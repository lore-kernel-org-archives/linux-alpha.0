From: Mikael Pettersson <mikpe@it.uu.se>
Subject: [bug] 2.6.39-rc3 fails to boot on Alpha
Date: Sun, 17 Apr 2011 17:13:20 +0200
Message-ID: <19883.912.266127.538215@pilspetsen.it.uu.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

2.6.39-rc3 doesn't boot on my Alpha (XP900).  As soon as aboot has loaded
and started the kernel I get:

halted CPU 0

halt code = 4
invalid PTBR
PC = fffffc00003130d0

(that PC value points to an "lda" instruction in sys_osf_proplist_syscall)

There's no other output except this, so I don't think the kernel got very far.

Haven't checked 2.6.39-rc[12] or bisected anything yet, but 2.6.38 works fine.

/Mikael
