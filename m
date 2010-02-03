From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH] alpha: PTR_ERR overwrites -EINVAL in syscall osf_mount
Date: Wed, 03 Feb 2010 09:16:34 -0800
Message-ID: <4B69AF72.3000208@twiddle.net>
References: <4B699B06.2040202@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <4B699B06.2040202@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Roel Kluin <roel.kluin@gmail.com>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>

On 02/03/2010 07:49 AM, Roel Kluin wrote:
> The initial -EINVAL value is overwritten by `retval = PTR_ERR(name)'.
> If this isn't an error pointer and typenr is not 1, 6 or 9, then
> this retval, a pointer cast to a long, is returned.
>
> Signed-off-by: Roel Kluin<roel.kluin@gmail.com>

Acked-by: Richard Henderson <rth@twiddle.net>


r~
