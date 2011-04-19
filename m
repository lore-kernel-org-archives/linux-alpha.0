From: Bob Tracy <rct@gherkin.frus.com>
Subject: [BUG] DMA_ERROR_CODE undefined in radeon_gart.c
Date: Tue, 19 Apr 2011 14:42:22 -0500
Message-ID: <20110419194222.GA23953@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-alpha@vger.kernel.org

Attempted to build 2.6.39-rc4 on an Alpha and got the following error:

  CC [M]  drivers/gpu/drm/radeon/radeon_gart.o
drivers/gpu/drm/radeon/radeon_gart.c: In function 'radeon_gart_bind':
drivers/gpu/drm/radeon/radeon_gart.c:186: error: 'DMA_ERROR_CODE' undeclared (first use in this function)
drivers/gpu/drm/radeon/radeon_gart.c:186: error: (Each undeclared identifier is reported only once
drivers/gpu/drm/radeon/radeon_gart.c:186: error: for each function it appears in.)
make[4]: *** [drivers/gpu/drm/radeon/radeon_gart.o] Error 1
make[3]: *** [drivers/gpu/drm/radeon] Error 2
make[2]: *** [drivers/gpu/drm] Error 2
make[1]: *** [drivers/gpu] Error 2
make: *** [drivers] Error 2

It appears that "DMA_ERROR_CODE" is currently defined for several
architectures in "arch/*/include/asm/dma-mapping.h", but not for "alpha".

-- 
------------------------------------------------------------------------
Bob Tracy          |  "Every normal man must be tempted at times to spit
rct@frus.com       |   upon his hands, hoist the black flag, and begin
                   |   slitting throats."	-- H.L. Mencken
------------------------------------------------------------------------
