From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 37/73] alpha: delete non-required instances of <linux/init.h>
Date: Tue, 21 Jan 2014 16:32:47 -0800
Message-ID: <52DF11AF.2000903@twiddle.net>
References: <1390339396-3479-1-git-send-email-paul.gortmaker@windriver.com> <1390339396-3479-38-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=5rlTXgHkyjGmuJKQmNGF4ilQe22xnD5c6M12BRy9Zr8=;
        b=PmMA9PgT+d+jqKdGRWZxJ779vsjRNHuoqiFhdjAYi+xDPhgstPemqz/dh/Ck39Sexl
         HW6MiAiWwF73pRr7hnkNPulWWf3M7UoSwAz6kwFHepD93iCg6RhfGLdzi/ESQTJSRTjt
         +Y8C2dHWpqQ3VZrzjFcN0fWqHeVa64LKEO9phoJ95Pnm4VnCcTpRqOgJCjBGscmnmGqL
         pSZ7+Lh5kWhuKbixl9tTJjOdKaVT3kvzwWuxy8toXTHFHKujyVDm9IaSW+xFPzON1B7V
         ZeQyp+LZA56VVE0XLhTpOm2UK4WV/PYzjDl5YLeIlmaj04GPVYNaoZ39dpMaW3UKj2H7
         uFYg==
In-Reply-To: <1390339396-3479-38-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

On 01/21/2014 01:22 PM, Paul Gortmaker wrote:
> None of these files are actually using any __init type directives
> and hence don't need to include <linux/init.h>.  Most are just a
> left over from __devinit and __cpuinit removal, or simply due to
> code getting copied from one driver to the next.

Acked-by: Richard Henderson <rth@twiddle.net>


r~
