From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha.git
Date: Tue, 29 Aug 2017 12:35:31 -0700
Message-ID: <20170829193531.GA10565@ivybridge.mattst88.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=smB0kGs2f0iZLHY9UwwnFs13HEofH5V6suvnhqhHpGQ=;
        b=bWGQS2Zl+SAJDeiByFr4OajhXh9ntoa2G9afIrkjxMPBEWVynRn1JhVxKQZGF6Duhk
         qaRy7Jpy5ITOYjC4lDK5iHtbKl0koQtFvoutJwYryIT4WaYGejQqrnrx0F32psUwq0Gc
         0Rz71RxMc9oiz5IEci7OEMH8ZZTNU56SEXAkONksO8e7WV8FhFuwc7gOkHFW/TMdQInA
         VzKaHgzt/nV/K4xxdzzd6cevPw6sEgWzmy0lWyC+Ip5rCerOWy+jNbPQpztpmPe3QUQR
         exqXbkr1lUx+LnQ+5+glgT46QcybL9/L8j8sdpaer4mkXvGuxv9YszOvf/E7SqCXkOhc
         ZHnw==
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Guenter Roeck <linux@roeck-us.net>, Ben Hutchings <ben@decadent.org.uk>, Michael Cree <mcree@orcon.net.nz>


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hi Linus,

Please pull my alpha git tree. It contains a few fixes and wires up some
additional syscalls.

Thanks,
Matt

PS: My alpha has been offline, hence the very late-in-cycle pull request.


The following changes since commit 143c97cc652949893c8056c679012f0aeccb80e5:

  Revert "pty: fix the cached path of the pty slave file descriptor in the master" (2017-08-23 18:16:11 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git for-linus

for you to fetch changes up to cec80d82142ab25c71eee24b529cfeaf17c43062:

  alpha: uapi: Add support for __SANE_USERSPACE_TYPES__ (2017-08-29 12:02:00 -0700)

----------------------------------------------------------------
Ben Hutchings (1):
      alpha: uapi: Add support for __SANE_USERSPACE_TYPES__

Guenter Roeck (1):
      alpha: Define ioremap_wc

Matt Turner (2):
      alpha: Fix build error without CONFIG_VGA_HOSE.
      alpha: Fix section mismatches

Michael Cree (1):
      alpha: support R_ALPHA_REFLONG relocations for module loading

Richard Henderson (3):
      alpha: Update for new syscalls
      alpha: Package string routines together
      alpha: Fix typo in ev6-copy_user.S

 arch/alpha/include/asm/io.h          |  1 +
 arch/alpha/include/asm/types.h       |  2 +-
 arch/alpha/include/asm/unistd.h      |  2 +-
 arch/alpha/include/uapi/asm/types.h  | 12 +++++++++++-
 arch/alpha/include/uapi/asm/unistd.h | 14 ++++++++++++++
 arch/alpha/kernel/core_marvel.c      |  6 ++++--
 arch/alpha/kernel/core_titan.c       |  2 ++
 arch/alpha/kernel/module.c           |  3 +++
 arch/alpha/kernel/smp.c              |  2 +-
 arch/alpha/kernel/systbls.S          |  9 +++++++++
 arch/alpha/lib/Makefile              | 22 ++++++++++++++++------
 arch/alpha/lib/copy_user.S           |  2 +-
 arch/alpha/lib/ev6-copy_user.S       |  7 ++++---
 13 files changed, 68 insertions(+), 16 deletions(-)

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO7Y55W+GH6LoZQVpD91oLZdMpyoFAlmlwgAACgkQD91oLZdM
pypgdRAAlj32cAGODek/U8DLU+y72/AZ+EvQKf0m3zzWZV2psHw3Xxo/WmhtTdwX
4LiglKGYuU9S8JqmVM3gpuZc0HKtvfZLgT5hGvZJU6zPZxBDy0108zxWpc8XLTSV
CqERs/H25imJwFb7Oqaki/s0yXhNsQFMM5XzZJ7U6AEfic4ObmHAlH+DGjML+X+v
b2/xe/GmwpJiiOB63Ko2UieNVpNnLOQ7CrS+NkyHCXOZtyptXG8gl8Iqtw0IRDCO
HWBe0JJuE/nel/EJ+yRNsNm6a2w3q8zeXwe0yAwIENXlRVu8ae31e9IdT85HiuGl
ilk79TiKuEzSlB/nc8VcFHNmSP6EPWryrdOM6RUNxf8TiuGIh4hcwY/Ez/MSJHZv
Y22tfduMg6lpaj06Sq1L5m32i7hINHLRDBNhAAUII5h8S6DTNyeHutVByYTDRULA
WP7J1cuXqOrGwuPvzolib5ezWFtEiIOdNWAKm64kC4pzI7g6SoJNjhWJ7uu34LXx
yinWi+W7/1mnfd6r1QM9wuP6g9vKlnxu4bWpQlvNhadrgaC6xlHrij2wO9Vkeh6o
3dUWf7RQoOX1M54X/eiysx5R4gAhZf0feU+yMSRoofgPk7YID1biNSjaQbd9R5Z2
nk0KPk7bmxSEnUmsrIecnnSCWQwb1Oc1aCzLBlLuVWpmtMc4o6k=
=iGQi
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
