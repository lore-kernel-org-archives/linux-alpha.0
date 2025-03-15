Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4E82036E2
	for <linux-alpha@vger.kernel.org>; Sat, 15 Mar 2025 14:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742050548; cv=none; b=DFm0a1C66CcGHXZtGpAZWyu9ECpZQYScfNrljByBYqjP6cggzYFuIEjkw9JbDkA8ftcQUNxnHTEcFh/PW+ODhmSRJ5nXodK3yJQkw3edYow+g78GASPadR6Eon5iOySHFai4JlDPQvf2YOJaBBNWnM1MayKfV9wMd++/6MK4X9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742050548; c=relaxed/simple;
	bh=XA99tfLBp8bXT73QYWUaMhUBMUYYGtyNQMBwQmFvmFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=q23jc23TUx6wbRKRgp0pk/iSkeskcQXcc2zZMu3mSszhrwoJCxp0DxlYNuN+L1umOsZ+NCjvdPsdMzixrUU52DR0IGHzy93XxapdsIVD5hqbQLu3COTB4w0jE5m/ir+QC7pqiYRUDDheONqh0o90qA9uhwyYFt8wz/RiBpdQ4Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PmSjBQ9i; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PmSjBQ9i"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2fee4d9c2efso1027022a91.3
        for <linux-alpha@vger.kernel.org>; Sat, 15 Mar 2025 07:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742050543; x=1742655343; darn=vger.kernel.org;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XA99tfLBp8bXT73QYWUaMhUBMUYYGtyNQMBwQmFvmFg=;
        b=PmSjBQ9iXnLJUW2idUj4k2rryQQVbg/u4JfQq9Z7sOLQAWkwBeOXLDdObkRKX/YwA5
         VZKXGNshnwN3FzHVih5sE5LsjfahwEYo8mTxY+LFfphTknebNzB/lfuO8AgeHLHwztzw
         hsQclR4CmM2Swg9TQqh+7yBxVTAaMFPsWwwstd/omtTWD9gRwkFkiw3zLoYoHumY5V1+
         OGK3MYKiA74blXWHYoH8LmYf767Z13BBpm0aBv2/F0xio5h/xsfr2n+3+iVpbq4gm1iX
         bEVfjWwVFbRAM9csDsJGmDcIdCcvalQvxWekpf6eq4XRcvLFvrtmew58O7LnVVFdwxXC
         yFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742050543; x=1742655343;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XA99tfLBp8bXT73QYWUaMhUBMUYYGtyNQMBwQmFvmFg=;
        b=BDHJIHUuj9uEuIkGQh2P0icAhTInP8lJXaDUjdiERhICUU+/vW8Z2DT7LWaJBefnIr
         orosaLgUACPOND+gIsZj+uzjZxTq8H8GWw0l/GIBzoUemJ6Fhfi4Imr0atQdqHZZ0IE5
         B2lYDQgsGw85HiSnOpGJVLeo1wnK2uack0o10jtzDC7i9znzZ6wWEyepTvj6jbdJuYzl
         ZcLErMu/tJE8PTAfEfw0Dx5Xmeo/nhxXr+P4W3WYPepcPtUSYpUn6Yu5+tAfy9BV6TFY
         TNkbS0/Pxr4DA7VKs+9gIU3xqNRft+a8ZwZkfhPPu6xIzs4iaRVa2YN6W//eFTzbizSW
         yGrg==
X-Gm-Message-State: AOJu0Yzm6Rkz1YUvhF1BAbFmRHCEkwW8LYGeizrU/ews7SP7MZpyNDNL
	8PHDVGGRh7ghNV3gqJLELCY4HVMHXA4TfJtuZCHuzLn0QFdmkDxkuo03UuVedqigHbr4Vu3dH2E
	4QkcwZlLkE20RLfb0EKE5qlE94v7Swu3v
X-Gm-Gg: ASbGnctnwDZCXrkl8yuVNSbYmH6JcqXs7++getV2qSJCTv28urAj1ewzJSFKwIkqdor
	T7e4tZfIyxkiqetVeDUjzdOCs7zOXEFieDygMBJXadzowx2Qc2kwG5DHS0ZYMzCNWB/P4zQRfgr
	LlAbcKCJ//THkFaqWe5g1Q/pU=
X-Received: by 2002:a17:90b:2e44:b0:2f9:d9fe:e72e with SMTP id
 98e67ed59e1d1-30151cc2490mt7920223a91.16.1742050543260; Sat, 15 Mar 2025
 07:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306185124.3147510-1-rppt@kernel.org> <20250306185124.3147510-11-rppt@kernel.org>
 <cee346ec-5fa5-4d0b-987b-413ee585dbaa@sirena.org.uk> <Z9CyRHewqfZlmgIo@shell.armlinux.org.uk>
 <Z9ErEBuMMvd6i2n9@kernel.org>
In-Reply-To: <Z9ErEBuMMvd6i2n9@kernel.org>
From: DiTBho Down in The Bunny hole <downinthebunnyhole@gmail.com>
Date: Sat, 15 Mar 2025 15:55:33 +0100
X-Gm-Features: AQ5f1Jrmv7KQRCuWBIo_vXTI9aIDRsZr_EQ5uQHAURWeudjXpiSlHPWiANvw4jg
Message-ID: <CAAZ8i80e6CsD1Y36-sVrVs4QPB-82J1gPOeDvHa_+sQtfUpMtQ@mail.gmail.com>
Subject: Soekris crypto 1411, where to find ?
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc <linux-parisc@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

hi
this is probably not the right place to ask, but I've been searching
eBay and similar places for 2 years and haven't found one yet.
I support older MIPS hardware and need to find a Soekris crypto 1411
miniPCI module or two, to add VPN acceleration.

Anyone have an idea where to buy it?

Soekris company went out of business years ago.

Let me know.
D.
