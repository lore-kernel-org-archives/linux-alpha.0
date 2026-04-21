Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0140F2EA749
	for <linux-alpha@vger.kernel.org>; Tue, 21 Apr 2026 17:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776793115; cv=pass; b=CVnfOdWtG2n8myIJ8HUgCYH7Ful+U4jNLpZvycik8jdCd4BPuoHZXL9dfkltBiuu5BF2AYjXSgSAlvQAkV0J+qzk0sZKoOTz8Gk2nDRatOd3h/TsUF6TpMRGwNM1iaNg1RWK6qgYbPHVEYMrRrpaGheMXex7GCORdXJLEPUKP1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776793115; c=relaxed/simple;
	bh=SZnZR6xff9RM5goVzYDgSWzr9sSSzdIU3mFZLeQjaZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kko4sYWSWCWMXxn9v8arAlnENNqgfy58HjIu/A8FXBf3pKken5/PGSSh4INrNRk9Nv5wThrVxwlMfbzKqq3AN1LlEqyyPk7kC2PJyRKds0VMNLFx2BeNS/JDelhcs8V89qrQGSUeGSeLLTgQpGNNrcHkvbOfUtDGloPE25+9+0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YD2oR0BP; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YD2oR0BP"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9382e59c0eso714323966b.0
        for <linux-alpha@vger.kernel.org>; Tue, 21 Apr 2026 10:38:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776793112; cv=none;
        d=google.com; s=arc-20240605;
        b=dyfIuX+2Pm++9IGde6x1jwklTCSjFEkDTBdK1DUemn6ZjrzCq2oNQmJ3kH/5k2Jk4T
         0jbF6Q+Ap50CRyy6v3z4B+VZ1TJaT1fh299gDo0/Q3ZG1uSu6ueXCQpF6lki2+gIGafO
         8yZZiv4cxjNJzp9j3YxXKSTKMVneU+efrkYb0fuIW8wXBRKw2tIlncCcWHCbjfPdveUD
         30b3Ua0YUa+BuajlHYkHEo6/wI/JK3ftcbmewJxZ1e7Qb61cmSMdLTFO74nnOch+2A1x
         1RZb/P3dCbIBPhbESJB5obL3V2xgt3Na0f1pwzGumgqW8z8GjadeeDUMLO2zGM7HreUx
         PRNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SZnZR6xff9RM5goVzYDgSWzr9sSSzdIU3mFZLeQjaZI=;
        fh=BmLuEyzr9/S4juxbITXNLFxy5aCS8ApS9mCckku7vTo=;
        b=VSiD8A3EAjVfTYlZFEjfKc0H/7W2PkV+1F61uf/17iNRsNKKNwXQ92lXq58wEtPIul
         KODeOuMPqdVEzHSPRed4+eJobcX2KpPf7twGCKDOdkt72/8BVVOajltLeI/qFdmZ3FqZ
         3sbXjMLb318a1o/5t5pxu2aDD60rKYJD62SODSX938NFJFlryoWLi2kWWRHjTIvJS8Dt
         NzqV4bOL8CQLCKFJWVeWSv4YaMuKf73ICZ7BDOTS7auqZzZYttltUfFm4qu2IfE41Ogx
         7OiZ1C93BT04jyVk+JBCYcJW1u3nO4/o4pN3PwoObXcRra/AuPhR+6/F9c6eMwj/afYH
         n8Tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776793112; x=1777397912; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SZnZR6xff9RM5goVzYDgSWzr9sSSzdIU3mFZLeQjaZI=;
        b=YD2oR0BPi6wk/dUg5L5MjZqsxRdBR95YFbyOgwGU0x8t2bMOAPRSsgyRcn/PsBRx9N
         xjFIefLzYhrQTsYrEUJjRp3/c1m2Wlu0NtH5H9ou+x7zo0TPsmIH8Ef66A4dpdAblusO
         MI5CWEOgDL98lH5nPGmUiIaiuslUwbR/+vRt/advRCC5ePcTfr0gC2DUfWbVMn6dJZ7a
         6RMLehJ24NIMCgeN3Vgn/VfrCL3txIUao61XclfiAZzK3QPMZGXPm8anyYf+L4/+BA5A
         991QzS5RzN+VjZkKyOvW/iRfA9e6IcwAqali6bVkfJ1ZngLtCPwilw6Wi4ebaDtupFOA
         duXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776793112; x=1777397912;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZnZR6xff9RM5goVzYDgSWzr9sSSzdIU3mFZLeQjaZI=;
        b=k21UfseC6+nL797ZwGhD0PdsTPf8icKxAFgsOWU/yp0oj0KNaLdHBBnrbrPnDbk9tI
         SgFwDuVtF86/Ph5jnsc8gQd59ZBHK978acbSBRYJJT/LMDHygudkGelEnDSqeEOOF3qX
         FstFaOJNJBu6CzyvHcVxv6z/pawRFBDTKvGNYPdcnEdc3hEKrCGb8U4okUWcAHhwvZwL
         9RrDEtqOkrm42sppZiq0khCDZZChME471+Whp64WA3xvp0gdV/H1p1mYe3v4WRZzSqV6
         Wi+3afz7cwdycvWNSa/BfkJZxgPP7/I0XoFfO9mn521fdjIEK3l9xKNV+lcPS4zJ+Drx
         gE0A==
X-Forwarded-Encrypted: i=1; AFNElJ869gJyuIPSZ6ZlSMKHAANV4g0FYul6Y6dkZSI1JXE5W5Xapo8jSeqX2HWq8E7GsZiddaW+dcT9jiHodw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD0o8UnNtnm0SOSvhiRAD9vcKrFThANvcp92NbVMajp9eNdPlV
	8dPOpX1wcUly02qdfx0degLaJrGr5VUlxgjSHuxT/Kcewnq0L8f6W2+GEKiqbOAwB/Zi6aPrSWX
	aaAzOTBgzIg5YVNvvclvYDKK/DxJAV4Y=
X-Gm-Gg: AeBDieuEVJL1oXcu3iXxCiCENFzoyHy43VJo6Mn+PDGXx3ZkQ2bHf2XdN/eUNNm7b4M
	jENwwhWZlHdM/rX7nA1jG7UJt47+8Lf96HO/dYLcUVq/AC/EWO87HQZos6GsY4+CwvxlVcvX2np
	Pw5nOIJaGsAjRtKd+WGHZan9Egn2VoHfY+4e37/EvhIhlvzzU4S4xeexIaT9GmVTH6qN0/2Bj9M
	uzIc5sNIBdVh+xeOkIJEE2awU4/A0ov2cK486ut7KrrGPwniLw5yYMxwWYFvPKDlaBRzrpV+ZTK
	BduDN3xeB3LsrhWNm3sb3fz7VCHKh+PbPgeTOeScs8o0WkYp
X-Received: by 2002:a17:907:3f8a:b0:ba7:b198:7d35 with SMTP id
 a640c23a62f3a-ba7b198818dmr503855866b.19.1776793112143; Tue, 21 Apr 2026
 10:38:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203063357.14320-1-linmag7@gmail.com> <202602041817.3967F048D@keescook>
 <CA+=Fv5S=XxDyNFdqhR3p_wEPwGEpjfE+Rqk1h1JJhactWFib_Q@mail.gmail.com>
 <CA+=Fv5SZK0eaT5Y_a-eTdZacFEcp36rF1YE=tyooDuVpZW=uOw@mail.gmail.com> <202604210947.C4D4020@keescook>
In-Reply-To: <202604210947.C4D4020@keescook>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 21 Apr 2026 19:38:20 +0200
X-Gm-Features: AQROBzD_czgDbhMDDFHAMaPvE7silGhZt6Bx5-z7E6I_tlnN5wHuhvwGMOA776c
Message-ID: <CA+=Fv5R6+aKQi_zmQjAbMquEZgsm46j9y68Q4MNijT206BYHXg@mail.gmail.com>
Subject: Re: [PATCH] selftests/seccomp: add Alpha support to seccomp_bpf
To: Kees Cook <kees@kernel.org>
Cc: luto@amacapital.net, wad@chromium.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de
Content-Type: text/plain; charset="UTF-8"

Hi

> It looks like the selftest changes still need to be landed?
>

Yeah, I took the SECCOMP support patch through my tree during this merge window,
I was thinking that the patch for selftest would go through your tree?

Regards

Magnus
