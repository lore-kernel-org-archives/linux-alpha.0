From: Chen Gang <xili_gchen_5257@hotmail.com>
Subject: [PATCH] alpha: kernel: osf_sys: Set 'kts.tv_nsec' only when 'tv'
 has effect
Date: Mon, 18 May 2015 12:37:08 +0800
Message-ID: <BLU436-SMTP22F7DFE18E42FC01E022CCB9C40@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Richard Henderson <rth@twiddle.net>, rth@twiddle.net, mattst88@gmail.com
Cc: viro@zeniv.linux.org.uk, waydi1@gmail.com, miklos@szeredi.hu, linux-alpha@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

The related warning:

    CC      init/do_mounts.o
  arch/alpha/kernel/osf_sys.c: In function =E2=80=98SyS_osf_settimeofda=
y=E2=80=99:
  arch/alpha/kernel/osf_sys.c:1028:14: warning: =E2=80=98kts.tv_nsec=E2=
=80=99 may be used uninitialized in this function [-Wmaybe-uninitialize=
d]
    kts.tv_nsec *=3D 1000;
                ^
  arch/alpha/kernel/osf_sys.c:1016:18: note: =E2=80=98kts=E2=80=99 was =
declared here
    struct timespec kts;
                    ^

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 arch/alpha/kernel/osf_sys.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index e51f578..36dc91a 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -1019,14 +1019,13 @@ SYSCALL_DEFINE2(osf_settimeofday, struct timeva=
l32 __user *, tv,
  	if (tv) {
 		if (get_tv32((struct timeval *)&kts, tv))
 			return -EFAULT;
+		kts.tv_nsec *=3D 1000;
 	}
 	if (tz) {
 		if (copy_from_user(&ktz, tz, sizeof(*tz)))
 			return -EFAULT;
 	}
=20
-	kts.tv_nsec *=3D 1000;
-
 	return do_sys_settimeofday(tv ? &kts : NULL, tz ? &ktz : NULL);
 }
=20
--=20
1.7.9.5
