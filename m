From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [patch V4] lib: GCD: Use binary GCD algorithm instead of Euclidean
Date: Sat, 07 May 2016 12:46:11 +0200
Message-ID: <87d1oyrvrg.fsf@linux-m68k.org>
References: <20160507084129.7284.qmail@ns.horizon.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20160507084129.7284.qmail@ns.horizon.com> (George Spelvin's
	message of "7 May 2016 04:41:29 -0400")
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: George Spelvin <linux@horizon.com>
Cc: akpm@linux-foundation.org, dalias@libc.org, davem@davemloft.net, geert@linux-m68k.org, James.Bottomley@HansenPartnership.com, jjuran@gmail.com, peterz@infradead.org, sam@ravnborg.org, zengzhaoxiu@163.com, deller@gmx.de, heiko.carstens@de.ibm.com, ink@jurassic.park.msu.ru, james.hogan@imgtec.com, jejb@parisc-linux.org, jonas@southpole.se, lennox.wu@gmail.com, lftan@altera.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-metag@vger.kernel.org, linux-mips@linux-mips.org, linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux@arm.linux.org.uk, linux@lists.openrisc.net, liqin.linux@gmail.com, mattst88@gmail.com, monstr@monstr.eu, nios2-dev@lists.rocketboards.org, ralf@linux-mips.org, rth@twiddle.net, schwidefsky@d

"George Spelvin" <linux@horizon.com> writes:

> Your benchmark code doesn't have to have a separate code path if
> __x86_64__; rdtsc works on 32-bit code just as well.

Take a look at the CC: list.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
