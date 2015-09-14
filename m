From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH 0/2] alpha: fix build failure
Date: Mon, 14 Sep 2015 17:19:27 +0530
Message-ID: <1442231369-27118-1-git-send-email-sudipm.mukherjee@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=fqXNta82eyPGVn0Bi+HJ2q3/uTX+pYIjUSJZGbv7zlw=;
        b=STzvjuIUztyxgjLxODowFIseq31ZLAdM9ktrdTBsrbWGnQEUjbVgMVBZ3IDM1twQ3Z
         q6lMals1M9JjrXtAdYaDAaymnIqSRpDPuvhZonejs+3mJtCNwfQ2nfgB5vaqSDqbPEiG
         IDoP8pmdUN8LTcw9C7hVYCp4q42YRdeiXyh73M10fX14n179PLxpsmM4Pq2px2aKV5h+
         iLM0GqdUphYtzv098GLlAnkhlykQRCyvcSEm4gtEnMIsF2gzKXAGqFxWWR9aAcq7nDVX
         jnI04Pp1MxTq4HpRI5S20ARUbGPwchATzL3iKrIHjd/urZnxmUYX+RoLRGo5F+JKpdff
         yi3Q==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-alpha@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>

We were getting build failure on allmodconfig. Mainly two causes
ioremap_uc was not defined and __delay was not exported.

regards
sudip

Sudip Mukherjee (2):
  alpha: io: define ioremap_uc
  alpha: lib: export __delay

 arch/alpha/include/asm/io.h | 4 +++-
 arch/alpha/lib/udelay.c     | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
1.9.1

