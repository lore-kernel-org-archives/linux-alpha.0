From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 0/4] Introduce and use absolute_pointer macro
Date: Tue, 14 Sep 2021 20:52:23 -0700
Message-ID: <20210915035227.630204-1-linux@roeck-us.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EWlyAfIJ6LK6KpxwIys48q3PWxQlxyDohB67wcgCd/M=;
        b=nUrn/Lw/ozglO0/A9wBQBB3xPkoAzmKdrQprI3+VccXyvcgJsFFh6Bxae1HWUezXd4
         AQmb9ebsH9GIgQE1wl9KXWoc7PiSvaIXe9WbY/IYmDO2508scavL+H0oJX9G/cISxyrs
         l7dPZq/Rzp/uC/iEYMQydnJlrkX84nLnxe5tih2wDXRTX+TvBe2oCSsAxdYX1HhGNItO
         ZbYGuPbTSYb0At2GGZVSlG9XTXaXKO2wfMUzpjKvNqfo/sD0H9uxRzfXaUWlNF9avXLB
         uvmw7xVrRzDHurwjcA9UUGVm8zBBI/SskOAh6S7tIPd1LrwGhQjamQId6BvHpdzk92Fe
         Aq/w==
Sender: Guenter Roeck <groeck7@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-alpha@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-sparse@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>

Kernel test builds currently fail for several architectures with error
messages such as the following.

drivers/net/ethernet/i825xx/82596.c: In function 'i82596_probe':
./arch/m68k/include/asm/string.h:72:25: error:
	'__builtin_memcpy' reading 6 bytes from a region of size 0
		[-Werror=stringop-overread]

Such warnings may be reported by gcc 11.x for string and memory operations
on fixed addresses if gcc's builtin functions are used for those
operations.

This patch series introduces absolute_pointer() to fix the problem.
absolute_pointer() disassociates a pointer from its originating symbol
type and context, and thus prevents gcc from making assumptions about
pointers passed to memory operations.

v2: Drop parisc patch (the problem will be solved differently)
    alpha: Move setup.h out of uapi
    Define COMMAND_LINE for alpha as absolute_pointer instead of using
    absolute_pointer on the define.

----------------------------------------------------------------
Guenter Roeck (4):
      compiler.h: Introduce absolute_pointer macro
      net: i825xx: Use absolute_pointer for memcpy from fixed memory location
      alpha: Move setup.h out of uapi
      alpha: Use absolute_pointer to define COMMAND_LINE

 arch/alpha/include/asm/setup.h      | 43 +++++++++++++++++++++++++++++++++++++
 arch/alpha/include/uapi/asm/setup.h | 42 +++---------------------------------
 drivers/net/ethernet/i825xx/82596.c |  2 +-
 include/linux/compiler.h            |  2 ++
 4 files changed, 49 insertions(+), 40 deletions(-)
 create mode 100644 arch/alpha/include/asm/setup.h
