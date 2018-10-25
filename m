From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: [git pull] alpha syscall glue stuff
Date: Thu, 25 Oct 2018 01:15:06 +0100
Message-ID: <20181025001506.GC32577@ZenIV.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

	several old patches making alpha syscall glue a bit less mysterious.

The following changes since commit 5c60a7389d795e001c8748b458eb76e3a5b6008c:

  Merge tag 'for-linus-4.19-ofs1' of git://git.kernel.org/pub/scm/linux/kernel/git/hubcap/linux (2018-08-16 10:53:45 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.alpha

for you to fetch changes up to 8a68060cefa6db0e02600ac35deed0dc2fa6a68f:

  alpha: unify the glue for sigreturn-like syscalls (2018-08-16 21:03:35 -0400)

----------------------------------------------------------------
Al Viro (2):
      alpha: use alpha_ni_syscall only for syscall zero
      alpha: unify the glue for sigreturn-like syscalls

 arch/alpha/kernel/entry.S   |  53 ++++----
 arch/alpha/kernel/systbls.S | 318 ++++++++++++++++++++++----------------------
 2 files changed, 183 insertions(+), 188 deletions(-)
