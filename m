From: JB <juergen-alpha@juergen-bierlein.org>
Subject: Re: Linux kernel 3.18 and above does not boot on PC164
Date: Wed, 30 Mar 2016 16:17:35 +0200
Message-ID: <BFB7D082-28E0-4DC1-8CF8-86E6692EAB6A@juergen-bierlein.org>
References: <2E8978F7-4F10-44C0-92ED-CADF683B61AE@juergen-bierlein.org> <20160302080952.GB31216@tower> <4F3332A6-4A28-4D9D-9023-C5DFEFDBE44C@juergen-bierlein.org> <B0C50BE7-A17C-40C0-B6E3-AC06233B5290@juergen-bierlein.org> <4A35B375-BE7B-4EBE-BDD1-2A6B3AD9E550@juergen-bierlein.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1459347462; l=4294;
	s=domk; d=juergen-bierlein.org;
	h=CC:To:Date:From:Subject:Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To;
	bh=Ww0/cIvYY/KprrjUrALk7cEtn92izhhGtZG6oeP74iY=;
	b=n52n5GTFXKRTIHNfkZAO0aSLvEVkr9zvGfapuFYbW3ycITCGC5BsL9KoXdFyJaBQHey
	+/cuYrpVjqYPF0vGFp0gGvzS2DWTuxZeKN/U3/fCXUZy5sPM0EC9z2UsmgXTtqY5lPuSe
	Gu+MgovaoNvN+pA87QU9D7iYJ2huWKpfl4I=
In-Reply-To: <4A35B375-BE7B-4EBE-BDD1-2A6B3AD9E550@juergen-bierlein.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: juergen-alpha@juergen-bierlein.org
Cc: linux-alpha@vger.kernel.org

Hi again,

3.17.4 and 3.17.8 also boot fine with the generic alpha kernel.
3.18.rc1 does not boot with this configuration. It just hangs when star=
ting the kernel from aboot.
So i guess the issue has been introduced in this patch for 3.18.rc1.

Will try some more builds over the next days and weeks and notify here =
if i found something ...

Take care,
J=C3=BCrgen

Am 10. M=C3=A4rz 2016 16:51:50 MEZ, schrieb JB <juergen-alpha@juergen-b=
ierlein.org>:
>Hi list,
>
>a small update.
>So far these kernel versions boot with the generic architecture on a
>PC164 board:
>3.14.*
>3.15.0
>3.16.0
>3.17.0
>3.17.4
>
>3.18.0 fails to boot.
>
>So the change must be in the remaining patches for 3.17.6 till 3.18.0.
>
>May be i have some more time in April to continue with the analysis or
>someone here on the list is going to volunteer and jump in ;-)
>
>Have fun,
>J=C3=BCrgen
>
>
>Am 3. M=C3=A4rz 2016 07:22:22 MEZ, schrieb JB
><juergen-alpha@juergen-bierlein.org>:
>>Hi all,
>>
>>The PC164 specific 4.4.3 kernel is booting now :-)
>>The network interface is not present but this is secondary for now.
>>
>>Thanks for the tip.
>>
>>I try to find out which kernel patch introduced the error with the
>>generic kernel configuration. This will take some time as every kerne=
l
>>build takes ~10 hours on this legacy machine ...
>>
>>Best regards,
>>Juergen
>>
>>Am 2. M=C3=A4rz 2016 10:27:21 MEZ, schrieb JB
>><juergen-alpha@juergen-bierlein.org>:
>>>OK, i give the pc164 specific kernel a try. Will report here if it
>>>worked or not the next days ...
>>>
>>>At least i am not alone with the issue :-)
>>>
>>>Cheers, Juergen
>>>
>>>Am 2. M=C3=A4rz 2016 09:09:52 MEZ, schrieb Michael Cree
>>><mcree@orcon.net.nz>:
>>>>On Tue, Mar 01, 2016 at 08:08:28PM +0100, JB wrote:
>>>>> i compiled the latest 3.14.62 kernel for my PC164 EV56 alpha
>>system.
>>>>This works without any failures since kernel 3.6.4 and above.
>>>>> Unfortunately i cannot get the linux kernel 3.18 and above to boo=
t
>>>>(the latest try today was a 4.4.3 Kernel).
>>>>>=20
>>>>> The last entries on the screen are:
>>>>>=20
>>>>> ###############################################
>>>>> aboot: Linux/Alpha SRM bootloader version 1.0_pre20040408
>>>>> aboot: switching to OSF/1 PALcode version 1.23
>>>>> aboot: booting from device 'IDE 0 11 0 1 1 0 0'
>>>>> aboot: valid disklabel found: 4 partitions.
>>>>> aboot: loading compressed vmlinux-4.4.3.gz...
>>>>> aboot: PHDR 0 vaddr 0xfffffc0001010000 offset 0x2000 size 0xebe3b=
8
>>>>> aboot: bss at 0xfffffc0001ece3b8, size 0x179540
>>>>> aboot: zero-filling 1545536 bytes at 0xfffffc0001ece3b8
>>>>> aboot: starting kernel vmlinux-4.4.3.gz with arguments ro
>>>>root=3D/dev/sda4
>>>>>=20
>>>>> halted CPU 0
>>>>>=20
>>>>> halt code =3D 6
>>>>> double error halt
>>>>> PC =3D fffffc00010324e4
>>>>> boot failure
>>>>> ###############################################
>>>>>=20
>>>>> Did i miss a new mandatory kernel config option for alpha or am i
>>>the
>>>>only one with this behaviour ?
>>>>> Hope you can help me a bit ...
>>>>
>>>>This has also been noted for the debian-ports built generic kernel,
>>>>for kernel versions 4.3 and above.  They fail to boot with symptoms
>>>>exactly as shown above.
>>>>
>>>>There is some speculation on the debian-alpha mail list that only
>>>>a kernel built for generic system is failing to boot.  I have not
>>>>been able to confirm that.
>>>>
>>>>I managed to build a 4.3 dp264 variant kernel which boots okay on a=
n
>>>>XP1000, but my attempts to build a 4.3 or 4.4 titan variant kernel
>>>>is failing with relocation errors such as:
>>>>
>>>>arch/alpha/kernel/built-in.o: In function `osf_filldir':
>>>>arch/alpha/kernel/osf_sys.o:(.text+0x278c): relocation truncated to
>>>>fit: BRSGP against symbol `__copy_user' defined in .text section in
>>>>arch/alpha/lib/lib.a(ev6-copy_user.o)
>>>>
>>>>so I have not got very far with exploring the problem.
>>>>
>>>>Cheers
>>>>Michael.
>>>>--
>>>>To unsubscribe from this list: send the line "unsubscribe
>>linux-alpha"
>>>>in
>>>>the body of a message to majordomo@vger.kernel.org
>>>>More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
Diese Nachricht wurde von meinem Android-Mobiltelefon mit K-9 Mail gese=
ndet.
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
