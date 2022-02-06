From: Walt Drummond <walt@drummond.us>
Subject: [PATCH v2 0/3] vstatus: TTY status message request
Date: Sun,  6 Feb 2022 07:48:51 -0800
Message-ID: <20220206154856.2355838-1-walt@drummond.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=home.drummond.us;
 s=default; t=1644162549;
 bh=lh62Ew6xc+1J56dda/HpT63a00cvbUs7Fsz625WMbNo=;
 h=From:To:Cc:Subject:Date:From;
 b=IMvAAykX2zxhJdzSUi0tXykKGnnaIw9PnTefGLd/FLsa7mUt+ApvNnkAxjiOG8CF2
 UlzPW6Xir5kCCxWqfEYN3bIysHzhkbkxqZusgCedJCPZpR4o4Wb9ogF4kWDlkyeDok
 LYTlYz986m951X3ZrowlNl0r0VwywtHKololqrw2XNSuGipoLq/s7ikn04KsKL39ad
 cghaP14NzAPk6+6NHZRQNYCkgXjNw40CyY51sGcQ4cQ0Jz7V27lPAVlzAd+Dvjlk4C
 ETy1ibTEQwbii5XPOQWd239kGFK+1TUd3H++9y9iz3njdjgvynb9MImSqqhM8JhwF+
 VSCoxgC9Bxkaw==
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
To: agordeev@linux.ibm.com, arnd@arndb.de, benh@kernel.crashing.org, borntraeger@de.ibm.com, chris@zankel.net, davem@davemloft.net, gregkh@linuxfoundation.org, hca@linux.ibm.com, deller@gmx.de, ink@jurassic.park.msu.ru, James.Bottomley@HansenPartnership.com, jirislaby@kernel.org, mattst88@gmail.com, jcmvbkbc@gmail.com, mpe@ellerman.id.au, paulus@samba.org, rth@twiddle.net, dalias@libc.org, tsbogend@alpha.franken.de, gor@linux.ibm.com, ysato@users.osdn.me
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org, walt@drummond.us, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, ar@cs.msu.ru, linuxppc-dev@lists.ozlabs.org

This patchset adds TTY status message request feature to the n_tty
line dicipline.  This feature prints a brief message containing basic
system and process group information to a user's TTY in response to a
new control character in the line dicipline (default Ctrl-T) or the
TIOCSTAT ioctl.  The message contains the current system load, the
name and PID of an interesting process in the forground process group,
it's run time, percent CPU usage and RSS.  An example of this message
is:

  load: 0.31  cmd: sleep 3616843 [sleeping] 0.36r 0.00u 0.00s 0% 696k

This feature is in many other Unix systems, both current and
historical.  In other implementations, this feature would also send
SIGINFO to the process group; this implementation does not.

User API visible changes are limited to:
 - The addition of VSTATUS in termios.c_cc[]
 - The addition of NOKERNINFO bit in termios.l_cflags
 - The addition of the TIOCSTAT ioctl number

None of these changes break the existing kernel api as the termios
structure on all architectures has enough space in the control
character array (.c_cc) for the new character.

Walt Drummond (3):
  vstatus: Allow the n_tty line dicipline to write to a user tty
  status: Add user space API definitions for VSTATUS, NOKERNINFO and
    TIOCSTAT
  vstatus: Display an informational message when the VSTATUS character
    is pressed or TIOCSTAT ioctl is called.

 arch/alpha/include/asm/termios.h         |   4 +-
 arch/alpha/include/uapi/asm/ioctls.h     |   1 +
 arch/alpha/include/uapi/asm/termbits.h   |   2 +
 arch/ia64/include/asm/termios.h          |   4 +-
 arch/ia64/include/uapi/asm/termbits.h    |   2 +
 arch/mips/include/asm/termios.h          |   4 +-
 arch/mips/include/uapi/asm/ioctls.h      |   1 +
 arch/mips/include/uapi/asm/termbits.h    |   2 +
 arch/parisc/include/asm/termios.h        |   4 +-
 arch/parisc/include/uapi/asm/ioctls.h    |   1 +
 arch/parisc/include/uapi/asm/termbits.h  |   2 +
 arch/powerpc/include/asm/termios.h       |   4 +-
 arch/powerpc/include/uapi/asm/ioctls.h   |   2 +
 arch/powerpc/include/uapi/asm/termbits.h |   2 +
 arch/s390/include/asm/termios.h          |   4 +-
 arch/sh/include/uapi/asm/ioctls.h        |   1 +
 arch/sparc/include/uapi/asm/ioctls.h     |   1 +
 arch/sparc/include/uapi/asm/termbits.h   |   2 +
 arch/xtensa/include/uapi/asm/ioctls.h    |   1 +
 drivers/tty/Makefile                     |   2 +-
 drivers/tty/n_tty.c                      | 103 +++++++++----
 drivers/tty/n_tty_status.c               | 181 +++++++++++++++++++++++
 drivers/tty/tty_io.c                     |   2 +-
 include/asm-generic/termios.h            |   4 +-
 include/linux/tty.h                      |   7 +-
 include/uapi/asm-generic/ioctls.h        |   1 +
 include/uapi/asm-generic/termbits.h      |   2 +
 27 files changed, 301 insertions(+), 45 deletions(-)
 create mode 100644 drivers/tty/n_tty_status.c

-- 
2.30.2

