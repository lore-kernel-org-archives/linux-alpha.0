From: Thomas Steudten <alpha@steudten.com>
Subject: Kernel crash/ oops >= 2.6.5 with gcc 3.4.0 on alpha
Date: Fri, 28 May 2004 13:47:12 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <40B726C0.5030400@steudten.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-admin@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

Hi

Sorry, maybe I miss some message before.

I build the 2.6.6 kernel with gcc-3.4.0 and it crashs after
start some init scripts (got no log at this time).
So I tried to rebuild my last build 2.6.5, and this
crashs to. The build with gcc-3.3.3 works without problems.
modutils-2.4.27

http://www.uwsg.iu.edu/hypermail/linux/kernel/0405.1/1532.html

No other application seems to fail with gcc-3.4.0 so I think
this problem is in context to the relocation, modules and gcc-3.4.0.

make modules
make[1]: `arch/alpha/kernel/asm-offsets.s' is up to date.
   CC [M]  fs/binfmt_em86.o
{standard input}: Assembler messages:
{standard input}:7: Warning: setting incorrect section attributes for .got
   CC [M]  fs/quota_v2.o
{standard input}: Assembler messages:
{standard input}:7: Warning: setting incorrect section attributes for .got
   CC [M]  fs/autofs/dirhash.o
   CC [M]  fs/autofs/init.o
{standard input}: Assembler messages:
{standard input}:7: Warning: setting incorrect section attributes for .got
   CC [M]  fs/autofs/inode.o


On x86 everything works without problems.

Please CC me.
-- 
Tom

LINUX user since kernel 0.99.x 1994.
RPM Alpha packages at http://alpha.steudten.com/packages
Want to know what S.u.S.E 1995 cdrom-set contains?



