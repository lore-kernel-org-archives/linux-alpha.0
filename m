Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C90426C38D
	for <linux-alpha@vger.kernel.org>; Thu, 11 Sep 2025 07:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757575757; cv=none; b=FP/NKc69NCT/GKZzhO0D6nUlVtrdJKm7ysXXc7XpzKjmxZRPPVzPmRICffCIq3n3gJRyyQAbg817ujspoaOMfmnpzCBpQZPvD+6CPKgRgPP0CyIYb7gDGZv3X9yyZAP39KIMpsIY0q1747VcgD6OIkmh2RMivq3bZliWFfgrqH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757575757; c=relaxed/simple;
	bh=TEIRZT/f9ZFe+n3XMoz5gFPwp4mNtoqn58IEZ/HkxUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u6DvlMZPgUjqMToDstq2lQN8V7xAc4OQHhEmfXAzg2j4I72lm3TN/nHNdaUd/HL+8pHxfZWhvAry1eWYusiUPgaGxaampaSAQ5PR52Xya11FDbWFuAgYMhwxBodKrvchHXyb50mnjSsVjpQa69rJN2PGnH9ydi5DxfxdnWhX3sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-544ad727e87so278808e0c.2
        for <linux-alpha@vger.kernel.org>; Thu, 11 Sep 2025 00:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757575755; x=1758180555;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XaFNAAT+NA6RCTfsICXLhuiGjMghVZ0R7BbTGO2fF0o=;
        b=fo8OtcQpcXEyIYoscjFBG0cwqb8l9wCA1otC808jkKEw8fO2ISJi0RpqYQfbrdISr7
         qw2SQh44YH5Gjkpuytqc3dQHZdD3HGRB45Pc3lHmFjcOnzjM4QjoYmQV1nGr7/jo3gkj
         SHtsFR6dtWkQlOIbYT72jEylAFBGHwZhZ87oxGjAN4b5KcXEc7jdhvffAteLJrGY+m4F
         bAZnlbNqK5oViWi+s7NvEjbEbDQ43K3+PFI2hxjjivhEEAFnBZwXIPQV+FO6DDg4RAAN
         +Zogs3IKHwkHBlA3EaFsE3TwECkoYxdRuBIbVxDvLJjC+FCuI8PRseLhcYFzkprI6lCQ
         lpxw==
X-Forwarded-Encrypted: i=1; AJvYcCWELS1monIF3311m38AyZTDwYWk29gdADsB4Ad77cNJlUAITP3WQyikwjBqpARE9uJN0cSyVaG27UIVfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZsduPhf/ch4vgpWkmwfuyIXqeBmOAAS4C6AZ4YZySacOjm5iq
	LAvagbVJizDaZsqSL055fqQkQXYfi+uUK52UX4MHF4mGUjCMI0ocssXrRr9fg/KJ
X-Gm-Gg: ASbGncscfTQWuEvh9o1a3uvhmtHn7qC4Z3YmnUVHjmnfY6R/YDHIE7ivOcplOwNrBg8
	WhPhRnii8cQ8Mkav8y737/KGif+CsQYiFr40e3tnl1J+I7AQfPG17tkxS3k8ZNsB5guFITLnp1S
	6TzgQGbWkU3G0HWPXWtai00tYMO5QMurtK5bxP4jAAJG3pWWStaV4tMbbTfbXivsht/RRY7g4wc
	7cekIabnNH9XKWV+CsBGrMy6T1BE1k6I7OZuvXKXsn/njGByLKiX5D4GmRqq7dokcUwOeS3QioW
	ufznCLVJyMJmgPtT05CNc7ZjM92BtiCAlvzwsj3MjoNd74zU8l94F9BtMV1nacHrv3jESop7JSO
	JxgtHehzSBAJ42nbiq1XCkgZVh+63Q4Y2dIs5gQV8gV6sViwaYPqlUjrHDt2XPf7C/l98XYUM7+
	HfCMDckA==
X-Google-Smtp-Source: AGHT+IG+gGJmyGOOxjr3tVaXv40vY97meEjI7hCRgVoYK0YDGeydJy/q8IyxhhbVSgd73gVAAwNgHQ==
X-Received: by 2002:a05:6122:30a2:b0:544:9313:8387 with SMTP id 71dfb90a1353d-5473d478dccmr6495157e0c.15.1757575755025;
        Thu, 11 Sep 2025 00:29:15 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8ccd4d1a8d5sm132395241.16.2025.09.11.00.29.14
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 00:29:14 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-529f4770585so316603137.1
        for <linux-alpha@vger.kernel.org>; Thu, 11 Sep 2025 00:29:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXMXscUS+FXRuyzsPoa8sdyP3mkSZfNA9vboCb4503GSp9QhUkRYSgzU1xZ/Q7rDeXX79Ux4XW5evBSfw==@vger.kernel.org
X-Received: by 2002:a05:6102:3e04:b0:538:dc93:e3c4 with SMTP id
 ada2fe7eead31-53d21db6e24mr6555906137.16.1757575754614; Thu, 11 Sep 2025
 00:29:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250911015124.GV31600@ZenIV> <20250911015306.GB2604499@ZenIV>
In-Reply-To: <20250911015306.GB2604499@ZenIV>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 09:29:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU33x6yVYO143cGCnGAcccBSthjNg9G7uyp=0oOXJvi5w@mail.gmail.com>
X-Gm-Features: AS18NWABAcMzYPBfj9VhQL9kwryCB7SJ28D1zs--UCgO1nL2MCGED90_txRXdwg
Message-ID: <CAMuHMdU33x6yVYO143cGCnGAcccBSthjNg9G7uyp=0oOXJvi5w@mail.gmail.com>
Subject: Re: [PATCH 2/6][alpha,m68k,openrisc] PAGE_PTR() had been last used
 outside of arch/* in 1.1.94
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>, 
	linux-alpha@vger.kernel.org, Michal Simek <monstr@monstr.eu>, 
	Max Filippov <jcmvbkbc@gmail.com>, Jonas Bonn <jonas@southpole.se>
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Sept 2025 at 03:53, Al Viro <viro@zeniv.linux.org.uk> wrote:
> .. and in arch/* - circa 2.2.7.
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
>  arch/alpha/include/asm/pgtable.h    | 13 -------------
>  arch/m68k/include/asm/pgtable_mm.h  | 10 ----------
>  arch/openrisc/include/asm/pgtable.h | 14 --------------

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

(I would have just taken it if it wasn't mixed with non-m68k stuff ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
