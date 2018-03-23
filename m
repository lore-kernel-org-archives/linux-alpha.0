From: Ilya Smith <blackzert@gmail.com>
Subject: Re: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
Date: Fri, 23 Mar 2018 20:55:49 +0300
Message-ID: <651E0DB6-4507-4DA1-AD46-9C26ED9792A8@gmail.com>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180323124806.GA5624@bombadil.infradead.org>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Nn/LegfdgCnPMfgxrP8ldElW5x41AbmrS9XnJZIcO0M=;
        b=dmuwuz6Z424tcCQofiCkpe7cXUJw3+yS9d8dSuF6KIrQ3AS98qcM3znkAh+yQ8N861
         DQUFRDwaQ8zsA9zfeG1lYzBYGpXJi8Q50XApUrKoNifIvTjyQXebt0GhEeFeh8udWnN1
         SaV+sgwIzdJcB/Q+xKm4AeFiWecFUaKndxiCasm/VGFuPIpnt4oIuMGZ2lfUg8gMc7EF
         TLbBhWhnBsA501jUsXGVCUu1Ta1OuIi+DgH6N9txRSK0LYwrDOwwO4wBeB3FY9sG34Ee
         y4n5+NevXgWYxnIIpB+Zzgls02Nrk6ePhuN+gOhnMpVoienq2TVmDFk/zgtFS2MEb0+f
         QLog==
In-Reply-To: <20180323124806.GA5624@bombadil.infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Matthew Wilcox <willy@infradead.org>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@synopsys.com, linux@armlinux.org.uk, tony.luck@intel.com, fenghua.yu@intel.com, ralf@linux-mips.org, jejb@parisc-linux.org, Helge Deller <deller@gmx.de>, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, nyc@holomorphy.com, viro@zeniv.linux.org.uk, arnd@arndb.de, gregkh@linuxfoundation.org, deepa.kernel@gmail.com, Michal Hocko <mhocko@suse.com>, Hugh Dickins <hughd@google.com>, kstewart@linuxfoundation.org, pombredanne@nexb.com, Andrew Morton <akpm@linux-foundation.org>, steve.capper@arm.com, punit.agrawal@arm.com


> On 23 Mar 2018, at 15:48, Matthew Wilcox <willy@infradead.org> wrote:
>=20
> On Thu, Mar 22, 2018 at 07:36:36PM +0300, Ilya Smith wrote:
>> Current implementation doesn't randomize address returned by mmap.
>> All the entropy ends with choosing mmap_base_addr at the process
>> creation. After that mmap build very predictable layout of address
>> space. It allows to bypass ASLR in many cases. This patch make
>> randomization of address on any mmap call.
>=20
> Why should this be done in the kernel rather than libc?  libc is =
perfectly
> capable of specifying random numbers in the first argument of mmap.
Well, there is following reasons:
1. It should be done in any libc implementation, what is not possible =
IMO;
2. User mode is not that layer which should be responsible for choosing
random address or handling entropy;
3. Memory fragmentation is unpredictable in this case

Off course user mode could use random =E2=80=98hint=E2=80=99 address, =
but kernel may
discard this address if it is occupied for example and allocate just =
before
closest vma. So this solution doesn=E2=80=99t give that much security =
like=20
randomization address inside kernel.=
