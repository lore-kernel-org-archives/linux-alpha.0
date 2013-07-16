From: Richard Henderson <rth@twiddle.net>
Subject: [PATCH 0/7] Minor Alpha updates for 3.11
Date: Tue, 16 Jul 2013 10:04:33 -0700
Message-ID: <1373994280-12047-1-git-send-email-rth@twiddle.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:x-mailer:mime-version
         :content-type:content-transfer-encoding;
        bh=R3WUhrBaca1SPNwG1T8lM1YoX75q6l5fGs8+N1AgcF4=;
        b=e1wQoa64rxoYgdUigX2u0Ar8ysNSFiLibxgdPS8Z/2q+59CQ6B0EphqYgjSfmOHGKH
         P+5W/seKpVd31nwhbcvI5voigtfKElnUigrHthGCbHTbgi1XklAwqZwAlA+S/EUzh6gZ
         AchNAOe9EALStj2AGNVoR0gLTuBc13Z0ABcrc8kxADoUmyOXL8gkJIvPESiusBvWzut9
         kR8ia9SzsH2jUc4ADP8byd/VzeUHQd+XtTcbqa9UucVLa8uXBjI5SCNw/9BqRQ/K910t
         IkpTUc3qjNF2EicPTGk2+k/8t5OW4lnguZTO6GYgbSNFUa7w8zfFt1zzCXkz8xk4CvZP
         bhsw==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

Here's a set of minor updates for arch/alpha that should not
be controversial.


r~


The following changes since commit 47188d39b5deeebf41f87a02af1b3935866364cf:

  Merge tag 'ext4_for_linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4 (2013-07-14 21:47:51 -0700)

are available in the git repository at:


  git://github.com/rth7680/linux.git axp-next

for you to fetch changes up to fd60fe7052eceab1b1e7c8691263ec2b2634ace0:

  alpha: Fix type compatibility warning for marvel_map_irq (2013-07-16 09:55:06 -0700)

----------------------------------------------------------------
Richard Henderson (7):
      alpha: Add kcmp and finit_module syscalls
      alpha: Eliminate compiler warning from memset macro
      alpha: Modernize lib/mpi/longlong.h
      alpha: Improve atomic_add_unless
      alpha: Implement atomic64_dec_if_positive
      alpha: Generate dwarf2 unwind info for various kernel entry points.
      alpha: Fix type compatibility warning for marvel_map_irq

 arch/alpha/Kconfig                   |   1 +
 arch/alpha/include/asm/atomic.h      |  88 ++++++--
 arch/alpha/include/asm/string.h      |  18 +-
 arch/alpha/include/asm/unistd.h      |   3 +-
 arch/alpha/include/uapi/asm/unistd.h |   2 +
 arch/alpha/kernel/entry.S            | 399 +++++++++++++++++++++++++----------
 arch/alpha/kernel/sys_marvel.c       |   3 +-
 arch/alpha/kernel/systbls.S          |   2 +
 lib/mpi/longlong.h                   |  17 +-
 9 files changed, 380 insertions(+), 153 deletions(-)
