From: afzal mohammed <afzal.mohd.ma@gmail.com>
Subject: Re: [PATCH v4] alpha: Replace setup_irq() by request_irq()
Date: Fri, 13 Mar 2020 18:18:21 +0530
Message-ID: <20200313124821.GD7225@afzalpc>
References: <20200304005209.5636-1-afzal.mohd.ma@gmail.com>
 <20200305130843.17989-1-afzal.mohd.ma@gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vfLtNZ0VvBNo56dvGGqSEkX8wp84sKqijejN4pOTelU=;
        b=ah/XXi/BK3w0arbvueMFncz4R99pp3f7rtrPBcxJUI8/No6t86N70GsKqhuHhaLRtW
         4mKx/0f98i4FCrt/UVZxNTfMoBE7uLouFwXE1i+l67yIV4gE3q4G/dceAj07Bht9ePuM
         qoBpi3Zmm+KDfdZbxnYZKQr5sOfc/E7tUp5mhGs7Wq/Y3ISAKidHotL7ncr4fibWIydy
         I85UJhQ04RVQwTI/MWCfe8g4FBjig0cEwc4fJ/aiE9zCW6rO2PLfbaNucHGD2eK99wyZ
         Q6iO5e+tfAG2GwlkJ1CPp8Uo2l9LAJdLIHG4i0TMaKKtQloP7GiMqOIvQDsPhaeaGIlJ
         IeFg==
Content-Disposition: inline
In-Reply-To: <20200305130843.17989-1-afzal.mohd.ma@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Richard Henderson, Ivan Kokshaysky, Matt Turner, 

On Thu, Mar 05, 2020 at 06:38:41PM +0530, afzal mohammed wrote:
> request_irq() is preferred over setup_irq(). Invocations of setup_irq()
> occur after memory allocators are ready.
> 
> Per tglx[1], setup_irq() existed in olden days when allocators were not
> ready by the time early interrupts were initialized.
> 
> Hence replace setup_irq() by request_irq().
> 
> [1] https://lkml.kernel.org/r/alpine.DEB.2.20.1710191609480.1971@nanos
> 
> Signed-off-by: afzal mohammed <afzal.mohd.ma@gmail.com>

If this patch is okay, please consider acking it so as to take it via
tglx.

Regards
afzal
