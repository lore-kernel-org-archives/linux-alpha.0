From: Bob Tracy <rct@gherkin.frus.com>
Subject: fs/btrfs/ioctl.c: implicit declaration of function
 __put_user_unaligned
Date: Sat, 21 Sep 2013 10:04:28 -0500
Message-ID: <20130921150428.GA19343@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
Resent-Message-ID: <RyceA5EEoKN.A.KKG.bWbPSB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <http://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mcree@orcon.net.nz
Cc: debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

Seeing this on alpha also.  Kernel version 3.12.0-rc1.

Is a fix similar to what Geert submitted for m68k appropriate here?

See http://marc.info/?l=linux-arch&m=137820065929216&w=2 for the
details.

--Bob

