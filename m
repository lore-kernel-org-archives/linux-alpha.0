From: Kurt Garloff <garloff@suse.de>
Subject: Re: AS600/333 kernel problem
Date: Thu, 13 Jun 2002 23:49:38 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20020613214938.GC6899@gum01m.etpnet.phys.tue.nl>
References: <wrpvg8s5jyd.fsf@hina.wild-wind.fr.eu.org> <20020612000820.GF11833@gum01m.etpnet.phys.tue.nl> <3D081625.1000408@kc8apf.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hoZxPH4CaxYzWscb"
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3D081625.1000408@kc8apf.net>
List-Id: <linux-alpha.vger.kernel.org>
To: Rick Altherr <kc8apf@kc8apf.net>
Cc: linux-alpha@vger.kernel.org


--hoZxPH4CaxYzWscb
Content-Type: multipart/mixed; boundary="iFRdW5/EC4oqxDHL"
Content-Disposition: inline


--iFRdW5/EC4oqxDHL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rick,

On Wed, Jun 12, 2002 at 11:48:53PM -0400, Rick Altherr wrote:
> I'm rather new to Linux on Alphas.  I have Debian installed on my AS600=
=20
> and it works fine, but I needed some kernel options and tried to build a=
=20
> new one.  The build completes fine and aboot begins to boot, but after=20
> it detects my QLogic ISP1020 SCSI controllers it dumps what appears to=20
> be the CPU registers and halts.  I've been trying 2.4.17.  Is this a=20
> known issue?  Any ideas?

Here is the patch from Jay (that Marc Zyngier forwarded to me), that helped
my AS500/266 to finally like the ISP1020 again ...

If I only could get the floppy to work with 2.4, everything would be perfec=
t.

Regards,
--=20
Kurt Garloff  <garloff@suse.de>                          Eindhoven, NL
GPG key: See mail header, key servers         Linux kernel development
SuSE Linux AG, Nuernberg, DE                            SCSI, Security

--iFRdW5/EC4oqxDHL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=patch-cia-jay
Content-Transfer-Encoding: quoted-printable

diff -ur old/arch/alpha/kernel/core_cia.c new/arch/alpha/kernel/core_cia.c
--- old/arch/alpha/kernel/core_cia.c	Sun Oct 21 13:30:58 2001
+++ new/arch/alpha/kernel/core_cia.c	Tue May 28 15:02:42 2002
@@ -370,7 +370,7 @@
 }
=20
 static inline void
-cia_prepare_tbia_workaround(void)
+cia_prepare_tbia_workaround(int cia_rev, int is_pyxis)
 {
 	unsigned long *ppte, pte;
 	long i;
@@ -382,10 +382,20 @@
 	for (i =3D 0; i < CIA_BROKEN_TBIA_SIZE / sizeof(unsigned long); ++i)
 		ppte[i] =3D pte;
=20
-	*(vip)CIA_IOC_PCI_W1_BASE =3D CIA_BROKEN_TBIA_BASE | 3;
-	*(vip)CIA_IOC_PCI_W1_MASK =3D (CIA_BROKEN_TBIA_SIZE*1024 - 1)
-				    & 0xfff00000;
-	*(vip)CIA_IOC_PCI_T1_BASE =3D virt_to_phys(ppte) >> 2;
+	if (is_pyxis || cia_rev !=3D 1) {
+		/* We can use W1 for SG on PYXIS/CIA rev 2. */
+		*(vip)CIA_IOC_PCI_W1_BASE =3D CIA_BROKEN_TBIA_BASE | 3;
+		*(vip)CIA_IOC_PCI_W1_MASK =3D (CIA_BROKEN_TBIA_SIZE*1024 - 1)
+					    & 0xfff00000;
+		*(vip)CIA_IOC_PCI_T1_BASE =3D virt_to_phys(ppte) >> 2;
+	} else {
+		/* CIA rev 1 can't use W1 or W2 for SG, apparently,
+		   so use W3, which we made sure is not used for DAC. */
+		*(vip)CIA_IOC_PCI_W3_BASE =3D CIA_BROKEN_TBIA_BASE | 3;
+		*(vip)CIA_IOC_PCI_W3_MASK =3D (CIA_BROKEN_TBIA_SIZE*1024 - 1)
+					    & 0xfff00000;
+		*(vip)CIA_IOC_PCI_T3_BASE =3D virt_to_phys(ppte) >> 2;
+	}
 }
=20
 static void __init
@@ -715,8 +725,14 @@
 	   are compared against W_DAC.  We can, however, directly map 4GB,
 	   which is better than before.  However, due to assumptions made
 	   elsewhere, we should not claim that we support DAC unless that
-	   4GB covers all of physical memory.  */
-	if (is_pyxis || max_low_pfn > (0x100000000 >> PAGE_SHIFT)) {
+	   4GB covers all of physical memory.
+
+	   Also, don't do DAC on CIA rev 1, it has other problems and is
+	   unlikely to have more than 2GB of memory anyway, so direct is
+	   fine.
+	*/
+	if (cia_rev =3D=3D 1 || is_pyxis ||
+	    max_low_pfn > (0x100000000 >> PAGE_SHIFT)) {
 		*(vip)CIA_IOC_PCI_W3_BASE =3D 0;
 	} else {
 		*(vip)CIA_IOC_PCI_W3_BASE =3D 0x00000000 | 1 | 8;
@@ -728,7 +744,7 @@
 	}
=20
 	/* Prepare workaround for apparently broken tbia. */
-	cia_prepare_tbia_workaround();
+	cia_prepare_tbia_workaround(cia_rev, is_pyxis);
 }
=20
 void __init



--iFRdW5/EC4oqxDHL--

--hoZxPH4CaxYzWscb
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9CRNxxmLh6hyYd04RAju1AJ9tXa5RZPx0uuMrZfHVoLEWTJz6hQCgy/qo
YCj7oH6FCNBS8CLP+cM9kQ0=
=1IKf
-----END PGP SIGNATURE-----

--hoZxPH4CaxYzWscb--
