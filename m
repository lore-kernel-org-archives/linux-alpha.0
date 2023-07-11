From: "Arnd Bergmann" <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 1/5] Non-functional cleanup of a "__user * filename"
Date: Tue, 11 Jul 2023 13:32:20 +0200
Message-ID: <0c59140d-e58d-4fb6-a94c-f829bb802db3@app.fastmail.com>
References: <87o8pscpny.fsf@oldenburg2.str.redhat.com>
 <cover.1689074739.git.legion@kernel.org>
 <3098381cf93a5010e878319c6218d2c5851746c0.1689074739.git.legion@kernel.org>
Mime-Version: 1.0
Return-path: <linux-api-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1689075161; x=1689161561; bh=3i
        BxzwnTyVw6BqHPrJ35gyKi0bdZzNDDY557YK2M5BM=; b=JRFvVCUqXTisKlcu78
        V6X1m5LSfDVcIeAFm4i9sZD+uWy9EgvZ+/ileXpa3R/i/cyyrzh9sD5o1jMT/pWb
        eErsQCfKm8c8yTwwLGg34pXoSWqC7ABI9ZHXvTxey9XGiczK6Wf7qDOrjekfkmae
        vub48BvOSfkhsJwvsGSTvvjWdyobXkLBI0s49VfzYahb4NGkrfTPsIo8HycipqB/
        wusp7BIORxxj0Gn9ikvLScqxRVAYg4+pvSdzc6II/+UNlSrBU/+YD+oNAVOm9XR2
        pF3gL50Cz2s4aGlpK9jLq5SyNVyF72ZQjs0jWJZSuFDy5mrH3IOJb0JQbUV/sWBP
        +weA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1689075161; x=1689161561; bh=3iBxzwnTyVw6B
        qHPrJ35gyKi0bdZzNDDY557YK2M5BM=; b=lpNBgLU3zxYVrchcOKgdZTHoTgY5D
        N9pkRaXJrHm32Ff9ChM/9SzKx53lNbBJrWNx9gBSeUZByFxNvoC7sYgniB09Zb7U
        ePLSVdOMLT2uc/O147FVCnw9mC6nJlC/v76dAjDmYmkvEZt3ToXWQ6FZ+/gmN/Iz
        MFwpTBkN81VeBB4c0ODv2Wr1UJRHMNKAL15oq5Mwixgj97JXCIoFQiGls+r8y+jU
        RKBCPhAI3YwUEHKil1YBariTOIakoffPQUpLbZC+qBhhcCUN93KuQ3bt9H0DZtSH
        9n97nscvUrVINTVF8W14jVU5Gn1X5RLqUC+bWY2StdFEVKXSOu/RPTlVw==
In-Reply-To: <3098381cf93a5010e878319c6218d2c5851746c0.1689074739.git.legion-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Gladkov <legion-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-api-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Cc: Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>, "James E . J . Bottomley" <James.Bottomley-d9PhHud1JfjCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Christian Borntraeger <borntraeger-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, christian-STijNZzMWpgWenYVfaLwtA@public.gmane.org, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>, "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Deepa Dinamani <deepa.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>, David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, fenghua.yu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, firoz.khan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, glebfm@altli

On Tue, Jul 11, 2023, at 13:25, Alexey Gladkov wrote:
> From: Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
>
> The next patch defines a very similar interface, which I copied from
> this definition.  Since I'm touching it anyway I don't see any reason
> not to just go fix this one up.
>
> Signed-off-by: Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
