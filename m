From: Michael Cree <mcree@orcon.net.nz>
Subject: Alpha no longer recognises certain partition tables (v2.6.38)
Date: Tue, 15 Mar 2011 22:06:25 +1300
Message-ID: <4D7F2C11.907@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-kernel@vger.kernel.org
Cc: linux-alpha@vger.kernel.org, warns@pre-sense.de, torvalds@linux-foundation.org

v2.6.38 boot reports it can't recognise the partition table on the 
system disk on my Alpha and panics when it can't find the root device.

It worked at v2.6.38-rc7.

While I haven't done a bisect to fully verify I nevertheless suggest the 
following patch as the likely cause:

1eafbfe Fix corrupted OSF partition table parsing

Cheers
Michael.
