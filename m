From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] alpha: Replace one-element array with flexible-array
 member
Date: Tue, 15 Aug 2023 14:02:05 -0600
Message-ID: <563e99c0-c9be-5903-c2cd-d2680a8ee6e9@embeddedor.com>
References: <ZMpZZBShlLqyD3ax@work>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=kziO47HPQuhKHz+UpmkJYDreIKaiytaoh9bnZL4wAkw=; b=VnwTqfL7dR4usa5rfPauKONeeX
        Wl5EYbK52+P3bmtKgRKzz7pjXe6oT4A09HnIe2XY78b8NMu76nRsVje/sKG8Tsgh0xwToBbzwhr5g
        jCd41DCpyIRnDRSI0BgA8Hshd/yTRS/pS7EU7LCN1n7q0HQ13W+Ucy/pfhcUt7c6fdbFfUj4cKf3J
        Wtwk9ZJ7y0TU4nn6JKAf9+nC0n5sw/3g09omUg5Vp3eN/A44xo9h3rw+n+xlzZ9meaJ4Y63YfqeLd
        MsM7wQ4T6FACSqPMJSiK+Ql1lClEwwKXBJ8ucxCxIaeGqInvjom7HNDzJYo0TwRY/Te8nOs0XWudL
        7RZL 
Content-Language: en-US
In-Reply-To: <ZMpZZBShlLqyD3ax@work>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org

Hi all,

Friendly ping: who can take this, please?

Thanks
--
Gustavo

On 8/2/23 07:25, Gustavo A. R. Silva wrote:
> One-element and zero-length arrays are deprecated. So, replace
> one-element array in struct osf_dirent with flexible-array
> member.
> 
> This results in no differences in binary output.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>   arch/alpha/kernel/osf_sys.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
> index d98701ee36c6..5db88b627439 100644
> --- a/arch/alpha/kernel/osf_sys.c
> +++ b/arch/alpha/kernel/osf_sys.c
> @@ -97,7 +97,7 @@ struct osf_dirent {
>   	unsigned int d_ino;
>   	unsigned short d_reclen;
>   	unsigned short d_namlen;
> -	char d_name[1];
> +	char d_name[];
>   };
>   
>   struct osf_dirent_callback {
