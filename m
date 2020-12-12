From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] alpha: add support for TIF_NOTIFY_SIGNAL
Date: Sat, 12 Dec 2020 07:35:14 -0800
Message-ID: <20201212153514.GA108207@roeck-us.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:
        To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=9Un3ww/7W/No9l18pClV/LJRznqez7VBBMPQINwNKQ8=; b=KdTYmdQG/zNxQEUK41hQiG+dDq
        PYslk46HVsbt40Cqw4PNpBkKDRatn6CgxaE/X5Ub+XaCnkxORQUSyJKDCOOPf2UykNkNK9cLnuj0v
        6uHJVoqGaebWJaH9XLBi9Ry/qds06usQmiC6vVbR1WM3vx62ytdKjdqsUeNpjQKJ5xMzwy7hJUAvM
        qVF7sDcsQ/J0JKbGKxbsHAu9EBQdunm9Vpse9ljlmeNFFV/it/KcvSdOxttXT+p2zzQCX5QnWo8Lf
        TVPC33N3Qent8mzrnPoLoa/1eikrlPsDserchGkIxceK9bOuQiSLI8Q6Du9HYHv7DZQHIRiVR5AbO
        M1acpq 
Content-Disposition: inline
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Matt Turner <mattst88@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

On Thu, Oct 08, 2020 at 09:11:42AM -0600, Jens Axboe wrote:
> Wire up TIF_NOTIFY_SIGNAL handling for alpha.
> 
> Cc: linux-alpha@vger.kernel.org
> Signed-off-by: Jens Axboe <axboe@kernel.dk>
> ---
...
>  work_pending:
> -	and	$17, _TIF_NOTIFY_RESUME | _TIF_SIGPENDING, $2
> +	and	$17, _TIF_NOTIFY_RESUME | _TIF_SIGPENDING, | _TIF_NOTIFY_SIGNAL, $2
                                                         ^^^^^

Does this compile anywhere ?

Guenter
