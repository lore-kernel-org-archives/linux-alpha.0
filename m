From: Helge Deller <deller@gmx.de>
Subject: Re: linux 4.6 FTBFS on alpha
Date: Thu, 5 May 2016 06:37:47 +0200
Message-ID: <572ACE1B.8040903@gmx.de>
References: <1462411070.1563.76.camel@decadent.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1462411070.1563.76.camel@decadent.org.uk>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Ben Hutchings <ben@decadent.org.uk>, Michael Cree <mcree@orcon.net.nz>
Cc: Debian kernel maintainers <debian-kernel@lists.debian.org>, linux-alpha@vger.kernel.org

On 05.05.2016 03:17, Ben Hutchings wrote:
> There's a silly type error in an alpha-specific module that now break=
s
> the build:
>=20
> /=C2=ABPKGBUILDDIR=C2=BB/fs/binfmt_em86.c: In function 'load_em86':
> /=C2=ABPKGBUILDDIR=C2=BB/fs/binfmt_em86.c:73:35: error: passing argum=
ent 2 of 'copy_strings_kernel' from incompatible pointer type [-Werror=3D=
incompatible-pointer-types]
>    retval =3D copy_strings_kernel(1, &i_arg, bprm);
>                                    ^
> In file included from /=C2=ABPKGBUILDDIR=C2=BB/fs/binfmt_em86.c:14:0:
> /=C2=ABPKGBUILDDIR=C2=BB/include/linux/binfmts.h:116:12: note: expect=
ed 'const char * const*' but argument is of type 'char **'
>  extern int copy_strings_kernel(int argc, const char *const *argv,
>             ^
> /=C2=ABPKGBUILDDIR=C2=BB/fs/binfmt_em86.c:77:34: error: passing argum=
ent 2 of 'copy_strings_kernel' from incompatible pointer type [-Werror=3D=
incompatible-pointer-types]
>   retval =3D copy_strings_kernel(1, &i_name, bprm);
>                                   ^
> In file included from /=C2=ABPKGBUILDDIR=C2=BB/fs/binfmt_em86.c:14:0:
> /=C2=ABPKGBUILDDIR=C2=BB/include/linux/binfmts.h:116:12: note: expect=
ed 'const char * const*' but argument is of type 'char **'
>  extern int copy_strings_kernel(int argc, const char *const *argv,
>             ^
>=20
> The conversion is safe but the C standard says it requires a cast.
> This can easily be fixed by adding the cast, but I also wonder why we
> still build this module.  Even the Kconfig text says it's redundant
> with binfmt_misc.  What do you think?

I don't know if it being used, but it seems that systemd takes care=20
of autoloading binfmt_misc automatically, so IMHO I agree that it shoul=
d
be safe to simply disable binfmt_em86 from the debian alpha kernel.

Question to the alpha kernel maintainers: Maybe binfmt_em86=20
should simply be dropped from the kernel source completely? =20

Helge
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
