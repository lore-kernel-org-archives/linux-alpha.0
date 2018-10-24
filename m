From: Bob Tracy <rct@gherkin.frus.com>
Subject: vmlinux ld relocation errors on Alpha
Date: Wed, 24 Oct 2018 09:46:29 -0500
Message-ID: <20181024144629.GA6338@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: debian-alpha@lists.debian.org, linux-kernel@vger.kernel.org

Back in January of 2017, a patch set was created for the 4.9.0 kernel and
*hopefully* sent upstream to address the subject issue.  The patch
implemented a workaround: defining a new "alphalib" section for all the
Alpha-specific library functions to be linked into the final vmlinux.
The patch was definitely not implemented in a vacuum: Helge Deller and
Michael Cree suggested the fix approach, and both Maciej W. Rozycki and
Matt Turner provided significant input along the way.

At this late date, I was forced to resync my Alpha build tree with the
one from "kernel.org", and noticed the patch set never made it into
mainline.  There's a definite possibility it was never submitted
upstream, and a further possibility it was NACK'd for some reason.

Am currently attempting a native 4.19.0 build with an up-to-date debian
"sid" toolchain.  If the build succeeds, than the issue became OBE for
whatever reason.  Otherwise, it would be nice to know what happened to
the patch set.  Should know either way as far as the build in a few more
hours.

--Bob
