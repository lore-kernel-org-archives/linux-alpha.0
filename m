Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="n6pn4AkV"
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F8AD0
	for <linux-alpha@vger.kernel.org>; Mon, 11 Dec 2023 22:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=YldHm0fXDz/zOibbSdTsP+0zoseMkiAWFMR6QD19hWc=; b=n6pn4AkVOmuOhQSbVIqvQlHYbr
	3wBb5i9NK6v3ZfJROilFz+MQtsd6T7fAa6ooruMr6FRBGeTU1WwFQq1xp0R9HLDjuZP3rqmSHlTLC
	xH/M3g0LwOqYcFEW8s4kKndCQPJbNlnpPkZ2Yg8YQvOdrfuwMC2rzLsDkL8crOUPumnQDJoY0Wbwn
	m4XsXxfaZARgp7gn1Ep54jMCCpH41Tv9nXHpd7PDneWdUCJDfxtd9qdK0FJ2y/IfaKuQSpE5dZcN9
	er3aD83M4/ecQQQsKraLyzXT9Kw1WebskQt9+3Nm/1Z2pMTcuqBf8MfxKW505FX2nn5wqGSe1R1yd
	TkGcZgSA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rCwfw-00B99F-26
	for linux-alpha@vger.kernel.org;
	Tue, 12 Dec 2023 06:55:28 +0000
Date: Tue, 12 Dec 2023 06:55:28 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-alpha@vger.kernel.org
Subject: [PATCH] alpha: fix modversions for strcpy() et.al.
Message-ID: <20231212065528.GH1674809@ZenIV>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Al Viro <viro@ftp.linux.org.uk>

	On alpha str{n,}{cpy,cat}() implementations are playing
fun games with shared chunks of code.  The problem is, they are
using direct branches and need to be next to each other.
	Currently it's done by building them in separate object
files, then using ld -r to link those together.  Unfortunately,
genksyms machinery has no idea what to do with that - we have
#SYMVER strcat <...>
generated in arch/alpha/lib/.strcat.S.cmd, but there's nothing
to propagate that into .stycpy.S.cmd, so modpost doesn't find
anything for those symbols, resulting in
WARNING: modpost: EXPORT symbol "strcpy" [vmlinux] version generation failed, symbol will not be versioned.
Is "strcpy" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "strcat" [vmlinux] version generation failed, symbol will not be versioned.
Is "strcat" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "strncpy" [vmlinux] version generation failed, symbol will not be versioned.
Is "strncpy" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "strncat" [vmlinux] version generation failed, symbol will not be versioned.
Is "strncat" prototyped in <asm/asm-prototypes.h>?
spew on modversion-enabled builds (all 4 functions in question
are in fact prototyped in asm-prototypes.h)

	Fixing doesn't require messing with kbuild, thankfully -
just build one object (i.e. have sty{n,}cpy.S with includes of relevant
*.S instead of playing with ld -r) and that's it.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
diff --git a/arch/alpha/lib/Makefile b/arch/alpha/lib/Makefile
index 1cc74f7b50ef..8f1c32a25a40 100644
--- a/arch/alpha/lib/Makefile
+++ b/arch/alpha/lib/Makefile
@@ -45,17 +45,3 @@ AFLAGS___remlu.o =       -DREM -DINTSIZE
 $(addprefix $(obj)/,__divqu.o __remqu.o __divlu.o __remlu.o): \
 						$(src)/$(ev6-y)divide.S FORCE
 	$(call if_changed_rule,as_o_S)
-
-# There are direct branches between {str*cpy,str*cat} and stx*cpy.
-# Ensure the branches are within range by merging these objects.
-
-LDFLAGS_stycpy.o := -r
-LDFLAGS_styncpy.o := -r
-
-$(obj)/stycpy.o: $(obj)/strcpy.o $(obj)/$(ev67-y)strcat.o \
-		 $(obj)/$(ev6-y)stxcpy.o FORCE
-	$(call if_changed,ld)
-
-$(obj)/styncpy.o: $(obj)/strncpy.o $(obj)/$(ev67-y)strncat.o \
-		 $(obj)/$(ev6-y)stxncpy.o FORCE
-	$(call if_changed,ld)
diff --git a/arch/alpha/lib/stycpy.S b/arch/alpha/lib/stycpy.S
new file mode 100644
index 000000000000..32ecd9c5f90d
--- /dev/null
+++ b/arch/alpha/lib/stycpy.S
@@ -0,0 +1,11 @@
+#include "strcpy.S"
+#ifdef CONFIG_ALPHA_EV67
+#include "ev67-strcat.S"
+#else
+#include "strcat.S"
+#endif
+#ifdef CONFIG_ALPHA_EV6
+#include "ev6-stxcpy.S"
+#else
+#include "stxcpy.S"
+#endif
diff --git a/arch/alpha/lib/styncpy.S b/arch/alpha/lib/styncpy.S
new file mode 100644
index 000000000000..72fc2754eb57
--- /dev/null
+++ b/arch/alpha/lib/styncpy.S
@@ -0,0 +1,11 @@
+#include "strncpy.S"
+#ifdef CONFIG_ALPHA_EV67
+#include "ev67-strncat.S"
+#else
+#include "strncat.S"
+#endif
+#ifdef CONFIG_ALPHA_EV6
+#include "ev6-stxncpy.S"
+#else
+#include "stxncpy.S"
+#endif
