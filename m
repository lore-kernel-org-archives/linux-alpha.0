From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 01/17] alpha: Use Kbuild logic to include <asm-generic/sections.h>
Date: Wed, 13 Nov 2013 07:23:52 +1000
Message-ID: <52829C68.6090409@twiddle.net>
References: <1384285347-13506-1-git-send-email-geert@linux-m68k.org> <1384285347-13506-2-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=gHzBxf/oUgzsMApRUNnsqZOi+lNQsmmrg0ZC1WoMzU0=;
        b=FLR1rE1g1XB1Go9ODRoETiBCmBnmqUCzc+ZzdRJWEhhSxtpPPdpFp0ATzg6wTUsCBY
         +lFG86+CdBMO0in6o8HtvHss6nmIcYbms47KWXizO9XmlZTLeJh2VCr7rw1vwptX48YW
         DqBCsl30ZAadDd5konIHtRgXtP8ulcv4SUtVNAqBknfnD7l4KmAcx8kAkIaQNOv/oCnN
         lppKdUDrjs0MYO+1suf0YS2+x5xCGzzWAl+wVtubz/wzobqYXUi6kVr4Xai7A7krrP5k
         BkNntGHMY7u6wgZ1dRXCQoDJx+0pRSJnc1vIEP7KVI+GB4Soenst0NMpvWx29qI+3mps
         Lr4g==
In-Reply-To: <1384285347-13506-2-git-send-email-geert@linux-m68k.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On 11/13/2013 05:42 AM, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: linux-alpha@vger.kernel.org
> ---
>  arch/alpha/include/asm/Kbuild     |    2 +-
>  arch/alpha/include/asm/sections.h |    7 -------
>  2 files changed, 1 insertion(+), 8 deletions(-)
>  delete mode 100644 arch/alpha/include/asm/sections.h

Acked-by: Richard Henderson <rth@twiddle.net>


r~
