From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 2/2] arch: Reserve map_shadow_stack() syscall number for
 all architectures
Date: Thu, 14 Sep 2023 22:26:47 +1000
Message-ID: <871qf17xfc.fsf@mail.lhotse>
References: <20230911180210.1060504-1-sohil.mehta@intel.com>
 <20230911180210.1060504-3-sohil.mehta@intel.com>
 <8b7106881fa227a64b4e951c6b9240a7126ac4a2.camel@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1694694421;
        bh=IKd/xoLaYMNT3G43ojUHtX33LcBflkrUDAX5TgQ89VQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=rYiR5HRfpS/tMJ5vZ04WGHK5tqlEmN3zl7YBnuBIj4iDXvSjRcMk3Bm1xQR4G2xqA
         ch/6vWdPHmOC2BUMMk4XX30GKkFETwPb6UKi6HR3vSS9M+ZGF48pqFYfp4X0b6Xnoc
         3IT8Xs1CRfVJWHkXJOg3XffMJXWhIzBrBfe0rLT/1FOwmVJNKXhzU+07wARKckah+G
         1nYEufulJtii1DdLYzWI+dlftci66s6CJLfGerDALqoTxKf5zQo5DIOqkNkz913pHl
         hiwkYuo8iIaiLSkIq8iYXaa9BldBulkzz3WoyK+kyoqd71CY/sNwj3K8X+Pby7L5LJ
         Ni+zJOD6zygLg==
In-Reply-To: <8b7106881fa227a64b4e951c6b9240a7126ac4a2.camel@intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "Mehta, Sohil" <sohil.mehta@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>
Cc: "svens@linux.ibm.com" <svens@linux.ibm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "schwab@linux-m68k.org" <schwab@linux-m68k.org>, "brgerst@gmail.com" <brgerst@gmail.com>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "monstr@monstr.eu" <monstr@monstr.eu>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>, "dalias@libc.org" <dalias@libc.org>, "lukas.bulwahn@gmail.com" <>

"Edgecombe, Rick P" <rick.p.edgecombe@intel.com> writes:
> On Mon, 2023-09-11 at 18:02 +0000, Sohil Mehta wrote:
>> diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl
>> b/arch/powerpc/kernel/syscalls/syscall.tbl
>> index 20e50586e8a2..2767b8a42636 100644
>> --- a/arch/powerpc/kernel/syscalls/syscall.tbl
>> +++ b/arch/powerpc/kernel/syscalls/syscall.tbl
>> @@ -539,3 +539,4 @@
>> =C2=A0450=C2=A0=C2=A0=C2=A0=C2=A0nospu=C2=A0=C2=A0=C2=A0set_mempolicy_ho=
me_node=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sys_set_mempol=
icy_hom
>> e_node
>> =C2=A0451=C2=A0=C2=A0=C2=A0=C2=A0common=C2=A0=C2=A0cachestat=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sys_cachestat
>> =C2=A0452=C2=A0=C2=A0=C2=A0=C2=A0common=C2=A0=C2=A0fchmodat2=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sys_fchmodat2
>> +453=C2=A0=C2=A0=C2=A0=C2=A0common=C2=A0=C2=A0map_shadow_stack=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0sys_map_shadow_stack
>
> I noticed in powerpc, the not implemented syscalls are manually mapped
> to sys_ni_syscall. It also has some special extra sys_ni_syscall()
> implementation bits to handle both ARCH_HAS_SYSCALL_WRAPPER and
> !ARCH_HAS_SYSCALL_WRAPPER. So wondering if it might need special
> treatment. Did you see those parts?

I don't think it needs any special treatment. It's processed by the same
script as other arches (scripts/syscalltbl.sh). So if there's no compat
or native entry it will default to sys_ni_syscall.

I think it's just habit/historical that we always spell out sys_ni_syscall.

cheers
