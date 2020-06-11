From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v2] All arch: remove system call sys_sysctl
Date: Thu, 11 Jun 2020 14:12:54 +1000
Message-ID: <20200611141254.15870ca2@canb.auug.org.au>
References: <1591847640-124894-1-git-send-email-nixiaoming@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aQCikJqRJB8W8qz/_oi9sOP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1591848800;
 bh=HCJ9wEAF4AGCfy1r8Su/DDpCJDSPFslJI0OUAzgOmTo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=doMxT1EfvCLMs1SCfzFv4HKFnLq4nEqu1VWjZApVjrLT3hEroj2Gx4CXE76A/aBy2
 Ar2cMXraxVjafWzcD1U/vKrxsb3/42ls16OormILkvdq3/vRVzV287C6p2bnI5uwj0
 KVC+49wnlSSPPXfY6kLLNsLkBuIDFdRptSyGMZbeuDImovvyitB4gYQbHoFKV7EHGo
 9pta6k4RIq0kgiQa7YFh0MhqhUgUKoAI1b+ZLZEyhQ8AMAUgzpPrsLEBKjjNnsuDfF
 0TqXyvx9787dOZdL2ltDc5+OVnezJ3eUdZHvuuniZFQL/fwTB2wglM/nhMM1fxkS7L
 aQg8BvqNwkn6w==
In-Reply-To: <1591847640-124894-1-git-send-email-nixiaoming@huawei.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
To: Xiaoming Ni <nixiaoming@huawei.com>
Cc: linux-sh@vger.kernel.org, catalin.marinas@arm.com, paulus@samba.org, ak@linux.intel.com, paulburton@kernel.org, geert@linux-m68k.org, mattst88@gmail.com, brgerst@gmail.com, acme@kernel.org, cyphar@cyphar.com, viro@zeniv.linux.org.uk, luto@kernel.org, tglx@linutronix.de, surenb@google.com, rth@twiddle.net, young.liuyang@huawei.com, linux-parisc@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, mark.rutland@arm.com, linux-ia64@vger.kernel.org, linux-xtensa@linux-xtensa.org, jongk@linux-m68k.org, linux@dominikbrodowski.net, James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, linux-s390@vger.kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, yzaikin@google.com, mszeredi@redhat.com, gor@linux.ibm.com, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-a

--Sig_/aQCikJqRJB8W8qz/_oi9sOP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Xiaoming,

On Thu, 11 Jun 2020 11:54:00 +0800 Xiaoming Ni <nixiaoming@huawei.com> wrot=
e:
>
>  arch/sh/configs/dreamcast_defconfig                |   1 -
>  arch/sh/configs/espt_defconfig                     |   1 -
>  arch/sh/configs/hp6xx_defconfig                    |   1 -
>  arch/sh/configs/landisk_defconfig                  |   1 -
>  arch/sh/configs/lboxre2_defconfig                  |   1 -
>  arch/sh/configs/microdev_defconfig                 |   1 -
>  arch/sh/configs/migor_defconfig                    |   1 -
>  arch/sh/configs/r7780mp_defconfig                  |   1 -
>  arch/sh/configs/r7785rp_defconfig                  |   1 -
>  arch/sh/configs/rts7751r2d1_defconfig              |   1 -
>  arch/sh/configs/rts7751r2dplus_defconfig           |   1 -
>  arch/sh/configs/se7206_defconfig                   |   1 -
>  arch/sh/configs/se7343_defconfig                   |   1 -
>  arch/sh/configs/se7619_defconfig                   |   1 -
>  arch/sh/configs/se7705_defconfig                   |   1 -
>  arch/sh/configs/se7750_defconfig                   |   1 -
>  arch/sh/configs/se7751_defconfig                   |   1 -
>  arch/sh/configs/secureedge5410_defconfig           |   1 -
>  arch/sh/configs/sh03_defconfig                     |   1 -
>  arch/sh/configs/sh7710voipgw_defconfig             |   1 -
>  arch/sh/configs/sh7757lcr_defconfig                |   1 -
>  arch/sh/configs/sh7763rdp_defconfig                |   1 -
>  arch/sh/configs/shmin_defconfig                    |   1 -
>  arch/sh/configs/titan_defconfig                    |   1 -
>  arch/sh/include/uapi/asm/unistd_64.h               |   2 +-
>  arch/sh/kernel/syscalls/syscall.tbl                |   2 +-
>  arch/sh/kernel/syscalls_64.S                       |   2 +-

You might want to rebase this onto v5.8-rc1 when it is released this
weekend as the 64bit sh code (sh5) has been removed.

--=20
Cheers,
Stephen Rothwell

--Sig_/aQCikJqRJB8W8qz/_oi9sOP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7hr0YACgkQAVBC80lX
0Gw/zwf/ePrQSi6jQG3FFC3lL3wjuRJnZ6E8VAvHZ0rFQ80eqF2ReUHrXoTiE7HT
WQE9HYgDCVQAz5m0IqYRX7xgX1s83s/GsOUpuB2wXvbUM7mcJYBvWbSwUf5Gin1m
nl4lYo7G6SCKD6HtOWNd8gviTAoOWOb2iwVTr4yH6CRe4O4HoPRFuhcSInEEL3qr
EwMdHVL3TxzRrGHU3YQMiGXY9A4Qsa7UyfyYBcgUQLbBdB1v11ooNzmP0KhRWK7U
f8EOkbZzI20TE+I5V5Gcud9Xq1BAYV35k52KeJnpPs42xOQItpTpnSErsCPFmatw
K3F1RMJqEwOYIKI4VCVLgIUPrYSD2A==
=Xz+D
-----END PGP SIGNATURE-----

--Sig_/aQCikJqRJB8W8qz/_oi9sOP--
