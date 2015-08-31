From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha.git
Date: Sun, 30 Aug 2015 18:13:07 -0700
Message-ID: <20150831011306.GA14041@ivybridge>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:mime-version:content-type
         :content-disposition:user-agent;
        bh=NvOumAtT2x35O9vvZdOkghzvZ4fT8CNM3jbs1Mi38rg=;
        b=ZVLuNxO605ubZBbCMLGG92g/IXgMi20aDU0R0oAGeIkLzYDmcbk/YqBDohBuLTNanp
         kYe6siJkAIiNtccvcFwGQJu8FQr/DfoBkMHwiItYvXSZi635Uu0bBNGRMlrEWehRz6Hn
         p3Ja1hm9KkzY6+nFPaCi6HSVVdlY58JevK2Zyp/2xgdKgVxjxQg6MZtiwSWrU522rdh+
         KfMiIUalnj6Se3bRlzTxCvpyL/KZLdlvoYDlq0luCXtwYIvpMvh3r8rehcb73h0twuAz
         1WDi0sB4GiRkK9UkV/W71/5y1aN/TafNmR+ovyKqRMWU+lkOGKtR/o5LT+LAP+nr7qdj
         HjZA==
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Please pull a single patch for alpha, one that enables
ARCH_USE_CMPXCHG_LOCKREF and offers around an 8% performance
improvement on a little benchmark that you wrote.

Thanks,
Matt

The following changes since commit 64291f7db5bd8150a74ad2036f1037e6a0428df2:

  Linux 4.2 (2015-08-30 11:34:09 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git for-linus

for you to fetch changes up to 8f8dcb3f7fe4febbfa96e64d4ad47de958c5cc34:

  alpha: select CONFIG_ARCH_USE_CMPXCHG_LOCKREF. (2015-08-30 18:01:16 -0700)

----------------------------------------------------------------
Matt Turner (1):
      alpha: select CONFIG_ARCH_USE_CMPXCHG_LOCKREF.

 arch/alpha/Kconfig                | 1 +
 arch/alpha/include/asm/spinlock.h | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index bf9e9d3..f515a4d 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -3,6 +3,7 @@ config ALPHA
 	default y
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
+	select ARCH_USE_CMPXCHG_LOCKREF
 	select HAVE_AOUT
 	select HAVE_IDE
 	select HAVE_OPROFILE
diff --git a/arch/alpha/include/asm/spinlock.h b/arch/alpha/include/asm/spi=
nlock.h
index 37b570d..fed9c6f 100644
--- a/arch/alpha/include/asm/spinlock.h
+++ b/arch/alpha/include/asm/spinlock.h
@@ -16,6 +16,11 @@
 #define arch_spin_unlock_wait(x) \
 		do { cpu_relax(); } while ((x)->lock)
=20
+static inline int arch_spin_value_unlocked(arch_spinlock_t lock)
+{
+        return lock.lock =3D=3D 0;
+}
+
 static inline void arch_spin_unlock(arch_spinlock_t * lock)
 {
 	mb();

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJV46oiAAoJEA/daC2XTKcqPvgQALJBUUuuwJuWOHd2yHNhfLvn
IsKSTytGsLYbLaEz/tv6AZufivfMEFoHBSznXERlP4I9X0HAypw2fLjTycJGEnQb
g4tMq+C3LrQyq//TTo0PDnN+77VZy86Iw3V9rcL/2vGKWGuZ4gxK808D1hkdNS47
LQF6fFnWD7yv1sF53BoYheCeE0kLmpH4DPOHETH1D4RSRBsbwjuz2grUkyTnUjE2
n737kXwhq5fh+yMLF16vDrCcjIKh+PzHt5ArU7eEyibWeMfmI2PCSbziI2SXdxOR
lfIFnZNUEpqwe7iaif7MxTuWaEO/uqoQhNDKXw3VlKju7373aHU7TXG3kosKB28S
fGF3ffVfMtY9Qkkg6jGeoBh0xNd4M/CfNfB/sRbI0bU2sBEgiGBE6Rj89SeLAbq6
pEJUVlT+OfsvZu5dpV2cu117ToufSNO35T6pdyKX2DACSw9/JiaVnrsBkuYLz0/R
zN+TgR7JHdZc3znvLfI+aEFBkK5XH3uFTQc5aQOHXbTMhWSEY8/2XV18KxycMhkS
XINMZG1JkTXjY/SYmu3ggW9RxghU9pwT+YBhDpaM6e/qLX0zAZqW7NdrNe7Tn2me
bunxQX6lIDxph8I7vtyallE6F1T+Tx3J3a3ktQoE7iwpqXdsUXtkwymhj81C63Dw
RvEBJGFClEFT2y2PJwiH
=1tu5
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
