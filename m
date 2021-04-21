From: Christian Brauner <christian.brauner-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1] binfmt: remove support for em86 (alpha only)
Date: Wed, 21 Apr 2021 09:54:31 +0200
Message-ID: <20210421075431.blsuv3adard2e4xu@wittgenstein>
References: <20210420175631.46923-1-david@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-api-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20210420175631.46923-1-david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, John Paul Adrian Glaubitz <glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, Richard Henderson <rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org>, Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>, Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-api-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Apr 20, 2021 at 07:56:31PM +0200, David Hildenbrand wrote:
> We have a fairly specific alpha binary loader in Linux: running x86
> (i386, i486) binaries via the em86 [1] emulator. As noted in the Kconfig
> option, the same behavior can be achieved via binfmt_misc, for example,
> more nowadays used for running qemu-user.
>=20
> An example on how to get binfmt_misc running with em86 can be found in
> Documentation/admin-guide/binfmt-misc.rst
>=20
> The defconfig does not have CONFIG_BINFMT_EM86=3Dy set. And doing a
> 	make defconfig && make olddefconfig
> results in
> 	# CONFIG_BINFMT_EM86 is not set
>=20
> ... as we don't seem to have any supported Linux distirbution for alpha
> anymore, there isn't really any "default" user of that feature anymore.
>=20
> Searching for "CONFIG_BINFMT_EM86=3Dy" reveals mostly discussions from
> around 20 years ago, like [2] describing how to get netscape via em86
> running via em86, or [3] discussing that running wine or installing
> Win 3.11 through em86 would be a nice feature.
>=20
> The latest binaries available for em86 are from 2000, version 2.2.1 [4] --
> which translates to "unsupported"; further, em86 doesn't even work with
> glibc-2.x but only with glibc-2.0 [4, 5]. These are clear signs that
> there might not be too many em86 users out there, especially users
> relying on modern Linux kernels.
>=20
> Even though the code footprint is relatively small, let's just get rid
> of this blast from the past that's effectively unused.
>=20
> [1] http://ftp.dreamtime.org/pub/linux/Linux-Alpha/em86/v0.4/docs/em86.ht=
ml
> [2] https://static.lwn.net/1998/1119/a/alpha-netscape.html
> [3] https://groups.google.com/g/linux.debian.alpha/c/AkGuQHeCe0Y
> [4] http://zeniv.linux.org.uk/pub/linux/alpha/em86/v2.2-1/relnotes.2.2.1.=
html
> [5] https://forum.teamspeak.com/archive/index.php/t-1477.html
>=20
> Cc: Alexander Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.or=
g>
> Cc: Richard Henderson <rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org>
> Cc: Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.or=
g>
> Cc: Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gman=
e.org>
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gm=
ane.org>
> Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>
> Cc: linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-api-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gma=
ne.org>
> ---

The only Alpha machines in active use I know of are here in Berlin at
the FU so adding Adrian in case they care but I don't think so and this
seems like a good cleanup:

Acked-by: Christian Brauner <christian.brauner-GeWIH/nMZzLQT0dZR+AlfA@publi=
c.gmane.org>


>  fs/Kconfig.binfmt |  15 -------
>  fs/Makefile       |   1 -
>  fs/binfmt_em86.c  | 110 ----------------------------------------------
>  3 files changed, 126 deletions(-)
>  delete mode 100644 fs/binfmt_em86.c
>=20
> diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
> index c6f1c8c1934e..8720e0a30005 100644
> --- a/fs/Kconfig.binfmt
> +++ b/fs/Kconfig.binfmt
> @@ -165,21 +165,6 @@ config OSF4_COMPAT
>  	  with v4 shared libraries freely available from Compaq. If you're
>  	  going to use shared libraries from Tru64 version 5.0 or later, say N.
> =20
> -config BINFMT_EM86
> -	tristate "Kernel support for Linux/Intel ELF binaries"
> -	depends on ALPHA
> -	help
> -	  Say Y here if you want to be able to execute Linux/Intel ELF
> -	  binaries just like native Alpha binaries on your Alpha machine. For
> -	  this to work, you need to have the emulator /usr/bin/em86 in place.
> -
> -	  You can get the same functionality by saying N here and saying Y to
> -	  "Kernel support for MISC binaries".
> -
> -	  You may answer M to compile the emulation support as a module and
> -	  later load the module when you want to use a Linux/Intel binary. The
> -	  module will be called binfmt_em86. If unsure, say Y.
> -
>  config BINFMT_MISC
>  	tristate "Kernel support for MISC binaries"
>  	help
> diff --git a/fs/Makefile b/fs/Makefile
> index 3215fe205256..c92e403c53f8 100644
> --- a/fs/Makefile
> +++ b/fs/Makefile
> @@ -39,7 +39,6 @@ obj-$(CONFIG_FS_ENCRYPTION)	+=3D crypto/
>  obj-$(CONFIG_FS_VERITY)		+=3D verity/
>  obj-$(CONFIG_FILE_LOCKING)      +=3D locks.o
>  obj-$(CONFIG_BINFMT_AOUT)	+=3D binfmt_aout.o
> -obj-$(CONFIG_BINFMT_EM86)	+=3D binfmt_em86.o
>  obj-$(CONFIG_BINFMT_MISC)	+=3D binfmt_misc.o
>  obj-$(CONFIG_BINFMT_SCRIPT)	+=3D binfmt_script.o
>  obj-$(CONFIG_BINFMT_ELF)	+=3D binfmt_elf.o
> diff --git a/fs/binfmt_em86.c b/fs/binfmt_em86.c
> deleted file mode 100644
> index 06b9b9fddf70..000000000000
> --- a/fs/binfmt_em86.c
> +++ /dev/null
> @@ -1,110 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - *  linux/fs/binfmt_em86.c
> - *
> - *  Based on linux/fs/binfmt_script.c
> - *  Copyright (C) 1996  Martin von L=C3=B6wis
> - *  original #!-checking implemented by tytso.
> - *
> - *  em86 changes Copyright (C) 1997  Jim Paradis
> - */
> -
> -#include <linux/module.h>
> -#include <linux/string.h>
> -#include <linux/stat.h>
> -#include <linux/binfmts.h>
> -#include <linux/elf.h>
> -#include <linux/init.h>
> -#include <linux/fs.h>
> -#include <linux/file.h>
> -#include <linux/errno.h>
> -
> -
> -#define EM86_INTERP	"/usr/bin/em86"
> -#define EM86_I_NAME	"em86"
> -
> -static int load_em86(struct linux_binprm *bprm)
> -{
> -	const char *i_name, *i_arg;
> -	char *interp;
> -	struct file * file;
> -	int retval;
> -	struct elfhdr	elf_ex;
> -
> -	/* Make sure this is a Linux/Intel ELF executable... */
> -	elf_ex =3D *((struct elfhdr *)bprm->buf);
> -
> -	if (memcmp(elf_ex.e_ident, ELFMAG, SELFMAG) !=3D 0)
> -		return  -ENOEXEC;
> -
> -	/* First of all, some simple consistency checks */
> -	if ((elf_ex.e_type !=3D ET_EXEC && elf_ex.e_type !=3D ET_DYN) ||
> -		(!((elf_ex.e_machine =3D=3D EM_386) || (elf_ex.e_machine =3D=3D EM_486=
))) ||
> -		!bprm->file->f_op->mmap) {
> -			return -ENOEXEC;
> -	}
> -
> -	/* Need to be able to load the file after exec */
> -	if (bprm->interp_flags & BINPRM_FLAGS_PATH_INACCESSIBLE)
> -		return -ENOENT;
> -
> -	/* Unlike in the script case, we don't have to do any hairy
> -	 * parsing to find our interpreter... it's hardcoded!
> -	 */
> -	interp =3D EM86_INTERP;
> -	i_name =3D EM86_I_NAME;
> -	i_arg =3D NULL;		/* We reserve the right to add an arg later */
> -
> -	/*
> -	 * Splice in (1) the interpreter's name for argv[0]
> -	 *           (2) (optional) argument to interpreter
> -	 *           (3) filename of emulated file (replace argv[0])
> -	 *
> -	 * This is done in reverse order, because of how the
> -	 * user environment and arguments are stored.
> -	 */
> -	remove_arg_zero(bprm);
> -	retval =3D copy_string_kernel(bprm->filename, bprm);
> -	if (retval < 0) return retval;=20
> -	bprm->argc++;
> -	if (i_arg) {
> -		retval =3D copy_string_kernel(i_arg, bprm);
> -		if (retval < 0) return retval;=20
> -		bprm->argc++;
> -	}
> -	retval =3D copy_string_kernel(i_name, bprm);
> -	if (retval < 0)	return retval;
> -	bprm->argc++;
> -
> -	/*
> -	 * OK, now restart the process with the interpreter's inode.
> -	 * Note that we use open_exec() as the name is now in kernel
> -	 * space, and we don't need to copy it.
> -	 */
> -	file =3D open_exec(interp);
> -	if (IS_ERR(file))
> -		return PTR_ERR(file);
> -
> -	bprm->interpreter =3D file;
> -	return 0;
> -}
> -
> -static struct linux_binfmt em86_format =3D {
> -	.module		=3D THIS_MODULE,
> -	.load_binary	=3D load_em86,
> -};
> -
> -static int __init init_em86_binfmt(void)
> -{
> -	register_binfmt(&em86_format);
> -	return 0;
> -}
> -
> -static void __exit exit_em86_binfmt(void)
> -{
> -	unregister_binfmt(&em86_format);
> -}
> -
> -core_initcall(init_em86_binfmt);
> -module_exit(exit_em86_binfmt);
> -MODULE_LICENSE("GPL");
> --=20
> 2.30.2
>=20
