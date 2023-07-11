From: Christian Brauner <brauner@kernel.org>
Subject: Re: (subset) [PATCH v4 0/5] Add a new fchmodat2() syscall
Date: Tue, 11 Jul 2023 19:36:45 +0200
Message-ID: <20230711-befreien-unwiderruflich-c2265c61e514@brauner>
References: <cover.1689074739.git.legion@kernel.org> <cover.1689092120.git.legion@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689097032;
        bh=g+dg42YNtsQJhOjtGMIfYdxeMk+Q5chUUpj1UHPyuI0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OU0fx9r/gW1jdTCG/iJZoodUiAYpTTMgryh+eUwK0SvFFeCzBDxABJWQ/HAhpM8ye
         yBnM//6OA543xk4QBgEbWFDkvCh7ONFKnet6T2nY6GiJNGe++LpNHsBO53yIxRC1dw
         CLUi1qmmodaux6upnMNyF/KqqubSxVHA67DwxYH/aO5VwDsXvdD1T4BZZhZWFZrom9
         +nthUGNjjcFzaX2bY1z9qhdSCg7rB6hz0xgLF1oCv+tCDu8UN7UNhRG5OCUuJUdOw+
         UBXBTnHv6L2WRueaCic7RFYV1/lmEsdEsvaplXp/1qHno7ehBsSMmEORgYmfsLOmFl
         vPA4Eb9AXLl0w==
In-Reply-To: <cover.1689092120.git.legion@kernel.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1700; i=brauner@kernel.org; h=from:subject:message-id; bh=g+dg42YNtsQJhOjtGMIfYdxeMk+Q5chUUpj1UHPyuI0=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaSsnSxT9aGqYFXo8u/Pv0u8/8n7p3Ja0Z4JQu5vS1/e2JvM Xda7tKOUhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAiwv8ZGa5HavbtmudR8P/916OJ0j 91rvW3zk3vj11VUnvmNlvDpK2MDJ8umZ/uZt1qWrp9+6sJ/1y98jZJfQleeOMaf2RRS0fvbmYA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexey Gladkov <legion@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, James.Bottomley@HansenPartnership.com, acme@kernel.org, alexander.shishkin@linux.intel.com, axboe@kernel.dk, benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, dalias@libc.org, davem@davemloft.net, deepa.kernel@gmail.com, deller@gmx.de, dhowells@redhat.com, fenghua.yu@intel.com, fweimer@redhat.com, geert@linux-m68k.org, glebfm@altlinux.org, gor@linux.ibm.com, hare@suse.com, hpa@zytor.com, ink@jurassic.park.msu.ru, jhogan@kernel.org, kim.phillips@arm.com, ldv@altlinux.org, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux@armlinux.org.uk

On Tue, 11 Jul 2023 18:16:02 +0200, Alexey Gladkov wrote:
> In glibc, the fchmodat(3) function has a flags argument according to the
> POSIX specification [1], but kernel syscalls has no such argument.
> Therefore, libc implementations do workarounds using /proc. However,
> this requires procfs to be mounted and accessible.
> 
> This patch set adds fchmodat2(), a new syscall. The syscall allows to
> pass the AT_SYMLINK_NOFOLLOW flag to disable LOOKUP_FOLLOW. In all other
> respects, this syscall is no different from fchmodat().
> 
> [...]

Tools updates usually go separately.
Flags argument ported to unsigned int; otherwise unchanged.

---

Applied to the master branch of the vfs/vfs.git tree.
Patches in the master branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: master

[1/5] Non-functional cleanup of a "__user * filename"
      https://git.kernel.org/vfs/vfs/c/0f05a6af6b7e
[2/5] fs: Add fchmodat2()
      https://git.kernel.org/vfs/vfs/c/8d593559ec09
[3/5] arch: Register fchmodat2, usually as syscall 452
      https://git.kernel.org/vfs/vfs/c/2ee63b04f206
[5/5] selftests: Add fchmodat2 selftest
      https://git.kernel.org/vfs/vfs/c/f175b92081ec
