From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH] alpha: fix ALPHA_LEGACY_START_ADDRESS and default to no
Date: Fri, 29 Oct 2010 00:22:57 -0400
Message-ID: <20101029042257.GA5886@Sempron.nc.rr.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:mime-version:content-type:content-disposition
         :user-agent;
        bh=Pr0NLFDmDeyyvIIVEYBRcazSeZDjgeherszqCm2LKyw=;
        b=U4A0AaKHc3ETOYcI/t2RPfnfxGUHe1Lt9Igof8HZMtZjMqpfiSqSOCf9p3ZhX3bLBq
         APdPcfZMIEWUtE9wQAsox+6v7ikuzbRvyqfAv24CwTWct5T3h/oIqRPfFbwLMMfr3HPY
         6+NMW4W14QjJ03tmW9571HYDqNIryfJXtq2PM=
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: linux-alpha@vger.kernel.org
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Michael Cree <mcree@orcon.net.nz>


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Kconfig.debug had ALPHA_LEGACY_START_ADDRESS twice, which seemed to mess
the whole thing up so that the only way that you could unselect
it was to set ALPHA_GENERIC. That is to say, setting ALPHA_TITAN
actually prevented unsetting ALPHA_LEGACY_START_ADDRESS, which is
necessary for Titan systems. WTF.

Also, in my two and a half years of doing alpha stuff, I've only known
one person to use MILO and this was on a 164UX where he had no option,
and the kernel has been broken on this board since 2.6.23 anyway. So,
even with as few Marvel/Titan systems as there are, there are fewer MILO
users.

This does mean that people who use MILO (do you still exist?) will have
to make sure to set this option. If you're using <aboot-0.7 then I have
no sympathy for you.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig.debug |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/arch/alpha/Kconfig.debug b/arch/alpha/Kconfig.debug
index 3f6265f..b2589b2 100644
--- a/arch/alpha/Kconfig.debug
+++ b/arch/alpha/Kconfig.debug
@@ -9,7 +9,7 @@ config EARLY_PRINTK
=20
 config ALPHA_LEGACY_START_ADDRESS
 	bool "Legacy kernel start address"
-	depends on ALPHA_GENERIC
+	depends on !ALPHA_GENERIC && !ALPHA_TITAN && !ALPHA_MARVEL && !ALPHA_WILD=
FIRE
 	default n
 	---help---
 	  The 2.4 kernel changed the kernel start address from 0x310000
@@ -26,11 +26,6 @@ config ALPHA_LEGACY_START_ADDRESS
 	  Say Y if you have a broken bootloader.  Say N if you do not, or if
 	  you wish to run on Wildfire, Titan, or Marvel.
=20
-config ALPHA_LEGACY_START_ADDRESS
-	bool
-	depends on !ALPHA_GENERIC && !ALPHA_TITAN && !ALPHA_MARVEL && !ALPHA_WILD=
FIRE
-	default y
-
 config MATHEMU
 	tristate "Kernel FP software completion" if DEBUG_KERNEL && !SMP
 	default y if !DEBUG_KERNEL || SMP
--=20
1.7.2.2


--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEARECAAYFAkzKTCEACgkQTVUdg23rv53rDgCeIJYQpP41/6ZKkgVrx3GJe+Id
4eUAniNQDQ2a6paM/uVM/tkY4ZN/eCkr
=uPAp
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
