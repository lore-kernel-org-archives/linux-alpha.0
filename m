From: Matt Turner <mattst88@gmail.com>
Subject: [BISECTED] 164UX Regression, 2.6.22->2.6.23
Date: Wed, 22 Sep 2010 20:38:11 -0400
Message-ID: <20100923003811.GA17384@Sempron.nc.rr.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:mime-version:content-type:content-disposition
         :user-agent;
        bh=M8r7w/X6/fS/3d123UuzfGQwbxqjVzz+b0xgRQXY/2A=;
        b=AreVx1Y9qb1c4tbTu0/GYtmcJFE6Or62QZ7DTR/W618WA7IbPicz3z05hOKKzuFlLx
         tO5WMIezu3RSd5Gdr52OtWYp1KfUKf4LvPA3Pq487U2kjWEvJcdrZtx2SSpkr60rVKK1
         A0j0bqKFENyTt0HFpRh5XteahC51HrVxS/Ms8=
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: linux-alpha@vger.kernel.org
Cc: Roland McGrath <roland@redhat.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Ian Las <ialas@yahoo.com>


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,
Alpha/Linux user Ian Las reported that since 2.6.22, the Kernel fails to lo=
ad
on his 164UX using MILO. (MILO is the only way to load Linux, as it only has
ARCSBIOS.)

It fails with

=2E..Image loaded into memory, entry @ 0xfffffc0000310000
Setting up Milo reboot parameter block at 0xfffffc0000000140
Boot line is bootdevice=3Dsdb2 bootfile=3Dvmlinux.gz root=3D/dev/sdb6
Bootstrap complete, kernel @ 0xfffffc0000310000, sp @ 0xfffffc0000304000
=2E..turning on virtual addressing and jumping to the Linux Kernel
---------------------------------------------------------------------------=
-----
Kernel panic - not syncing: Attempted to kill init!

Ian successfully bisected the failing commit, inline below. We tried revert=
ing
the commit, but it causes linker failures due to overlapping sections.

How can we further debug and fix this?

Thanks!
Matt


commit caf45dd92677b2001123cc06b5835052ccfee76f
Author: Roland McGrath <roland@redhat.com>
Date:   Thu Jul 19 01:48:37 2007 -0700

    alpha: Put allocated ELF notes in read-only data segment
   =20
    This changes the alpha linker script to use the asm-generic NOTES macro=
 so
    that ELF note sections with SHF_ALLOC set are linked into the kernel im=
age
    along with other read-only data.  The PT_NOTE also points to their loca=
tion.
   =20
    This paves the way for putting useful build-time information into ELF n=
otes
    that can be found easily later in a kernel memory dump.
   =20
    Signed-off-by: Roland McGrath <roland@redhat.com>
    Cc: Richard Henderson <rth@twiddle.net>
    Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

diff --git a/arch/alpha/kernel/vmlinux.lds.S b/arch/alpha/kernel/vmlinux.ld=
s.S
index 6f4f037..fe13daa 100644
--- a/arch/alpha/kernel/vmlinux.lds.S
+++ b/arch/alpha/kernel/vmlinux.lds.S
@@ -3,7 +3,7 @@
 OUTPUT_FORMAT("elf64-alpha")
 OUTPUT_ARCH(alpha)
 ENTRY(__start)
-PHDRS { kernel PT_LOAD ; }
+PHDRS { kernel PT_LOAD; note PT_NOTE; }
 jiffies =3D jiffies_64;
 SECTIONS
 {
@@ -28,6 +28,9 @@ SECTIONS
   __ex_table : { *(__ex_table) }
   __stop___ex_table =3D .;
=20
+  NOTES :kernel :note
+  .dummy : { *(.dummy) } :kernel
+
   RODATA
=20
   /* Will be freed after init */

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEARECAAYFAkyaoXMACgkQTVUdg23rv51y4wCcC1TwYiyS8/njkzznwZ3VLRtS
KAwAoJ3Ency7tZCFxUEGsDC/S7T06hZB
=LSC/
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
