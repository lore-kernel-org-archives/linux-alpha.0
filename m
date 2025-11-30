Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D92F1A76BB
	for <linux-alpha@vger.kernel.org>; Sun, 30 Nov 2025 22:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764540995; cv=none; b=q4eB+lEi5WPEKApi/K41sQiBrqyp2i23m208UAQ/hCk0xxs2I4VrC5AsHw2FVxSsjEywCm4yXR/6Ce+GPmXmOdGq0doIpQj0VPCF/HtzRzSZdo/Bs2qf1bfoAEXlggxB+j6BMO23GUxvLTI4DhZ1hQAC9ohUtdDIap7o1fhE7ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764540995; c=relaxed/simple;
	bh=8tD2GuEFu58eP6OwhB0oVa83IQoUfjy96Mxsq1mNn44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ukgT0Psp9cOIdZ4yM6fMru+sc3uPcSov29SbQH+MB9YjsZ//TVqFgBHwD+/fr/WuW/4pIrYs5iiFqnEsshD19YIK9VIceUuZoizLMWXwkwm4vWxbiqAgmotc3btRxeMaL0AvfwMbMN20Sgincdj2VeeIvfT6dieckI/0iJ//6OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bDIsDwt8; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bDIsDwt8"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b73a9592fb8so914444766b.1
        for <linux-alpha@vger.kernel.org>; Sun, 30 Nov 2025 14:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1764540991; x=1765145791; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OcRycMVHU0Hww8GJa0solfhWtGZ+LWi9BgBVF9tAJWs=;
        b=bDIsDwt8lGEtsnUZFAFzaLACPK8hcsM/IXntCmrPZlsem3d7jgCGSWZ8WKXcl1ce4I
         32cqulgiYxq84R6N2Du/u3TyqCa20iUXV3HvAPai66VSq8sDLlgcDgZE+XKYcYmizD7r
         olVyI9NQ5kbBpmPchw18lqvFzoZih53j2tbSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764540991; x=1765145791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OcRycMVHU0Hww8GJa0solfhWtGZ+LWi9BgBVF9tAJWs=;
        b=oPdlydYGA22ilzO8tKAFlwGRaDg3psrtXcvMW3s1+q1KsY3/WgANQc3RsSA+kpz7tA
         3/DMdO8q7N2i8p3+CVUoopMexSTNguG5OREYJRuZzAPKdKF8W/MNLyeuDdENPxCinudE
         A82GAGqzIEThtr48l+I79pWdahJ/yNPAsfc3Bv1xmk3/UsLObenulmBlShlvWeR6ZDhO
         3VOuVHYnI0s/OalJ+FejPvD75ou98ldhjvGi0frwUJk9xOOSd9gT2yE/xGfX0jQKJN2w
         p17rN5fuE8bnHNQLnznkW6SFGaHfNKeDrOug1+ppUgjsxMAcWlC8eZIVS/spRxHPq/MD
         lnxw==
X-Forwarded-Encrypted: i=1; AJvYcCWUi0maTW1BFFabN3i5seh8zeXH0P6pnhCb+jPLhV39U62nNE3o7TdxxgHtEI10HEwVddH97jJ3C7sMUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTyHYv1TEbgr6yMNB+9lUcLuddF7k+JCHaPQDE8OVTtZR02y+c
	7iy8aL2txHY1wGgj8i8Kt0gde7K24ys5gUuy29pOkswU01JZ2byp+H/zilHIlukEoUjnOySyGuB
	6lQ/IX5A=
X-Gm-Gg: ASbGncsMGKgMy1ijPPHvya9SM9vz2Ww/dcpv6wRqldcknQh911eUS3IPTdqztJ49aUS
	+yqFVzGhIUma3Ti+r0k++uXW9O2gmAJI5LucZxegvlHTMEEWvuXdjKDbqvn8F6seOP53nAq+9wP
	inCh5DxOLKOQIz8oo+EeUn4a1388PVqd2Vfbhsqxt+vHd/Rlj2C6RMZHNA7+u+sursEu4Y+Sbsm
	VdpC+AOg5k0xXhTMyc7recZupmaq5l0hCZzKuTes2Ou6eM27CBYVcHeemAqGxlHC3OpVc8GqJFH
	DrHVFeftHM1zbq4ctOAYb4uxcyfsAXdflFFTA4OupdpO/94HWObngIUEVHa2u8fXtg/M8vEizSL
	QYkFq6gHWMqUsPEi7KrdqbpG+Wy3RdPbtmtVhsL5yMMeDV/pHSTk9gTD1KPjOXbUXRZ0jCd1Qlt
	0jw7Bd9sNZsmGv6jnvWd7TXW+QbDbnR8z2lTYQlFggxkaCeVVbbwDUcKpMMK1J8JfUSybw0EY=
X-Google-Smtp-Source: AGHT+IGfxRJMjOxjpwB7fbQxOYUF8X0HlNCLsIeumogak5pmwS+TXeKTHPOmbpEf+mTBW9n36qvUug==
X-Received: by 2002:a17:906:3716:b0:b76:b928:eba2 with SMTP id a640c23a62f3a-b76b928ebcemr2359241166b.12.1764540991031;
        Sun, 30 Nov 2025 14:16:31 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a7afb4sm1028946566b.70.2025.11.30.14.16.30
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Nov 2025 14:16:30 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64165cd689eso6805555a12.0
        for <linux-alpha@vger.kernel.org>; Sun, 30 Nov 2025 14:16:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVERV1M7bGlJKiwAo878JMKJMTHRDNTpf23wA+NVaKFK2ChbhDODPSFh3pf+g2Oim+3hlDfTzb9w2dMPg==@vger.kernel.org
X-Received: by 2002:a05:6402:42c7:b0:640:b07c:5704 with SMTP id
 4fb4d7f45d1cf-645550f2186mr35236789a12.15.1764540989792; Sun, 30 Nov 2025
 14:16:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <20251126185545.GC3538@ZenIV> <c375dd22-8b46-404b-b0c2-815dbd4c5ec8@huaweicloud.com>
 <20251129033728.GH3538@ZenIV> <20251130030146.GN3538@ZenIV>
In-Reply-To: <20251130030146.GN3538@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 30 Nov 2025 14:16:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjhgYWmSA0zyXxWr+5T5y_aLWkZLXj0i+xyhVz0Q4jL7Q@mail.gmail.com>
X-Gm-Features: AWmQ_bmTUCdJWcv7cINUl1_LNv_Km0lC6yoktUJAc05I0M6Vkfdd5_maAqPfL2E
Message-ID: <CAHk-=wjhgYWmSA0zyXxWr+5T5y_aLWkZLXj0i+xyhVz0Q4jL7Q@mail.gmail.com>
Subject: Re: [RFC][alpha] saner vmalloc handling (was Re: [Bug report]
 hash_name() may cross page boundary and trigger sleep in RCU context)
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 29 Nov 2025 at 19:01, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> +         Default is 8Gb total and under normal circumstances, this is so
> +         far and above what is needed as to be laughable.  However, there are
> +         certain applications (such as benchmark-grade in-kernel web serving)
> +         that can make use of as much vmalloc space as is available.

I wonder if we even need the config variable?

Because this reads like the whole feature exists due to the old 'tux'
web server thing (from the early 2000's - long long gone, never merged
upstream).

So I'm not sure there are any actual real use-cases for tons of
vmalloc space on alpha.

Anyway, I see no real objections to the patch, only a "maybe it could
be cut down even more".

                Linus
