From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RFC PATCH v2 2/2] Architecture defined limit on memory region
 random shift.
Date: Thu, 22 Mar 2018 13:54:48 -0700
Message-ID: <20180322135448.046ada120ecd1ab3dd8f94aa@linux-foundation.org>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
        <1521736598-12812-3-git-send-email-blackzert@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521736598-12812-3-git-send-email-blackzert@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ilya Smith <blackzert@gmail.com>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@synopsys.com, linux@armlinux.org.uk, tony.luck@intel.com, fenghua.yu@intel.com, jhogan@kernel.org, ralf@linux-mips.org, jejb@parisc-linux.org, deller@gmx.de, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, nyc@holomorphy.com, viro@zeniv.linux.org.uk, arnd@arndb.de, gregkh@linuxfoundation.org, deepa.kernel@gmail.com, mhocko@suse.com, hughd@google.com, kstewart@linuxfoundation.org, pombredanne@nexb.com, steve.capper@arm.com, punit.agrawal@arm.com, paul.burton@mips.com, aneesh.kumar@linux.vnet.ibm.com, npiggin@gmail.c


Please add changelogs.  An explanation of what a "limit on memory
region random shift" is would be nice ;) Why does it exist, why are we
doing this, etc.  Surely there's something to be said - at present this
is just a lump of random code?



