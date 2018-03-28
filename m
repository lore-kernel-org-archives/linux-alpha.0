From: Ilya Smith <blackzert@gmail.com>
Subject: Re: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
Date: Wed, 28 Mar 2018 21:47:15 +0300
Message-ID: <F9D157F8-F70F-45BC-B9E4-B5CB7CC419F4@gmail.com>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180323124806.GA5624@bombadil.infradead.org>
 <651E0DB6-4507-4DA1-AD46-9C26ED9792A8@gmail.com>
 <20180326084650.GC5652@dhcp22.suse.cz>
 <01A133F4-27DF-4AE2-80D6-B0368BF758CD@gmail.com>
 <20180327072432.GY5652@dhcp22.suse.cz>
 <0549F29C-12FC-4401-9E85-A430BC11DA78@gmail.com>
 <20180327143820.GH5652@dhcp22.suse.cz>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=egK4Hy+FSMVRapLItJLtWI4tYDufyZsulm/WqkNWwpk=;
        b=rho/w/GdqJxAuE5Zb9qX5hYgtEFMkl+4bKPLAesLv2h23Ls1RLt2o7h9vigxREBmwW
         oJc7zB8l7tTWE6vnFnZ8UOaCDrPTjbNu0wNyvPwnIr/izGzSQFKnQ/ckivvAckB3neM/
         wIaE4MNMjW8NN7Nn78+B6nial1Me7lo+tjQ/cRNntsYuZCe96d14RdObNEQYOkNV9ico
         cLJNsqGKNH/fgq6/ECk8h6q5oxnM3KJKWpIpLI27yQ978Q6hcrQdC1pnmBQprMfZfIWL
         Tsq/fhuvpSPik66hB7ybw8drTgKHhl3sfCUmh3OESwX8ZD15e6cKCwWXZL0q1JsfS9/k
         Kp6w==
In-Reply-To: <20180327143820.GH5652@dhcp22.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Michal Hocko <mhocko@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@synopsys.com, linux@armlinux.org.uk, tony.luck@intel.com, fenghua.yu@intel.com, ralf@linux-mips.org, jejb@parisc-linux.org, Helge Deller <deller@gmx.de>, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, nyc@holomorphy.com, viro@zeniv.linux.org.uk, arnd@arndb.de, gregkh@linuxfoundation.org, deepa.kernel@gmail.com, Hugh Dickins <hughd@google.com>, kstewart@linuxfoundation.org, pombredanne@nexb.com, Andrew Morton <akpm@linux-foundation.org>, steve.capper@arm.com, punit.agrawal@arm.


> On 27 Mar 2018, at 17:38, Michal Hocko <mhocko@kernel.org> wrote:
>=20
> On Tue 27-03-18 16:51:08, Ilya Smith wrote:
>>=20
>>> On 27 Mar 2018, at 10:24, Michal Hocko <mhocko@kernel.org> wrote:
>>>=20
>>> On Mon 26-03-18 22:45:31, Ilya Smith wrote:
>>>>=20
>>>>> On 26 Mar 2018, at 11:46, Michal Hocko <mhocko@kernel.org> wrote:
>>>>>=20
>>>>> On Fri 23-03-18 20:55:49, Ilya Smith wrote:
>>>>>>=20
>>>>>>> On 23 Mar 2018, at 15:48, Matthew Wilcox <willy@infradead.org> =
wrote:
>>>>>>>=20
>>>>>>> On Thu, Mar 22, 2018 at 07:36:36PM +0300, Ilya Smith wrote:
>>>>>>>> Current implementation doesn't randomize address returned by =
mmap.
>>>>>>>> All the entropy ends with choosing mmap_base_addr at the =
process
>>>>>>>> creation. After that mmap build very predictable layout of =
address
>>>>>>>> space. It allows to bypass ASLR in many cases. This patch make
>>>>>>>> randomization of address on any mmap call.
>>>>>>>=20
>>>>>>> Why should this be done in the kernel rather than libc?  libc is =
perfectly
>>>>>>> capable of specifying random numbers in the first argument of =
mmap.
>>>>>> Well, there is following reasons:
>>>>>> 1. It should be done in any libc implementation, what is not =
possible IMO;
>>>>>=20
>>>>> Is this really so helpful?
>>>>=20
>>>> Yes, ASLR is one of very important mitigation techniques which are =
really used=20
>>>> to protect applications. If there is no ASLR, it is very easy to =
exploit=20
>>>> vulnerable application and compromise the system. We can=E2=80=99t =
just fix all the=20
>>>> vulnerabilities right now, thats why we have mitigations - =
techniques which are=20
>>>> makes exploitation more hard or impossible in some cases.
>>>>=20
>>>> Thats why it is helpful.
>>>=20
>>> I am not questioning ASLR in general. I am asking whether we really =
need
>>> per mmap ASLR in general. I can imagine that some environments want =
to
>>> pay the additional price and other side effects, but considering =
this
>>> can be achieved by libc, why to add more code to the kernel?
>>=20
>> I believe this is the only one right place for it. Adding these 200+ =
lines of=20
>> code we give this feature for any user - on desktop, on server, on =
IoT device,=20
>> on SCADA, etc. But if only glibc will implement =E2=80=98user-mode-aslr=
=E2=80=99 IoT and SCADA=20
>> devices will never get it.
>=20
> I guess it would really help if you could be more specific about the
> class of security issues this would help to mitigate. My first
> understanding was that we we need some randomization between program
> executable segments to reduce the attack space when a single address
> leaks and you know the segments layout (ordering). But why do we need
> _all_ mmaps to be randomized. Because that complicates the
> implementation consirably for different reasons you have mentioned
> earlier.
>=20

There are following reasons:
1) To protect layout if one region was leaked (as you said).=20
2) To protect against exploitation of Out-of-bounds vulnerabilities in =
some=20
cases (CWE-125 , CWE-787)
3) To protect against exploitation of Buffer Overflows in some cases =
(CWE-120)
4) To protect application in cases when attacker need to guess the =
address=20
(paper ASLR-NG by  Hector Marco-Gisbert and  Ismael Ripoll-Ripoll)
And may be more cases.

> Do you have any specific CVE that would be mitigated by this
> randomization approach?
> I am sorry, I am not a security expert to see all the cosequences but =
a
> vague - the more randomization the better - sounds rather weak to me.

It is hard to name concrete CVE number, sorry. Mitigations are made to =
prevent=20
exploitation but not to fix vulnerabilities. It means good mitigation =
will make=20
vulnerable application crash but not been compromised in most cases. =
This means=20
the better randomization, the less successful exploitation rate.


Thanks,
Ilya

