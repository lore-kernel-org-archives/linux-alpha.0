From: Metod Kozelj <metod.kozelj@rzs-hm.si>
Subject: Re: AS500/266 trouble
Date: Tue, 16 Apr 2002 11:47:20 +0200 (CEST)
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.10.10204161141510.23589-100000@calvus.rzs-hm.si>
References: <20020415185306.F2345@nbkurt.etpnet.phys.tue.nl>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20020415185306.F2345@nbkurt.etpnet.phys.tue.nl>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kurt Garloff <garloff@suse.de>
Cc: Linux Alpha list <linux-alpha@vger.kernel.org>

Hello,

On Mon, 15 Apr 2002, Kurt Garloff wrote:

> (2) I can't get a 2.4.18 kernel to work:
>     The qlogicisp driver/hardware seems to trigger some weird machine check.

We have AlphaStation 600/333, also with QLogic ISP starting from SRM. 
A side note: we only use BSD partition scheme on one of disks, other use
the 'normal' PC partition scheme.

We've found out that 2.4.9 kernel is rock-solid on it:

$ uname -a
Linux alpha 2.4.9 #1 Mon Sep 10 16:36:25 CEST 2001 alpha unknown
$ uptime
 11:43am  up 55 days, 23:07, 14 users,  load average: 1.00, 1.18, 1.21

No newer kernels are able to pass the qlogic mess.

Peace!
  Mkx

---- perl -e 'print $i=pack(c5,(41*2),sqrt(7056),(unpack(c,H)-2),oct(115),10);'

