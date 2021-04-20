From: David Hildenbrand <david@redhat.com>
Subject: [PATCH v1] binfmt: remove support for em86 (alpha only)
Date: Tue, 20 Apr 2021 19:56:31 +0200
Message-ID: <20210420175631.46923-1-david@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618941405;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=afa6Hv1Y+nEnC6nqP5aByitRJ6Vc/us+E9c6JL1buB0=;
        b=BTLylp2JL0GZV/PPlIgR3z/472H9iLxT8BY0iEOrYZk2THplFnXoU/G8Ov1X/jzmqv59zP
        am8pv/wpxMXs4f29ksMVrlk9L3WkD+Uu4/GrW5n1wAqMiQze9THIFreG2jH6Mf76q56G2Q
        ISb6KkydDX1keyeZVZETRMIFRSV0+rI=
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, linux-alpha@vger.kernel.org

We have a fairly specific alpha binary loader in Linux: running x86
(i386, i486) binaries via the em86 [1] emulator. As noted in the Kconfig
option, the same behavior can be achieved via binfmt_misc, for example,
more nowadays used for running qemu-user.

An example on how to get binfmt_misc running with em86 can be found in
Documentation/admin-guide/binfmt-misc.rst

The defconfig does not have CONFIG_BINFMT_EM86=3Dy set. And doing a
	make defconfig && make olddefconfig
results in
	# CONFIG_BINFMT_EM86 is not set

... as we don't seem to have any supported Linux distirbution for alpha
anymore, there isn't really any "default" user of that feature anymore.

Searching for "CONFIG_BINFMT_EM86=3Dy" reveals mostly discussions from
around 20 years ago, like [2] describing how to get netscape via em86
running via em86, or [3] discussing that running wine or installing
Win 3.11 through em86 would be a nice feature.

The latest binaries available for em86 are from 2000, version 2.2.1 [4] --
which translates to "unsupported"; further, em86 doesn't even work with
glibc-2.x but only with glibc-2.0 [4, 5]. These are clear signs that
there might not be too many em86 users out there, especially users
relying on modern Linux kernels.

Even though the code footprint is relatively small, let's just get rid
of this blast from the past that's effectively unused.

[1] http://ftp.dreamtime.org/pub/linux/Linux-Alpha/em86/v0.4/docs/em86.html
[2] https://static.lwn.net/1998/1119/a/alpha-netscape.html
[3] https://groups.google.com/g/linux.debian.alpha/c/AkGuQHeCe0Y
[4] http://zeniv.linux.org.uk/pub/linux/alpha/em86/v2.2-1/relnotes.2.2.1.ht=
ml
[5] https://forum.teamspeak.com/archive/index.php/t-1477.html

Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-api@vger.kernel.org
Cc: linux-alpha@vger.kernel.org
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 fs/Kconfig.binfmt |  15 -------
 fs/Makefile       |   1 -
 fs/binfmt_em86.c  | 110 ----------------------------------------------
 3 files changed, 126 deletions(-)
 delete mode 100644 fs/binfmt_em86.c

diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
index c6f1c8c1934e..8720e0a30005 100644
--- a/fs/Kconfig.binfmt
+++ b/fs/Kconfig.binfmt
@@ -165,21 +165,6 @@ config OSF4_COMPAT
 	  with v4 shared libraries freely available from Compaq. If you're
 	  going to use shared libraries from Tru64 version 5.0 or later, say N.
=20
-config BINFMT_EM86
-	tristate "Kernel support for Linux/Intel ELF binaries"
-	depends on ALPHA
-	help
-	  Say Y here if you want to be able to execute Linux/Intel ELF
-	  binaries just like native Alpha binaries on your Alpha machine. For
-	  this to work, you need to have the emulator /usr/bin/em86 in place.
-
-	  You can get the same functionality by saying N here and saying Y to
-	  "Kernel support for MISC binaries".
-
-	  You may answer M to compile the emulation support as a module and
-	  later load the module when you want to use a Linux/Intel binary. The
-	  module will be called binfmt_em86. If unsure, say Y.
-
 config BINFMT_MISC
 	tristate "Kernel support for MISC binaries"
 	help
diff --git a/fs/Makefile b/fs/Makefile
index 3215fe205256..c92e403c53f8 100644
--- a/fs/Makefile
+++ b/fs/Makefile
@@ -39,7 +39,6 @@ obj-$(CONFIG_FS_ENCRYPTION)	+=3D crypto/
 obj-$(CONFIG_FS_VERITY)		+=3D verity/
 obj-$(CONFIG_FILE_LOCKING)      +=3D locks.o
 obj-$(CONFIG_BINFMT_AOUT)	+=3D binfmt_aout.o
-obj-$(CONFIG_BINFMT_EM86)	+=3D binfmt_em86.o
 obj-$(CONFIG_BINFMT_MISC)	+=3D binfmt_misc.o
 obj-$(CONFIG_BINFMT_SCRIPT)	+=3D binfmt_script.o
 obj-$(CONFIG_BINFMT_ELF)	+=3D binfmt_elf.o
diff --git a/fs/binfmt_em86.c b/fs/binfmt_em86.c
deleted file mode 100644
index 06b9b9fddf70..000000000000
--- a/fs/binfmt_em86.c
+++ /dev/null
@@ -1,110 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  linux/fs/binfmt_em86.c
- *
- *  Based on linux/fs/binfmt_script.c
- *  Copyright (C) 1996  Martin von L=C3=B6wis
- *  original #!-checking implemented by tytso.
- *
- *  em86 changes Copyright (C) 1997  Jim Paradis
- */
-
-#include <linux/module.h>
-#include <linux/string.h>
-#include <linux/stat.h>
-#include <linux/binfmts.h>
-#include <linux/elf.h>
-#include <linux/init.h>
-#include <linux/fs.h>
-#include <linux/file.h>
-#include <linux/errno.h>
-
-
-#define EM86_INTERP	"/usr/bin/em86"
-#define EM86_I_NAME	"em86"
-
-static int load_em86(struct linux_binprm *bprm)
-{
-	const char *i_name, *i_arg;
-	char *interp;
-	struct file * file;
-	int retval;
-	struct elfhdr	elf_ex;
-
-	/* Make sure this is a Linux/Intel ELF executable... */
-	elf_ex =3D *((struct elfhdr *)bprm->buf);
-
-	if (memcmp(elf_ex.e_ident, ELFMAG, SELFMAG) !=3D 0)
-		return  -ENOEXEC;
-
-	/* First of all, some simple consistency checks */
-	if ((elf_ex.e_type !=3D ET_EXEC && elf_ex.e_type !=3D ET_DYN) ||
-		(!((elf_ex.e_machine =3D=3D EM_386) || (elf_ex.e_machine =3D=3D EM_486))=
) ||
-		!bprm->file->f_op->mmap) {
-			return -ENOEXEC;
-	}
-
-	/* Need to be able to load the file after exec */
-	if (bprm->interp_flags & BINPRM_FLAGS_PATH_INACCESSIBLE)
-		return -ENOENT;
-
-	/* Unlike in the script case, we don't have to do any hairy
-	 * parsing to find our interpreter... it's hardcoded!
-	 */
-	interp =3D EM86_INTERP;
-	i_name =3D EM86_I_NAME;
-	i_arg =3D NULL;		/* We reserve the right to add an arg later */
-
-	/*
-	 * Splice in (1) the interpreter's name for argv[0]
-	 *           (2) (optional) argument to interpreter
-	 *           (3) filename of emulated file (replace argv[0])
-	 *
-	 * This is done in reverse order, because of how the
-	 * user environment and arguments are stored.
-	 */
-	remove_arg_zero(bprm);
-	retval =3D copy_string_kernel(bprm->filename, bprm);
-	if (retval < 0) return retval;=20
-	bprm->argc++;
-	if (i_arg) {
-		retval =3D copy_string_kernel(i_arg, bprm);
-		if (retval < 0) return retval;=20
-		bprm->argc++;
-	}
-	retval =3D copy_string_kernel(i_name, bprm);
-	if (retval < 0)	return retval;
-	bprm->argc++;
-
-	/*
-	 * OK, now restart the process with the interpreter's inode.
-	 * Note that we use open_exec() as the name is now in kernel
-	 * space, and we don't need to copy it.
-	 */
-	file =3D open_exec(interp);
-	if (IS_ERR(file))
-		return PTR_ERR(file);
-
-	bprm->interpreter =3D file;
-	return 0;
-}
-
-static struct linux_binfmt em86_format =3D {
-	.module		=3D THIS_MODULE,
-	.load_binary	=3D load_em86,
-};
-
-static int __init init_em86_binfmt(void)
-{
-	register_binfmt(&em86_format);
-	return 0;
-}
-
-static void __exit exit_em86_binfmt(void)
-{
-	unregister_binfmt(&em86_format);
-}
-
-core_initcall(init_em86_binfmt);
-module_exit(exit_em86_binfmt);
-MODULE_LICENSE("GPL");
--=20
2.30.2

