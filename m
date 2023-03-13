From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH v4] alpha: Clean-up the panic notifier code
Date: Mon, 13 Mar 2023 17:57:17 -0300
Message-ID: <522c745a-4e4c-8c6c-cca5-0d4ebc76ace3@igalia.com>
References: <20230220212245.153554-1-gpiccoli@igalia.com>
 <ba225af5-3729-32a4-318a-c1c4b8e8b37a@igalia.com>
 <CAEdQ38HS=V9QJsdSoccos02HGn4=QKobkci=BTP9tc3=RyzUFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=m3KRKIIxdQGzDnfQbP1Rf414m0PFZ7Oc2osrdxzJBmk=; b=mOvcffLPKSHMzp5msUiTRSnf6M
        GACFCJHb1oFRC8NQpHSfAxYCgkrg/YW4MaAikPTySg4VabWqIWcicuLikA5eGcoft5ayR7AEHZV6O
        AqOMLj6RRJpOM9Z9SjqeVev1BjlPqhNi3gSfEdVD4z9cbj1RWcbFnwEXDMDozw0N6D8GgA4Dw7bOH
        9gJ0xIw1nJQE2TlmURapIZMFBKDKw691LB5Lv54I1HNxuvPy26M9okKO7EOVpwOz+p3K70QegGPjL
        klhC7WHA6YkPNA9jNSN8xFBGQthVjwrCS8y0++66L2bx40qUFjWm3N1IPzSSf6iERzHXxRqAH3eqJ
        JuhuUCv 
Content-Language: en-US
In-Reply-To: <CAEdQ38HS=V9QJsdSoccos02HGn4=QKobkci=BTP9tc3=RyzUFQ@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-kernel@vger.kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, Petr Mladek <pmladek@suse.com>

On 13/03/2023 17:39, Matt Turner wrote:
> [...]
> My apologies. I meant to include this in my last pull request.
> 
> I'll take it through my tree.
> 
> Thanks,
> Matt

Hi Matt, no need for apologies - thanks for including!
Cheers,


Guilherme
