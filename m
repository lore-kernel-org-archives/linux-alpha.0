From: Rick Altherr <kc8apf@kc8apf.net>
Subject: AS600/333 kernel problem
Date: Wed, 12 Jun 2002 23:48:53 -0400
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <3D081625.1000408@kc8apf.net>
References: <wrpvg8s5jyd.fsf@hina.wild-wind.fr.eu.org> <20020612000820.GF11833@gum01m.etpnet.phys.tue.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-alpha@vger.kernel.org

I'm rather new to Linux on Alphas.  I have Debian installed on my AS600 
and it works fine, but I needed some kernel options and tried to build a 
new one.  The build completes fine and aboot begins to boot, but after 
it detects my QLogic ISP1020 SCSI controllers it dumps what appears to 
be the CPU registers and halts.  I've been trying 2.4.17.  Is this a 
known issue?  Any ideas?
-- 
Thanks and 73s,
Rick Altherr
KC8APF
kc8apf@kc8apf.net

