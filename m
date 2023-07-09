From: xuanzhenggang001@208suo.com
Subject: [PATCH] alpha/boot/misc: prefer 'unsigned int' to bare use of
 'unsigned'
Date: Sun, 09 Jul 2023 22:12:06 +0800
Message-ID: <60256ab738fe281c1fb3ec72fba62c60@208suo.com>
References: <20230709141002.8229-1-denghuilong@cdjrlc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
        content-transfer-encoding:content-type:message-id:user-agent
        :references:in-reply-to:subject:to:from:date:mime-version; s=
        dkim; t=1688911927; x=1691503928; bh=Oqo/UICIck48szuiKPT9stvme+K
        S0oG33Dm89Cb0R5M=; b=ouCVcYW+dlaWJuZ4/JGQNmLInUVJNS52fCDxtVV2Igv
        eJXE4A2Yi8HNE/r6GV9DGmvnOlGgRE69cxsL98jfggra0GFlw4M2MwlXlroFFJRI
        PIHcMv8Qy6Pjrvmj1lFnFOrPnAm+2U43g1c1+RxdT52nvyi3WsC4SXgnGuuRaDBj
        coR9qRMjIdJVgQ1zx+p4xFHVyKT1uJeghwkWIUguPf3AHC1U7UGjWnaYxUb5Y5ed
        u0Hoh14oPl2Cdm/1iUGh3BNbEyo06V0q2wPJMBfFDnSOG+lQ3R2kLGSgIvpVOr5r
        YIIiD6xJf2fhEtRG1qlBdYoiKTtCRkCgWJ+2gzpaHpw==
In-Reply-To: <20230709141002.8229-1-denghuilong@cdjrlc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: richard.henderson@linaro.org, ink@jurassic.park.msu.ru
Cc: mattst88@gmail.com, viro@zeniv.linux.org.uk, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Fix the following warnings reported by checkpatch:

arch/alpha/boot/misc.c:48: WARNING: Prefer 'unsigned int' to bare use of 
'unsigned'
arch/alpha/boot/misc.c:49: WARNING: Prefer 'unsigned int' to bare use of 
'unsigned'
arch/alpha/boot/misc.c:50: WARNING: Prefer 'unsigned int' to bare use of 
'unsigned'
arch/alpha/boot/misc.c:124: WARNING: Prefer 'unsigned int' to bare use 
of 'unsigned'

Signed-off-by: Zhenggang Xuan <xuanzhenggang001@208suo.com>
---
  arch/alpha/boot/misc.c | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/boot/misc.c b/arch/alpha/boot/misc.c
index 1ab91852d9f7..7d3249972587 100644
--- a/arch/alpha/boot/misc.c
+++ b/arch/alpha/boot/misc.c
@@ -45,9 +45,9 @@ typedef unsigned long  ulg;
  static uch *inbuf;        /* input buffer */
  static uch *window;        /* Sliding window buffer */

-static unsigned insize;        /* valid bytes in inbuf */
-static unsigned inptr;        /* index of next byte to be processed in 
inbuf */
-static unsigned outcnt;        /* bytes in output buffer */
+static unsigned int insize;        /* valid bytes in inbuf */
+static unsigned int inptr;        /* index of next byte to be processed 
in inbuf */
+static unsigned int outcnt;        /* bytes in output buffer */

  /* gzip flag byte */
  #define ASCII_FLAG   0x01 /* bit 0 set: file probably ascii text */
@@ -121,7 +121,7 @@ int fill_inbuf(void)
  void flush_window(void)
  {
      ulg c = crc;
-    unsigned n;
+    unsigned int n;
      uch *in, *out, ch;

      in = window;
