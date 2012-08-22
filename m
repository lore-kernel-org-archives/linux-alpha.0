From: Bob Tracy <rct@gherkin.frus.com>
Subject: [BUG] net/core/sock.c won't compile on alpha
Date: Wed, 22 Aug 2012 07:14:07 -0500
Message-ID: <20120822121407.GA6257@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-alpha@vger.kernel.org, mcree@orcon.net.nz

Kernel version 3.6.0-rc2, and probably -rc1 as well.  I get the
following compile-time error on alpha architecture:

(...)
  CC      net/core/sock.o
net/core/sock.c:274:36: error: initializer element is not constant
net/core/sock.c:274:36: error: (near initialization for "memalloc_socks")
net/core/sock.c:274:36: error: initializer element is not constant
make[2]: *** [net/core/sock.o] Error 1
make[1]: *** [net/core] Error 2
make: *** [net] Error 2

Compiler is gcc-4.6.3.

Line 274 of net/core/sock.c is

struct static_key memalloc_socks = STATIC_KEY_INIT_FALSE;

which made its first appearance in 3.6.0-rc1.

--Bob
