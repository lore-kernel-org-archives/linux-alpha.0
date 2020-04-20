From: Nate Karstens <nate.karstens@garmin.com>
Subject: Implement close-on-fork
Date: Mon, 20 Apr 2020 02:15:44 -0500
Message-ID: <20200420071548.62112-1-nate.karstens@garmin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Obf8vJL6eB5UeU879i1Y2ZaUrwAqXiDjQeosQo0DGk0=;
 b=CU8fPaE/YUAdbdWZNiws63RKc4CHYrpnREhetAoYNuj88hjKb31Zgo4wug6abVk0ATDgU0K/WgcPkTIWwdC7LVF6cCeDRQkku1Uv08k4aXLPkjM/G8iFRe1lBiRSKVOGDS28kTsE6qRj0q8q7xEngOsqdnDnZSU8Ta7wkNv3rtiAUERKkd+8lr9JavZYo7YC22mHFqXKuS/QFUfq2Otc0PApoHuebMBteRW6dd8m1am8sOuMP9KmT1jM1yIKrercv/L63wvjGnSeHxdpIMxtr9qGIONXmAs/niGUo0GKb5GCP2S0IiYelHeijCgb18AAQ0v7J//lc/CmN/BwdXCyTw==
Sender: linux-parisc-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>, "J. Bruce Fields" <bfields@fieldses.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Changli Gao <xiaosuo@gmail.com>

Series of 4 patches to implement close-on-fork. Tests have been
published to https://github.com/nkarstens/ltp/tree/close-on-fork.

close-on-fork addresses race conditions in system(), which
(depending on the implementation) is non-atomic in that it
first calls a fork() and then an exec().

This functionality was approved by the Austin Common Standards
Revision Group for inclusion in the next revision of the POSIX
standard (see issue 1318 in the Austin Group Defect Tracker).

[PATCH 1/4] fs: Implement close-on-fork
[PATCH 2/4] fs: Add O_CLOFORK flag for open(2) and dup3(2)
[PATCH 3/4] fs: Add F_DUPFD_CLOFORK to fcntl(2)
[PATCH 4/4] net: Add SOCK_CLOFORK

