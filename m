From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND PATCH v2 8/9] media: fsl-viu: Constify ioreadX() iomem argument (as in generic implementation)
Date: Wed, 19 Feb 2020 18:50:06 +0100
Message-ID: <20200219175007.13627-9-krzk__43318.2234339014$1582134772$gmane$org@kernel.org>
References: <20200219175007.13627-1-krzk@kernel.org>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582134754;
        bh=HDn1c+OCg4Fxwj0uJTYLgnTqOgR4bEcc2OImuEKXcQg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mWeABfyOQaHBfM1Tl4Rl2aedyBAE8jc2SywErFB4jyNFhmM9UdvOiGm3LE3U1nkFc
         873iQ9IusUp84dBz6YY/fHsHUBu//dBjjVwQQwc5Wp4QlJOHXM0h8vQp7TnxMb2yLh
         vk6aSGDTtV8yJjISbJPkkW9wkktuJxNSCdZTdaOY=
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
 drivers/media/platform/fsl-viu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/fsl-viu.c b/drivers/media/platform/fsl-viu.c
index 81a8faedbba6..991d9dc82749 100644
--- a/drivers/media/platform/fsl-viu.c
+++ b/drivers/media/platform/fsl-viu.c
@@ -34,7 +34,7 @@
 /* Allow building this driver with COMPILE_TEST */
 #if !defined(CONFIG_PPC) && !defined(CONFIG_MICROBLAZE)
 #define out_be32(v, a)	iowrite32be(a, (void __iomem *)v)
-#define in_be32(a)	ioread32be((void __iomem *)a)
+#define in_be32(a)	ioread32be((const void __iomem *)a)
 #endif
 
 #define BUFFER_TIMEOUT		msecs_to_jiffies(500)  /* 0.5 seconds */
-- 
2.17.1

