Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x2A3Cbh4"
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8813D126
	for <linux-alpha@vger.kernel.org>; Tue, 21 Nov 2023 09:48:24 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6c431b91b2aso5090196b3a.1
        for <linux-alpha@vger.kernel.org>; Tue, 21 Nov 2023 09:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700588904; x=1701193704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BQpzfrYGsE+0PTDTiL34gs/OkqhZ2Wyj6iaH/gbK9pA=;
        b=x2A3Cbh47sHuNGHBg/J7MDKyUfI9sMsj7PdzqyW2ayIIV3Ozs0iybHayy15D5OyDpm
         mL3ChPDjdkXqPCUDo2Ck4L2gCqXk1GGkK6lO54isvvW2//0iVW8wJfROrTN0AVTH/5FF
         sp5K6dmV1+HQwrpfOwavtUhswCvYvR11Ab8f+WcpIUrKQ2rfr+NlzUjHXqzQVrYyEKzn
         7fU9IZkKigzFZynGqYWOU4L8zngOIEFWnV84Z9ibm9FPB9MdcBapmm9M5dKvGW6vCDph
         /ZtMsS+hX9SvyLtYIPr8Po082uDCvf316AzfhxXBOqQuzVmXUXvbWiTWMSfkPb9+i7oz
         I+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700588904; x=1701193704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQpzfrYGsE+0PTDTiL34gs/OkqhZ2Wyj6iaH/gbK9pA=;
        b=MNWQwoX7Vrxke7a6Yt2YrnFD5f/FRy8h2qsF4v7ILqg/+J2BuqYlq8G8zyiNp2XEvg
         k0xpNbYBogI2U7C7VAFLg2PwN6+aSVsFKNi3ssoBYiScrJrgW9GoFvvDBbNyShwsZ5Pg
         i7YHwDFrc51MP2pcCcfsw/9a7Kg4YP5ryg7NC/xecq84IP2HG69aHpF1OaeUyzKrk3Sp
         JLyjNyvucyEm6kqqESDZYI7ZBVJdj2cazv8V7JMWzgLfJyZMeKWXwYx56r3dH0pJGGx7
         eCw02vwFS/WcbfvrF7ps+yzuMqIjQHzTfp8QRHZttErwSOBzm0LDGGZ9OT4NFMQy6gfb
         3d0Q==
X-Gm-Message-State: AOJu0Yx8eHclGSHcf7+jjA5re5csZh/DpUKFnb8l7iBasdfAb3ujOF9v
	yjmiRFrZE+6nM7F+ZQKhwUyQ8Q==
X-Google-Smtp-Source: AGHT+IH5+zyRERABCW680nOLtro7a4MXSzHErXwyD79vgIKV1PgOl18oHlnP03UVvOvNUqMpg8KYLQ==
X-Received: by 2002:a05:6a20:1604:b0:138:2fb8:6c48 with SMTP id l4-20020a056a20160400b001382fb86c48mr9735361pzj.8.1700588903961;
        Tue, 21 Nov 2023 09:48:23 -0800 (PST)
Received: from [172.20.7.39] ([187.217.227.247])
        by smtp.gmail.com with ESMTPSA id b11-20020a056a000ccb00b006cb69ff0444sm5547127pfv.151.2023.11.21.09.48.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 09:48:23 -0800 (PST)
Message-ID: <2773db23-b897-48f4-8529-5cb70480e40e@linaro.org>
Date: Tue, 21 Nov 2023 11:48:21 -0600
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/17] tty: srmcons: make srmcons_do_write() return void
Content-Language: en-US
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, linux-alpha@vger.kernel.org
References: <20231121092258.9334-1-jirislaby@kernel.org>
 <20231121092258.9334-16-jirislaby@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231121092258.9334-16-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *

On 11/21/23 03:22, Jiri Slaby (SUSE) wrote:
> The return value of srmcons_do_write() is ignored as all characters are
> pushed. So make srmcons_do_write() to return void.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: linux-alpha@vger.kernel.org
> ---
>   arch/alpha/kernel/srmcons.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/alpha/kernel/srmcons.c b/arch/alpha/kernel/srmcons.c
> index 8025e2a882ed..32bc098de7da 100644
> --- a/arch/alpha/kernel/srmcons.c
> +++ b/arch/alpha/kernel/srmcons.c
> @@ -88,7 +88,7 @@ srmcons_receive_chars(struct timer_list *t)
>   }
>   
>   /* called with callback_lock held */
> -static int
> +static void
>   srmcons_do_write(struct tty_port *port, const char *buf, int count)
>   {
>   	static char str_cr[1] = "\r";
> @@ -125,7 +125,6 @@ srmcons_do_write(struct tty_port *port, const char *buf, int count)
>   				need_cr = 0;
>   		}
>   	}
> -	return count;
>   }
>   
>   static ssize_t

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
