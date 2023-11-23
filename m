Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="lYWXKbPN"
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B22010F9
	for <linux-alpha@vger.kernel.org>; Thu, 23 Nov 2023 10:03:17 -0800 (PST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BF77B416B6
	for <linux-alpha@vger.kernel.org>; Thu, 23 Nov 2023 18:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1700762583;
	bh=IZhERP1k0Mx/BUzQA+h6IX0Zi/l8fXxzweZfh/vGwZ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=lYWXKbPNj+RwTytJQXdXMPyYC2DRLFiD6KVRK4scNDJQ4XNohSSZoz/iHYuQIJbdq
	 3ujWe6R90GXOcFt4kAsjIhI/GknPSPEGuA9GuYbLMWuXkZpeAJt4E5mLJ/c16AUHPP
	 +Ky5LFAT5AyFoV9JVA//CiVvN1UPBcBdoM4ewULhKBase97S5fM92n8JGcj8s04J5Z
	 aPNBZcOZPex+N77wkaxauSYzKy+ztp/EOQ3Rj9iSS/CHa6tfQXeqrnS8T9tPrEYTmE
	 IxOr7n4AmdSOCMUzSQxjia3mjbdD8pxDth2P2I/Rw/q/Gaeew1yqWTAyGBubUKZWdI
	 6+Wr7IuLxOsUA==
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-40b29868c6eso5462675e9.3
        for <linux-alpha@vger.kernel.org>; Thu, 23 Nov 2023 10:03:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700762581; x=1701367381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZhERP1k0Mx/BUzQA+h6IX0Zi/l8fXxzweZfh/vGwZ8=;
        b=RaiULcV5+sXb4DuE4w0yZzuNqHHZjfObR43Dz+GRYpqcOGpPhwzcpN2GwRd1RqMu2c
         rxWWeh8+GprvimrefGSWihJ01Q4NfVry7GQWFaB3WjpyzZfnoJoPipGQ/Z4TMIqVVvRk
         rFfNI6UdelcC0nqXG0L7+b6xEUsUlSpyejc8fw6szVtlw/4hpD2vtORUyw4b7OLg+4NF
         jmr+SPrV+WsE4j9k33qHUHVcBFvElz5Zm+WnL4HopYVloPuT4WxIblcfkitmrfUEqAEu
         aGib1jYXBljCoyN0uNRrjw+bMG6Sc7VhC8XrxJheUyLsRkmRSfsdsqoEU30UT6Hu2VG1
         Dy8g==
X-Gm-Message-State: AOJu0YyL1khE2LiibKvoHRR0+BHI5B4N5pokUpR87voTlSWxul2+iejj
	EpHgocQsYfJKIMMOHDaxUlloW0TuZ7QMTve7CovkMdsOor50aylpAKJwt8Jv/xwqFWlCNyp5QuN
	dTD4RMogMhknUulxVPioPStuKUvhnMA8aPIANIjrW
X-Received: by 2002:a05:600c:3b87:b0:401:b2c7:34a8 with SMTP id n7-20020a05600c3b8700b00401b2c734a8mr269708wms.7.1700762581177;
        Thu, 23 Nov 2023 10:03:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGaRuyi+0akFvSjaF5Jn6MGpgnlz1tMo6K/RVM8k2sDbh9gA+jVmH6qtYWR9GxC0Qx5oSTDOQ==
X-Received: by 2002:a05:600c:3b87:b0:401:b2c7:34a8 with SMTP id n7-20020a05600c3b8700b00401b2c734a8mr269696wms.7.1700762580759;
        Thu, 23 Nov 2023 10:03:00 -0800 (PST)
Received: from localhost ([2001:67c:1560:8007::aac:c15c])
        by smtp.gmail.com with ESMTPSA id v11-20020a05600c444b00b0040b3867a297sm1026777wmn.36.2023.11.23.10.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:02:59 -0800 (PST)
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>
Cc: linux-alpha@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] alpha: remove a.out support from tools/objstrip
Date: Thu, 23 Nov 2023 18:02:41 +0000
Message-Id: <20231123180246.750674-2-dimitri.ledkov@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123180246.750674-1-dimitri.ledkov@canonical.com>
References: <20231123180246.750674-1-dimitri.ledkov@canonical.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As a.out support has been dropped from alpha port, drop a.out support
and make ELF support required.

Only performed a test build on x86 for native x86 and cross-compiled
for alpha.

Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
---
 arch/alpha/boot/tools/objstrip.c | 52 ++++----------------------------
 1 file changed, 6 insertions(+), 46 deletions(-)

diff --git a/arch/alpha/boot/tools/objstrip.c b/arch/alpha/boot/tools/objstrip.c
index 7cf92d172d..91c0ad29e1 100644
--- a/arch/alpha/boot/tools/objstrip.c
+++ b/arch/alpha/boot/tools/objstrip.c
@@ -21,17 +21,12 @@
 
 #include <sys/fcntl.h>
 #include <sys/stat.h>
-#include <sys/types.h>
-
-#include <linux/a.out.h>
-#include <linux/coff.h>
-#include <linux/param.h>
-#ifdef __ELF__
-# include <linux/elf.h>
-# define elfhdr elf64_hdr
-# define elf_phdr elf64_phdr
-# define elf_check_arch(x) ((x)->e_machine == EM_ALPHA)
-#endif
+
+#include <linux/elf.h>
+#define elfhdr elf64_hdr
+#define elf_phdr elf64_phdr
+#define elf_check_arch(x) ((x)->e_machine == EM_ALPHA)
+
 
 /* bootfile size must be multiple of BLOCK_SIZE: */
 #define BLOCK_SIZE	512
@@ -55,13 +50,10 @@ main (int argc, char *argv[])
     size_t nwritten, tocopy, n, mem_size, fil_size, pad = 0;
     int fd, ofd, i, j, verbose = 0, primary = 0;
     char buf[8192], *inname;
-    struct exec * aout;		/* includes file & aout header */
     long offset;
-#ifdef __ELF__
     struct elfhdr *elf;
     struct elf_phdr *elf_phdr;	/* program header */
     unsigned long long e_entry;
-#endif
 
     prog_name = argv[0];
 
@@ -145,7 +137,6 @@ main (int argc, char *argv[])
 	exit(1);
     }
 
-#ifdef __ELF__
     elf = (struct elfhdr *) buf;
 
     if (memcmp(&elf->e_ident[EI_MAG0], ELFMAG, SELFMAG) == 0) {
@@ -192,37 +183,6 @@ main (int argc, char *argv[])
 		    prog_name, (long) elf_phdr->p_vaddr,
 		    elf_phdr->p_vaddr + fil_size, offset);
 	}
-    } else
-#endif
-    {
-	aout = (struct exec *) buf;
-
-	if (!(aout->fh.f_flags & COFF_F_EXEC)) {
-	    fprintf(stderr, "%s: %s is not in executable format\n",
-		    prog_name, inname);
-	    exit(1);
-	}
-
-	if (aout->fh.f_opthdr != sizeof(aout->ah)) {
-	    fprintf(stderr, "%s: %s has unexpected optional header size\n",
-		    prog_name, inname);
-	    exit(1);
-	}
-
-	if (N_MAGIC(*aout) != OMAGIC) {
-	    fprintf(stderr, "%s: %s is not an OMAGIC file\n",
-		    prog_name, inname);
-	    exit(1);
-	}
-	offset = N_TXTOFF(*aout);
-	fil_size = aout->ah.tsize + aout->ah.dsize;
-	mem_size = fil_size + aout->ah.bsize;
-
-	if (verbose) {
-	    fprintf(stderr, "%s: extracting %#016lx-%#016lx (at %lx)\n",
-		    prog_name, aout->ah.text_start,
-		    aout->ah.text_start + fil_size, offset);
-	}
     }
 
     if (lseek(fd, offset, SEEK_SET) != offset) {
-- 
2.34.1

