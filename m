From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha-2.6
Date: Fri, 18 Dec 2009 02:15:09 -0500
Message-ID: <b4198de60912172315w73223eh996d32c89ac807fd@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:cc:content-type;
        bh=VpdJiW7SB6UNeBBUeYJIyXNvmhIWwrcMkYKUWFatmOo=;
        b=vV6hoOJJsaH14MCI8++Q95ja84O++j8qkqH4KodD6DqucE8kMEGi5qba57Dx5Dv/lR
         n56WnNsFCHbUSLoyCF8+UaIxENiydsupVy17v43EACaTq0qJMexccXtZKnGwRdTTb8bg
         zjrWRIxx5fdujlz/UnENDYMMar8eCh0wEIJH0=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hi Linus,

Please pull the 'for-linus' branch from
ssh://master.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha-2.6.git
for-linus

It contains some catch-up work, adding missing syscalls and perf
support, along with the new unreachable() stuff.

Thanks,
Matt Turner

The following changes since commit 55639353a0035052d9ea6cfe4dde0ac7fcbb2c9f:
  Linus Torvalds (1):
        Linux 2.6.33-rc1

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha-2.6.git for-linus

Daniele Calore (1):
      alpha: Wire up missing/new syscalls

David Daney (1):
      alpha: Convert BUG() to use unreachable()

Michael Cree (1):
      alpha: Add minimal support for software performance events

 arch/alpha/Kconfig                  |    1 +
 arch/alpha/include/asm/bug.h        |    3 ++-
 arch/alpha/include/asm/perf_event.h |    9 +++++++++
 arch/alpha/include/asm/unistd.h     |   17 ++++++++++++++++-
 arch/alpha/kernel/systbls.S         |   16 +++++++++++++++-
 5 files changed, 43 insertions(+), 3 deletions(-)
 create mode 100644 arch/alpha/include/asm/perf_event.h
