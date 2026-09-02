Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223763EE1D3
	for <linux-alpha@vger.kernel.org>; Wed,  2 Sep 2026 09:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788342146; cv=pass; b=iE/VAb9o2PToJFzI0tFQVjaOBHbJrrrfHohLzJVQrm6kuXk8WuNdnureAasWRPgJXwFVsO20ky90TMTjNkdrfjV+cSMxqUHOZESDsxcP0tmm+vJYeulXmC9vgc62Ee3XvngZAMTj8TOiQsB1WHX1SQPtfyAiN0OlZp3I5sqNTAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788342146; c=relaxed/simple;
	bh=TZPdm3JlsBSyBiqpPl8P3NLVGhX7z88eUZs7iLPLnDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CsJiuUED3kvzN/VwTB+eEc1vKeDYymvX6a6BL0YnTjqKl9ZEMNRLCGf+rIcKMBvHfKn5Mk/zjeas9ABIaF0t1jB54MbNYiFItB7SSQTYTt9QLBEyG0MAynnW2KuwD7qVZopXzsnVEqz3DUIZmlxW3u4+f03aPaKc4UsClMX4ODo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rcX9zH2I; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rcX9zH2I"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a6868f18aeso762148a12.0
        for <linux-alpha@vger.kernel.org>; Wed, 02 Sep 2026 02:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788342143; cv=none;
        d=google.com; s=arc-20260327;
        b=VkMs6J2hOmu8Nt17jjn9lUkDhJFw/4fZZvLPZ0MeZEs3LeC/m+JMzpMe6hrO9UKxUV
         I/2Y6KoCdfiirEAR/5bPXrUpZcI2bDUQbKhtkCsUv0CEpb6RB7ugD5rS5yJTffSiEYLQ
         4jWphpAhQkkiaSAxYd04yqRCQYc28Z2SMwXbBYJtP0IdZJdXVdwPf4ELVBbxt+eSaSVn
         QcgQ525aCOCJ0gJWIJRKRRPY+L4LOFNlzfZ+X3DP5O/R556IhhDmFHqkQQylV8i2vISe
         uCBLFlu2d7kxzD13h0sg97fB6nrRb0VLc8z9oizjdSnyDAIgBl2IknOxcEBf8AoPfC/K
         qDVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TZPdm3JlsBSyBiqpPl8P3NLVGhX7z88eUZs7iLPLnDo=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=Zss4mav4ETvW2Iny49N+ralaMLF1sLppkbJcjbvFc2w4tqKCXX+o7ZEINOdoJrsfgL
         8+6JcfWsSPE4858TT8RDa+Tip6L46lsIpSUonrpQqgj9EO1BDMrG8FFEmGOrwOPUJJfv
         bdUW4VH1vQ28zFnCca9tawG2A4TxdkF6i06RK7slWPeGQ07YEvHrbKsfpjvqWafiGAtP
         iPXPiC/lVKj1eBaRKbOvrMdNUTzARXahSk9uR4ixZKA0sliwRdYYVgNWc4a+p+ruVUtY
         w8RKxEzweP7mpnSxBYlox01ZoGOuo7sIx1vfGy61duidNfD0D4Tx+GYrZrCdV5OUONzu
         SFpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788342143; x=1788946943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TZPdm3JlsBSyBiqpPl8P3NLVGhX7z88eUZs7iLPLnDo=;
        b=rcX9zH2Ifeuk3ERm+Cu9uR2vE+z+gkZJ+VPYM4C5hSit4LJaW2BUYXBRhax1dXPU9Z
         5L6S699yxyKkIsdQSKjyB6qDkATkJogANVwsGMCp6bzDkOVsFhpSVl4bSQDMWowwF50x
         F6P2hhJ91V9x7Tg0RstiJ+l/Qyu+fvOl3GLAEv3Vlflfzkvn6y9Gxne2knmOxgej1U0J
         w5RbGdQQznSCrDeiy/FsrY5SgxTw4A1mkV89X1T6fPhVqr6wGhF2CTwwqZxJH+ifKADg
         JgtwKEKx3gIutTWEj/6ieV8Y+baKj49w50+fzLletTp80xL65L3/a7Nr0P/+jAY9I499
         SENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788342143; x=1788946943;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TZPdm3JlsBSyBiqpPl8P3NLVGhX7z88eUZs7iLPLnDo=;
        b=dl8giN5uzYtmpfcN5YZnjMDLL5Re47HmG8fBb485SfkkWCxhsvZzyS8My/8xu7T1DC
         sShYTJxsJ42uwIbVpXJfP0fcYqql1gNMJuuhSZ7SU+AORhkWMxT2+Qk4LS4buQ6he0lo
         qZfGvsUIx36owo2JhyROawEbUNAtjNybHaS0y+XD+zoaHHzCZ0RfBhiPhq40gqZMI4ju
         lPUi3zvOiUiomjR2Gqn5EjntXRFOUBv/Mxuk2GUAbuW+Je2YnslcVM3CNGpzGAIDOi0s
         /5+rPC/vdYM0bhRYOoGSodM9ikgUA/dVtWqHbjKtOng0h1L0MhT8QLtayI3/k8tp8sxR
         lhRQ==
X-Gm-Message-State: AFuF++modlbg7Ga5y7PXnxVx66u79265laRR0KurU0kelxc2Q7xyTnro
	ag0rvzcevmK8TvgIY/pe98bRUyfPTbMONjMz3McCgOk5jz0O9xOeFf7q41h7DIer1otQexeD8Ry
	4CeUDE5E5T5wrZDT1BYL7GLpYaDxVYLTy3AzP
X-Gm-Gg: AYBFou0oD2UAeGYHoN9PVwoi0gRMRTuv736JXW0CwKPoszhIpFS7pTqCDCHMQomhdax
	b+p5nSERCXzicMj7iUblqTLcJ5Ec/BOnRSl9Ik/7XHHmEkxwM5h0+Lpb2E8QeqmCpKAmLLCqgML
	5SDmMcZW1ycVAYGPXz1o7OScXDp5QQK0VODeUZ9nFjh4mWj8eUT1ZO/i4oQr2PX+nelx5MO9qNq
	f/ZLElBnko3ILe5mlqlHCGLrpouSkpYVenqmcvShrshMgbY8G4yKqTp/twuCjH9ab20Ndidh/86
	/lCGelMubbl1xlQWTXg7jJHCF6Br0MDlobc9C72vc3Ycd7+D1dzYzUA0Ldjow8IsKMEEBKT3pOX
	pqCKD4Y+oMxNSOf+iH1BzY56hoSRTZ0A=
X-Received: by 2002:a05:6402:52c9:b0:6a5:ed9e:b4a1 with SMTP id
 4fb4d7f45d1cf-6a6829ad89fmr2344805a12.13.1788342143147; Wed, 02 Sep 2026
 02:42:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <802e4076e332cb82fcca73d8e22e0a591e44ab45.1788277742.git.mattst88@gmail.com>
In-Reply-To: <802e4076e332cb82fcca73d8e22e0a591e44ab45.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 11:42:11 +0200
X-Gm-Features: AcwNN1WeQg8auXTfAiPp9obWnMyCg_-UrnnazrrKK9k8O-gQb7ik0Xi3Zc4DBbc
Message-ID: <CA+=Fv5QcmifCM7gm18z5sYvZcaexqXsiGQfygTt0=srKhSmPqw@mail.gmail.com>
Subject: Re: [PATCH 13/24] alpha: add ARCH_HAS_PTE_SPECIAL support
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Add _PAGE_SPECIAL using bit 19 (0x80000), which is unused in the Alpha
> PTE layout. This enables pte_special()/pte_mkspecial() for marking PTEs
> that are not backed by struct page (VDSO mappings, zero page,
> io_remap_pfn_range, etc.).
>
> Include _PAGE_SPECIAL in _PAGE_CHG_MASK so it is preserved across
> pte_modify() calls.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Matt Turner <mattst88@gmail.com>

I tested this on an AlphaServer ES40 with
CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy.

A focused anonymous-memory test faulted in 256 shared zero pages,
changed their protections from read-write to read-only and back, and
then wrote to every page to trigger replacement with private COW pages.

The test completed successfully, all data checks passed, and no
page-table or bad-PTE warnings appeared in dmesg.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
