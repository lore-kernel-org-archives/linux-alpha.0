From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] alpha: Replace one-element array with flexible-array member
Date: Tue, 15 Aug 2023 16:44:12 -0700
Message-ID: <169214305098.657491.4672688597029199904.b4-ty@chromium.org>
References: <ZMpZZBShlLqyD3ax@work>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692143061; x=1692747861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vG5YLVC3eDKirzY40GTGyFbIQV7NMpfOOW8qjICzL9g=;
        b=oBXtosF0pp2dlR76dRPteSznb7v90y3c6+QKAWDhL0B6LTQLODDst9tl3HBtqXjUA8
         EybyR9mmvR+KQNYPEAvYX8oupycUhhaQu1sCAeF4KwKh7OicB3Mo0FjopdJ0TG+2HhQb
         qyGQY2g3xsuvhVaqH+E/g9x60PXAhkkqYZIEk=
In-Reply-To: <ZMpZZBShlLqyD3ax@work>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org

On Wed, 02 Aug 2023 07:25:56 -0600, Gustavo A. R. Silva wrote:
> One-element and zero-length arrays are deprecated. So, replace
> one-element array in struct osf_dirent with flexible-array
> member.
> 
> This results in no differences in binary output.
> [...]

Applied to for-next/hardening, thanks!

[1/1] alpha: Replace one-element array with flexible-array member
      https://git.kernel.org/kees/c/967afdf808cf

Take care,

-- 
Kees Cook

