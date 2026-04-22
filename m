Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99982296BA9
	for <linux-alpha@vger.kernel.org>; Wed, 22 Apr 2026 06:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776840888; cv=none; b=nzp7Srz+UFR9ouYf7BU38/0kQT1LyxLrjyCvJHIzVrleza0kDahD8KTGtdAALj3pXw0pIT/7naHRwEHYwj+HdNVFfG5O9iKCddZTWsR2SLZU3jG4hDox/06/XkRaHbxHtwOPyMWCVl7zv5fQ0ina/iNOn3tseBh8UGZSh4WJJYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776840888; c=relaxed/simple;
	bh=M5g0U17jf72qYxMz8kLVwYzsVn+6qWRz8++xq+cwags=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b9zfm/qyoBGQRD4pKOFVgPJxT++RpPfXun3ud4ixgZyWZEC+z9CqAYgrgqxt7svMgeppXm8xCCzmNqL5WiqOIxl10ZWSVZwCVu7ECSgoRskpq/WZnbl/TQLzilVTYU/0FKbb8KvHuG0CYKVeXNm1pkA/nRBsHiFv4F+LBoFWv7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56a9076813bso2098980e0c.3
        for <linux-alpha@vger.kernel.org>; Tue, 21 Apr 2026 23:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776840886; x=1777445686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyxMyDKhrlWE+5iCHg59pMAULgdQUBAeBRtLLkE5UPM=;
        b=kY4ILZwCpGjdiYr26qUvMxeWrj5dr9Fo454LRaGxo192UcNwHEtFVPcmIZQOPBSACq
         A74P1a1EAJssPdPGxXF1Mn43xrjHXkTOC9pfKBJM2aC+Fai14WM18dlc2jzm/L0QuBIT
         XBnxXH0PoqX/F6foVtSoltE3ClCpChIMKI3NFatUwdNKm9AxJEaobiwPgHWmr4fIuILb
         gD9uW1Tl9HZa4ZzKk9hRqA3fZOONhmA7DfmsWUDZjbFN0NhQElDo55WJFtGdFAydHrcu
         88Un4r+9ac3I7mPT58z9vd/wfxZF+4xNEE1y9jR230bVam7yhtFjTA5Ta/jvDo8VaHj0
         Hfkw==
X-Forwarded-Encrypted: i=1; AFNElJ9rVD3VMMmyjg+9ooi5w039+axx/iE+jw0zCzQAGgiVP8VMk0M9yt0ZSwyjkGscpbuBmFyqpYWrBLxguA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy10fGN8SCRxsjnQaR9yBNTNtcLM2kEsymk37KebtEvGcG860zy
	hvjinzIqYaqMYjTjw9LpbFz27l3mxD5FLIwhdhO54H096LX5Dh0hsS1C+JbP34q6m0U=
X-Gm-Gg: AeBDietdUkOioVxqD5jholt8ACj2AC02RHkUmdYzP79kmTlBG82llPyCbtJ6lnXKp8c
	h5bm5pcmhFLNl20/eKNGXvqvIGWJuTfQwu2P7IqCoI51HFzONc0CDt1DGxDWwlKYOEj3sBXq0jk
	frxg/Sv0DMTT+djsDpirKHYn5k7WDhX3q1wgeP1Tv74ezktQlh3fq5gukSNEZu1Tg3ytitsqAHv
	oXl6ggnplHFBY32HnpxqW/KDAio3KmQ0lAroPEURoFKEDi7UUnrkx+FC94YVzLn4MckVvD+QCNj
	CkrLMP4IQSSsUDNkxZ/sU9D68NgISfx7U3A7dhU6GPmGi4UWRx2+Q1Z/3n1K24h8krf6HpGhfQ1
	dyAW3CAdCxhmflMD+/kuvjjC3ASstqETkhxGJjZUO2r9V3YwqPxdMz9urmj1ww1wYTNCmqvbIEy
	vWiBEGHXumP824grLAPfHz209clR06ByfqN+gobZd96+bZSdEufDGP567hQatFhvtd4U/uYjQbr
	Is=
X-Received: by 2002:a05:6122:4589:b0:56f:6add:9041 with SMTP id 71dfb90a1353d-56fa5956d62mr9150453e0c.11.1776840886600;
        Tue, 21 Apr 2026 23:54:46 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa93253aesm9123145e0c.14.2026.04.21.23.54.45
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 23:54:45 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56a9076813bso2098969e0c.3
        for <linux-alpha@vger.kernel.org>; Tue, 21 Apr 2026 23:54:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/qGN3+4CXRGGm6NwilrQU0udeuspuY2Tarazf7laosCZmRCIgrCCZ8LZ87SP93+TuOs4Tx1wcMSf9tQA==@vger.kernel.org
X-Received: by 2002:a05:6122:f84:b0:56c:db8b:504e with SMTP id
 71dfb90a1353d-56fa59fbc9fmr11532873e0c.13.1776840884876; Tue, 21 Apr 2026
 23:54:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776808209.git.mst@redhat.com> <006f9142e591ba8c340c3b354aee76aec5c285b9.1776808210.git.mst@redhat.com>
In-Reply-To: <006f9142e591ba8c340c3b354aee76aec5c285b9.1776808210.git.mst@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 08:54:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUtNPY1=92H8GZSDkQ5_rNnxL6WkjTF=1ApjwTA4z1TqA@mail.gmail.com>
X-Gm-Features: AQROBzCgl_wyqpfJ8JAvw4YHU8svwkzmMCs8RMYgDiGFQgsN4z72BoUKVxkZaoc
Message-ID: <CAMuHMdUtNPY1=92H8GZSDkQ5_rNnxL6WkjTF=1ApjwTA4z1TqA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 10/19] mm: remove arch vma_alloc_zeroed_movable_folio
 overrides
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Brendan Jackman <jackmanb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Suren Baghdasaryan <surenb@google.com>, Jason Wang <jasowang@redhat.com>, 
	Andrea Arcangeli <aarcange@redhat.com>, Gregory Price <gourry@gourry.net>, linux-mm@kvack.org, 
	virtualization@lists.linux.dev, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-alpha@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Apr 2026 at 00:01, Michael S. Tsirkin <mst@redhat.com> wrote:
> Now that the generic vma_alloc_zeroed_movable_folio() uses
> __GFP_ZERO, the arch-specific macros on alpha, m68k, s390, and
> x86 that did the same thing are redundant.  Remove them.
>
> arm64 is not affected: it has a real function override that
> handles MTE tag zeroing, not just __GFP_ZERO.
>
> Suggested-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

>  arch/m68k/include/asm/page_no.h | 3 ---

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
