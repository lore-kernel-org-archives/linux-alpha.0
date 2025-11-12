Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8F129ACD7
	for <linux-alpha@vger.kernel.org>; Wed, 12 Nov 2025 20:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762978306; cv=none; b=T7n/UBqqxRxmwL+KQ30OCe8G97LcIzc3o5YxXKFjorD9MRdwaKMHW9xYLMCxVMn9yU1oC9ieV/YPGLoeaT3YcpxqUwdzCXSmnNqGrtmoYEJUBor59wIqiXfpwGrN4MGvNNM6pSXRmNLInizaCWc1gqseqS1lvDOuDLkUY/eSVeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762978306; c=relaxed/simple;
	bh=7m4DvriM37qRnM2FSfuXRop6IHSnMXPsNmSBQ7psrMw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R1MVZnPc18uOKEhZ+AUyuJRKZD/9g0nP/YK8l5QYSzTTg5L/tjeCMMMBdOjehZObO9ZPLRQ+8cVTNAu6FbEN7l24s8UyA+8qe2iDIQctPo1sJrrp+aCKtYR+2n69VyrIKdzgPF4fp4WcPt/hf79Q746Vv+zxCcmFrK1BJ+v9FgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/MahNBP; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/MahNBP"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-63f97c4eccaso25183d50.2
        for <linux-alpha@vger.kernel.org>; Wed, 12 Nov 2025 12:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762978304; x=1763583104; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6hGzcOlbbGbyI0TcF5Sp7hYfpwvnrcTw/LD+RYYoy/4=;
        b=g/MahNBPFEtaLOeijx7bqX1ZdNBVi+DrWo7YM51eCpN52sXCGnzj71E7oLQGUb+L7C
         dwvvKIIO6zDb1V8lA86WwrYc+7A7shgOpR++cyD1YR0csXwozwbU42Ny7+y/+EtkyiId
         HqYyxtomjkltGxu0UmlV+pcSD1sEa2Mh+ofaMScy5FccmUmyphfyiNaMEUjbsHC1Tu+4
         d7N7rQSIeXnT3BuhDkrWR6z6jsc0Aj88xGxz8dyGG6rgE/TKS/flH/2eqv8yCJLEaxz8
         sjnfHQluMqPwOVdQAlqF1IVcLRneoc+euNXmAHS5Md/MkRlsCJspCiVFIAMV0eSU7227
         mIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762978304; x=1763583104;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6hGzcOlbbGbyI0TcF5Sp7hYfpwvnrcTw/LD+RYYoy/4=;
        b=vFeUuhMrWWKUiPBer1bAbbtn2a8WxijeKfPhdeWkCAS4TJ+GvsoWup2h+xLfF9OeCG
         lB/WMk2jsoUVvDopWCouUApazXTKzAXDuocGrt4ru4KiBohph90QvXsvwV35hdGr3blI
         K08cEZVP7Vl1B96muYOweY+2i2r85W5FmwkwZZJDMpdJAnQZD5s7aHKu3TqGpqwr9ygH
         BdbRqgLpAUqPfGBkJmPqYbIJewjPc5KMrnnWkI2ZTc69QeL4SU6W4Aye54j4K4ihHcvj
         oskNxHcsocBxMkCnQ6LQWoCijWcl8xAyuM9MZ/YBhfi+UFy/2qcrFGPKrft4m2lXLnV5
         A0qg==
X-Gm-Message-State: AOJu0YwIsNh8eSyXva52NM96ffaXiteuPa1kPFAE99mjhXKITbmM0dIF
	2fblfQr5UKDCPLCc/P1/ggNIFAnlaHWSSJlJnp5cPI/MqIr94uCvMwuy
X-Gm-Gg: ASbGnct9Et6RS97Wqg4uvH+5FK6URz+D6qq+EhQDYTAISsVcryMcoxbW1h10JbMtIYf
	rx/mEI57m6kfKWI/kNvIJYUNoTasYZ0o71aR5bXsD8Yq46xv5kRmhB+8F2cNjCj7sIfgIVZhI4W
	HC7h7jJh8SfDhTZIRRB5CmvYCLSZrmzXFdJxnYFzfLIYlyN7XkyRZ7Lx3m4HxgFR0xGcpoopbg1
	3yTwtVDKSMBN87kB4YRI1UymyK6tWqDvohNp8Ysd6E+dgcFqSB/KWKYDbdE13NTiPMFDX4lE7BB
	AMAI/+x7aNaJSnJifDCpSMprzV2j0cxJCwvepV9BL8LOcEsoMAGtDkY7mE+PVHaubf+RyaP7YVK
	r2HmMS+anTQwVMkvNjDX8q1QEEVu5Mw8PKQ5fSMciKEPHJKla4sSMEWgCywX6yOX7k59S
X-Google-Smtp-Source: AGHT+IFnMVwZQrQnlyfXiO7Q8cJt+lracFM2MlhYoALs/LETA6AshN8NV/9I3iOkkZsZs4vyL6CHKg==
X-Received: by 2002:a05:690e:4292:20b0:63f:2b0c:2d55 with SMTP id 956f58d0204a3-64101b3aedcmr3138897d50.51.1762978304068;
        Wed, 12 Nov 2025 12:11:44 -0800 (PST)
Received: from localhost ([162.208.5.25])
        by smtp.gmail.com with UTF8SMTPSA id 956f58d0204a3-641015aece9sm1267616d50.3.2025.11.12.12.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 12:11:43 -0800 (PST)
Date: Wed, 12 Nov 2025 15:11:41 -0500
From: Matt Turner <mattst88@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PULL] alpha.git
Message-ID: <4qsa6oyacdik7neohp67y3vvqu2wczxcuqr4bulxuxksga7zf6@6obnf7yg4ccy>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qh24d6ljfp7tlqfb"
Content-Disposition: inline


--qh24d6ljfp7tlqfb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] alpha.git
MIME-Version: 1.0


Hi Linus,

Please pull a patch to add Magnus as a maintainer of the alpha port.

Thanks,
Matt

The following changes since commit 24172e0d79900908cf5ebf366600616d29c9b417:

  Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux (2025-11-11 10:31:17 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git tags/alpha-fixes-v6.18-rc5

for you to fetch changes up to d58041d2c63e09a1c9083e0e9f4151e487c4e16a:

  MAINTAINERS: Add Magnus Lindholm as maintainer for alpha port (2025-11-11 20:52:04 -0500)

----------------------------------------------------------------
alpha: Fixes for v6.18

Add Magnus as a maintainer of the alpha port.

----------------------------------------------------------------
Magnus Lindholm (1):
      MAINTAINERS: Add Magnus Lindholm as maintainer for alpha port

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

--qh24d6ljfp7tlqfb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iNUEABYKAH0WIQReryEEmoa4pUzLG/qs6yl0DJpOlwUCaRTp/V8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0NUVB
RjIxMDQ5QTg2QjhBNTRDQ0IxQkZBQUNFQjI5NzQwQzlBNEU5NwAKCRCs6yl0DJpO
l56MAP9Bw3TlMQV8LR0aUZZNL3+8I9pZoke4en39x5Kp9s1KtgEA8rf3UL8m00Rz
hU1MgcyBDvnGiSfRSaQUNduq/Jz1SgM=
=Sq8d
-----END PGP SIGNATURE-----

--qh24d6ljfp7tlqfb--
