From: Liam Howlett <liam.howlett@oracle.com>
Subject: Re: [PATCH] alpha/kernel/traps: Use find_vma_intersection() in traps
 for setting si_code
Date: Fri, 2 Apr 2021 13:05:19 +0000
Message-ID: <20210402130512.h7vkbxdwn7errxmh@revolver>
References: <20210401195138.2895285-1-Liam.Howlett@Oracle.com>
 <CANN689GC8jXbzFb_HL-vpoBxuD4-By029=PMsi4Vs9ufik4RhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=buoOZVgPAS+QE4iOfrPemfh6nUyFohK8vWwhlhyjESM=;
 b=iPXXS56wY45SXQEmOorph+jWz4DTrqW5sv2IPLTgEXCVCfhIHWGiBQaQ/4v3oPUFoqzz
 BdfQLyLU/BoEUXNvUkvHYJC9mwMO5fgYZVZO6YZP9pkvyBvmHoWaMX7JvaXdpDXK7ZWN
 rtyMlYLruk9KYJlG4LE7LX6vpuOSW+YQEBISJr9GUKrMWAyUBIH+zkhhymE4qrm8li/o
 l2anuRr27tFpuDCTIBLodWn4s8WG4Dd4RyIwUWpGQz903AnIPe/lwqhu9gnY+40+4zVl
 gzCXOi5kCAoUjuldoui5x6buUUEkMO4P8eQqPV2n8dqWcnJ87V9qMnNpLTWO5YlS8IyH uw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buoOZVgPAS+QE4iOfrPemfh6nUyFohK8vWwhlhyjESM=;
 b=QpYlbVchUZqqUFwrEG/zzJVYcZdzSV/fZc0HT3FoRVdGG5LecSWWpMjCxuLKzlLx7Le+xW2RFEbp9gVRx/0UzI5hFurIUvED7MYNU15WsgjdrOG8y60yPBVxWe7FQU4d+bSb+vha7JjiNn/BNYnpCBSjmNaINPQQhfEOSpbabho=
In-Reply-To: <CANN689GC8jXbzFb_HL-vpoBxuD4-By029=PMsi4Vs9ufik4RhQ@mail.gmail.com>
Content-Language: en-US
Content-ID: <E3BBC585AEB34A42B7676F9713D36C54@namprd10.prod.outlook.com>
List-ID: <linux-alpha.vger.kernel.org>
To: Michel Lespinasse <walken@google.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dmitry Safonov <0x7f454c46@gmail.com>, "Gustavo A . R . Silva" <gustavoars@kernel.org>

* Michel Lespinasse <walken@google.com> [210401 16:25]:
> You are correct that find_vma is insufficient for what's intended
> here, and that find_vma_intersection fixes it.
>=20
> I'll let the arch maintainers speak of what the consequences of the
> changed si_code would be - the bug has been here so long, that I would
> worry some userspace might have come to depend on it (the old "common
> law feature" issue).

Fair point.  Is this a valid concern given the result will vary,
although uncommon, based on the address passed in?  A user would see
different behaviour based on where the address lands in the virtual
address space.

>  Just a concern I have, with 0 evidence behind it, so I hope it turns
> out not to be an actual issue.
>=20
> Acked-by: Michel Lespinasse <walken@google.com>
>=20
> On Thu, Apr 1, 2021 at 12:51 PM Liam Howlett <liam.howlett@oracle.com> wr=
ote:
> >
> > find_vma() will continue to search upwards until the end of the virtual
> > memory space.  This means the si_code would almost never be set to
> > SEGV_MAPERR even when the address falls outside of any VMA.
> >
> > Using find_vma_intersection() allows for what is intended by only
> > returning a VMA if it falls within the range provided, in this case a
> > window of 1.
> >
> > Signed-off-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
> > ---
> >  arch/alpha/kernel/traps.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
> > index 921d4b6e4d95..7f51386c06d0 100644
> > --- a/arch/alpha/kernel/traps.c
> > +++ b/arch/alpha/kernel/traps.c
> > @@ -957,8 +957,10 @@ do_entUnaUser(void __user * va, unsigned long opco=
de,
> >                 si_code =3D SEGV_ACCERR;
> >         else {
> >                 struct mm_struct *mm =3D current->mm;
> > +               unsigned long addr =3D (unsigned long)va;
> > +
> >                 mmap_read_lock(mm);
> > -               if (find_vma(mm, (unsigned long)va))
> > +               if (find_vma_intersection(mm, addr, addr + 1))
> >                         si_code =3D SEGV_ACCERR;
> >                 else
> >                         si_code =3D SEGV_MAPERR;
> > --
> > 2.30.0
>=20
>=20
>=20
> --=20
> Michel "Walken" Lespinasse
> A program is never fully debugged until the last user dies.=
