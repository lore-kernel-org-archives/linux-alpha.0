From: Sergei Trofimovich <slyich@gmail.com>
Subject: Re: [PATCH] Alpha: unbreak osf_setsysinfo(SSI_NVPAIRS,
 [SSIN_UACPROC, UAC_SIGBUS])
Date: Sat, 13 Aug 2011 00:51:28 +0300
Message-ID: <20110813005128.7644d5e4@sf.home>
References: <1313076314-6111-1-git-send-email-slyich@gmail.com>
	<4E44D46A.1070007@orcon.net.nz>
	<20110812125903.01e7bdf0@sf.home>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/X_riaHexkkHLuWTgdyNLQe1"; protocol="application/pgp-signature"
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=date:from:to:cc:subject:message-id:in-reply-to:references:x-mailer
         :mime-version:content-type;
        bh=GG3C62FNTnaTNinAlM9I1ztGrPYM5vZFAN7FNA3We6w=;
        b=EiRLicavLovw2gE6AWTvVjApkEAOVFcyavzJjk/uCq/+fj9a0QPUNbm21hh+Z9GX8x
         hWOTDtdot7UxtcuU+lTsIqWWRpHSMp1xh/mwdXvZ3VvfkshTF9k/ZzlsDF/uNnU5LGln
         nV2clT0YeDQk87vYk0kLMlYDeXwRHglQkH4+I=
In-Reply-To: <20110812125903.01e7bdf0@sf.home>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: linux-alpha@vger.kernel.org
Cc: Michael Cree <mcree@orcon.net.nz>, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com

--Sig_/X_riaHexkkHLuWTgdyNLQe1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

> I'll build alpha toolchain / qemu root and will try to cook
> nicer patch with compile-time safety checks.

Sent reworked patch: http://marc.info/?l=3Dlinux-alpha&m=3D131318270531656&=
w=3D2

Yelling at the header I've found minor nit:
...
#define SET_UNALIGN_CTL(task,value)     ({                                 =
  \
        task_thread_info(task)->flags =3D ((task_thread_info(task)->flags &=
    \
                ~ALPHA_UAC_MASK)
                | (((value) << ALPHA_UAC_SHIFT)       & (1<<TIF_UAC_NOPRINT=
))\
                | (((value) << (ALPHA_UAC_SHIFT + 1)) & (1<<TIF_UAC_SIGBUS)=
) \
                | (((value) << (ALPHA_UAC_SHIFT - 1)) & (1<<TIF_UAC_NOFIX))=
);\
        0; })

#define GET_UNALIGN_CTL(task,value)     ({                              \
        put_user((task_thread_info(task)->flags & (1 << TIF_UAC_NOPRINT))\
                  >> ALPHA_UAC_SHIFT                                    \
                 | (task_thread_info(task)->flags & (1 << TIF_UAC_SIGBUS))\
                 >> (ALPHA_UAC_SHIFT + 1)                               \
                 | (task_thread_info(task)->flags & (1 << TIF_UAC_NOFIX))\
                 >> (ALPHA_UAC_SHIFT - 1),                              \
                 (int __user *)(value));                                \
        })

The macros SET_UNALIGN_CTL/GET_UNALIGN_CTL are used
only in kernel/sys.c:prctl syscall.

> | (((value) << ALPHA_UAC_SHIFT)       & (1<<TIF_UAC_NOPRINT))
prctl.h: # define PR_UNALIGN_NOPRINT     1

> |  (((value) << (ALPHA_UAC_SHIFT + 1)) & (1<<TIF_UAC_SIGBUS))
prctl.h: # define PR_UNALIGN_SIGBUS      2

> | (((value) << (ALPHA_UAC_SHIFT - 1)) & (1<<TIF_UAC_NOFIX)));

prctl.h: no '4' value

Do you think it's worth adding to userspace interface
or should one just remove it from handled by prctl flags [ABI change]?

Thanks!

diff --git a/include/linux/prctl.h b/include/linux/prctl.h
index a3baeb2..f66539a 100644
--- a/include/linux/prctl.h
+++ b/include/linux/prctl.h
@@ -15,6 +15,7 @@
 #define PR_SET_UNALIGN   6
 # define PR_UNALIGN_NOPRINT    1       /* silently fix up unaligned user a=
ccesses */
 # define PR_UNALIGN_SIGBUS     2       /* generate SIGBUS on unaligned use=
r access */
+# define PR_UNALIGN_NOFIX      4       /* skip offending instruction and d=
o nothing */

 /* Get/set whether or not to drop capabilities on setuid() away from
  * uid 0 (as per security/commoncap.c) */

--=20

  Sergei

--Sig_/X_riaHexkkHLuWTgdyNLQe1
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk5FoGYACgkQcaHudmEf86prDgCfQ4Afuvvj9CSu2MsJwUVWz/UV
LZkAnieCN8j/WNDouTfEe8onQ2MsCKd8
=RFF/
-----END PGP SIGNATURE-----

--Sig_/X_riaHexkkHLuWTgdyNLQe1--
