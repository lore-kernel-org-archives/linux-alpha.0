From: Nawab Ali <alin@ececs.uc.edu>
Subject: TLB reload code
Date: Thu, 15 Jan 2004 17:16:18 -0500 (EST)
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <Pine.GSO.4.43.0401151706290.10304-100000@gatekeeper.ececs.uc.edu>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

Hi,
I have a Digital Alphastation 600 running Debian woody. I need to modify
the TLB miss handler code. Basically everytime there is a TLB miss, I'm
trying to log the new PTE that is brought into the TLB.

Now I know that Alpha handles TLB misses in software (PALcode). My
question is where can I get the PALcode source for an Alpha (Alcor) and
how do I go about modifying its TLB miss handler??

Is it possible to modify the TLB miss handler(is there one??) in the linux
source code without mucking around with the PALcode??

Any help would be greatly appreciated.

Thanx.
nawab

