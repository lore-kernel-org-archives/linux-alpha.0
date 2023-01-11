From: Al Viro <viro@zeniv.linux.org.uk>
Subject: alpha/boot/misc: trim unused declarations
Date: Wed, 11 Jan 2023 20:44:25 +0000
Message-ID: <Y78fqZ8BqNWiJC/a@ZenIV>
References: <Y78fXnVzitfpX1Tm@ZenIV>
 <Y78fj4jXf5MtLU75@ZenIV>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=+FHbMOlIlsp5eH3GhFLAgB53zv/sJzBS5sCRMc8EflM=; b=h6ZYKv+4pC7upad7snxOSIuj8i
        tzEJNACMZNqgRjJBTfX0IdqH/VS0c6RmMd9CN0it94DByTFozoRVTMyPlPCrDkzhs2sGAT/SiFeWZ
        gtr5Edi4JIZM0nnwn4ddvk8W2ahWFakvHN3dW0S2Kvs2Gb1hxTYPAegeywkMeKFaIpIdp2/VLKScO
        bNqQ3H8vqur7ZxIcfhgmjbb2K6SBUIV7YvNfvNjbzItHSRn6WMT47OmrpG/CX0Wm5gpin6n68ChQj
        Pg0Pu8HeA1v3JbnGnG+FepfZw1fW5IiL4Ri/OfPSN3UhNaw5UDO/Mbs/8Hrp3pHTyvnYMV6U25P0t
        nlSBI6vQ==;
Content-Disposition: inline
In-Reply-To: <Y78fj4jXf5MtLU75@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

gzip_mark() and gzip_release() are gone; there used to be two
forward declarations of each and the patch removing those suckers
had left one of each behind...

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/alpha/boot/misc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/alpha/boot/misc.c b/arch/alpha/boot/misc.c
index 325d4dd4f904..1ab91852d9f7 100644
--- a/arch/alpha/boot/misc.c
+++ b/arch/alpha/boot/misc.c
@@ -89,8 +89,6 @@ static ulg output_ptr;
 static ulg bytes_out;
 
 static void error(char *m);
-static void gzip_mark(void **);
-static void gzip_release(void **);
 
 extern int end;
 static ulg free_mem_ptr;
-- 
2.30.2

