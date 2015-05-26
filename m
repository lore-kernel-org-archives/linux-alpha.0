From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha.git
Date: Tue, 26 May 2015 13:09:48 -0700
Message-ID: <20150526200948.GA13466@ivybridge>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:mime-version:content-type
         :content-disposition:user-agent;
        bh=Uv2bfx2HmuhAJb5zDLl883cHqJZ4hpEq/s5AyyttFPk=;
        b=ITVS6H1GP2vlrGkMSSYmCv1No6qYXxw+q8PiIHvfPGbAD+ZaQ63zZzYX3UNDi3eyX6
         GLGF2a++/gwRE1DxhDNYqQtft7j5ceMytjaf/V/lFfOCk+lwZCmIWR34mknSSWYu3Ul9
         nfYN/Mm51SHCd+vM/BuUGQAAU293Hab8PBCcOHA9ELoeCxPJb3/p056sCUTD5TXK0cVb
         uLQxckb8iH2M/cSicpvHleMg7S5kGIR1bDJUI4cS9IsZ/IELYrKiZroFnnXgAMYZqkXN
         Wxas43qGXSyf+RXGxRAOkKQJQUMMHzfCnMQOXqkcnfoz6UbpXEN/HN8KCCZ2BSya45Z7
         N/rQ==
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull a small collection of patches that I've been neglecting.

Probably most importantly are the patches that wire up the new syscalls
needed by udev and the fix to the bootp{,z}file targets.

Thanks,
Matt

The following changes since commit a8b253b9f253c05e5e10b829b8d1fb24556f4b56:

  Merge tag 'pinctrl-v4.1-4' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl (2015-05-25 15:15:54 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git for-linus

for you to fetch changes up to cceaeddc2edf710141563c65808b5cea6829b925:

  alpha: kernel: osf_sys: Set 'kts.tv_nsec' only when 'tv' has effect (2015-05-26 10:01:51 -0700)

----------------------------------------------------------------
Alex Dowad (1):
      alpha: copy_thread(): rename 'arg' argument to 'kthread_arg'

Chen Gang (2):
      alpha: Wire up all missing implemented syscalls
      alpha: kernel: osf_sys: Set 'kts.tv_nsec' only when 'tv' has effect

Geert Uytterhoeven (1):
      alpha: Remove #include <uapi/asm/types.h> from <asm/types.h>

Helge Deller (1):
      alpha: Fix bootpfile and bootpzfile make targets

Jiang Liu (1):
      smp, alpha: kill SMP single function call interrupt

Paul Gortmaker (2):
      alpha: don't use module_init for non-modular core code
      alpha: delete non-required instances of <linux/init.h>

Yijing Wang (1):
      alpha: clean up unnecessary MSI/MSI-X capability find

 arch/alpha/boot/Makefile             |  16 +-
 arch/alpha/boot/main.c               |   1 -
 arch/alpha/boot/stdio.c              | 306 +++++++++++++++++++++++++++++++++++
 arch/alpha/boot/tools/objstrip.c     |   3 +
 arch/alpha/include/asm/types.h       |   1 -
 arch/alpha/include/asm/unistd.h      |   2 +-
 arch/alpha/include/uapi/asm/unistd.h |   3 +
 arch/alpha/kernel/err_ev6.c          |   1 -
 arch/alpha/kernel/irq.c              |   1 -
 arch/alpha/kernel/osf_sys.c          |   3 +-
 arch/alpha/kernel/process.c          |   7 +-
 arch/alpha/kernel/smp.c              |   8 +-
 arch/alpha/kernel/srmcons.c          |   3 +-
 arch/alpha/kernel/sys_marvel.c       |   2 +-
 arch/alpha/kernel/systbls.S          |   3 +
 arch/alpha/kernel/traps.c            |   1 -
 arch/alpha/oprofile/op_model_ev4.c   |   1 -
 arch/alpha/oprofile/op_model_ev5.c   |   1 -
 arch/alpha/oprofile/op_model_ev6.c   |   1 -
 arch/alpha/oprofile/op_model_ev67.c  |   1 -
 20 files changed, 333 insertions(+), 32 deletions(-)
 create mode 100644 arch/alpha/boot/stdio.c

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJVZNMMAAoJEA/daC2XTKcq410P/j8GosfSo/qBiODStm76fMB0
+w+4qJKF5b5YmnG8HVNCK14mD0k/rZoj5Y3rYP0JHXiMZCFFiLw3FAMQvPMHTmbk
VtO7xEQ62WBFOQzTuLdF8JMsiN5kqGCVhPQPCQZoLWDa1eBgQP40D8Sy4XoeBAZ1
GhSOF0bd6ME6VXfpU1H9MjnK1mdHKerczGG1QHQVMlolb7giNyeFBvt+mSmAWBYE
tk4ZKBQNWJErsR+ouf9ETWo6EUZvB++wT/0kxGFuyEmc09VW1xfPmKauqIVVNBMJ
rRHtn368+sTFwgzaXfpQPXJ2gysEBb72OWUPtmy2h+sARzxvghwyk50ps3qS9334
+FjSKyZPYUqO3ZKtCyF761n38LPHEA4vdAdm79U/4yMQB98raVhtO9t08UC4RNnJ
Ajg5RQfl8kmr/+fM+3NuW7m1STI8ndUn/EAoto2pnFC10Njp9A1aorDYv7qHHrQt
D1sWwj5X4HsxUwXsBVDKwSUH6nddaViQ8mKeRenqAavnm3ibFAPoEXuDOgAk4LAN
xyYaWq6WSJRJIgfF00zgUJDScoX16tFvFaSAlBSAOJIP+z+0S94GBuRZZF2vBGFD
1YhoMDYC29oaFphWXHPC53F/T9QedTrEE482Gbe4/+fRKAIAzbJzz90jx9agdqjh
FYBfaEMa2muLlvZEV2sM
=oJIH
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
