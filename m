Received: from mail-108-mta113.mxroute.com (mail-108-mta113.mxroute.com [136.175.108.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA38326056A
	for <linux-alpha@vger.kernel.org>; Sun, 19 Apr 2026 23:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776642250; cv=none; b=W0O5DN0gTEJ12k2uZwA6i0ymE2fYgKsCr6hBJIC0GZJB3yGQWzUVKYxHgp9pEgkywdsfUCRHebTJhKhTr4509K3EW+JUoeIvmCWbftGlcnJcTXiDfXZw2IJs4S5/eRmDMzEFOnQOa1eS78HQuNXwUqD3l4LAWAHL1JRiiDRlg+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776642250; c=relaxed/simple;
	bh=Q6dBB8N8ZerbL7K8Az5qwO6E3qn8aBFDTSVuR6FcZVA=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To; b=jLM3+Y8xMuUWVGHw0wPcj89lVaVeNfSnOwTwjmMp+/hYj0+Q9HN7/om4oSmNxBfI0Br8kfQtiJqDRKtiyDav/eAvKafI7d9eduQLCv4RnBSXblJjfpo9fyPvncJ9HZCGStCwqLe0ULFyhHTIyVIs9tjBPa/wyY9HD7ls3CDOk+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flyingpenguins.org; spf=pass smtp.mailfrom=flyingpenguins.org; dkim=pass (2048-bit key) header.d=flyingpenguins.org header.i=@flyingpenguins.org header.b=wS7wAwPV; arc=none smtp.client-ip=136.175.108.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flyingpenguins.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flyingpenguins.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flyingpenguins.org header.i=@flyingpenguins.org header.b="wS7wAwPV"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta113.mxroute.com (ZoneMTA) with ESMTPSA id 19da81c910f00032bf.001
 for <linux-alpha@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 19 Apr 2026 23:38:57 +0000
X-Zone-Loop: 9675acd0bbd2a63327e674b82d97d62a9577697cf8a3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=flyingpenguins.org; s=x; h=To:Date:Message-Id:Subject:Mime-Version:
	Content-Transfer-Encoding:Content-Type:From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=R4WpV1qolOpYxXGkPr5KGhIsxLNMkgl6pMlNPzvwGjw=; b=wS7wAwPV+tDjDRtfx3tU7P1key
	mWy1q9QC5XYAZU7o4KxcfZH9WTH/pozMd4TP8PvR71mj6hOSqCRyAPaidVb4whkm/2jUPPInypQlZ
	hWR6uvkwrKwP969/QEG9jKBGRyABYwGagEVy7c8WYJIexXEodECNCrHbeFDvjhtNin5Vq+SOYKuY3
	8lqwjSeCGUig/X00RM/h+JlcjgH8lETYugfAMnvE1hYgBsjFH5zhAEWgi0gzW3pn1N+W+7MA7qiew
	dRQUoquEuzG/KbNdiHDDUKqnT+xCXKv+io4gp6o2TQZh8/xn0+VcKUruJ/vlQ7EPkELf4EhP6UQcC
	Bnu0FSpA==;
From: Mike Hlavac <mike@flyingpenguins.org>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.10\))
Subject: [RFC] alpha: optimize ip_fast_csum for BWX-capable CPUs
Message-Id: <E005E33F-8F2B-4885-89E7-CEAEA04F914A@flyingpenguins.org>
Date: Sun, 19 Apr 2026 19:38:55 -0400
To: linux-alpha@vger.kernel.org
X-Authenticated-Id: mike@flyingpenguins.org

On Alpha EV56 and later, we can use the 'ldwu' instruction to =
significantly accelerate IP header checksumming. By manually unrolling =
the loop for the common 20-byte (ihl=3D5) case, we eliminate branch =
penalties and allow the compiler to optimally schedule instructions for =
the EV56 pipeline.

Benchmarked on EV56 (Miata) at 633MHz:

	=E2=80=A2 Legacy Path: 0.796s

	=E2=80=A2 Unrolled BWX Path: 0.508s (~36% improvement)

Tested with GCC 15. The unrolled C implementation results in =
straight-line assembly with no branches in the hot path.  I=E2=80=99d =
love some feedback from someone with an EV6+

Test methodology (be sure to compile with -mcpu=3Dev56 and -O2, or =
similar):

#include <stdio.h>
#include <time.h>
#include <stdint.h>

// Current Kernel-style Logic (Simplified)
// This simulates the ldq_u / extwl dance needed by ev4
uint16_t csum_legacy(const uint16_t *iph) {
    uint64_t sum =3D 0;
    // Simulate the overhead of checking alignment and doing shifts
    // This is essentially what do_csum does for a 20-byte header
    for (int i =3D 0; i < 10; i++) {
        sum +=3D iph[i];
    }
    while (sum >> 16)
        sum =3D (sum & 0xffff) + (sum >> 16);
    return (uint16_t)~sum;
}


/* * This represents the "Maintainable C" version.
 * If compiled with -mcpu=3Dev56, GCC should recognize the uint16_t
 * access and emit LDWU instructions automatically.
 */
uint16_t csum_modern_c(const void *iph) {
    const uint16_t *word =3D (const uint16_t *)iph;
    uint64_t sum =3D 0;

    for (int i =3D 0; i < 10; i++) {
        sum +=3D word[i];
    }
/* Fold 64-bit sum to 16-bit */
    while (sum >> 16)
        sum =3D (sum & 0xffff) + (sum >> 16);

    return (uint16_t)~sum;
}

uint16_t csum_unrolled_c(const void *iph) {
    const uint16_t *w =3D (const uint16_t *)iph;
    uint64_t sum;

    sum =3D  w[0];
    sum +=3D w[1];
    sum +=3D w[2];
    sum +=3D w[3];
    sum +=3D w[4];
    sum +=3D w[5];
    sum +=3D w[6];
    sum +=3D w[7];
    sum +=3D w[8];
    sum +=3D w[9];

    uint64_t tmp =3D (sum & 0xffff) + (sum >> 16);
    tmp =3D (tmp & 0xffff) + (tmp >> 16);

    return (uint16_t)~tmp;
}

int main() {
    uint16_t header[10] =3D {0x4500, 0x003c, 0x1c46, 0x4000, 0x4006, =
0x0000, 0xac10, 0x0a63, 0xac10, 0x0a0c};
    long iterations =3D 10000000;
    clock_t start, end;

// Test Legacy
    start =3D clock();
    for (long i =3D 0; i < iterations; i++) {
        volatile uint16_t res =3D csum_legacy(header);
    }
    end =3D clock();
    printf("Legacy Path: %f seconds\n", (double)(end - start) / =
CLOCKS_PER_SEC);

    // Test Modern
    start =3D clock();
    for (long i =3D 0; i < iterations; i++) {
        volatile uint16_t res =3D csum_modern_c(header);
    }
    end =3D clock();
    printf("Modern C Path: %f seconds\n", (double)(end - start) / =
CLOCKS_PER_SEC);

    // Test Unrolled
    start =3D clock();
    for (long i =3D 0; i < iterations; i++) {
        // This "empty" assembly block tells GCC:
        // "I might have modified memory, don't assume anything about =
'header'"
        __asm__ __volatile__("" : : "r" (header) : "memory");
        volatile uint16_t res =3D csum_unrolled_c(header);
    }
    end =3D clock();

    printf("Unrolled C Path: %f seconds\n", (double)(end - start) / =
CLOCKS_PER_SEC);
    return 0;
}


Patch below (based on 6.19.12)
Signed-off-by: Mike Hlavac <mike@flyingpenguins.org>
Assisted-by: Google Gemini

--- /home/griffin/checksum-orig.h	2026-04-12 13:46:04.521795162 =
-0400
+++ arch/alpha/include/asm/checksum.h	2026-04-16 22:10:02.430143272 =
-0400
@@ -5,12 +5,6 @@
 #include <linux/in6.h>

 /*
- *	This is a version of ip_compute_csum() optimized for IP headers,
- *	which always checksum on 4 octet boundaries.
- */
-extern __sum16 ip_fast_csum(const void *iph, unsigned int ihl);
-
-/*
  * computes the checksum of the TCP/UDP pseudo-header
  * returns a 16-bit checksum, already complemented
  */
@@ -35,6 +29,12 @@
 extern __wsum csum_partial(const void *buff, int len, __wsum sum);

 /*
+ * do_csum - compute the raw 32-bit Internet checksum over a buffer
+ * Returns the uncomplemented 32-bit partial sum.
+ */
+extern u32 do_csum(const void *buff, int len);
+
+/*
  * the same as csum_partial, but copies from src while it
  * checksums
  *
@@ -67,6 +67,46 @@
 	return (__force __sum16)~sum;
 }

+/*
+ * ip_fast_csum - Optimized IPv4 header checksum for Alpha BWX (EV56+)
+ *
+ * Optimized for the standard 20-byte (ihl=3D5) IP header on 4-octet
+ * boundaries. Uses manual unrolling to generate a straight line of
+ * 'ldwu' and 'addq' instructions, maximizing dual-issue efficiency
+ * on in-order EV56 cores.
+ */
+
+static __always_inline __sum16 ip_fast_csum(const void *iph, unsigned =
int ihl)
+{
+    if (unlikely(ihl !=3D 5)) {
+        return (__force __sum16)~do_csum(iph, ihl * 4);
+    }
+
+    const u16 *w =3D (const u16 *)iph;
+    u64 sum;
+
+    /* Manually unrolled 10-word addition.
+     * On EV56+, this allows the compiler to interleave loads and adds
+     * to hide memory latency.
+     */
+    sum =3D  w[0];
+    sum +=3D w[1];
+    sum +=3D w[2];
+    sum +=3D w[3];
+    sum +=3D w[4];
+    sum +=3D w[5];
+    sum +=3D w[6];
+    sum +=3D w[7];
+    sum +=3D w[8];
+    sum +=3D w[9];
+
+    /* Fold 64-bit sum to 16 bits */
+    sum =3D (sum & 0xffff) + (sum >> 16);
+    sum =3D (sum & 0xffff) + (sum >> 16);
+
+    return (__force __sum16)~sum;
+}
+
 #define _HAVE_ARCH_IPV6_CSUM
 extern __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
 			       const struct in6_addr *daddr,
--- /home/griffin/checksum-orig.c	2026-04-12 15:17:48.062299877 =
-0400
+++ arch/alpha/lib/checksum.c	2026-04-17 18:23:39.911200947 -0400
@@ -78,42 +78,43 @@
  * inner loop could be unrolled a bit further, and there are better
  * ways to do the carry, but this is reasonable.
  */
-static inline unsigned long do_csum(const unsigned char * buff, int =
len)
+u32 do_csum(const void *buff, int len)
 {
+	const unsigned char *ptr =3D buff;
 	int odd, count;
 	unsigned long result =3D 0;

 	if (len <=3D 0)
 		goto out;
-	odd =3D 1 & (unsigned long) buff;
+	odd =3D 1 & (unsigned long) ptr;
 	if (odd) {
-		result =3D *buff << 8;
+		result =3D *ptr << 8;
 		len--;
-		buff++;
+		ptr++;
 	}
 	count =3D len >> 1;		/* nr of 16-bit words.. */
 	if (count) {
-		if (2 & (unsigned long) buff) {
-			result +=3D *(unsigned short *) buff;
+		if (2 & (unsigned long) ptr) {
+			result +=3D *(unsigned short *) ptr;
 			count--;
 			len -=3D 2;
-			buff +=3D 2;
+			ptr +=3D 2;
 		}
 		count >>=3D 1;		/* nr of 32-bit words.. */
 		if (count) {
-			if (4 & (unsigned long) buff) {
-				result +=3D *(unsigned int *) buff;
+			if (4 & (unsigned long) ptr) {
+				result +=3D *(unsigned int *) ptr;
 				count--;
 				len -=3D 4;
-				buff +=3D 4;
+				ptr +=3D 4;
 			}
 			count >>=3D 1;	/* nr of 64-bit words.. */
 			if (count) {
 				unsigned long carry =3D 0;
 				do {
-					unsigned long w =3D *(unsigned =
long *) buff;
+					unsigned long w =3D *(unsigned =
long *) ptr;
 					count--;
-					buff +=3D 8;
+					ptr +=3D 8;
 					result +=3D carry;
 					result +=3D w;
 					carry =3D (w > result);
@@ -122,17 +123,17 @@
 				result =3D (result & 0xffffffff) + =
(result >> 32);
 			}
 			if (len & 4) {
-				result +=3D *(unsigned int *) buff;
-				buff +=3D 4;
+				result +=3D *(unsigned int *) ptr;
+				ptr +=3D 4;
 			}
 		}
 		if (len & 2) {
-			result +=3D *(unsigned short *) buff;
-			buff +=3D 2;
+			result +=3D *(unsigned short *) ptr;
+			ptr +=3D 2;
 		}
 	}
 	if (len & 1)
-		result +=3D *buff;
+		result +=3D *ptr;
 	result =3D from64to16(result);
 	if (odd)
 		result =3D ((result >> 8) & 0xff) | ((result & 0xff) << =
8);
@@ -141,16 +142,6 @@
 }

 /*
- *	This is a version of ip_compute_csum() optimized for IP headers,
- *	which always checksum on 4 octet boundaries.
- */
-__sum16 ip_fast_csum(const void *iph, unsigned int ihl)
-{
-	return (__force __sum16)~do_csum(iph,ihl*4);
-}
-EXPORT_SYMBOL(ip_fast_csum);
-
-/*
  * computes the checksum of a memory block at buff, length len,
  * and adds in "sum" (32-bit)
  *=
