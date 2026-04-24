Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B25B333440
	for <linux-alpha@vger.kernel.org>; Fri, 24 Apr 2026 07:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777015019; cv=pass; b=cY3hDxhyt6qcmeA7nPTaB+nj+W2PA1Alu1h90+CETvCc6sCG7v6cs3W2DQdrmiPCHB7Ow/QoyMv/QYyZFxLBfaaCZOMdNbwdt0Aj7dQmdGhwq7alv50fx91TK5rC1Ds9BAaEH5+QUJajr15XSwGtJm4evNaq4jgBqAGMfers6VU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777015019; c=relaxed/simple;
	bh=W+ssi1VXndSbA3jTir7s/4LRoYtNUVNtJuZsueaDSGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MOpCsgeVxlc5YzY2DHlaI3h/fRhwRKkQ6khl9QsisH4zcgtq6b/XhQQBuPyt3UNruyxdDNpLV2RTHazuTg0E10ArYU1Hd+1REctRe59vzt5GEDMb9qZrL9MYl2CP6eFhEJw3VGL1wAeIhay2ImV8wt1oeybTXO0QbuwLW0MDcPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ii/v758E; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ii/v758E"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67893fba9c3so2357674a12.2
        for <linux-alpha@vger.kernel.org>; Fri, 24 Apr 2026 00:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777015016; cv=none;
        d=google.com; s=arc-20240605;
        b=CXfldwKssMIzuY2n759LCcM+gRWx+gj/9dYIe5HtjuCr/9xvbYU/vvLscVfu5PU6Tj
         OhC1F7wyhGcl4Ryv6hbv88iotOq7XD86hURLA72rvqMAzvad7M2yLTL32hHKche4fhON
         qO04gtSMe0SeW8SaNW5PqIFeTEjEQd7QPBi/v7lQOsECcHsOzGl8yIURHDkWw6DrmTgg
         yQFO9rcGB4c6qxhaUxjbRdNyyVbRX//VwbZO6li5OEx1TFT713V7cCAzA3voXVWKHquS
         cWaFcreqRWAjYlutox8HH2xu7QH9A9SDhh0XrddstQCFAeQCsXeN0xq6sGw9m63gjTFu
         0fcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8uv1ap7wfpWSK/rjkumTWgHiVOSnLQXCSFDMADgPR1Y=;
        fh=aOetBlYVA3iV197WdESmX46ws60p5ouKvoxY2eo3xDM=;
        b=A8mK2mlqo4b/YOIoD65FjCq9Zi5haCNnlA4Mka6s885UHNsB5j5IZ3vI6wb4g0gWnN
         1hvhWAX/No7LMPsLIBV46yLjSKUVHFLbumVUAa+bkmeMY3MB0O4+iCFdpWGakTk9c3as
         V+2p6zRMdJuk5+2jRhgieApXR+ZJfFqxY1bjWEB0JOupl6XoRmJyZGOjTqP+T/zQY0dw
         vp3i8TU+g5jRJh7zqDIGPwhmKgl28sGUtkUp0J8Aroh9MCz+8qEp8tl4ezq92u7Nyx6o
         s0zGVyaz+rjT/kXAUhO2uxTS8kNslK/C+s9vpjvFFY1ub9PTPWi6K07juOIxEQgDHJIl
         g59A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777015016; x=1777619816; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uv1ap7wfpWSK/rjkumTWgHiVOSnLQXCSFDMADgPR1Y=;
        b=Ii/v758ESAPCph1vuePCXkFXQqx0DIewWiAP07QoulSKxGGgKcF7EQtj2F//bLSVrp
         Talx2NtuhA/ZUOBYlmrO8renTgK6nt+VJyOjno4TJHW4h9ly6b4bRXvr7ARjBID1riEr
         68MUQnetBgUwPdBwa6ZKbyOFeLUUzzSkFXmO6ARbMYRVTQJgup1FFTsxJVEEb9S5Puy/
         6JX3j5/S/ZxI2cunsZYGL0OZuP9uRdXtuQlOfc/hwg9lXTYhrK+iSiZfzqGUEyy946f0
         s0chDp59e0d913IZJYSiAXs9zNEGqVw9BiUldEhCCK9UHAW54FloxLHH9dGsTq8Df+7v
         d4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777015016; x=1777619816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8uv1ap7wfpWSK/rjkumTWgHiVOSnLQXCSFDMADgPR1Y=;
        b=RZSm59+WpMamOjHk7LUyKtUNBWAmP1kuJ6dMz/+LvwBWSFCFhtfmzzx9kuKNANq9nr
         dcRSdodFQg9H687qkSg7AglaIXf1An/VDyutNTOEonPGgXtiMjPv+YqEdFsieDZBaI5Y
         zbKHio5AuEIV4iXt6LSYERir96NbIwa3ZVYNkBOaw/MFtQd1+l7gqFLOgXyLp18VFJsA
         prLCrMK1rqwZVKxMcK8FejXVIy85LpbhJmG27lwRlpKdp05ngmbx5pHRZhplb+CxSv4N
         jV73F3SUhJJjK0GzQLRN2Z27x0ovAkfKtvptHoA1ZmySkLSOWAxmV0C0U2SLEXuCVMyh
         hHpg==
X-Forwarded-Encrypted: i=1; AFNElJ9EbW/W322vqr9TKfYL5JGqm5b83O/YatYXueBNvuu9f1dY4QiCBMVmy3xWQRBFAmraorhx9HJsMz+CVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5teC6y53zNtPWau90quPnjqxhsWi+CLRKFpgIJPHLFVvMfGTQ
	HNptefWMf6+9JHUo5EF8mXtMnDls0y+SMyds9/QThnyXH/RayywF+xrqYsOEkrRaBLyp/6ynirn
	i4WS+ohSSsI0TWv+GX89JYlOmK8pIBI4=
X-Gm-Gg: AeBDievxMB7+8G72r45A65P7tRivlRQ4x1/nN/0fWQFcIOQhcTOZehKzwvg8SquCtw+
	Vej7MxW4FNyMcdKi93K4Vn621qf+kkspNr0kEovQiz914f8NQwArVKhrU69lxuEOsVS4sPiTrpd
	/n28xAq/a+g5AcD/FHoe1zG1FLQcsHzGmasHjqcxuYEj8cv0mgqTsFZYfRUljaCH7HlLy+w3wY3
	aVP2bCNg44LF/uLHkhyIaGyjq6FjyV2yhlnMBkQ09q1XesBci7hqC0xnNC6FpoddPJHGdM53+Ow
	YC/chT0o5uA27crZifJtK9hUU8c3B3xXL/mqrP/awAHoLKH+xoU=
X-Received: by 2002:a17:907:1ca1:b0:bad:dfe1:6a56 with SMTP id
 a640c23a62f3a-baddfe16c2dmr60367766b.30.1777015016077; Fri, 24 Apr 2026
 00:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776808209.git.mst@redhat.com> <006f9142e591ba8c340c3b354aee76aec5c285b9.1776808210.git.mst@redhat.com>
In-Reply-To: <006f9142e591ba8c340c3b354aee76aec5c285b9.1776808210.git.mst@redhat.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 24 Apr 2026 09:16:43 +0200
X-Gm-Features: AQROBzARFJV36R4zYM7xbfHPyy5Ua1V3EjGjDIipUn9qIBzgKGxem5ahIafz8os
Message-ID: <CA+=Fv5T83qH-c0U4eXO84HQmG=225SepaxVYzrpQh_CWMhG5hg@mail.gmail.com>
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
	Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-alpha@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 12:01=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> Now that the generic vma_alloc_zeroed_movable_folio() uses
> __GFP_ZERO, the arch-specific macros on alpha, m68k, s390, and
> x86 that did the same thing are redundant.  Remove them.
>
> arm64 is not affected: it has a real function override that
> handles MTE tag zeroing, not just __GFP_ZERO.
>
> Suggested-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  arch/alpha/include/asm/page.h   | 3 ---
>  arch/m68k/include/asm/page_no.h | 3 ---
>  arch/s390/include/asm/page.h    | 3 ---
>  arch/x86/include/asm/page.h     | 3 ---
>  4 files changed, 12 deletions(-)
>
> diff --git a/arch/alpha/include/asm/page.h b/arch/alpha/include/asm/page.=
h
> index 59d01f9b77f6..4327029cd660 100644
> --- a/arch/alpha/include/asm/page.h
> +++ b/arch/alpha/include/asm/page.h
> @@ -12,9 +12,6 @@
>
>  extern void clear_page(void *page);
>
> -#define vma_alloc_zeroed_movable_folio(vma, vaddr) \
> -       vma_alloc_folio(GFP_HIGHUSER_MOVABLE | __GFP_ZERO, 0, vma, vaddr)
> -
>  extern void copy_page(void * _to, void * _from);
>  #define copy_user_page(to, from, vaddr, pg)    copy_page(to, from)
>

From an alpha perspective, this looks good to me.

Acked-by: Magnus Lindholm <linmag7@gmail.com>
