From: Stratos Psomadakis <psomas@ece.ntua.gr>
Subject: Re: [BUG] DMA_ERROR_CODE undefined in radeon_gart.c
Date: Tue, 19 Apr 2011 23:07:06 +0300
Message-ID: <4DADEB6A.20506@ece.ntua.gr>
References: <20110419194222.GA23953@gherkin.frus.com> <4DADEAD8.4090203@ece.ntua.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4DADEAD8.4090203@ece.ntua.gr>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bob Tracy <rct@gherkin.frus.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On 19/04/2011 11:04 =CE=BC=CE=BC, Stratos Psomadakis wrote:
> On 19/04/2011 10:42 =CE=BC=CE=BC, Bob Tracy wrote:
>> Attempted to build 2.6.39-rc4 on an Alpha and got the following erro=
r:
>>
>>   CC [M]  drivers/gpu/drm/radeon/radeon_gart.o
>> drivers/gpu/drm/radeon/radeon_gart.c: In function 'radeon_gart_bind'=
:
>> drivers/gpu/drm/radeon/radeon_gart.c:186: error: 'DMA_ERROR_CODE' un=
declared (first use in this function)
>> drivers/gpu/drm/radeon/radeon_gart.c:186: error: (Each undeclared id=
entifier is reported only once
>> drivers/gpu/drm/radeon/radeon_gart.c:186: error: for each function i=
t appears in.)
>> make[4]: *** [drivers/gpu/drm/radeon/radeon_gart.o] Error 1
>> make[3]: *** [drivers/gpu/drm/radeon] Error 2
>> make[2]: *** [drivers/gpu/drm] Error 2
>> make[1]: *** [drivers/gpu] Error 2
>> make: *** [drivers] Error 2
>>
>> It appears that "DMA_ERROR_CODE" is currently defined for several
>> architectures in "arch/*/include/asm/dma-mapping.h", but not for "al=
pha"
> Similar issue in this discussion [1].
> They solved it by replacing DMA_ERROR_CODE with dma_mapping_error(). =
[2]
> Probably this can work here too
[1] http://lkml.org/lkml/2010/3/11/261
[2] http://git.infradead.org/mtd-2.6.git/commitdiff/0c82d3ce

--=20
Stratos Psomadakis
<psomas@ece.ntua.gr>
