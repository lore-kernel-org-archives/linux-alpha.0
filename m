From: Jay Maynard <jmaynard@conmicro.cx>
Subject: 2.4 kernels broken on Takara?
Date: Sun, 8 Feb 2004 10:39:09 -0600
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20040208103909.C25099@thebrain.conmicro.cx>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

I'm trying to install Gentoo on a Takara (PICMG 21164A/500). The only
installer I've found that will run is the Debian 3.0r2 CD, which has a
2.2.20 kernel on it. That's not new enough for Gentoo, which needs a 2.4 to
install. I've tried installing a Debian system, then a 2.4 kernel on top of
that - but 2.4.18 and 2.4.24 prebuilt generic kernels, as well as a 2.4.24
custom kernel built specifically for the Takara, all blow up with a kernel
paging error during startup, right after the PCI bridges are detected. The
2.2.20 kernel iinstalled by Debian runs fine.

What do I need to do to find this problem and fix it?
