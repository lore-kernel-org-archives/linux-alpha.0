Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93B03090E5
	for <linux-alpha@vger.kernel.org>; Sat, 29 Nov 2025 13:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764424013; cv=none; b=tJ9moillY93OsxlymnrPB6BB1ARnQgop1qINpgek5NQFZSt6rZEIJ+EBEQAai6EKC545nhUTyhXfLrwA5jAyMqlHtqTpyPTYc60hPpaZ6wL+s5vSRRxOfnTX7tOpfo5pCnauf/I8IeF0FuY0R4VFZ6vqZmKW+igGIzooyW9m9rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764424013; c=relaxed/simple;
	bh=VSsMkG9UYEpqdmWleMYeETEBraLCrRYnJUjtmcHK1bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kkgJ/u3h0/Zltz3cygFjXyjMvszKukMPfoN7Fv8fMWyt0n7pXY8BqP/NqR6DTVfb+VXvANQIP6duu7+E/AHCYZ7wRxJyX33nuQELTIpoBQgXsa4NgiljHSiBZssZNomDJnjn/v7FPNqTfONjomUgC7AYBKtHIprgDbTQbxHnEGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiZMWO0u; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiZMWO0u"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b7636c96b9aso371913666b.2
        for <linux-alpha@vger.kernel.org>; Sat, 29 Nov 2025 05:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764424008; x=1765028808; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VSsMkG9UYEpqdmWleMYeETEBraLCrRYnJUjtmcHK1bk=;
        b=DiZMWO0u1141yLbmIozWA/lB4opMj8YJ3BbKlsaoDhSVSrFnVJ35WCx7U3JjFge4hM
         vxvuXIdPK9hMv1EJnDdFOQXbPXXqQFWCDnrJwbsDJ/ByQjJZmBenjSxNad9NwMZACthP
         w6pvEnCl/CrwfkQO7B80+w2WxzqCisjwMuu8Bf+Yqv2woyi/VeYPsn2uln/WPPULeqA4
         0yhYrbQnFma5mxT2akyDl5j++mZq/sV8tckkiGbCD84nRNmVG/afO5bUqM8zUXCHeikK
         e1GEyrm9AFagcIr76PGsK2eoXsnBXhMUmpFOMm243D6K2qRFsl/qW3oO44q+I+A4f33Y
         kX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764424008; x=1765028808;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSsMkG9UYEpqdmWleMYeETEBraLCrRYnJUjtmcHK1bk=;
        b=EPdHF2P3Cv2/SeUtLK7aU6Sw6YG5sctduihkKnWp+vfmOfq4nXNEwUqRJ/02cy0U4d
         XOKmU2aYKQ38BFs+7B3Q462+fYRwYYOKdBMDYmBGerz2M76jf4cCFRCEabPiy4o+mL8R
         w+C6/QELXENx0a6cmZrsZPEFzLrMI9PBWLYuO4WI8WnrHfW9u7qLeXYw7YJ15/CUnqx5
         3qmVb9jvbt7vwAu363LecYOOH/xGPvQ7kpXBtSOzbdryMDWfPoCexqQujVjhI1m/4ont
         KE6iqhKcmHRO3FdV3Y/fHvpfmkDo51A0wMTQMmD49P2ZFJMSHIQdI9zqzXX8GJoDr3sA
         Lv7w==
X-Gm-Message-State: AOJu0Yyuabzf1SoOYXy3g1ZPaTE+ERsaqmtxPe4HL+2OuqMBk9ZHjhCO
	r59SkqxkLweThoJ8QpYZG5y/MZfa1Xq0cvXjfYs4W89wA/be0JGvMnwxx1istPohIxgeg6rGjKS
	QV8oqjpNtSsx6se+RX+g2qajmp+qRJfQ=
X-Gm-Gg: ASbGncu3XmWd92RZWYBBAnsc0pHS7VEQZNZj8/72dC3KlGknCJksEUTSDiaXkcBcwRi
	S113dhOavYSzNQ2q8GqZ93J8dPjZ6ByxRy+LRc41J7aB4+K9Q4pT3zumnlaAZuj+e3ZHQBJXjTm
	JREabirMTphOraCiXomamzHVOD1WHREKCuMy5BbKxwhHRbzuIVcqXxpRJ0gnhXGTSlOBrWIqv29
	GYXgUaeM5ksGEHXdMn82Vtu5268QTEoy1svcCR/0/C/+y1XsHKor2eI6LVQVkP9jPqgr/u1
X-Google-Smtp-Source: AGHT+IFQzotMKnKF6S5xOQGEVLPx+z06hUAWeouedMM80Lhw1e8Oe0nJp7dPP+ppJ5y1fLzg8zL27RS7ZXjtE7Z5vnU=
X-Received: by 2002:a17:906:478a:b0:b73:42df:29a with SMTP id
 a640c23a62f3a-b76719ec80fmr3319982466b.59.1764424008043; Sat, 29 Nov 2025
 05:46:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1605dd43-5e95-46eb-a0c6-78ff8b4d51b3@web.de>
In-Reply-To: <1605dd43-5e95-46eb-a0c6-78ff8b4d51b3@web.de>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 29 Nov 2025 14:46:36 +0100
X-Gm-Features: AWmQ_blLVCEqWLZoU6eFtO2PZjCzcgNR2IRrusHQCtc7tE9S42G7VcDZ-VTUPug
Message-ID: <CA+=Fv5RDbA-=WFf1bdekhheZfYScbu8J1Eud-sEgTqUGnk00qg@mail.gmail.com>
Subject: Re: [PATCH] alpha: Use pointers from memcpy() calls for assignments
 in two functions
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-alpha@vger.kernel.org, Chen Gang <gang.chen@asianux.com>, 
	Matt Turner <mattst88@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, 
	Miaoqian Lin <linmq006@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Markus,

I noticed that the kernel test bot complained about some build issues,
are you planning on putting out a v2 of this patch?

Regards

Magnus
