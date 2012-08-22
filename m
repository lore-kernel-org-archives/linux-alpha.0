From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH 00/10] rcu: Add missing RCU idle APIs on idle loop
Date: Wed, 22 Aug 2012 18:23:38 +0200
Message-ID: <1345652628-15060-1-git-send-email-fweisbec@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:x-mailer;
        bh=nJ1z2nCzrWT1UP1YY0Zj78ja6g5gZ3Akz87yrkUrsjE=;
        b=BdL4rI0IP0LMnQ4vLbfisFd5CWj9ToNTe/ern7gFyhTc87HSZAXgSlRYjEcIv0S34S
         b7m8KeJ8iqvDgl7hsdIkjH6ECjDqA5oDoOiPDAPhDbNXMA421WyG5iH5vOVzVRijEMdE
         KkMyP6NgGoAG0BkIby1tNW54csJAjgXNGmS84i/Y1KwHYidl0dFa9pX0wV6I5lxzWWaO
         pnMrMDTnDUTyEsKYM8ex5mz15jSdSiafcnlDMfmwcDu3rFXnc+GVK6KhG3fzScIlh6mQ
         K0P21atFtGw37AfRFeo+xLSqZ5QJ55SulTyzFkeQzdjnZ6QuLudLLa1J+3UDRgRTSPX4
         vNww==
Sender: linux-parisc-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Chris Zankel <chris@zankel.net>, "3.2.x.." <stable@kernel.org>, Chen Liqin <liqin.chen@sunplusct.com>, Lennox Wu <lennox.wu@gmail.com>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, Parisc <linux-parisc@vger.kernel.org>, David Howells <dhowells@redhat.com>, Koichi Yasutake <yasutake.koichi@jp.panasonic.com>, Geert Uytterhoeven <geert@linux-m68k.org>, m68k <linux-m68k@lists.linux-m68k.org>, Hirokazu Takata <takata@linux-m32r.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Cris <linux-cris-kernel@axis.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>

So this fixes some potential RCU stalls in a bunch of architectures.
When rcu_idle_enter()/rcu_idle_exit() became a requirement, we forgot
to handle the architectures that don't support CONFIG_NO_HZ.

I guess the set should be dispatched into arch maintainer trees.

I'm sorry I haven't built tested everywhere. But the changes are
small and need to be at least boot tested anyway.

Also many of these archs use the same kind of idle loop:

void cpu_idle(void)
{
        while (1) {
                rcu_idle_enter();
                while (!need_resched())
                        //power saving function()
                rcu_idle_exit();
                schedule_preempt_disabled();
        }
}

So once the set is merged, I'll probably try to consolidate this with a generic
simple cpu_idle() that does the above and calls the arch power saving
function. This will be only for archs that use this simple idle loop
of course.

Thanks.

Frederic Weisbecker (10):
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
 arch/cris/kernel/process.c    |    3 +++
 arch/frv/kernel/process.c     |    3 +++
 arch/h8300/kernel/process.c   |    3 +++
 arch/m32r/kernel/process.c    |    3 +++
 arch/m68k/kernel/process.c    |    3 +++
 arch/mn10300/kernel/process.c |    3 +++
 arch/parisc/kernel/process.c  |    3 +++
 arch/score/kernel/process.c   |    4 +++-
 arch/xtensa/kernel/process.c  |    3 +++
 10 files changed, 32 insertions(+), 2 deletions(-)

-- 
1.7.5.4

