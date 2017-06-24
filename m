From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH] alpha: support R_ALPHA_REFLONG relocations for module
 loading
Date: Sat, 24 Jun 2017 08:09:24 -0700
Message-ID: <403b6cf4-9c05-fb32-4916-e906a787b730@twiddle.net>
References: <20170624013702.18225-1-mcree@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PnTdwiBTAxM3OylDmp0I0CDZuSY4tepJ7VLFm38vNe0=;
        b=sPaj71jSPqgKNrhC3Gql5WNGFsseZ0W/Pto4e1GigmMAB1bOPvs2i+SFdI4rzNOxeX
         ToNHUbw9nSQTgYefRP9iXqmMx6RyjaRiAtsR96RTEY+o25/slMC8MetZlKyxIHrm4i46
         wE4y41Znr+p3dwD2+TFXOLJAp46LeWfjLLfTlM4N9v6EQGXCqSclNlxsBN2HFJVMkaFT
         Q36iyo2V9BmBxW5aq4r98jp14cyOAjHZa8Ci5nDskSAahrGLMH9n1QNZuFSFTbEh09Vw
         fAS38rsTMjceLmhj6vPjYKzxwR/wrPPwLEL3Y+131NaYBdcvP5/wt+ETsnEFjEYiB09c
         0hDA==
In-Reply-To: <20170624013702.18225-1-mcree@orcon.net.nz>
Content-Language: en-US
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michael Cree <mcree@orcon.net.nz>, linux-kernel@vger.kernel.org
Cc: Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

On 06/23/2017 06:37 PM, Michael Cree wrote:
> Since commit 71810db27c1c853b33 (modversions: treat symbol CRCs
> as 32 bit quantities) R_ALPHA_REFLONG relocations can be required
> to load modules. This implements it.
> 
> Tested-by: Bob Tracy<rct@gherkin.frus.com>
> Signed-off-by: Michael Cree<mcree@orcon.net.nz>
> ---
>   arch/alpha/kernel/module.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
