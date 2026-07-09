Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0089B435EDD
	for <linux-alpha@vger.kernel.org>; Thu,  9 Jul 2026 16:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783614428; cv=none; b=NZhVulGQit9RHGO+NmJLLCYB6h8dSKF4ZCeP6/4cDRvb2pLSeKwzpV0eCgKeNmVUsr9gioZBz+95qP/TsZ159JdZqBnew7w6x2ZMDWGDjcZWlEr4o0bCIvRHzTZOLd5BlmLTGU7HKqtmLw5SnzKOCHAKbJAc6jjqVh69uBRerfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783614428; c=relaxed/simple;
	bh=S/xAtxH9kCAjFwM1/MAEgEQMpcNiqhEBM0MEXLopRqg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eo/mK8JSri2RTngrIWjv5knszNYfBg/9qOuwWbUtFQ4idQyl02EYgsj+Vt65LTOPRV7/S1KG7fl/c4zCFjC7NPWvheLSIpmgWc4qsQogK4ZXe+59kndP2X85kVXiPrh2o4B3+vDWSHXf/aFxZdb7q3sLLy9P+GTVy4IeZ3a3m9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f66IYRb3; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f66IYRb3"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso8681985e9.1
        for <linux-alpha@vger.kernel.org>; Thu, 09 Jul 2026 09:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783614423; x=1784219223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GEOL8DOWD1Msvjz7k5cAG0xDAOqwGsu0BnpwMff10wU=;
        b=f66IYRb3W3n4wUp60vuJmeagFdempVA19+GvfglfbGXQNr32Jgf6Zu59Uj+bcep6dg
         jsx4MIO/Rg0Jc8lrVT/RQMxMMW76zzTchDs11lEHMl8wueX5jr2m95gnsMPuCp+FiVia
         BXcS1RfCaig3WVexG8fiT0f1WyIZI2ZFqmCdfMorSUHquBf0Y5WGXwn3lYxbxm4/2faj
         NWGL5ZyKcF+WzWoxiQjAkz+rxwePY89gZ4a0ESMuDMMFx4G3ZLECB3j0O5NlKwsrjWw/
         4IqBiE/i3mAHjgYbMO+ob6qHoEPfbgtS+ClBm3imDY87X4M/jBzC1B5Fmge7V4/JxTvX
         p0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783614423; x=1784219223;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GEOL8DOWD1Msvjz7k5cAG0xDAOqwGsu0BnpwMff10wU=;
        b=ipt/JSFiH2Q1HzrKOLhe2sNl42v8WEs0GPnXu1I1z//UlBnWP+kqCfQbSbSJWk8v1V
         ZTiBRp1fEr22XLn3PEZWEJsLAPdo6l+SHWBGwNEh0qpm4v0DkAm2TDiEuvHk1M36LtRv
         JMSG/nxzw3pui66vPI53x23XisE2mC4AV+ZXo6hFlMv5L3H0qNXY5hD0RYEdsc1qlcXo
         CTsyQ/cw+wKluVKdyx9C87eJybuyhAC6w81UQrAb0VTZxiu3dVmT6qv1bXLo/+TOdV40
         tuNI1BtBCDTOLo9XtmcbroxbLOm9XSUc0mLKwoUqYACIJJZwGS97hI+E+p2GtK++FXqy
         37tg==
X-Forwarded-Encrypted: i=1; AHgh+RoWz3n4zEDNJQ462ywybz/B9xnXBDUvCshxIUhZEbPWOzpeQWyqmI1FICtg6kO33vH/BLeEWWG/v+Zm1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR9IvPlIbS7LAse3Fis3maot5rfrWVt2bicvDw44vmCtisnN6K
	EdKnAAu5a3Bftlu2mxyImpi+lLj4hDMpm1QKPa7QCH3JklBCNuW9GHAS
X-Gm-Gg: AfdE7ck/5yAXZioeBKXUKVwte2Vi5rAuKYxWiFxBLjajf++iBP2QmpA9htew4MZ6Z3I
	KMYuyu9AVhhonsgJL2FWJpD2/xLAS9Cs6ttMP3HizS5dZCA4wqi6Ds1SOi7EPLFyRdi0FzYOu+W
	u1UxPF5TqY9h3If7P4OB6lRBJmF1brtWeoGjUpO9honfhEtVLFcBkJCWJEXnAmr5eJKnJ3Ftzqh
	jebEIa8IOkBmC7zxrGJVvIAKUg+Y566cqBTgSQm2pNmsnzpEn3q6tUE33w2m6rpjVxUEqCT9b/j
	D68TTFe2CKaYi9dSRTvdDzKEdshUxsK9dSAIzzVa/+Gj+ee1BpDjd53TbWxl5iLyuwx9lEs2a0Y
	nsLQ4WQDUtGKBX+ApX4UlbJOBFE6n1Y0GWaf2Wz6P/ibFe3RuXowTn0wPvieoKGY/bssnHqOs5W
	Q9tzy1IYkOYwgxRJrxoWaV9O/PS3eFVhVFHZZCMJXoCabhcw==
X-Received: by 2002:a05:600d:6405:10b0:493:eec0:2b8c with SMTP id 5b1f17b1804b1-493eec02c80mr19641245e9.12.1783614423204;
        Thu, 09 Jul 2026 09:27:03 -0700 (PDT)
Received: from pumpkin (host-92-21-50-228.as13285.net. [92.21.50.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb670a41sm70023415e9.0.2026.07.09.09.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 09:27:02 -0700 (PDT)
Date: Thu, 9 Jul 2026 17:26:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, LKML
 <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde
 <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Kees Cook
 <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, Mark
 Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Andy
 Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Guo Ren
 <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger
 <richard@nod.at>, Chris Zankel <chris@zankel.net>,
 linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Arnd Bergmann
 <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>, Will Deacon
 <will@kernel.org>, Brian Cain <bcain@kernel.org>, Michal Simek
 <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>,
 linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
 linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Subject: Re: [patch 13/18] entry: Make trace_syscall_enter() return type
 bool
Message-ID: <20260709172659.7040db33@pumpkin>
In-Reply-To: <87ik6pqdkf.ffs@fw13>
References: <20260707181957.433213175@kernel.org>
	<20260707190254.338083894@kernel.org>
	<ak5ySpil83TNWxeq@kunlun.suse.cz>
	<87se5tqkyp.ffs@fw13>
	<87ik6pqdkf.ffs@fw13>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 09 Jul 2026 01:14:24 +0200
Thomas Gleixner <tglx@kernel.org> wrote:

> On Wed, Jul 08 2026 at 22:34, Thomas Gleixner wrote:
> > On Wed, Jul 08 2026 at 17:52, Michal Such=C3=A1nek wrote:
> > Q: Is it perfect?
> > A: No
> >
> > Q: Can it be made perfect?
> > A: No, because you can't change history and established practice.
> >
> > Just for illustration. Changing the logic in trace_syscall_enter() to:
> >
> > --- a/kernel/entry/syscall-common.c
> > +++ b/kernel/entry/syscall-common.c
> > @@ -9,13 +9,15 @@
> > =20
> >  bool trace_syscall_enter(struct pt_regs *regs, long *syscall)
> >  {
> > +	long orig_syscall =3D *syscall;
> > +
> >  	trace_sys_enter(regs, *syscall);
> >  	/*
> >  	 * Probes or BPF hooks in the tracepoint may have changed the
> >  	 * system call number. Reread it.
> >  	 */
> >  	*syscall =3D syscall_get_nr(current, regs);
> > -	return *syscall !=3D -1L;
> > +	return *syscall =3D=3D orig_syscall || *syscall !=3D -1L;
> >  }
> > =20
> >  void trace_syscall_exit(struct pt_regs *regs, long ret)
> >
> > does not make #2 magically go away. It's still the same problem whether
> > you like it or not. =20
>=20
> And just to be entirely clear, the syscall() interface has to be correct
> in the first place, but then it's all about performance.
>=20
> So the sequence of:
>=20
>    pt_regs =3D PUSH_REGS();
>    syscall =3D pt_regs->syscall_reg;
>    pt_regs->result =3D -ENOSYS;
>=20
>    arch_syscall(pt_regs, syscall) {
>       if (likely(syscall_enter_from_user_mode(pt_regs, &syscall) {

I guess most architectures inline that to avoid the &syscall.
Otherwise you'd want:
	syscall =3D syscall_enter_from_user_mode(pt_regs, syscall);
with the 'error' return being selected to fail the test below
(which -1L converted to ~0UL will do nicely).

	David

>          if (syscall < SYSCALL_max)
>             pt_regs->result =3D invoke_syscall(pt_regs, syscall);
>       }
>       ,,,,
>    }
>    pt_regs->($RETURN_VALUE) =3D pt_regs->result;
>    POP_REGS();
>    return;
>=20
> is the correct and obviuosly most efficient way idependent of the -1L
> return value overload in the original implementation, which this series
> gets rid of for clarity.
>=20
> If an architecture decide[sd] to do otherwise and makes up it's own rules
> which only cover parts of the problem then it _is_ an architecture
> problem and not something which has to be solved by claiming that every
> architecture has to implement the same nonsense as you falsely claimed
> in your RFC^WPOC^Whack thread:
>=20
>   "However, the API should be specified in a way that does not require
>    everyone implementing such flag."
>=20
> There is _ZERO_ requirement for any architecture to implement that
> flag. Just because S390 decided it's a brilliant idea to do so does not
> make it a requirement for everyone.
>=20
> No. Every other architecture got it right because they looked at the
> historical patterns despite having correct documentation at hand.
>=20
> Feel free to prove me wrong with actual facts.
>=20
> Thanks,
>=20
>         tglx
>=20

