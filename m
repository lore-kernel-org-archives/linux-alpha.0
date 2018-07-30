From: Bob Tracy <rct@gherkin.frus.com>
Subject: [FTBFS] 4.18-rc7 bitsperlong.h issue on alpha
Date: Mon, 30 Jul 2018 18:12:10 -0500
Message-ID: <20180730231210.GA20813@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-alpha@vger.kernel.org, debian-alpha@lists.debian.org

On an alpha system, got the following build error on the 4.18-rc7
mainline kernel source tree:

  HOSTCC  net/bpfilter/main.o
In file included from tools/include/uapi/asm/bitsperlong.h:17,
                 from /usr/include/asm-generic/int-ll64.h:12,
		 from /usr/include/alpha-linux-gnu/asm/types.h:24,
                 from tools/include/linux/types.h:10,
                 from ./include/uapi/linux/bpf.h:11,
                 from net/bpfilter/main.c:9:
tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent word size.  Check asm/bitsperlong.h
 #error Inconsistent word size.  Check asm/bitsperlong.h
  ^~~~~
scripts/Makefile.host:107: recipe for target 'net/bpfilter/main.o' failed
make[2]: *** [net/bpfilter/main.o] Error 1
scripts/Makefile.build:558: recipe for target 'net/bpfilter' failed
make[1]: *** [net/bpfilter] Error 2
Makefile:1029: recipe for target 'net' failed
make: *** [net] Error 2

Encountering this kind of error is not unusual on alpha.

--Bob
