From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH 0/7] Minor Alpha updates for 3.11
Date: Tue, 16 Jul 2013 21:29:12 -0700
Message-ID: <CAEdQ38HUezMg+xdUFjjHHs5wSyN0Bw1Hcou7yDsPBc07sLyGnA@mail.gmail.com>
References: <1373994280-12047-1-git-send-email-rth@twiddle.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=FSgY/3UaFM15gVV5UGutx2UNR1aEhMorcx1qyb+5z8Y=;
        b=X71KtqWHxpazvz7UaHRO4/usxTA/gZK9DLeGJ3qZ7ny+hl5hI0JrYW29KQDwDnbUQ6
         BMUlkKJZ4L1nstA1di2K8IyQBA9gfKgHczEWKIlIAWVu/4bnkX/PCDtxbtfRYBM1qOOf
         uW2CbmegI9j0za5cTDCb/o51Ho2jB6qTwSWoCdTF6g8U9yV6Um5i/+WFAKXgeMGl/5DW
         bl8KTAt1s4K2YYewS90Z8viR6D7/fZOZDR6eRMAushoEqrf4vBxOy8msWzPcYbpzOqw1
         I9onq/14rBEMl5ZZ95/yyXvkezAe8KgfDe9wHnwApcbu+qI6oXRmdD7++gSfZPaGq8xu
         NRGQ==
In-Reply-To: <1373994280-12047-1-git-send-email-rth@twiddle.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: linux-kernel@vger.kernel.org, ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org

On Tue, Jul 16, 2013 at 10:04 AM, Richard Henderson <rth@twiddle.net> wrote:
> Here's a set of minor updates for arch/alpha that should not
> be controversial.

Patches 1-5 and 7 (with the typo fixed) are

Reviewed-and-Tested-by: Matt Turner <mattst88@gmail.com>

I don't know enough patch 6 to make any kind of meaningful review, so it's

Acked-by: Matt Turner <mattst88@gmail.com>

I've got five patches in a for-linus branch on kernel.org that I was
planning to send a pull request for soon. Would you like me to add
these to that branch?

Thanks!
Matt
