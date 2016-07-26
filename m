From: Daniel Wagner <wagi@monom.org>
Subject: [PATCH] binfmt_em86: Fix incompatible pointer type
Date: Tue, 26 Jul 2016 11:39:38 +0200
Message-ID: <1469525978-23359-1-git-send-email-wagi@monom.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-kernel@vger.kernel.org
Cc: linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Daniel Wagner <daniel.wagner@bmw-carit.de>

=46rom: Daniel Wagner <daniel.wagner@bmw-carit.de>

Since the -Wincompatible-pointer-types is reported as error, alpha
doesn't build anymore. Let's fix it in a minimal way.

fs/binfmt_em86.c:73:35: error: passing argument 2 of =E2=80=98copy_stri=
ngs_kernel=E2=80=99 from incompatible pointer type [-Werror=3Dincompati=
ble-pointer-types]
   retval =3D copy_strings_kernel(1, &i_arg, bprm);
                                   ^            ^
fs/binfmt_em86.c:77:34: error: passing argument 2 of =E2=80=98copy_stri=
ngs_kernel=E2=80=99 from incompatible pointer type [-Werror=3Dincompati=
ble-pointer-types]
  retval =3D copy_strings_kernel(1, &i_name, bprm);
                                  ^
Signed-off-by: Daniel Wagner <daniel.wagner@bmw-carit.de>
---
Hi,

Here is the same patch again. The 0day bot is nagging me that
I broke that and up to now it's still not fixed.

Andrew, are you willing to pick this one up?

cheers,
daniel

 fs/binfmt_em86.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/binfmt_em86.c b/fs/binfmt_em86.c
index 4905385..dd2d3f0 100644
--- a/fs/binfmt_em86.c
+++ b/fs/binfmt_em86.c
@@ -24,7 +24,8 @@
=20
 static int load_em86(struct linux_binprm *bprm)
 {
-	char *interp, *i_name, *i_arg;
+	const char *i_name, *i_arg;
+	char *interp;
 	struct file * file;
 	int retval;
 	struct elfhdr	elf_ex;
--=20
2.5.5
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
