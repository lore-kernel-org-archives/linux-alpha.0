Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7CC395DAA
	for <linux-alpha@vger.kernel.org>; Mon,  3 Aug 2026 23:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785800453; cv=none; b=nr/V02SNSk12t3lD8fNIbpMknmOTYqpVjJAGnMIqgJkOlWKvlNdI87Rest4tt91NN6fMuHXmGqZCSs8tyZXc50YtJ++BEdtF8XwCRTGZW/tOx7Bq7ajZyKu1a5xdz232ZxDdj4Onj40w0vy0ON91Y7F4TRkfANQUKI/hiXrgfU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785800453; c=relaxed/simple;
	bh=YZg1odxiWek0UxsP57a8f13DBqPUmymS1YIGamKZW+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sa3RMqxvc+GQgw/A83JNzTHnUsr7NzZ4xusXlhTDyM7xhy4y4Ad3CHEuAbaFgpZnBpSwrvKNJwff/MxZLnnQhuh/UvyrtacQOrqp6+opxJTPWK1mjzC0neXsSNnKqwdmU/OPWFOHveGlIAGcuxNAfsUUOL1nX5cI3rRMQCNGqmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B06zjzZI; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B06zjzZI"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-664db84f074so5755755d50.0
        for <linux-alpha@vger.kernel.org>; Mon, 03 Aug 2026 16:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785800449; x=1786405249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iXt2lHl6V6DYOxKrsChpRVwvJNwCDOvF3knLtupIoSg=;
        b=B06zjzZIb4DrxrL4KvqLlHDn9RGSsjwqhOhkwKhmOUr9TLQKClY+YqrK7vqY70jjEJ
         PwgsgeL7uh2DbOLRXvkOgG1AwXVmafNqOf7G1692yDq4+UHUuOeNnisRffLMVcmfE6QC
         LLGxOaqZUWJDebuW0nkJKWitu7udF1/8aPzTjtBPkCbymJ/Hxp1FEOumvUBBj/OE8dOT
         u/2iwVKLoECCOPnyy0E+vV8pKFBdbGJnhreHvqGYuX0BFucddECVDaCwsyw2z6oobVsu
         lNn/1muTrj3YbiRuvVBLIm9IkZIqAH+VHQ3PBfvD9oW7FU3LvpIBG4t0xbZl6UpNtexw
         CVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785800449; x=1786405249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iXt2lHl6V6DYOxKrsChpRVwvJNwCDOvF3knLtupIoSg=;
        b=kL37anZhdboOrfjeksM2PJXmTDJ2aAGaz/nQSUeQEufKhY1O3ElAMGwNF/kqRPZqlF
         T0LKsF4vPRPhDhbq/EvBpk8uA46A3UMlEcqHafsgjtCl04avnswmrWY+YyQP31S/NdPS
         WewMJ+GNmjGRiP9eTiNyJDJ9Tffq9U5TdCkBtTw5jswFPhKfPubMivkUX97rV1nJLNyx
         58ttAXTH74h2IlkX1yDTnW3X4OXAEQCFqzG/mGZfr5od1pUw6p6L1ABoNCNI7hRXbL8i
         ZzA5Gc+Dip+35c5h/Rsrkxrl3Id3TZEWn4fW7W5/VjpGtztcZxfWXpwCGuZNIHSoIROD
         d/4g==
X-Gm-Message-State: AOJu0YzBf3/W1Ca0F07B3IdzY5WC5+EdEYZ82E84cyKO4mZxX2d4k+y/
	jN/cwChICXaYI0hBTHaz3BxxyU8A1pTY9RTVUc57O8x2GnX6hodix95xh+1o4xfOF/0=
X-Gm-Gg: AR+sD13S5GnFX7vo+xW+ycGUI+lNcpqGmB+5UYHOwummtwA4K3wH3oK0V92dOcj/Go3
	4+65jFYFZ3sxCx2jOz+eJCthhJeLkv5YxJlJlYM7sfw/98A03DoYrMktA5nB0P0/uLPqBNauGef
	3ZDbxbJgnqOu6Dbh12wZbMrP7yBeKFTYC8RXM79CGztXIu4DLcVi6JWlZqHvCWUlOWhOyOJCvXy
	RksxwMUzjwulDplb2NznqxMhX5NvnZp7yBbEhjRe26PSxcGSQi66SNAsS3rgVt2KdxpxwcrVSsy
	ntyxnPrO0TUGb6f1o01+xVVwUpCrIuD7UNJxS4vdYI1t9RbANpL7zKWJ969xravQTNLrSlBnHmP
	ZEriUncS0/6HgfJTXRPu7XlwzT9zl+oCVH6GI3Qzarz8XVzWdsVlkZyyXXqV71pNSyTM5YpyB+h
	5iCRrOSPTu8RWVUpJ52e/WRaVhOS+Kiu6KwISSL9cd2yFsz7r238iI5QGT7CWveyUGdfHZ2c4=
X-Received: by 2002:a05:690e:480a:b0:668:8f89:762 with SMTP id 956f58d0204a3-6694efd03bamr9722268d50.1.1785800449430;
        Mon, 03 Aug 2026 16:40:49 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66948b98babsm6681712d50.0.2026.08.03.16.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 16:40:48 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 03 Aug 2026 19:40:45 -0400
Subject: [PATCH 1/3] alpha: fix ieee_swcr_to_fpcr setting FPCR_DNOD
 unconditionally
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-alpha-fp-exceptions-v1-1-c99d75608e60@gmail.com>
References: <20260803-alpha-fp-exceptions-v1-0-c99d75608e60@gmail.com>
In-Reply-To: <20260803-alpha-fp-exceptions-v1-0-c99d75608e60@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-sh@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

ieee_swcr_to_fpcr() converts the software IEEE trap-enable and status
bits kept in thread_info.ieee_state into the hardware FPCR format.  It
contained:

	fp |= (~sw & IEEE_TRAP_ENABLE_DNO) << 41;

FPCR_DNOD (bit 47) disables denormal operand traps: with it set the
hardware handles a denormal operand itself, treating it as zero, instead
of trapping for software completion.  The intent was to set DNOD when the
user has not asked for SIGFPE on denormal operands, but
IEEE_TRAP_ENABLE_DNO is clear by default, so ieee_swcr_to_fpcr(0) always
set DNOD.

Instructions built with the software completion suffix therefore never
trapped on a denormal operand.  The hardware silently substituted zero
and produced wrong results, affecting every program compiled with -mieee
and default FPU settings, glibc included.

Set FPCR_DNOD only when IEEE_MAP_DMZ is requested, which is exactly the
case where flushing denormal inputs to zero is what the user asked for.
DNOD then encodes MAP_DMZ, which ieee_fpcr_to_swcr() already recovers
from FPCR_DNZ, so drop its attempt to recover IEEE_TRAP_ENABLE_DNO from
DNOD; the DNO trap enable lives solely in ieee_state.

Both functions are in a uapi header, so the encoding change is visible to
userspace, but nothing outside the kernel is known to depend on DNOD
carrying the DNO trap enable, and the kernel is the only writer of the
FPCR.

This must not be backported on its own.  Re-enabling denormal operand
traps exposes a second bug, fixed in the following patch: those traps
usually find an exact result, and for an exact result the emulator did
not write the FPCR back, leaving hardware-fabricated exception bits
visible to user space.  Taken alone this change would make spurious
exception flags more common.

The bug predates the git history, so there is no commit to reference in a
Fixes tag.

Cc: stable@vger.kernel.org # 5.15+
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/uapi/asm/fpu.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/include/uapi/asm/fpu.h b/arch/alpha/include/uapi/asm/fpu.h
index cea9eafa056f..d28dc36786e2 100644
--- a/arch/alpha/include/uapi/asm/fpu.h
+++ b/arch/alpha/include/uapi/asm/fpu.h
@@ -101,7 +101,12 @@ ieee_swcr_to_fpcr(unsigned long sw)
 		      | IEEE_TRAP_ENABLE_OVF)) << 48;
 	fp |= (~sw & (IEEE_TRAP_ENABLE_UNF | IEEE_TRAP_ENABLE_INE)) << 57;
 	fp |= (sw & IEEE_MAP_UMZ ? FPCR_UNDZ | FPCR_UNFD : 0);
-	fp |= (~sw & IEEE_TRAP_ENABLE_DNO) << 41;
+	/*
+	 * Disable denormal operand traps only when denormal inputs are to be
+	 * flushed to zero.  Otherwise they must keep trapping, so that /S
+	 * instructions reach the kernel emulation handler.
+	 */
+	fp |= (sw & IEEE_MAP_DMZ ? FPCR_DNOD : 0);
 	return fp;
 }
 
@@ -116,7 +121,6 @@ ieee_fpcr_to_swcr(unsigned long fp)
 			     | IEEE_TRAP_ENABLE_OVF);
 	sw |= (~fp >> 57) & (IEEE_TRAP_ENABLE_UNF | IEEE_TRAP_ENABLE_INE);
 	sw |= (fp >> 47) & IEEE_MAP_UMZ;
-	sw |= (~fp >> 41) & IEEE_TRAP_ENABLE_DNO;
 	return sw;
 }
 

-- 
2.54.0

