Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C572D949F
	for <linux-alpha@vger.kernel.org>; Wed, 14 Oct 2026 02:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791943843; cv=none; b=U5MSV2p0kNdmU/15wSusYMeK93wIfQwwGEwKhOOSLMeJYf3xsqmr6Uk6lU2ekcEsJh20imJK3y/TPJTV6OoMLIBZAQVpSv0LDWfxAkT5LoJx6FW7iVoNa2OZCQJdr5OZUxSyxf04RmSEKfDBr08KRhaQbKqBMABKj9Aqv9Lp/aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791943843; c=relaxed/simple;
	bh=V01dN7/IfsEO5pHq2duFtB/TRqL+3S234iS50A0mA8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JyhFhObwcaiCHm92gqt+2B1qgS6E941fg7kZP3dJGcPLR3de/xYS2UQxgSZtwZJQa6TvYON5tNGwU+y/pRcgmeppz+Ajj9da/1Lobr2Rn022h/dJ8+VDy2sBZdGdGSzxqv2MayFczPMCy4AX+qJI3C7/7JV0Po7BhDlUdnHuaZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khiVaIq7; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khiVaIq7"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8726acc5eadso28836447b3.0
        for <linux-alpha@vger.kernel.org>; Tue, 13 Oct 2026 19:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791943841; x=1792548641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0p3i0gAxxSlQHkl/PX1ueeB867F3mj3/aOjUbLcnjU=;
        b=khiVaIq781TOIXCYQdfhI0zo1v06OwgDwQ+AfU7re7r/EI0nliwzLSk/d1Xsw0ESMj
         S+wDyDj8jYlQ3RtzYoihSHwNiO6ChGAd2dIEJRRHKncKlcL9ZU6Bl/HElxOxZdVVWKrO
         3/bxfFnR+N5R25W5IaQrZADN6vdmkrVaIsGMYKwNCAp/vZ2V8kgiYbQ5WQ6ojEj2thp4
         rCXqMQcM+TvaR8Kq57tZxFyqPA0yADjkx+BVEPby0hpePPdeuH4LeFGIHjz0JevaHvS+
         Scf3Vb3fo3A2lYAayzQISW3k79nQkVc4Pe1W3oLyggNJBtEgeV6G/kp9lBuxj4EG8D2a
         3Zog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791943841; x=1792548641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D0p3i0gAxxSlQHkl/PX1ueeB867F3mj3/aOjUbLcnjU=;
        b=hIxnXSuS10dHBr9fhmkr/QAY9+JIXHr5TN5qTT9ohIaVvYgM/nc6SMlyfwy4t28QkX
         PKImR/tlHBDP6QhUVXnnIZVw46LP757QTEyyt3LHY1pLg97f4eVCAqFQTcmws8bW7/YY
         G8h6zTGcv0eyRX42TgLae+Yo33gBbNXLJbAO/IV47R/j0JG6ERABsG8TtJQR+EtB1I1V
         xlvO0fvag7jx/hVncCtixLQ5RJK6TyfLPP+A9dO0+EwVz8ZqWVZhRlIHI0a9QPNoUscS
         N0Me/P50PkPdJQayhNfuBkC5UxkDVKMmvFLavbGpJ8JMYYkjvsbKs7URAdxMaR3N+F6u
         rPiQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/267DMbekSgtsumnRGIeM8QUVo1ipuj3KxaSzY1gDCdntOiEHyITnNmzQ5pDlf6qeSDiEv2JHv5aFww==@vger.kernel.org
X-Gm-Message-State: AFq9FYLvnpnXL8o6yHjPsAhKJnyqZzzhKEy5nvRKEl3S5f2WnhUamqDd
	V9m3cU1UJJx9JIB2BXBrWrZn94WjK9FAKAfYNFqrRLhTYyKOSiK9xbJW
X-Gm-Gg: AYBFou1HEeDWRhkOkjo8LU4Xhc6jy0m9lUspGVyQoQgmby98Jn2wW4vyotV/sbgVV+B
	DWBWxueo0T1iXzd43rBVw6UHu72aAh93t0x9aE8j7tyT6p87W5wdymX/6CqeEg0hKIf9CAgxGO9
	yar7Odye2A1y1KD7SjNDh3zh057LlCuX3Owlpq6aHvYxvDOTF0iWKV44wMaXgBJumpO0KsIKFqp
	2zzaFrAmEPkVVTX9jym2vf11+tPfbAqN1NNkcOcdjIJEmXKJ3Y5lbLClHsCYOn96b/FxZlFvq6b
	R9hO9DFF1ZgUGNTEMlXRWOLVYSDSauW0/imlLXX6XP46d17wAyzTAaoWco6QXXsXXptgnMUdiWY
	eiygp+dOzU5BCevkaFjARim6lmnYH4JKpvS7MCn3qQQteZXKIkcBehKe1UHi0nhAGQWO8MNaChe
	IEiLZ8qG5HENnBoxro6eBGWdb0LLPSIIid8C+TSCJroLX04EFzd/QfDSWnBSY1AH3LF0zwwzDJy
	xRpLYip73EbgQXjHT8ku8RstK34WKSp
X-Received: by 2002:a05:690c:dc6:b0:89b:6beb:1149 with SMTP id 00721157ae682-8b07ee94aa8mr53781347b3.54.1791943841047;
        Tue, 13 Oct 2026 19:10:41 -0700 (PDT)
Received: from localhost ([2600:1702:d60:1bc0::46])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f1ecbfbsm50290417b3.23.2026.10.13.19.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 19:10:40 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Subject: Re: [PATCH v7 5/5] alpha: decode Clipper environmental events and retain console logs
Date: Tue, 13 Oct 2026 22:10:20 -0400
Message-ID: <20261014021020.3842132-3-mattst88@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013211551.991723-6-linmag7@gmail.com>
References: <20261013211551.991723-1-linmag7@gmail.com> <20261013211551.991723-6-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Oct 13, 2026 at 23:15 +0200, Magnus Lindholm wrote:
> Remove the redundant silent first pass now that every valid environmental
> notification is reported.

The silent pass only existed in v6, so this is a change between
versions. It belongs below the --- line.

> +#  define EL_TYPE__REGATTA__TSUNAMI_PCHIP0_EXTENDED	(6)
> +#  define EL_TYPE__REGATTA__TSUNAMI_PCHIP1_EXTENDED	(7)

Where are these two types and their register layout described? I could
not find them in the 21272 HRM or the ES40 Service Guide.

> +static int
> +clipper_process_environment(struct el_common *header, int print)

With the silent pass gone, the only caller passes print = 1 and ignores
the return value. Both can go.

> +		if (packet->class != EL_CLASS__HEADER || packet->revision != 1)
> +			return false;

el_process_header_subpacket() prints the frame name and, for event and
halt frames, the timestamp. This scanner prints nothing for the
wrapper, so a decoded log no longer says when the error happened, and
the halt code is dropped too. Please print them here as well.

> +		default:
> +			return false;

Your changelog says the ES40 record is class 5, type 4, which lands
here. So on the one machine this ran on, the log is never decoded or
cleared, and each boot dumps up to 1 KiB of hex per CPU. Please split
the scanner into its own patch so the environmental decode does not
wait on it.

> +	for (i = 0; i < dump; i++) {
> +		if (!(i & 15))
> +			printk("%s  %04zx:", err_print_prefix, i);
> +		printk(KERN_CONT " %02x", data[i]);
> +		if ((i & 15) == 15 || i + 1 == dump)
> +			printk(KERN_CONT "\n");
> +	}

print_hex_dump() does this:

	print_hex_dump(err_print_prefix, "  ", DUMP_PREFIX_OFFSET, 16, 1,
		       data, dump, false);

> +static struct el_subpacket_handler tsunami_subpacket_handler =
> +	SUBPACKET_HANDLER_INIT(EL_CLASS__REGATTA_FAMILY, tsunami_process_subpacket);

Nothing reaches this. tsunami_console_log() calls the function
directly, and the handler list is only walked from
cdl_check_console_data_log(), err_ev7.c and err_marvel.c. Drop the
registration and the three functions can be __init.
