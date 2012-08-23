From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH 00/11] rcu: Add missing RCU idle APIs on idle loop v2
Date: Thu, 23 Aug 2012 16:58:24 +0200
Message-ID: <1345733915-20040-1-git-send-email-fweisbec@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:x-mailer;
        bh=WOtodxy7w4DOm2zh7qEvxc3ZDDJeYz6ZE1GoIHMGLf8=;
        b=Y8M6Kq5HeNsTRkKBlVaVYcvV4T5bRhuTprMJ1lZ3bCjghwV72ze/DGCZP32kUvb9m7
         Chk0QmMYi/X8bylBZJDw1dnJHKH5lwI336D4ugD3940z6y+CT9uBylveLSItQdEPf1dA
         fG7me1WxdtxfxNW39U1aGm7TCVfgKhg3rIRkPnx+fg+vomZTydDh3rbp1lY95NaioSos
         Bd6bhLMC7rVfhyRhJ2Jm5y+i/BrniDhcSCHtZfXZQFZpos6OmLc65mP/A1xbMAkjyL31
         rDvxLovAfcv4TGR9X+rnEunAwsME54kbehdHWCeYPcSPGQ2R7/ix8VNylSMadfWRKryW
         q2lg==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Chris Zankel <chris@zankel.net>, "3.2.x.." <stable@vger.kernel.org>, Chen Liqin <liqin.chen@sunplusct.com>, Lennox Wu <lennox.wu@gmail.com>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, Parisc <linux-parisc@vger.kernel.org>, David Howells <dhowells@redhat.com>, Koichi Yasutake <yasutake.koichi@jp.panasonic.com>, Geert Uytterhoeven <geert@linux-m68k.org>, m68k <linux-m68k@lists.linux-m68k.org>, Hirokazu Takata <takata@linux-m32r.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Cris <linux-cris-kernel@axis.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Mic

Hi,

Changes since v1:

- Fixed preempt handling in alpha idle loop
- added ack from Geert
- fixed stable email address, sorry :-/

This time I built tested everywhere but: h8300 (compiler internal error),
and mn10300, parisc, score (cross compilers not available in
ftp://ftp.kernel.org/pub/tools/crosstool/files/bin/x86_64/4.6.3/)

For testing, you can pull from:

git://github.com/fweisbec/linux-dynticks.git
	rcu/idle-fix-v2 

Thanks.

Frederic Weisbecker (11):
  alpha: Fix preemption handling in idle loop
  alpha: Add missing RCU idle APIs on idle loop
  cris: Add missing RCU idle APIs on idle loop
  frv: Add missing RCU idle APIs on idle loop
  h8300: Add missing RCU idle APIs on idle loop
  m32r: Add missing RCU idle APIs on idle loop
  m68k: Add missing RCU idle APIs on idle loop
  mn10300: Add missing RCU idle APIs on idle loop
  parisc: Add missing RCU idle APIs on idle loop
  score: Add missing RCU idle APIs on idle loop
  xtensa: Add missing RCU idle APIs on idle loop

 arch/alpha/kernel/process.c   |    6 +++++-
 arch/alpha/kernel/smp.c       |    1 +
 arch/cris/kernel/process.c    |    3 +++
 arch/frv/kernel/process.c     |    3 +++
 arch/h8300/kernel/process.c   |    3 +++
 arch/m32r/kernel/process.c    |    3 +++
 arch/m68k/kernel/process.c    |    3 +++
 arch/mn10300/kernel/process.c |    3 +++
 arch/parisc/kernel/process.c  |    3 +++
 arch/score/kernel/process.c   |    4 +++-
 arch/xtensa/kernel/process.c  |    3 +++
 11 files changed, 33 insertions(+), 2 deletions(-)

-- 
1.7.5.4

