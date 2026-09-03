Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12DF7E105
	for <linux-alpha@vger.kernel.org>; Thu,  3 Sep 2026 05:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412705; cv=pass; b=N8NGQOtgHckY9xQ7Kyko5N/uZ1hdVl9f/pz/AJgFORQOdKoGbhfBM9jO/RHkQZjZaWnaDpG5uEkRNGtg5t6LznFD2E09inYh0RsQj7SFtrXdKaL6SjuAcQXLr+1cVrkkdmPQeIT7CvG6p8xrC94615oRK1Pq83faK1GfGkHk37U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412705; c=relaxed/simple;
	bh=hQGwiNsBhLcjr2x3lOVklBcAjBNib2HeV4EQAoRsLt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hn+Zk+yOLEj2bVN0D9E0csCWwDpqvzB9vcHPGXYjoxYml2bkIaVjO+KmdCR8mC/N6SWpjZQ2ZGDWpweUj8UFhFC6MtR4ZlTgYv/Kl3SeRHvtTZQCGWT/Y1l8rKFAit3NKzqypQDCN08eXE2OlpkZ/nKED2rrqY3n9e3TegGK/hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcaWuZoJ; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcaWuZoJ"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a0de062db5so3339034a12.1
        for <linux-alpha@vger.kernel.org>; Wed, 02 Sep 2026 22:18:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788412702; cv=none;
        d=google.com; s=arc-20260327;
        b=Ris8p9DmT2XIvOOVr7D6ubcVNsVNfvI4i4M/Ez0ecu2+D8+43Ddac/mEIKwEHclWrW
         ISiZMiJBPzJLAOfaob5RjztvqcXK1IGX1fcOn7GQCT2mKW/xaT6XKwFfwFh0puklUfWL
         enlEks42hR/uj+SgcE2BTm82+f1u43lwkfzYpWmXEwgHj+532GYbTCmx5JBKq7UteaAv
         jnjHXHa36zRF+2O6JgCFrHGT3+oYXZPfIQ4E6DMyo9pCI35rqjLZd6+AdO7xLgx0j7YF
         RCBOLUzOqZ1lDyyh/XWwT5PXujLRBcqWnTBgEp60UHjv7l/PPxA2fKpxgouCpK7/3X9C
         Mc4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ikJWWDee5Muzvzg+dlA+QWCtKc5zclbTp4Z8G8xsTzU=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=Df3CZTcAe5f+JHpaaUms9fGegIsejV3/VFI2vwzPaB9kbP3DPBFU/oDv73SV7SrPMz
         A/lS3ujt+1tBETgwzMKg/QzTfoioGBm2bUkxnVddxM37mKjvh2Nt6vgm9FQ4AiJDaJCZ
         BXgA/HfBZASLZyYU6ehsIRzJOx0MfXvQ+Fzok0HKSXH06Lr9+wiuHgmPgov1gbPTGxGv
         3GQ5xUCvhRRoPegFgCK2vP110m7sUF8s8f1sjkImRk7QfPc5h/7L9CisAhDlN5eqUM47
         EKpc9dO8or36tapqoeRaoWQk4xzLBNxxIEDL+Lj0xZQD3q+yAwO2DQtlwoFEYIAn6FpM
         a0jQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412702; x=1789017502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ikJWWDee5Muzvzg+dlA+QWCtKc5zclbTp4Z8G8xsTzU=;
        b=WcaWuZoJmkCPwLYZeM1h6oxaCRYffc3G1J3mkQciH2WZ0ui6v+XMcdlI0oy6rlKb/i
         2SOVh8WcENmVEmX+uxlmhdj7AjCQcBAFMaqTDyJ3CBlwavcyT30rMhRqBY9BD0VN0/Ns
         ha3qXKUEBC197cgw3QB3fizUh9b4+tHInAlO2YngrMnTtZJOnFpCT0/y3CdG4d/PM+q9
         /tYLfgLPUg8bUlNyJjcDauxppergC3w7WuJ/RfZb7EquduEu81Sb2RCYVzkb/r9TKDvc
         KM7V6vo4LhpkEkV9l49UxjV26lkvOIzPqo7HalwUEwchOf86pmuKwtgaJa7+/NSjNSZ/
         AwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412702; x=1789017502;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikJWWDee5Muzvzg+dlA+QWCtKc5zclbTp4Z8G8xsTzU=;
        b=gmblqDDMMTDWkB26gYmPSnofDQ0h737foiXW5o0z/ihh9fzx+1skfzPg0xYXaPsHnT
         QH5w6rcVAr5MpGi1Kd8wj2YZlFDAdl6saaRjK8JfCyY7GgLy0pXs0zzdi+S3WZiPzoZB
         weZ1xhIDh0f2Zf8ugzhbcb/8SsNrLhHeGJbyP/28xDV4/Q2yWSSa1h2ebZlCc3Y6Ovq2
         /+AZTO5wmdczMLwF47UN5rMHfiEsDyaLK8HOSaP0VLiAEA4QygdYsYkiVKCCKNKil73W
         8SVEoeLqSUCZsOW8xPZAmD301CLZmvjzfPkovn6+r96pemvlY0HKgKkw/N2vy2OoC8jG
         4yjw==
X-Gm-Message-State: AFuF++k9daTqaanlEY3PDPfp+pk2Y1R12QKKwVWQcdIAif8QJl8pN+tc
	9SYHmHS8pKZnZNuxby3fGihWxjMVn7Bf2+WbJWg7BPsQS6f6WtMZ95/iaZh5+bH91WOtT7Sl751
	epIpHVHFiOJV3NLRdzzGGcJNEGVFS9B4=
X-Gm-Gg: AYBFou3U4rB18LsHbnaDT2NFDN7JWtSIJGpDvOTWHLi7fNzo/g2SmBZ4i9Jbd2hjarB
	OutAVw2EWCdPNmcCM7vEJAsR3wYYmYaV5a5G0CZSBUHvNpajbqNh3A0QIcI3EHA8SEpKRbdd7yW
	64dldB2Hnc4NZTWJdqg5mkLvcPNTcWOEq08ww6djAge6xG0NZ4b8Ol17IoyGtLsHaX3QOWn9CgY
	QrOXzHytHjUQ4smuc1tkp84Wz/UuC00ToRNPo5O2IQ0sjzgdygce8I6RsdL4VDV6omVjP64LKbQ
	UqF3cZ+rqDtTazaLZOK6QcMG69XefCATSeOL8Wbu32BYto3a80oLn31czOhuRKKXU/hChGZwZ2n
	AviFqTIFTOPl0WzVQmrk5Kxxbfk+2MWM=
X-Received: by 2002:a05:6402:21d4:b0:6a0:dda3:83db with SMTP id
 4fb4d7f45d1cf-6a6818d24f1mr6640392a12.0.1788412701843; Wed, 02 Sep 2026
 22:18:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <7f44a90b0479bc98b15fc5ff4095ed555d33e805.1788277742.git.mattst88@gmail.com>
In-Reply-To: <7f44a90b0479bc98b15fc5ff4095ed555d33e805.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 3 Sep 2026 07:18:10 +0200
X-Gm-Features: AcwNN1UJWKF1dweJFPbkwbs0re3gejXqbNx5ovSIuGBRoGj-WcE8-7WNhKzB9S4
Message-ID: <CA+=Fv5Q74ZS_rL4qRpxX4fsdW9eCZkk-C13E3-aqgxQhFnGApA@mail.gmail.com>
Subject: Re: [PATCH 19/24] alpha: discard .eh_frame and the relocation sections
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> gcc emits .eh_frame for Alpha even though the kernel builds with
> -fno-asynchronous-unwind-tables, and nothing in the kernel consumes it:
> the stack trace code scans the stack for text addresses rather than
> unwinding DWARF.  It was allocated in the loaded image, so dropping it
> shrinks vmlinux by about 1.1MB for a Marvel SMP configuration.
>
> The .rela* sections are equally useless, as the kernel image is not
> relocatable.  The linker was already dropping their contents.
>
> Both were being placed as orphan sections, which is what drew attention
> to them.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---

I verified that .eh_frame and .rela* sections were present in the
linker input objects but absent from the final vmlinux. The resulting
compressed kernel image also booted successfully on an Alpha UP2000.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
