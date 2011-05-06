From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Subject: Re: [PATCH] alpha: Add DMA_ERROR_CODE defn to avert compiler error
 in drm
Date: Fri, 6 May 2011 21:30:03 +0900
Message-ID: <20110506212708I.fujita.tomonori@lab.ntt.co.jp>
References: <1304496817-7646-1-git-send-email-mcree@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1304496817-7646-1-git-send-email-mcree@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: mcree@orcon.net.nz
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, mattst88@gmail.com, rth@twiddle.net, ink@jurassic.park.msu.ru

On Wed,  4 May 2011 20:13:37 +1200
Michael Cree <mcree@orcon.net.nz> wrote:

> The radeon drm code now relies on DMA_ERROR_CODE.  This defines
> it in alpha dma-mapping header to at least enable me to compile
> radeon drm/kms into kernel.
> 
> Signed-off-by: Michael Cree <mcree@orcon.net.nz>
> ---
>  arch/alpha/include/asm/dma-mapping.h |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)

This isn't correct. The drivers should not use DMA_ERROR_CODE directly
(some architecture specific drivers use it though). Fix rademon
drm/kms instead.
