From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v1] binfmt: remove support for em86 (alpha only)
Date: Wed, 21 Apr 2021 10:01:32 +0200
Message-ID: <37f00e0a-e0b9-0c93-d0e8-47169c091faa@physik.fu-berlin.de>
References: <20210420175631.46923-1-david@redhat.com>
 <20210421075431.blsuv3adard2e4xu@wittgenstein>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20210421075431.blsuv3adard2e4xu@wittgenstein>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Christian Brauner <christian.brauner@ubuntu.com>, David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, linux-alpha@vger.kernel.org

Hi!

On 4/21/21 9:54 AM, Christian Brauner wrote:
> The only Alpha machines in active use I know of are here in Berlin at
> the FU so adding Adrian in case they care but I don't think so and this
> seems like a good cleanup:
>=20
> Acked-by: Christian Brauner <christian.brauner@ubuntu.com>

Thanks for CC'ing me. FWIW, Gentoo has a very active Alpha maintenance as w=
ell
and there are more people running Debian on Alpha on the debian-alpha ML.

I agree that em86 is obsolete and most users will just use qemu-user these =
days.

Adrian

>>  fs/Kconfig.binfmt |  15 -------
>>  fs/Makefile       |   1 -
>>  fs/binfmt_em86.c  | 110 ----------------------------------------------
>>  3 files changed, 126 deletions(-)
>>  delete mode 100644 fs/binfmt_em86.c
>>
>> diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
>> index c6f1c8c1934e..8720e0a30005 100644
>> --- a/fs/Kconfig.binfmt
>> +++ b/fs/Kconfig.binfmt
>> @@ -165,21 +165,6 @@ config OSF4_COMPAT
>>  	  with v4 shared libraries freely available from Compaq. If you're
>>  	  going to use shared libraries from Tru64 version 5.0 or later, say N.
>> =20
>> -config BINFMT_EM86
>> -	tristate "Kernel support for Linux/Intel ELF binaries"
>> -	depends on ALPHA
>> -	help
>> -	  Say Y here if you want to be able to execute Linux/Intel ELF
>> -	  binaries just like native Alpha binaries on your Alpha machine. For
>> -	  this to work, you need to have the emulator /usr/bin/em86 in place.
>> -
>> -	  You can get the same functionality by saying N here and saying Y to
>> -	  "Kernel support for MISC binaries".
>> -
>> -	  You may answer M to compile the emulation support as a module and
>> -	  later load the module when you want to use a Linux/Intel binary. The
>> -	  module will be called binfmt_em86. If unsure, say Y.
>> -
>>  config BINFMT_MISC
>>  	tristate "Kernel support for MISC binaries"
>>  	help
>> diff --git a/fs/Makefile b/fs/Makefile
>> index 3215fe205256..c92e403c53f8 100644
>> --- a/fs/Makefile
>> +++ b/fs/Makefile
>> @@ -39,7 +39,6 @@ obj-$(CONFIG_FS_ENCRYPTION)	+=3D crypto/
>>  obj-$(CONFIG_FS_VERITY)		+=3D verity/
>>  obj-$(CONFIG_FILE_LOCKING)      +=3D locks.o
>>  obj-$(CONFIG_BINFMT_AOUT)	+=3D binfmt_aout.o
>> -obj-$(CONFIG_BINFMT_EM86)	+=3D binfmt_em86.o
>>  obj-$(CONFIG_BINFMT_MISC)	+=3D binfmt_misc.o
>>  obj-$(CONFIG_BINFMT_SCRIPT)	+=3D binfmt_script.o
>>  obj-$(CONFIG_BINFMT_ELF)	+=3D binfmt_elf.o
>> diff --git a/fs/binfmt_em86.c b/fs/binfmt_em86.c
>> deleted file mode 100644
>> index 06b9b9fddf70..000000000000
>> --- a/fs/binfmt_em86.c
>> +++ /dev/null
>> @@ -1,110 +0,0 @@
>> -// SPDX-License-Identifier: GPL-2.0-only
>> -/*
>> - *  linux/fs/binfmt_em86.c
>> - *
>> - *  Based on linux/fs/binfmt_script.c
>> - *  Copyright (C) 1996  Martin von L=C3=B6wis
>> - *  original #!-checking implemented by tytso.
>> - *
>> - *  em86 changes Copyright (C) 1997  Jim Paradis
>> - */
>> -
>> -#include <linux/module.h>
>> -#include <linux/string.h>
>> -#include <linux/stat.h>
>> -#include <linux/binfmts.h>
>> -#include <linux/elf.h>
>> -#include <linux/init.h>
>> -#include <linux/fs.h>
>> -#include <linux/file.h>
>> -#include <linux/errno.h>
>> -
>> -
>> -#define EM86_INTERP	"/usr/bin/em86"
>> -#define EM86_I_NAME	"em86"
>> -
>> -static int load_em86(struct linux_binprm *bprm)
>> -{
>> -	const char *i_name, *i_arg;
>> -	char *interp;
>> -	struct file * file;
>> -	int retval;
>> -	struct elfhdr	elf_ex;
>> -
>> -	/* Make sure this is a Linux/Intel ELF executable... */
>> -	elf_ex =3D *((struct elfhdr *)bprm->buf);
>> -
>> -	if (memcmp(elf_ex.e_ident, ELFMAG, SELFMAG) !=3D 0)
>> -		return  -ENOEXEC;
>> -
>> -	/* First of all, some simple consistency checks */
>> -	if ((elf_ex.e_type !=3D ET_EXEC && elf_ex.e_type !=3D ET_DYN) ||
>> -		(!((elf_ex.e_machine =3D=3D EM_386) || (elf_ex.e_machine =3D=3D EM_48=
6))) ||
>> -		!bprm->file->f_op->mmap) {
>> -			return -ENOEXEC;
>> -	}
>> -
>> -	/* Need to be able to load the file after exec */
>> -	if (bprm->interp_flags & BINPRM_FLAGS_PATH_INACCESSIBLE)
>> -		return -ENOENT;
>> -
>> -	/* Unlike in the script case, we don't have to do any hairy
>> -	 * parsing to find our interpreter... it's hardcoded!
>> -	 */
>> -	interp =3D EM86_INTERP;
>> -	i_name =3D EM86_I_NAME;
>> -	i_arg =3D NULL;		/* We reserve the right to add an arg later */
>> -
>> -	/*
>> -	 * Splice in (1) the interpreter's name for argv[0]
>> -	 *           (2) (optional) argument to interpreter
>> -	 *           (3) filename of emulated file (replace argv[0])
>> -	 *
>> -	 * This is done in reverse order, because of how the
>> -	 * user environment and arguments are stored.
>> -	 */
>> -	remove_arg_zero(bprm);
>> -	retval =3D copy_string_kernel(bprm->filename, bprm);
>> -	if (retval < 0) return retval;=20
>> -	bprm->argc++;
>> -	if (i_arg) {
>> -		retval =3D copy_string_kernel(i_arg, bprm);
>> -		if (retval < 0) return retval;=20
>> -		bprm->argc++;
>> -	}
>> -	retval =3D copy_string_kernel(i_name, bprm);
>> -	if (retval < 0)	return retval;
>> -	bprm->argc++;
>> -
>> -	/*
>> -	 * OK, now restart the process with the interpreter's inode.
>> -	 * Note that we use open_exec() as the name is now in kernel
>> -	 * space, and we don't need to copy it.
>> -	 */
>> -	file =3D open_exec(interp);
>> -	if (IS_ERR(file))
>> -		return PTR_ERR(file);
>> -
>> -	bprm->interpreter =3D file;
>> -	return 0;
>> -}
>> -
>> -static struct linux_binfmt em86_format =3D {
>> -	.module		=3D THIS_MODULE,
>> -	.load_binary	=3D load_em86,
>> -};
>> -
>> -static int __init init_em86_binfmt(void)
>> -{
>> -	register_binfmt(&em86_format);
>> -	return 0;
>> -}
>> -
>> -static void __exit exit_em86_binfmt(void)
>> -{
>> -	unregister_binfmt(&em86_format);
>> -}
>> -
>> -core_initcall(init_em86_binfmt);
>> -module_exit(exit_em86_binfmt);
>> -MODULE_LICENSE("GPL");
>> --=20
>> 2.30.2
>>

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
