From: Richard Henderson <rth@twiddle.net>
Subject: [PATCH 2/3] alpha: Package string routines together
Date: Fri, 23 Jun 2017 14:20:00 -0700
Message-ID: <20170623212001.2785-3-rth@twiddle.net>
References: <20170623212001.2785-1-rth@twiddle.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VoafEY0Zyq5pzOyrUdqqsoFgkvqru1zfEnOKiqm+F2A=;
        b=S0Xm79i1ncTCADiP9RwomRrh4nOF78dmJXNI6acAUywNiRVZh08NdAe6zQNucp3j3S
         SDodYoQ6lfNlFaGQCC9UTSj9N9BQxSGRXajGtdzxMmLwvchMN/lpkreHnxaNhm4Jd6Kz
         3KHBJIXv47Pz1QPWHSnyFZ+dAvzOIs22DzT9XRbBnja1dF5z1qyvK9RPUOqpi8CknLBb
         mgxNw38AtmtCxQ3fNBHUrY04nAu7s+VY6qFn4e1tLb2WjTIyXTsm9JE4t0MQY0UQOLjl
         8S3uqaTJnnGMyz5Yqkc8vYWfSC40DrDOKtUclL8TL85v4ZrpD1tmcgNJeeN9DHqnY89X
         WJGw==
In-Reply-To: <20170623212001.2785-1-rth@twiddle.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-alpha@vger.kernel.org

There are direct branches between {str*cpy,str*cat} and stx*cpy.
Ensure the branches are within range by merging these objects.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 arch/alpha/lib/Makefile | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/alpha/lib/Makefile b/arch/alpha/lib/Makefile
index 7083434..a808159 100644
--- a/arch/alpha/lib/Makefile
+++ b/arch/alpha/lib/Makefile
@@ -20,12 +20,8 @@ lib-y =	__divqu.o __remqu.o __divlu.o __remlu.o \
 	checksum.o \
 	csum_partial_copy.o \
 	$(ev67-y)strlen.o \
-	$(ev67-y)strcat.o \
-	strcpy.o \
-	$(ev67-y)strncat.o \
-	strncpy.o \
-	$(ev6-y)stxcpy.o \
-	$(ev6-y)stxncpy.o \
+	stycpy.o \
+	styncpy.o \
 	$(ev67-y)strchr.o \
 	$(ev67-y)strrchr.o \
 	$(ev6-y)memchr.o \
@@ -49,3 +45,17 @@ AFLAGS___remlu.o =       -DREM -DINTSIZE
 $(addprefix $(obj)/,__divqu.o __remqu.o __divlu.o __remlu.o): \
 						$(src)/$(ev6-y)divide.S FORCE
 	$(call if_changed_rule,as_o_S)
+
+# There are direct branches between {str*cpy,str*cat} and stx*cpy.
+# Ensure the branches are within range by merging these objects.
+
+LDFLAGS_stycpy.o := -r
+LDFLAGS_styncpy.o := -r
+
+$(obj)/stycpy.o: $(obj)/strcpy.o $(obj)/$(ev67-y)strcat.o \
+		 $(obj)/$(ev6-y)stxcpy.o FORCE
+	$(call if_changed,ld)
+
+$(obj)/styncpy.o: $(obj)/strncpy.o $(obj)/$(ev67-y)strncat.o \
+		 $(obj)/$(ev6-y)stxncpy.o FORCE
+	$(call if_changed,ld)
-- 
2.9.4

