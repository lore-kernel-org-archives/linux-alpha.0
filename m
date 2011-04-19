From: Stratos Psomadakis <psomas@ece.ntua.gr>
Subject: Re: [BUG] DMA_ERROR_CODE undefined in radeon_gart.c
Date: Tue, 19 Apr 2011 23:04:40 +0300
Message-ID: <4DADEAD8.4090203@ece.ntua.gr>
References: <20110419194222.GA23953@gherkin.frus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110419194222.GA23953@gherkin.frus.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bob Tracy <rct@gherkin.frus.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On 19/04/2011 10:42 =CE=BC=CE=BC, Bob Tracy wrote:
> Attempted to build 2.6.39-rc4 on an Alpha and got the following error=
:
>
>   CC [M]  drivers/gpu/drm/radeon/radeon_gart.o
> drivers/gpu/drm/radeon/radeon_gart.c: In function 'radeon_gart_bind':
> drivers/gpu/drm/radeon/radeon_gart.c:186: error: 'DMA_ERROR_CODE' und=
eclared (first use in this function)
> drivers/gpu/drm/radeon/radeon_gart.c:186: error: (Each undeclared ide=
ntifier is reported only once
> drivers/gpu/drm/radeon/radeon_gart.c:186: error: for each function it=
 appears in.)
> make[4]: *** [drivers/gpu/drm/radeon/radeon_gart.o] Error 1
> make[3]: *** [drivers/gpu/drm/radeon] Error 2
> make[2]: *** [drivers/gpu/drm] Error 2
> make[1]: *** [drivers/gpu] Error 2
> make: *** [drivers] Error 2
>
> It appears that "DMA_ERROR_CODE" is currently defined for several
> architectures in "arch/*/include/asm/dma-mapping.h", but not for "alp=
ha"
Similar issue in this discussion [1].
They solved it by replacing DMA_ERROR_CODE with dma_mapping_error().
Probably this can work here too.

--=20
Stratos Psomadakis
<psomas@ece.ntua.gr>

