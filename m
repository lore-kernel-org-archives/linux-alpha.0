From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Alpha no longer recognises certain partition tables (v2.6.38)
Date: Wed, 16 Mar 2011 08:03:42 -0700
Message-ID: <AANLkTinvRJNZGrKT0pbFBcHoe2LOeSVMd2CEBaKdbU2u@mail.gmail.com>
References: <4D7F2C11.907@orcon.net.nz> <AANLkTimRDH4S1QMN6f4AfKOe6ipPK6jm+g91nuBJYQJa@mail.gmail.com>
 <AANLkTi=yev46gYosVdSfVvmf7MnB2oVriyvDT+pu1FnC@mail.gmail.com> <4D80695D.8080903@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <4D80695D.8080903@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michael Cree <mcree@orcon.net.nz>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, warns@pre-sense.de

On Wed, Mar 16, 2011 at 12:40 AM, Michael Cree <mcree@orcon.net.nz> wro=
te:
>
> OK, I've fallen for that and created too many partitions on my system=
 disk.
> =A0When using your patch dmesg reports:
>
> [ =A0 =A07.511714] sd 1:0:0:0: [sdb] 2930277168 512-byte logical bloc=
ks: (1.50
> TB/1.36 TiB)
> [ =A0 =A07.551753] sd 1:0:0:0: [sdb] Write Protect is off
> [ =A0 =A07.572261] sd 1:0:0:0: [sdb] Mode Sense: 00 3a 00 00
> [ =A0 =A07.591792] sd 1:0:0:0: [sdb] Write cache: enabled, read cache=
: enabled,
> doesn't support DPO or FUA
> [ =A0 =A07.633785] OSF: 10 partitions
> [ =A0 =A07.654292] =A0sdb: sdb1 sdb2 sdb3 sdb4 sdb5 sdb6 sdb7 sdb8
> [ =A0 =A07.675777] sd 1:0:0:0: [sdb] Attached SCSI disk

Ok, no problem.

I'll increase the value of OSF_MAX_PARTITIONS to 18 (which is what
fits in a 512 byte sector), and mark it for back-porting into stable
too.

Thanks for testing.

> I could get it back to eight partitions but it will require copying t=
he
> largest partition to another disk and back again as that partition do=
es not
> meet the conditions for resizing.

Oh, no need for that. There really isn't any real technical limit for
the "limit to 8 partitions", and we don't cause regressions.

                              Linus
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
