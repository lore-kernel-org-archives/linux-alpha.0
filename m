From: Bob Tracy <rct@gherkin.frus.com>
Subject: fdisk vs. BSD disklabels and slices
Date: Sun, 6 Jan 2019 16:31:35 -0600
Message-ID: <20190106223135.GA26510@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
Resent-Message-ID: <jntcquU4SeB.A.xx.ZHoMcB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20190106223135.GA26510@gherkin.frus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org
Cc: mcree@orcon.nz.net, mattst88@gmail.com

Has anyone reading this used a recent version of "fdisk" to create a BSD
disklabel and disk slices from scratch on an Alpha?  If so, would you
please describe the procedure in enough detail that relevant Linux
installation documentation could be updated?  It would seem to be anything
*but* intuitive :-(.

If "fdisk" is the wrong utility, I need a pointer to the correct one(s).
At this point, I'm seriously considering digging out my old Debian 4.0
CDs and harvesting the essential pieces.

As always, thanks in advance.

For what it's worth, the new Gentoo "install-alpha-minimal" image fixed
the "qla1280" firmware loading issue for the most part (a module reload
is required to get the firmware to load).

--Bob

