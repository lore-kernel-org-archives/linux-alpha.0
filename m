From: Anshul <anshulusr@gmail.com>
Subject: Re: [PATCH] fixed formatting issues
Date: Mon, 28 Aug 2023 13:54:41 +0530
Message-ID: <CAPwwkU7+zHo2jpt+ovJDE1ca=K8AKyowyA5Z9pOFAy6iifVEwA@mail.gmail.com>
References: <20230828071829.64366-1-anshulusr@gmail.com> <2023082827-craftily-citric-06fa@gregkh>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693211090; x=1693815890;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e9pJAr454rayHBAXFAjSdv3co7r+pS6oC0hrTuJIa6E=;
        b=eY2asSzzsQ06/so0010x36+boQ3snxsY+ZhSEEJMUPdRKigzKMOHnD3JkjdxFgLJCr
         Z/bUrl+yxCPBB+ijb2WKjbcADhY5TIZp8+rFSs5M/NOzSrLxxm3BC3oktivF+s8BTD15
         kODf45MmZgqRTEzGyppstnpBSDD1XWjLCfH0pkVOEw/m+8eL9sKYkd+tclBemVCtbaUV
         /Aa9bVsxY2yserL06GqRxhcUSullxJwOXLL2w0RiwDvAQ2Zblnux5PN2MvBuUBmPAhjy
         0zExMXiD3nDyzmTvdXr1QjJJhK6G3Hl++0dqhSZuCpuKExawyYEehlq4Hi4nQb377nTK
         wt8w==
In-Reply-To: <2023082827-craftily-citric-06fa@gregkh>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org

Hello Greg,

> - Your patch did many different things all at once, making it difficult
>   to review.  All Linux kernel patches need to only do one thing at a
>   time.  If you need to do multiple things (such as clean up all coding
>   style issues in a file/driver), do it in a sequence of patches, each
>   one doing only one thing.  This will make it easier to review the
>   patches to ensure that they are correct, and to help alleviate any
>   merge issues that larger patches can cause.

I believe that splitting the patch is not necessary in this instance since
the changes are localized and trivial to reason about.

> - You did not write a descriptive Subject: for the patch, allowing
>   everyone, to know what this patch is all about.  Please read the
>   section entitled "The canonical patch format" in the kernel file,
>   Documentation/process/submitting-patches.rst for what a proper
>   Subject: line should look like.

As per the feedback, the updated patch has incorporated the changes.

> - It looks like you did not use your "real" name for the patch on either
>   the Signed-off-by: line, or the From: line (both of which have to
>   match).  Please read the kernel file,
>   Documentation/process/submitting-patches.rst for how to do this
>   correctly.

I have verified that the Signed-off-by: line and the From: line contain the
same content.

Thanks for the feedback,

Anshul
