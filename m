From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha.git
Date: Mon, 22 Jul 2013 10:11:46 -0700
Message-ID: <20130722171146.GA5106@work-Thinkpad.ak.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:mime-version:content-type
         :content-disposition:user-agent;
        bh=uB2NhuTz3q99luxzDRa7vQSu31N4njvUGKDqJC0fkXQ=;
        b=seEPXitOhJFvajdmUO2H5gY21V4o1/MggIm72JsNXMVrUpPRGmG63DZxE6pEwawEdP
         dA87g5ET/lYtn8SbaYSu4Hcim8jjwY1I8kElKXrPs6QuEb8A+ONn36jTqrtf+RDMEazT
         x0XgspE9lNzca+hYU8PsfQQ4iv5PTOB0ooT0zh1T8euzObo7LHuvJKpq3v9dPejBkluK
         j0ImvpJ84etoxwwa1v/zCvY6LtGLF3CUNQDbuUq2/5T3mi7HSo1/Kg7r73rFrlGNDWbr
         fXbIOOeiLOTNdQoDpal64nr3VZ5486eymzfY8kH6PCslaEpdVXDY/oO9hGbMKAJH0JIq
         bAaA==
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org, Joe Perches <joe@perches.com>, Chen Gang <gang.chen@asianux.com>, Will Deacon <will.deacon@arm.com>, Richard Henderson <rth@twiddle.net>


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull my alpha git tree. It contains mostly clean ups and
fixes but also an atomic64_dec_if_positive implementation and a
pair of new syscalls.

Thanks,
Matt

The following changes since commit b8a33fc7258f9e6e42b15571d0284b7c0ef0d0a9:

  Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm (2013-07-19 10:17:12 -0700)

are available in the git repository at:


  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git for-linus

for you to fetch changes up to dff64649e757870e9351e7d85917ae681d20ee54:

  alpha: Use handle_percpu_irq for the timer interrupt (2013-07-19 13:54:26 -0700)

----------------------------------------------------------------
Chen Gang (2):
      alpha: kernel: using memcpy() instead of strcpy()
      alpha: kernel: typo issue, using '1' instead of '11'

Joe Perches (1):
      alpha: Convert print_symbol to %pSR

Richard Henderson (10):
      alpha: Add kcmp and finit_module syscalls
      alpha: Modernize lib/mpi/longlong.h
      alpha: Improve atomic_add_unless
      alpha: Implement atomic64_dec_if_positive
      alpha: Generate dwarf2 unwind info for various kernel entry points.
      alpha: Fix type compatibility warning for marvel_map_irq
      alpha: Use __builtin_alpha_rpcc
      alpha: Don't if-out dp264_device_interrupt.
      alpha: Force the user-visible HZ to a constant 1024.
      alpha: Use handle_percpu_irq for the timer interrupt

Will Deacon (1):
      alpha: locks: remove unused arch_*_relax operations

 arch/alpha/Kconfig                   |   1 +
 arch/alpha/include/asm/atomic.h      |  88 +++++++++++++++++++++++++++----------
 arch/alpha/include/asm/param.h       |   8 ++--
 arch/alpha/include/asm/spinlock.h    |   4 --
 arch/alpha/include/asm/unistd.h      |   3 +-
 arch/alpha/include/uapi/asm/param.h  |   7 ---
 arch/alpha/include/uapi/asm/unistd.h |   2 +
 arch/alpha/kernel/entry.S            | 399 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------
 arch/alpha/kernel/irq_alpha.c        |   2 +-
 arch/alpha/kernel/smp.c              |   5 ++-
 arch/alpha/kernel/sys_dp264.c        |   8 ----
 arch/alpha/kernel/sys_marvel.c       |   3 +-
 arch/alpha/kernel/systbls.S          |   2 +
 arch/alpha/kernel/time.c             |   4 +-
 arch/alpha/kernel/traps.c            |   8 ++--
 lib/mpi/longlong.h                   |  17 +++-----
 16 files changed, 381 insertions(+), 180 deletions(-)

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR7WfSAAoJEA/daC2XTKcqQQYQAINZVnmeD/uZffU9Hx7EoIR5
P38C0LeV9xKB2pNIVa2j9E5SKeA5ddb1RZsu+E4Z8PSILuIorrbk+8qts1k9DyJx
fYVW7QA0P8e8A08ot+ZLvHggEJQeUpj13WW9hFhRUKb5MVXUqMN9RXSptaQQYV+U
6MGFXvYDilHtIl/5+3cYA3xsYZWvLmLkY4QxuramyExSYWe2W/UaQnD15fPJkJmA
d+plspuY64TW/gmNsGxLbjOXBuBVq0da1zH3RmW8yKV1nN5Y4ufnh/lsXIc8pmJY
ks2QKciqS+qJj8Z/HkmXEe15d+6HHJ1vQXqJHrg/9228o8tiCA6Ui53D2k5O7OKp
jrGDgkD2aoDf/rISIeY00zbMlPQ9E++uErhrrfXnHSVkF4KDM+5Z9L5pNN99CHH1
QVRETSq23afHWEQ/6cboJxHcFUbZYHt2JuCNbZ8bYzMXP+vEfPejN0+QyGsX4M+T
TACQD963SIhaREm2yTYT5+PMgpUyuXVVrbszTRKVi57uG+5qZK48t85kB9bpEhCB
k+VQ+4lbNQPr6E3OQjtrk6vQk8Sro8HmwTQK+ZkoE4elMzeGBAPaZQPJNmh4k6mf
ayMQaThC4iPnubc9B3dAJDiPY7zcGybYp4vAmf+/abWU5mm7wgItgj1XCxRqPB4+
XF4cdwwWiPkPUnoGFv3Z
=fa7L
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--
