From: Steve Langasek <vorlon@debian.org>
Subject: [patch] __cmpxchg() must really always be inlined on alpha
Date: Thu, 2 Feb 2006 05:21:55 -0800
Message-ID: <20060202132155.GC18093@tennyson.dodds.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4jXrM3lyYWu4nBt5"
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
To: linux-alpha@vger.kernel.org, stable@kernel.org
Cc: nobse@debian.org


--4jXrM3lyYWu4nBt5
Content-Type: multipart/mixed; boundary="gj572EiMnwbLXET9"
Content-Disposition: inline


--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi folks,

With the latest 2.6.15 kernel builds for alpha on Debian, we ran into a
problem with undefined references to __cmpxchg_called_with_bad_pointer() in
a couple of kernel modules (xfs.ko and drm.ko; see
http://bugs.debian.org/347556).  It looks like people have been trying to
out-clever each other wrt the definition of "inline" on this architecture
:), with the result that __cmpxchg(), which must be inlined so the compiler
can see its argument is const, is not guaranteed to be inlined.  Indeed, it
was not being inlined when building with -Os.

I was asked to forward the attached patch to these two lists, which fixes
the issue by adding an __attribute__((always_inline)) explicitly to the
definition of __cmpxchg() instead of relying on redefines of "inline"
elsewhere to make this happen.  Please let me know if I should be submitting
the patch in a different format.

Thanks,
--=20
Steve Langasek                   Give me a lever long enough and a Free OS
Debian Developer                   to set it on, and I can move the world.
vorlon@debian.org                                   http://www.debian.org/

--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="alpha-cmpxchg-inline.patch"
Content-Transfer-Encoding: quoted-printable

--- linux-2.6.15/include/asm-alpha/system.h.orig	2006-01-26 02:57:09.000000=
000 -0800
+++ linux-2.6.15/include/asm-alpha/system.h	2006-01-26 02:58:13.000000000 -=
0800
@@ -562,7 +562,7 @@
    if something tries to do an invalid cmpxchg().  */
 extern void __cmpxchg_called_with_bad_pointer(void);
=20
-static inline unsigned long
+static inline __attribute__((always_inline)) unsigned long
 __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int si=
ze)
 {
 	switch (size) {

--gj572EiMnwbLXET9--

--4jXrM3lyYWu4nBt5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFD4gdzKN6ufymYLloRApQEAJ9cFXtIIAaD1b9tBzFr4yDa/gpv0ACcDbbV
qcC7pEfoVL5jLTqJDYCcJkg=
=IAuH
-----END PGP SIGNATURE-----

--4jXrM3lyYWu4nBt5--
