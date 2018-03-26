From: Ilya Smith <blackzert@gmail.com>
Subject: Re: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
Date: Mon, 26 Mar 2018 22:45:31 +0300
Message-ID: <01A133F4-27DF-4AE2-80D6-B0368BF758CD@gmail.com>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180323124806.GA5624@bombadil.infradead.org>
 <651E0DB6-4507-4DA1-AD46-9C26ED9792A8@gmail.com>
 <20180326084650.GC5652@dhcp22.suse.cz>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=S9O5DCef4JN4Csb5MyH8I2J1Wv04nrFco3PatjlWPkU=;
        b=qB2uC9R3GQamk5ZHa6D74ooUCtnGaafclLwMkabw2jn2e2tbvlYToCvnHbUmCNQKbr
         TQgd8lIExYcq6M8I3OlqSulxNndIAtVnKWSfhTaSPV6Wh0SkO6pGm+0al/ckp6M1Ecv6
         QRYa4VYLX/2jMzzLAUuR6MA0NPXz7SlJQD1aJHKiHNd4UkOf3MRCG+QF5eutJhwBVKp1
         ylaDjJK+YXvLe6OoCRjCXCpsgwNjlmrwHD+S8PXZO1d0ZjjioSI5X5OFLQ+SxEK7bAZT
         iv1nzVsaCza7bXYTdufZuNzi7CeGIZzRH/pIlP72zAq+fU1SJ7aV2qAOXl2LWi9QVww2
         Gjrw==
In-Reply-To: <20180326084650.GC5652@dhcp22.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Michal Hocko <mhocko@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@synopsys.com, linux@armlinux.org.uk, tony.luck@intel.com, fenghua.yu@intel.com, ralf@linux-mips.org, jejb@parisc-linux.org, Helge Deller <deller@gmx.de>, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, nyc@holomorphy.com, viro@zeniv.linux.org.uk, arnd@arndb.de, gregkh@linuxfoundation.org, deepa.kernel@gmail.com, Hugh Dickins <hughd@google.com>, kstewart@linuxfoundation.org, pombredanne@nexb.com, Andrew Morton <akpm@linux-foundation.org>, steve.capper@arm.com, punit.agrawal@arm.


> On 26 Mar 2018, at 11:46, Michal Hocko <mhocko@kernel.org> wrote:
>=20
> On Fri 23-03-18 20:55:49, Ilya Smith wrote:
>>=20
>>> On 23 Mar 2018, at 15:48, Matthew Wilcox <willy@infradead.org> =
wrote:
>>>=20
>>> On Thu, Mar 22, 2018 at 07:36:36PM +0300, Ilya Smith wrote:
>>>> Current implementation doesn't randomize address returned by mmap.
>>>> All the entropy ends with choosing mmap_base_addr at the process
>>>> creation. After that mmap build very predictable layout of address
>>>> space. It allows to bypass ASLR in many cases. This patch make
>>>> randomization of address on any mmap call.
>>>=20
>>> Why should this be done in the kernel rather than libc?  libc is =
perfectly
>>> capable of specifying random numbers in the first argument of mmap.
>> Well, there is following reasons:
>> 1. It should be done in any libc implementation, what is not possible =
IMO;
>=20
> Is this really so helpful?

Yes, ASLR is one of very important mitigation techniques which are =
really used=20
to protect applications. If there is no ASLR, it is very easy to exploit=20=

vulnerable application and compromise the system. We can=E2=80=99t just =
fix all the=20
vulnerabilities right now, thats why we have mitigations - techniques =
which are=20
makes exploitation more hard or impossible in some cases.

Thats why it is helpful.

>=20
>> 2. User mode is not that layer which should be responsible for =
choosing
>> random address or handling entropy;
>=20
> Why?

Because of the following reasons:
1. To get random address you should have entropy. These entropy =
shouldn=E2=80=99t be=20
exposed to attacker anyhow, the best case is to get it from kernel. So =
this is
a syscall.
2. You should have memory map of your process to prevent remapping or =
big
fragmentation. Kernel already has this map. You will got another one in =
libc.
And any non-libc user of mmap (via syscall, etc) will make hole in your =
map.
This one also decrease performance cause you any way call syscall_mmap=20=

which will try to find some address for you in worst case, but after you =
already
did some computing on it.
3. The more memory you use in userland for these proposal, the easier =
for
attacker to leak it or use in exploitation techniques.
4. It is so easy to fix Kernel function and so hard to support memory
management from userspace.

>=20
>> 3. Memory fragmentation is unpredictable in this case
>>=20
>> Off course user mode could use random =E2=80=98hint=E2=80=99 address, =
but kernel may
>> discard this address if it is occupied for example and allocate just =
before
>> closest vma. So this solution doesn=E2=80=99t give that much security =
like=20
>> randomization address inside kernel.
>=20
> The userspace can use the new MAP_FIXED_NOREPLACE to probe for the
> address range atomically and chose a different range on failure.
>=20

This algorithm should track current memory. If he doesn=E2=80=99t he may =
cause
infinite loop while trying to choose memory. And each iteration increase =
time
needed on allocation new memory, what is not preferred by any libc =
library
developer.

Thats why I did this patch.

Thanks,
Ilya


