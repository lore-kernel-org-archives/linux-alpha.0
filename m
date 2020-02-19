From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND PATCH v2 7/9] drm/nouveau: Constify ioreadX() iomem argument (as in generic implementation)
Date: Wed, 19 Feb 2020 18:50:05 +0100
Message-ID: <20200219175007.13627-8-krzk@kernel.org>
References: <20200219175007.13627-1-krzk@kernel.org>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582134742;
        bh=9j4Wqmtnrm+aYUsHCZ4ooV/8lCGRX1ceFNDIpPGSnzM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nm1WAez1jNKXLSvW7J07Tbu90KQFEkmZity4oGOnVRPXsXM+hDFW5K6Tinm5MRxB0
         WmxFTCqql9bAOnA8rju+Ll6+AjyoFTRt2mVhrLGPAW7sOr9jTILaKYuFP5x34AJbfm
         vB/5/wk1OU7xGWOO0ZojgLGfdpGedlnCP90LLVcU=
In-Reply-To: <20200219175007.13627-1-krzk@kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@synopsys.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Jiri Slaby <jirislaby@gmail.com>, Nick Kossifidis <mickflemm@gmail.com>, Luis
Cc: Krzysztof Kozlowski <krzk@kernel.org>

The ioreadX() helpers have inconsistent interface.  On some architectures
void *__iomem address argument is a pointer to const, on some not.

Implementations of ioreadX() do not modify the memory under the address
so they can be converted to a "const" version for const-safety and
consistency among architectures.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 1b62ccc57aef..d95bdd65dbca 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -613,7 +613,7 @@ nouveau_bo_rd32(struct nouveau_bo *nvbo, unsigned index)
 	mem += index;
 
 	if (is_iomem)
-		return ioread32_native((void __force __iomem *)mem);
+		return ioread32_native((const void __force __iomem *)mem);
 	else
 		return *mem;
 }
-- 
2.17.1

