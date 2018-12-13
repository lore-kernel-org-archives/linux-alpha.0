From: Michael Cree <mcree@orcon.net.nz>
Subject: Generic kernel fails to boot on Alpha bisected to b38d08f3181c
Date: Thu, 13 Dec 2018 21:26:12 +1300
Message-ID: <20181213082612.bi2dcd6uhzp3t6iq@tower>
Mime-Version: 1.0
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
Resent-Message-ID: <qwqgKCThK4E.A.puE.2ehEcB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20181213082612.bi2dcd6uhzp3t6iq@tower
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org, tj@kernel.org
Cc: linux-kernel@vger.kernel.org, debian-alpha@lists.debian.org

A kernel built for generic UP Alpha had been noted to fail to boot
for quite some time (since the release of 3.18).  The kernel either
locks up before printing any messages to the console or just falls
back into the SRM with a HALT instruction again before any messages
are printed to the console.  A work around is to either use a kernel
built for generic SMP or to build a machine specific kernel as these
boot correctly.

Because there were other compile errors at the time it proved
difficult to bisect, but we are continuing to get complaints about
it as it renders the Debian Alpha installer somewhat useless, so I
returned to trying to find the problem and managed to bisect it to:

commit b38d08f3181c5025a7ce84646494cc4748492a3b
Author: Tejun Heo <tj@kernel.org>
Date:   Tue Sep 2 14:46:02 2014 -0400

    percpu: restructure locking

Any suggestions as to what might be the problem and a fix?

Cheers,
Michael.

