From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 22/73] alpha: don't use module_init for non-modular core
 code
Date: Tue, 21 Jan 2014 16:32:29 -0800
Message-ID: <52DF119D.6090506@twiddle.net>
References: <1390339396-3479-1-git-send-email-paul.gortmaker@windriver.com> <1390339396-3479-23-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=nYSxh4vx92d1p4WAzBw5hcZ0LgvgOA4BpipuTOzSCuw=;
        b=NqozM1TpAJL4DpQdFW0Ex+53KJFLYlTddmKThP0dlOtepDgNeBM6FNwfSnHtKanmO+
         Qj3/ugyYq79J5VGUFC3sBkcEqREvb2UusNj5cleH7E8G7shynBu3in3XPUcOnYJbcRo/
         tquvdSHPKz+nLAV17nFPHVuijQf3P2BF8/NQ0sNydwgERcdCmLFVw3+b86Psuu0Z2qV0
         /lxMVLVQm+TyuzmKiQo8yQrRVEB6OhBPntDsTfYgyMsmvmFxlMMLZI9WRay0bvvYYlWf
         LiP+JETnxl0ZzIByuUZHLb65N5CDu89qFqmpdjuyw8sTP7FXCW2mDmMmhvN9veevi8i/
         F3Vw==
In-Reply-To: <1390339396-3479-23-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

On 01/21/2014 01:22 PM, Paul Gortmaker wrote:
> The srm console is always built in.  It will never be modular,
> so using module_init as an alias for __initcall is rather
> misleading.
> 
> Fix this up now, so that we can relocate module_init from
> init.h into module.h in the future.  If we don't do this, we'd
> have to add module.h to obviously non-modular code, and that
> would be a worse thing.
> 
> Direct use of __initcall is discouraged, vs prioritized ones.
> Use of device_initcall is consistent with what __initcall
> maps onto, and hence does not change the init order, making the
> impact of this change zero.   Should someone with real hardware
> for boot testing want to change it later to arch_initcall or
> console_initcall, they can do that at a later date.
> 
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: linux-alpha@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>  arch/alpha/kernel/srmcons.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
