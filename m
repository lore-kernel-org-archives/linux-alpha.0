From: JB <juergen-alpha@juergen-bierlein.org>
Subject: Re: Linux kernel 3.18 and above does not boot on PC164
Date: Wed, 02 Mar 2016 10:31:04 +0100
Message-ID: <1A8E1A6A-C38C-44FF-8B87-30F1D9F1C7AC@juergen-bierlein.org>
References: <2E8978F7-4F10-44C0-92ED-CADF683B61AE@juergen-bierlein.org> <20160302080952.GB31216@tower>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1456911066; l=2616;
	s=domk; d=juergen-bierlein.org;
	h=CC:To:Date:From:Subject:Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To;
	bh=OeGPMxo27x8NQPUYFJLrAfQYMz0q3tSsRRXAROygD00=;
	b=KnDrIWqZkWg5pZ2ouFZgGXmSGn7YVqy7tGuPavPffEOVrXRZAOdoPJMmIbE+P5EZyNu
	FPmHDQsZHir3mJsTPGIQ75bD424nMg8cROmAo0SfeuIG6kDejNt5a8IAEixfs5vmYHn3i
	ckMjm1VXHZSvi8QMIKzLrw7sLeWARXovSOY=
In-Reply-To: <20160302080952.GB31216@tower>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: juergen-alpha@juergen-bierlein.org
Cc: linux-alpha@vger.kernel.org

OK, i give the pc164 specific kernel a try. Will report here if it work=
ed or not the next days ...

At least i am not alone with the issue :-)

Cheers, Juergen

Am 2. M=C3=A4rz 2016 09:09:52 MEZ, schrieb Michael Cree <mcree@orcon.ne=
t.nz>:
>On Tue, Mar 01, 2016 at 08:08:28PM +0100, JB wrote:
>> i compiled the latest 3.14.62 kernel for my PC164 EV56 alpha system.
>This works without any failures since kernel 3.6.4 and above.
>> Unfortunately i cannot get the linux kernel 3.18 and above to boot
>(the latest try today was a 4.4.3 Kernel).
>>=20
>> The last entries on the screen are:
>>=20
>> ###############################################
>> aboot: Linux/Alpha SRM bootloader version 1.0_pre20040408
>> aboot: switching to OSF/1 PALcode version 1.23
>> aboot: booting from device 'IDE 0 11 0 1 1 0 0'
>> aboot: valid disklabel found: 4 partitions.
>> aboot: loading compressed vmlinux-4.4.3.gz...
>> aboot: PHDR 0 vaddr 0xfffffc0001010000 offset 0x2000 size 0xebe3b8
>> aboot: bss at 0xfffffc0001ece3b8, size 0x179540
>> aboot: zero-filling 1545536 bytes at 0xfffffc0001ece3b8
>> aboot: starting kernel vmlinux-4.4.3.gz with arguments ro
>root=3D/dev/sda4
>>=20
>> halted CPU 0
>>=20
>> halt code =3D 6
>> double error halt
>> PC =3D fffffc00010324e4
>> boot failure
>> ###############################################
>>=20
>> Did i miss a new mandatory kernel config option for alpha or am i th=
e
>only one with this behaviour ?
>> Hope you can help me a bit ...
>
>This has also been noted for the debian-ports built generic kernel,
>for kernel versions 4.3 and above.  They fail to boot with symptoms
>exactly as shown above.
>
>There is some speculation on the debian-alpha mail list that only
>a kernel built for generic system is failing to boot.  I have not
>been able to confirm that.
>
>I managed to build a 4.3 dp264 variant kernel which boots okay on an
>XP1000, but my attempts to build a 4.3 or 4.4 titan variant kernel
>is failing with relocation errors such as:
>
>arch/alpha/kernel/built-in.o: In function `osf_filldir':
>arch/alpha/kernel/osf_sys.o:(.text+0x278c): relocation truncated to
>fit: BRSGP against symbol `__copy_user' defined in .text section in
>arch/alpha/lib/lib.a(ev6-copy_user.o)
>
>so I have not got very far with exploring the problem.
>
>Cheers
>Michael.
>--
>To unsubscribe from this list: send the line "unsubscribe linux-alpha"
>in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
Diese Nachricht wurde von meinem Android-Mobiltelefon mit K-9 Mail gese=
ndet.
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
