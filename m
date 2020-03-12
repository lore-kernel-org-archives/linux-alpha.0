From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [RESEND PATCH v2 8/9] media: fsl-viu: Constify ioreadX() iomem
 argument (as in generic implementation)
Date: Thu, 12 Mar 2020 09:01:22 +0100
Message-ID: <1c4a11b5-5ca6-7555-de3c-ff30f707fac7__17982.2107589402$1584000114$gmane$org@xs4all.nl>
References: <20200219175007.13627-1-krzk@kernel.org>
 <20200219175007.13627-9-krzk@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584000098; bh=rlvXrsquCgOAoL6m3j4naIDiZk45jPg5qzfaHkH6ylc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=S5pQfgbOLIHhQdw0W7sV5AZx/O5rbzeyPt7bFpTNkwgO8Qy0BKq+Rvjmju5L2B424
         ts5RJaST/5DSO90woF88XEKoVSWzdXA1+cYgXtZ9lrnSZ/voNQNCc/kNcDWB/9eH8q
         oukXvG+APHr07xXyoiRVnfNAIu0NoRyJO4gRl7kMox10FOdeAVa4C86hGVXEgWIL1z
         DHpeiiUb+PUHWBRHnftozp83wtSCPlDu/KR0wA5Tus7873ErMhZjEh0V/cX/LLr9QJ
         GcvLzWg4JtL3YxsnzXI28YMgDuIhwtNvDRGPXfnFqtov7CBrtU3S5QfdwsKM1K25I6
         WU1k8NIIoVM6w==
In-Reply-To: <20200219175007.13627-9-krzk@kernel.org>
Content-Language: en-US
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Krzysztof Kozlowski <krzk@kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@synopsys.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Jiri Slaby <jirislaby@gmail.com>, Nick

On 2/19/20 6:50 PM, Krzysztof Kozlowski wrote:
> The ioreadX() helpers have inconsistent interface.  On some architectures
> void *__iomem address argument is a pointer to const, on some not.
> 
> Implementations of ioreadX() do not modify the memory under the address
> so they can be converted to a "const" version for const-safety and
> consistency among architectures.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  drivers/media/platform/fsl-viu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/fsl-viu.c b/drivers/media/platform/fsl-viu.c
> index 81a8faedbba6..991d9dc82749 100644
> --- a/drivers/media/platform/fsl-viu.c
> +++ b/drivers/media/platform/fsl-viu.c
> @@ -34,7 +34,7 @@
>  /* Allow building this driver with COMPILE_TEST */
>  #if !defined(CONFIG_PPC) && !defined(CONFIG_MICROBLAZE)
>  #define out_be32(v, a)	iowrite32be(a, (void __iomem *)v)
> -#define in_be32(a)	ioread32be((void __iomem *)a)
> +#define in_be32(a)	ioread32be((const void __iomem *)a)
>  #endif
>  
>  #define BUFFER_TIMEOUT		msecs_to_jiffies(500)  /* 0.5 seconds */
> 

