From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/3] alpha: improvements of arch/alpha/lib/Makefile
Date: Sun, 11 Sep 2016 16:42:13 +0900
Message-ID: <1473579736-16139-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com u8B7gKsv025893
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1473579744;
        bh=8R3x9z2jfzeDe0UApzJ1b95aUd0kc1BV3AhgzYs3WJg=;
        h=From:To:Cc:Subject:Date:From;
        b=NazpViQX/cZz6Ct3bR+OovzctLAiQKaJTWVcU6jJ3G4Ey25ZdL8j/VRcsBu/YBZna
         b8pfh+J093aPPhGW69WlkfiAad05FvdX+unJRn5nNAPjlu0PyOkv/iQmThi46uW1Sc
         bZ4s8l5tMjMijesVjGkj08sozasHIfiIBS33hk8knO6gMAUpBzEjz40KFf+Xv+WqUj
         +2FpUwlcQyxE3ptUNwfrB9cpTwsmaateZ9ZdtqbAFtIGUG5NEMPA6/d1rjCtX7ajwR
         wER5fMvRfgPXMMG5HBn2+OQqN+0sUKjuMW7AZMR2dGV2ha6DpESQ8uOkl/cjxMyR43
         QQ5wSfirkB3pw==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Matt Turner <mattst88@gmail.com>

While building for Alpha architecture, I noticed ugly long log
for division routines.  So, I took a look at the Makefile.
Here is a series of build rule cleanups.


Masahiro Yamada (3):
  alpha: add $(src)/ rather than $(obj)/ to make source file path
  alpha: merge build rules of division routines
  alpha: make short build log available for division routines

 arch/alpha/lib/Makefile | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

-- 
1.9.1

