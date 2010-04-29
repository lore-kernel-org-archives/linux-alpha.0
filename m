From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH] alpha: simplify and optimize sched_find_first_bit
Date: Wed, 28 Apr 2010 20:56:21 -0700
Message-ID: <4BD90365.3030404@twiddle.net>
References: <1272512276-25975-1-git-send-email-mattst88@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=D/ZJ8ASr+GhwPwLxGw4z1qLyFKNJstjEaSvG9ArSKAI=;
        b=qg7tKHjwFutnX1A/dyGCYgaFD93sBWyp6Jo/2gUhXlob58SbqHEhCXuSTUzl+JeMAl
         t513slbrihtm2we9zkLgzERLn1JCb1Gv0dctYnHUe2VBwYnArgoMtqSi+qu8DKNdj1Li
         pgoUCGK8c96Xy3YoP74pZr3KaHIJ8R/EhZgH0=
In-Reply-To: <1272512276-25975-1-git-send-email-mattst88@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@elte.hu>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

On 04/28/2010 08:37 PM, Matt Turner wrote:
> Search only the first 100 bits instead of 140, saving a couple
> instructions. The resulting code is about 1/3 faster (40K ticks/1000
> iterations down to 30K ticks/1000 iterations).
> 
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ingo Molnar <mingo@elte.hu>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: linux-alpha@vger.kernel.org
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Acked-by: Richard Henderson <rth@twiddle.net>


r~
