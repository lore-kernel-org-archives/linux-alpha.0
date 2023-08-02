From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH] alpha: Replace one-element array with flexible-array member
Date: Wed, 2 Aug 2023 07:25:56 -0600
Message-ID: <ZMpZZBShlLqyD3ax@work>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690982692;
        bh=DDm1LEyHVrqgVPbORsJTPU+hVDJwprYsNNL9IHeL+5k=;
        h=Date:From:To:Cc:Subject:From;
        b=nWjglhibGmIAoJ0wRJHiguhdY/s9FGgXJNwpF0vJi9mJ8pofv2p7JYopQP/LkiAo2
         SrzWDgQqEqxd+zUR8u/m4gwZH4DMVKXhPwjATpsaMIbE/csJS8XoMj36otYrK9WRIZ
         qkcP3LbpzDOaGSitQOh2VAH/jqg5vdA9FTa1T49wj7DhBvRU4R9pG/WD/ME722baiR
         VjIJVMlWetVgQP/RUfMmdqwZtvoQx6CspYJwak8pPv9rAzbhxdlDfWtqR8eMKU/7cm
         Uc10RjfRmaThlihTV+AUKeNc6/c9NyFrzIGGSpUVo7Ij1DbCVdZbl8EWMeW342sz+c
         psQ4JFmi/JWiQ==
Content-Disposition: inline
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-hardening@vger.kernel.org

One-element and zero-length arrays are deprecated. So, replace
one-element array in struct osf_dirent with flexible-array
member.

This results in no differences in binary output.

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 arch/alpha/kernel/osf_sys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index d98701ee36c6..5db88b627439 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -97,7 +97,7 @@ struct osf_dirent {
 	unsigned int d_ino;
 	unsigned short d_reclen;
 	unsigned short d_namlen;
-	char d_name[1];
+	char d_name[];
 };
 
 struct osf_dirent_callback {
-- 
2.34.1

