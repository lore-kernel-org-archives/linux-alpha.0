Received: from mail-108-mta251.mxroute.com (mail-108-mta251.mxroute.com [136.175.108.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E8E39183C
	for <linux-alpha@vger.kernel.org>; Fri, 15 May 2026 20:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778876641; cv=none; b=ATcOyU2xQx2J4PxvLHrytozWo/cuI7wNDF8Fims6Jv+KbwKskOe5Q+owYfSXPaRNK79Sb4VFj06X9vkhXqgfayqvTTL7XjsJOi3xaou6sP63goFlTsbLrto4BQuwKp2nNCNsApjNof7lJSrsaKjQVgdgx7DGltOQM1x8B0KRxdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778876641; c=relaxed/simple;
	bh=+UlrDE3xZGI/XeFoXmI+y2HdUCNCWuidXYS2IYBrObQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PZVPRm3nIx8gpNqp7zFumf2xL60hQ4rAThxpTeKO8m5wS+wT/fgwUTjfQVAdRhUpc21/1gCsUmAMRfTELHXq/Gu24MQvkwI9i8mJ5ZDOEPN6Esa4FRZyHQK6eNyQpNGxMnaEpguzGqc4eU5yrQZtgEmPPLOghIYQRhnu/RjWk90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flyingpenguins.org; spf=pass smtp.mailfrom=flyingpenguins.org; dkim=pass (2048-bit key) header.d=flyingpenguins.org header.i=@flyingpenguins.org header.b=ioB6DX3z; arc=none smtp.client-ip=136.175.108.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flyingpenguins.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flyingpenguins.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flyingpenguins.org header.i=@flyingpenguins.org header.b="ioB6DX3z"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta251.mxroute.com (ZoneMTA) with ESMTPSA id 19e2d4a98aa00067f7.002
 for <linux-alpha@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 15 May 2026 20:18:44 +0000
X-Zone-Loop: c27cc625d7fffefede3f47a2859bab79afdaa1d18865
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=flyingpenguins.org; s=x; h=To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1FDgRPoVQMQ3Nb/mYal2hDDUeHc3K6v3vKNZHP1hcnU=; b=ioB6DX3zfeBs+ARemo5LnypulI
	X+KHk4wNnZZh4Zm7PXTZvoCGPfMiALIJXKSUtwF7dQnElu712gic6Cqk5R9MH/V4JwxunLEuONFFF
	YMLsG156KY/22o1KSnkwRpgtekcIuX9KOk9FR+NXPthd4nAUIuGboXB6iYWNHXU1Xe0r7vRmjiGn9
	mHU9W0J0ZyZWgbBPWdMWCuRQ0+Iv/vSaJL97en2KFTFybbtHsv8p/PZpaGMfrW5IG6dZJOrJypWJ8
	npPW0oRC0L4/vINtqvQ9WYIiQyh4xHQTWyVXhZVIwFBuQrMv9VHCmNj6x4nfyNHSkiaHfiasty7ba
	9ReJdFiA==;
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.10\))
Subject: Re: [RFC] alpha: optimize ip_fast_csum for BWX-capable CPUs
From: Mike Hlavac <mike@flyingpenguins.org>
In-Reply-To: <CA+=Fv5RaTrRkjzsWgoE1hJ+nBmTzV19Ps2Wuzn1z9EKnDmN8Tw@mail.gmail.com>
Date: Fri, 15 May 2026 16:18:41 -0400
Cc: linux-alpha@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <5249DDD2-6962-475D-880A-E3D6C57E97DD@flyingpenguins.org>
References: <E005E33F-8F2B-4885-89E7-CEAEA04F914A@flyingpenguins.org>
 <CA+=Fv5RaTrRkjzsWgoE1hJ+nBmTzV19Ps2Wuzn1z9EKnDmN8Tw@mail.gmail.com>
To: Magnus Lindholm <linmag7@gmail.com>
X-Authenticated-Id: mike@flyingpenguins.org



> On Apr 23, 2026, at 5:30 AM, Magnus Lindholm <linmag7@gmail.com> =
wrote:
>=20
> On Mon, Apr 20, 2026 at 1:44=E2=80=AFAM Mike Hlavac =
<mike@flyingpenguins.org> wrote:
>>=20
>> On Alpha EV56 and later, we can use the 'ldwu' instruction to =
significantly accelerate IP header checksumming. By manually unrolling =
the loop for the common 20-byte (ihl=3D5) case, we eliminate branch =
penalties and allow the compiler to optimally schedule instructions for =
the EV56 pipeline.
>>=20
>> Benchmarked on EV56 (Miata) at 633MHz:
>>=20
>>        =E2=80=A2 Legacy Path: 0.796s
>>=20
>>        =E2=80=A2 Unrolled BWX Path: 0.508s (~36% improvement)
>>=20
>> Tested with GCC 15. The unrolled C implementation results in =
straight-line assembly with no branches in the hot path.  I=E2=80=99d =
love some feedback from someone with an EV6+
>>=20
>=20
> Mike,
>=20
> Thanks for working on this.  I tested the benchmark here with GCC
> 15.2.1 at -O2 on several CPU targets.  There does seem to be a real
> optimization opportunity, but I do not think this patch is the right
> shape yet.
>=20
> Results here (EV67 833 MHz system) were roughly:
>=20
>  ev4:  legacy ~0.365s, modern ~0.83s,  unrolled ~0.230s
>  ev5:  legacy ~0.394s, modern ~0.716s, unrolled ~0.230s
>  ev56: legacy ~0.304s, modern ~0.304s, unrolled ~0.171s
>  ev6:  legacy ~0.314s, modern ~0.313s, unrolled ~0.177s
>=20
> The measured win comes from the manually unrolled ihl=3D=3D5 case =
becoming
> straight-line code with no inner loop branch, not from the "modern C"
> rewrite by itself.  On ev56/ev6, the looped legacy and looped modern-C
> variants compile to essentially the same code, while on ev4/ev5 the
> plain uint16_t loop is actually much worse than legacy.
>=20
> One caveat is that the benchmark repeatedly checksums the same small
> static header, so it mainly measures code shape with hot data.  That
> is useful, but it does not say much by itself about the end-to-end
> gain on real traffic. Touching old and stable code is alway a risk to
> introduce new problems.
>=20
> I also think the interface change is a problem.  Today Alpha has an
> out-of-line ip_fast_csum() symbol.  This patch turns it into a header
> inline and makes the fallback path call do_csum(), but do_csum() is
> not exported, which looks wrong for modules.
>=20
> The optimization itself does not seem out of line; other archs also
> treat ip_fast_csum() as a specialized IPv4-header routine.  What
> would seem safer here would be to keep the Alpha-specific fast path
> behind the existing ip_fast_csum() implementation, with the current
> checksum code as the fallback for larger ihl values and non-BWX
> friendly builds.
>=20
> Thanks,
> Magnus

Magnus,

Thanks for the feedback.   I=E2=80=99ve re-worked the patch and =
micro-benchmark based on your comments.   The benchmark has more =
overhead from the XOR operations, but it gives a different view of the =
same picture with a non-static header.

Benchmark results on my machine (updated version):

Legacy Path: 2.648437 seconds
Unrolled C Path: 2.429688 seconds

Updated benchmark:

#include <stdio.h>
#include <time.h>
#include <stdint.h>

//generate more randomized header values
static inline uint32_t xorshift32(uint32_t *state)
{
    uint32_t x =3D *state;
    x ^=3D x << 13;
    x ^=3D x >> 17;
    x ^=3D x << 5;
    return *state =3D x;
}

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
   uint16_t header2[10] =3D {0x4500, 0x003c, 0x1c46, 0x4000, 0x4006, =
0x0000, 0xac10, 0x0a63, 0xac10, 0x0a0c};
   long iterations =3D 10000000;
   uint32_t rng_state =3D 0x12345678;
   clock_t start, end;

// Test Legacy
   start =3D clock();
   for (long i =3D 0; i < iterations; i++) {
       for (int j =3D 0; j < 10; j++)
           header[j] ^=3D (uint16_t)xorshift32(&rng_state);
       volatile uint16_t res =3D csum_legacy(header);
   }
   end =3D clock();
   printf("Legacy Path: %f seconds\n", (double)(end - start) / =
CLOCKS_PER_SEC);

   rng_state =3D 0x12345678;

   // Test Unrolled
   start =3D clock();
   for (long i =3D 0; i < iterations; i++) {
       for (int j =3D 0; j < 10; j++)
           header2[j] ^=3D (uint16_t)xorshift32(&rng_state);
       volatile uint16_t res =3D csum_unrolled_c(header2);
   }
   end =3D clock();

   printf("Unrolled C Path: %f seconds\n", (double)(end - start) / =
CLOCKS_PER_SEC);
   return 0;
}

Updated patch:

Signed-off-by: Mike Hlavac <mike@flyingpenguins.org>
Assisted-by: Google Gemini

--- /home/griffin/kernel-hacking/checksum/checksum-orig.c	=
2026-04-12 15:17:48.062299877 -0400
+++ arch/alpha/lib/checksum.c	2026-05-13 02:41:15.379142990 -0400
@@ -16,6 +16,7 @@

 #include <asm/byteorder.h>
 #include <asm/checksum.h>
+#include <asm/special_insns.h>

 static inline unsigned short from64to16(unsigned long x)
 {
@@ -142,12 +143,38 @@

 /*
  *	This is a version of ip_compute_csum() optimized for IP headers,
- *	which always checksum on 4 octet boundaries.
+ *	which always checksum on 4 octet boundaries.   Optimized version
+ *	provided for CPUs that see benefit for the unrolled logic.
  */
 __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
 {
+    if (likely(ihl =3D=3D 5) && !amask(AMASK_BWX)) {
+        const u16 *w =3D iph;
+        u64 sum;
+
+        sum  =3D w[0];
+        sum +=3D w[1];
+        sum +=3D w[2];
+        sum +=3D w[3];
+        sum +=3D w[4];
+        sum +=3D w[5];
+        sum +=3D w[6];
+        sum +=3D w[7];
+        sum +=3D w[8];
+        sum +=3D w[9];
+
+        sum =3D (sum & 0xffff) + (sum >> 16);
+        sum =3D (sum & 0xffff) + (sum >> 16);
+
+        return (__force __sum16)~sum;
+    }
+	/* existing legacy implementation as fallback for:
+	*   - ihl !=3D 5
+	*   - EV4/EV5 where the old code is better
+	*/
 	return (__force __sum16)~do_csum(iph,ihl*4);
 }
+
 EXPORT_SYMBOL(ip_fast_csum);

 /*

