From: syzbot <syzbot+61acc40a49a3e46e25ea@syzkaller.appspotmail.com>
Subject: Re: INFO: task hung in pipe_release (2)
Date: Wed, 12 Aug 2020 20:57:04 -0700
Message-ID: <0000000000001d3cbb05acba4cc2@google.com>
References: <00000000000084b59f05abe928ee@google.com>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <00000000000084b59f05abe928ee@google.com>
Sender: linux-ia64-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James.Bottomley@HansenPartnership.com, amanieu@gmail.com, arnd@arndb.de, benh@kernel.crashing.org, bfields@fieldses.org, borntraeger@de.ibm.com, bp@alien8.de, catalin.marinas@arm.com, chris@zankel.net, christian@brauner.io, corbet@lwn.net, cyphar@cyphar.com, dalias@libc.org, davem@davemloft.net, deller@gmx.de, dvyukov@google.com, fenghua.yu@intel.com, geert@linux-m68k.org, gor@linux.ibm.com, heiko.carstens@de.ibm.com, hpa@zytor.com, ink@jurassic.park.msu.ru, jcmvbkbc@gmail.com, jhogan@kernel.org, jlayton@kernel.org, kvalo@codeaurora.org, linux-alpha@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linu

syzbot has bisected this issue to:

commit fddb5d430ad9fa91b49b1d34d0202ffe2fa0e179
Author: Aleksa Sarai <cyphar@cyphar.com>
Date:   Sat Jan 18 12:07:59 2020 +0000

    open: introduce openat2(2) syscall

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=164e716a900000
start commit:   6ba1b005 Merge tag 'asm-generic-fixes-5.8' of git://git.ke..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=154e716a900000
console output: https://syzkaller.appspot.com/x/log.txt?x=114e716a900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=84f076779e989e69
dashboard link: https://syzkaller.appspot.com/bug?extid=61acc40a49a3e46e25ea
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=142ae224900000

Reported-by: syzbot+61acc40a49a3e46e25ea@syzkaller.appspotmail.com
Fixes: fddb5d430ad9 ("open: introduce openat2(2) syscall")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
