From: Thomas Steudten <alpha@steudten.com>
Subject: ALPHA Problem please give info..
Date: Sat, 11 Oct 2003 15:18:50 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <3F88033A.2040504@steudten.com>
References: <200310111244.h9BCi7QD021471@indianer.linux-kernel.at>
Reply-To: alpha@steudten.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <200310111244.h9BCi7QD021471@indianer.linux-kernel.at>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oliver Pitzeier <oliver@linux-kernel.at>
Cc: George France <france@handhelds.org>, Alan Bort <333101@personal.net.py>, James Stevenson <james@stev.org>, linux-alpha@vger.kernel.org

Hi

I got a strange oops from the 2.6.0-pre7 kernel on alpha.
Can anybody who uses this kernel, an alpha cpu, the md/ raid1
drivers give me the following info please:

- output /proc/cpuinfo or more..
- disassembly of read_balance() function in raid1.o or from the
   kernel. The gcc options use to compile from "make V=1 boot".
   You can generate a new raid1.o with.
   1. cd ./linux
   2. rm drivers/md/raid1.o
   3. make V=1 drivers/md/raid1.o
   4. look at the gcc line
   5. Add -g and -fverbose-asm to the end of the gcc line.
   6. copy paste the gcc line and execute it.
   7. objdump -S -D -l drivers/md/raid1.o > /tmp/A
   8. send the disassembly from read_balance from /tmp/A
      to alpha@steudten.com.

Thanks in advance..

Regards
Tom

