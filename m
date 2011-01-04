From: Bob Tracy <rct@gherkin.frus.com>
Subject: [BUG] implicit declaration of kfree/kzalloc in i2c-i801.c on Alpha
Date: Tue, 4 Jan 2011 00:18:21 -0600
Message-ID: <20110104061821.GA25886@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org
Cc: mcree@orcon.net.nz

Another 2.6.37-rc8 build failure on alpha:

(...)
  CC [M]  drivers/i2c/busses/i2c-i801.o
drivers/i2c/busses/i2c-i801.c: In function 'i801_probe':
drivers/i2c/busses/i2c-i801.c:737: error: implicit declaration of function 'kzalloc'
drivers/i2c/busses/i2c-i801.c:737: warning: assignment makes pointer from integer without a cast
drivers/i2c/busses/i2c-i801.c:855: error: implicit declaration of function 'kfree'
make[3]: *** [drivers/i2c/busses/i2c-i801.o] Error 1
make[2]: *** [drivers/i2c/busses] Error 2
make[1]: *** [drivers/i2c] Error 2
make: *** [drivers] Error 2

--Bob
