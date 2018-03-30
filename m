From: Rich Felker <dalias@libc.org>
Subject: Re: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
Date: Fri, 30 Mar 2018 09:33:48 -0400
Message-ID: <20180330133348.GR1436@brightrain.aerifal.cx>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180330075508.GA21798@amd>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180330075508.GA21798@amd>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>
Cc: Ilya Smith <blackzert@gmail.com>, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@synopsys.com, linux@armlinux.org.uk, tony.luck@intel.com, fenghua.yu@intel.com, jhogan@kernel.org, ralf@linux-mips.org, jejb@parisc-linux.org, deller@gmx.de, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, ysato@users.sourceforge.jp, davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, nyc@holomorphy.com, viro@zeniv.linux.org.uk, arnd@arndb.de, gregkh@linuxfoundation.org, deepa.kernel@gmail.com, mhocko@suse.com, hughd@google.com, kstewart@linuxfoundation.org, pombredanne@nexb.com, akpm@linux-foundation.org, steve.capper@arm.com, punit.agrawal@arm.com, paul.burton@mips.com

On Fri, Mar 30, 2018 at 09:55:08AM +0200, Pavel Machek wrote:
> Hi!
> 
> > Current implementation doesn't randomize address returned by mmap.
> > All the entropy ends with choosing mmap_base_addr at the process
> > creation. After that mmap build very predictable layout of address
> > space. It allows to bypass ASLR in many cases. This patch make
> > randomization of address on any mmap call.
> 
> How will this interact with people debugging their application, and
> getting different behaviours based on memory layout?
> 
> strace, strace again, get different results?

Normally gdb disables ASLR for the process when invoking a program to
debug. I don't see why that would be terribly useful with strace but
you can do the same if you want.

Rich
