From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha-2.6
Date: Thu, 14 Jan 2010 18:21:31 -0500
Message-ID: <b4198de61001141521t7fe8dfb9wb955f72450ca34aa@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:cc:content-type;
        bh=DDhPlfHC++h294uPngSgLhYCJEOlr/sw7T7eH6/Vs7k=;
        b=k4YM8M3Q2u2/n9EJiTRD0qLS5cQWIMMKXCC9vsGGJDMZFrx5K7nAvmIUUqhjTF25tD
         w+pLnpyuL0qIgpTRJyGwadJVOXQ3aRHOVAHYNT1Cl6sFpZbD2p6prWvHoxXb8hPuWjbs
         HX/MqpObM3CA4JQCGfxv1Qj7Yjv0J3idSySLI=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

Please pull the 'for-linus' branch from my tree. It contains the
cpumask_of_node() -1 fix and adds me as a maintainer so patches don't
miss me.

Thanks,
Matt Turner

The following changes since commit 61c39bb354a1f791ba6f562b766a72e508a036ee:
  Linus Torvalds (1):
        Merge branch 'for-linus' of git://git390.marist.edu/pub/scm/linux-2.6

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha-2.6.git for-linus

Anton Blanchard (1):
      alpha: cpumask_of_node() should handle -1 as a node

Matt Turner (1):
      alpha: add myself as a maintainer, and drop mention of 2.4

 MAINTAINERS                       |    3 +--
 arch/alpha/include/asm/topology.h |    3 +++
 2 files changed, 4 insertions(+), 2 deletions(-)
