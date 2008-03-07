From: rct@frus.com (Bob Tracy)
Subject: [regression]2.6.25-rc4: boot panic on alpha
Date: Thu, 6 Mar 2008 21:41:55 -0600 (CST)
Message-ID: <20080307034155.A8C6EDBA2@gherkin.frus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932643AbYCGDmU@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: linux-alpha@vger.kernel.org

The regression is relative to 2.6.25-rc1 + timer fixes (added when
I reported the problems with 2.6.25-rc1 relative to 2.6.24).  I haven't
tried -rc2 or -rc3.

Might be related to similar reports I've seen, but wanted to add the
Alpha platform to the list.  The -rc4 kernel boots, but at some point
following initialization of the SCSI layer, there's a panic with enough
diagnostic output that a 50-line screen can't hold it all.  Unfortunately,
the system logging isn't active, so nothing gets captured.

The panic is completely reproducible.  The "Code" line at the bottom
of the panic output is

44220001 4821f621 4821b681 4821f62b f420004f 00000081 <0000009b> 0066c012

The first line of the "Trace" section is

 [<fffffc000031a41f>] iommu_arena_alloc+0x64/0xe0

Platform is an Alpha PWS 433au.  gcc is version 4.1.2 (Debian 4.1.1-21).

-- 
------------------------------------------------------------------------
Bob Tracy          |  "I was a beta tester for dirt.  They never did
rct@frus.com       |   get all the bugs out." - Steve McGrew on /.
------------------------------------------------------------------------
