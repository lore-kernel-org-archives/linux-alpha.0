From: Daniel Wagner <daniel.wagner@bmw-carit.de>
Subject: [PATCH resend] binfmt_em86: load_em86: Remove unused i_arg variable and constify i_name
Date: Wed, 17 Feb 2016 13:57:09 +0100
Message-ID: <1455713829-9856-1-git-send-email-daniel.wagner@bmw-carit.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-kernel@vger.kernel.org
Cc: linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Daniel Wagner <daniel.wagner@bmw-carit.de>

i_arg is not used at all therefore remove it. This also prevents
a warning with gcc 5.2 when -Wincompatible-pointer-types is enabled:

fs/binfmt_em86.c:73:35: warning: passing argument 2 of =E2=80=98copy_st=
rings_kernel=E2=80=99 from incompatible pointer type [-Werror=3Dincompa=
tible-pointer-types]
   retval =3D copy_strings_kernel(1, &i_arg, bprm);


The second error would come from i_name which is defined as char pointe=
r
without the const attribute.

fs/binfmt_em86.c:71:34: warning: passing argument 2 of =E2=80=98copy_st=
rings_kernel=E2=80=99 from incompatible pointer type [-Werror=3Dincompa=
tible-pointer-types]
  retval =3D copy_strings_kernel(1, &i_name, bprm);


While at it, check the remove_arg_zero return value too.

fs/binfmt_em86.c:68:2: warning: ignoring return value of =E2=80=98remov=
e_arg_zero=E2=80=99, declared with attribute warn_unused_result [-Wunus=
ed-result]
  remove_arg_zero(bprm);
  ^

Signed-off-by: Daniel Wagner <daniel.wagner@bmw-carit.de>
---

I forgot to Cc the linux-alpha list and Cc also the alpha arch
maintainers... 2nd try.

fs/binfmt_em86.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/fs/binfmt_em86.c b/fs/binfmt_em86.c
index 4905385..bc8fff2 100644
--- a/fs/binfmt_em86.c
+++ b/fs/binfmt_em86.c
@@ -24,7 +24,8 @@
=20
 static int load_em86(struct linux_binprm *bprm)
 {
-	char *interp, *i_name, *i_arg;
+	const char *i_name;
+	char *interp;
 	struct file * file;
 	int retval;
 	struct elfhdr	elf_ex;
@@ -55,7 +56,6 @@ static int load_em86(struct linux_binprm *bprm)
 	 */
 	interp =3D EM86_INTERP;
 	i_name =3D EM86_I_NAME;
-	i_arg =3D NULL;		/* We reserve the right to add an arg later */
=20
 	/*
 	 * Splice in (1) the interpreter's name for argv[0]
@@ -65,15 +65,11 @@ static int load_em86(struct linux_binprm *bprm)
 	 * This is done in reverse order, because of how the
 	 * user environment and arguments are stored.
 	 */
-	remove_arg_zero(bprm);
+	retval =3D remove_arg_zero(bprm);
+	if (retval < 0) return retval;
 	retval =3D copy_strings_kernel(1, &bprm->filename, bprm);
 	if (retval < 0) return retval;=20
 	bprm->argc++;
-	if (i_arg) {
-		retval =3D copy_strings_kernel(1, &i_arg, bprm);
-		if (retval < 0) return retval;=20
-		bprm->argc++;
-	}
 	retval =3D copy_strings_kernel(1, &i_name, bprm);
 	if (retval < 0)	return retval;
 	bprm->argc++;
--=20
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
