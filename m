From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH v4] alpha: Clean-up the panic notifier code
Date: Mon, 13 Mar 2023 17:18:48 -0300
Message-ID: <ba225af5-3729-32a4-318a-c1c4b8e8b37a@igalia.com>
References: <20230220212245.153554-1-gpiccoli@igalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=1pIf+VierdJpmiI9zH5ye8/eQXEQAS3qYu1Hwf19Ncw=; b=R7d6Us7vCuOJReyceWdv+LWtTC
        5i5hHWzz00qZTY6FXaLcQvLmThPfgsZFYH8ZHjDYsJfo9Irpn6ZfsFegJq26hvKThLu4ldNwqWV2x
        kXkPgfw8xMXtp8RhxxIeSyFfwYYm3L3/OWn23Epm/H9l+tf+hh4OAMZ0Oa55d1CkdaIwcB8UZwAF9
        E2FIDJIqeoad+oXMaEmGmOP1JOXwbraz02PFER6uHfn8Wl8AijMeZi1X2OfcqS6uH5WzFMXcLUn5m
        c02De4I+TQkJQ8RROcqVoNvaXRHTVel+UYgbD1vI9b9oyumeuDwqyRXhQlJxXkhw7v92TgShtcZQ1
        yY7cxcA 
Content-Language: en-US
In-Reply-To: <20230220212245.153554-1-gpiccoli@igalia.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, Matt Turner <mattst88@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: linux-kernel@vger.kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, Petr Mladek <pmladek@suse.com>

On 20/02/2023 18:22, Guilherme G. Piccoli wrote:
> The alpha panic notifier has some code issues, not following
> the conventions of other notifiers. Also, it might halt the
> machine but still it is set to run as early as possible, which
> doesn't seem to be a good idea.
> 
> So, let's clean the code and set the notifier to run as the
> latest, following the same approach other architectures are
> doing - also, remove the unnecessary include of a header already
> included indirectly.
> 
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> 
> ---
> 
> 
> V4:
> - Rebased (and build-tested) against v6.2.
> 
> V3:
> - No changes.
> 
> V2:
> - Fixed rth email address;
> - Added Petr's review tag - thanks!
> 

Hi folks, just a gentle ping.
Lemme know if there's anything I could do in order to get this move forward.

Thanks in advance,


Guilherme
