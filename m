From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 6/6] alpha: remove <asm/export.h>
Date: Sun, 20 Aug 2023 08:33:53 +0900
Message-ID: <20230819233353.3683813-6-masahiroy@kernel.org>
References: <20230819233353.3683813-1-masahiroy@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692488047;
        bh=94swkMMWtMWXwlQ0MRgkdCnBJXEwx0etvzk4fEwCRDY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JsMv3/rggBxUAEy32zChNAPBOEk124vJgtFdFlqmhzojWGUfnGlmH6Dv0D7biSBGU
         MfhY7jR5WQoXC7RaHkedup9FAPC3Yp/FcJYsRDRtWZhGUxs6VKkJA0GulpwgYdTqt1
         glqQGzkihFlP0v7PsYiLUsEts+9sl2NbYYXwox5Gkjfd3G5Yig9l6GhGhUegCmEEIM
         lULmSruHs4a9z5EMqm8m6WOK94P5TolXC9oIFJewviheEF6XiezAxgZtoNjWlVB8nh
         NjOk2dED6IoyJT748l7aOqXD7gaTRXbi95OD0Lzq5QdJERcYSkX3l4JMndODHH/SBt
         hs5iKuiYFfJPw==
In-Reply-To: <20230819233353.3683813-1-masahiroy@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kbuild@vger.kernel.org
Cc: linux-arch@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

All *.S files under arch/alpha/ have been converted to include
<linux/export.h> instead of <asm/export.h>.

Remove <asm/export.h>.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/alpha/include/asm/Kbuild | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/alpha/include/asm/Kbuild b/arch/alpha/include/asm/Kbuild
index dd31e97edae8..396caece6d6d 100644
--- a/arch/alpha/include/asm/Kbuild
+++ b/arch/alpha/include/asm/Kbuild
@@ -3,6 +3,5 @@
 generated-y += syscall_table.h
 generic-y += agp.h
 generic-y += asm-offsets.h
-generic-y += export.h
 generic-y += kvm_para.h
 generic-y += mcs_spinlock.h
-- 
2.39.2

