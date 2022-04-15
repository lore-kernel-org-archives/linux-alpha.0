From: Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH 7/7] alpha: remove unused __SLOW_DOWN_IO and SLOW_DOWN_IO definitions
Date: Fri, 15 Apr 2022 14:08:17 -0500
Message-ID: <20220415190817.842864-8-helgaas@kernel.org>
References: <20220415190817.842864-1-helgaas@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-sh-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650049724;
        bh=dvZpqVTi0jdBV+n0QdZhgd89O8shNTR194n0OIslFEI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Vo9SN5UB5HN+TQ8PDoWan0KcngRkeZPACjXnATfZw2QPo8YV8IFEsKTgTqaUHb4Wq
         buYSTHLuV8dWUQ+yssZu4Cu0uOcBv0mjwVsDVHIh1maofvqLvYAAAy1RVEFK9yCXo+
         dPGdBtMn+DALp8LeFcJxFbSsAfDVa+Yze68PW2g0l28eXMzTI2kK5VoUBifIrHOtwZ
         1WOf86Z5OYIWDhVv4bhoKtsirQ9OaUxjNMN4e/90dC6L7vUMwinM6ndR4799Tqlo2s
         Geiv9PhbOsZgFOoijb1U7+dWqsYEaovac2mSFv5v7ZmqCiWLmIaVi+7wvIiA7CI4f6
         lLjJ23uF8IhFQ==
In-Reply-To: <20220415190817.842864-1-helgaas@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, Chas Williams <3chas3@gmail.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>

From: Bjorn Helgaas <bhelgaas@google.com>

Remove unused __SLOW_DOWN_IO and SLOW_DOWN_IO definitions.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 arch/alpha/include/asm/io.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index c9cb554fbe54..338dd24400bd 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -14,10 +14,6 @@
    the implementation we have here matches that interface.  */
 #include <asm-generic/iomap.h>
 
-/* We don't use IO slowdowns on the Alpha, but.. */
-#define __SLOW_DOWN_IO	do { } while (0)
-#define SLOW_DOWN_IO	do { } while (0)
-
 /*
  * Virtual -> physical identity mapping starts at this offset
  */
-- 
2.25.1

