Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BBA23B61B
	for <linux-alpha@vger.kernel.org>; Wed, 14 Oct 2026 02:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791943830; cv=none; b=kOa7WhQz8LoSNaUbACsOO155PeeljkPKo2yChtqMuTK+7/tgC0OXsagYY6NV3hkj+pWY97lsIcbdg6Jtth3+Wp4XzPn7AjsdmWsKfKvqrFVUA9I4A6SqQf9b63isUS02vjHIJdF2JnSnfwX59sijRHVVWjaYumPcKF3fXdBu3RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791943830; c=relaxed/simple;
	bh=QUP/mWiQ9hNu1zpYzlxuN/F+0PRmerw0BsOtOWyPgd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W6KK+hZZ9r3V9gaJrzOATfNO+SRAM+67SVhTt5yOj8+t9Vfrt0Vw/XiN6XhaTmzvdJzMvuOfcmgmeCgTiV8zDz9x9807i4ob79SXR6i0DbYm/+4mFzzrp4yY48QLeHnjS1TfUcpDkHp38TpvnP0K1gaI/mfZ4vOuAkzxFCvAXY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhqOnzPu; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhqOnzPu"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b06c0794cfso5515867b3.0
        for <linux-alpha@vger.kernel.org>; Tue, 13 Oct 2026 19:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791943828; x=1792548628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QUP/mWiQ9hNu1zpYzlxuN/F+0PRmerw0BsOtOWyPgd4=;
        b=bhqOnzPuRDKSxvNXa7ZNYePh/m3rTHmz+P5T/Jxi8eGMhPbU7Uzk4T1Vb7A2Du2F/k
         JfjBUR2S3w4DUaHiUs18heW/2HJpQ2hPjRGmIOBkd6ixG1BIJhag/X+fVqRx//IbGvhm
         6bOQ7EMF82SOcD0y/ZyF17HGx7qp8jj/hLXr4BrMV8B/DEJSCFWrKFSHcxQGvDWKr8vz
         nU8Qa1EVQkK/g4nxumqK2Modmz8Bq0MKtNaQQZEIPdC847oE50q/MNlgrTdwUT67zAjP
         UWKJMfH5nfks1nTQjsomii0IZ4d2Tu793CLQoQ84drOkzRIfaby+l3XN2/GPl3a+F2mK
         pSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791943828; x=1792548628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QUP/mWiQ9hNu1zpYzlxuN/F+0PRmerw0BsOtOWyPgd4=;
        b=lTBnzNgXff5xAJvO8er4IRly8S1lpOln+o8Up9YxUWB7EZ++PqeRjj9QaBXxikaCxB
         vZB00uS81dRwlZCDpqML2H2dfBy2XYh0E0U93R2Fv+TD/bFuFYmTcsfkpZqGmG0eDdMz
         ewPaIc8YknZtrrn4VFB9c/A1bXqwUgHjQYiAqF2wc+6L4k1jpSLExfGR8SCls3iqDc+x
         PIN9IDsoJ/7LMo/Rrz/pejKq9hBeoMMh3GwqvzsLNGrsElhvw9itWWDAmWmH/oEc4gOj
         tbEHeMfaNFa5VlyHcBcj9OfnPgf89ml9Hi9R1whoYmsYfWal9rlyzNHX3XQ+iisCRrM+
         l8+g==
X-Forwarded-Encrypted: i=1; AKwUvBz/5Ty9Jx5/2UFxrGUxJCyr3hGKOfaqZq+mVxoonC0R27jIQhfy6vlAhAtsmrLqkOAIZWztbCauKMMV0w==@vger.kernel.org
X-Gm-Message-State: AFq9FYLI/jCxcxTdnC4vyjfsKdBEP3PWfziNGt1R18wNLnyFfuKbw/jX
	ltgXYzBvDrHbBD6JrmEsJeVtynnG5kW3LRFnQWGub+ZJ29IcU2LfWDU+
X-Gm-Gg: AYBFou3x7YbEafIrkXyNT4Hgf35JXP8lRmfrGf7FX+lKd9GVdLrOQwY29NWb4Ypa/h9
	FJMoEoDf7PUZKoGz943DDl+ic7vuCKE2qu74hyQQ1XgTvJfMYV24NZQJXjy3qtHt6tV45M86GjD
	GSFaqaw92neOBwEV1TfbPdBMOcc+6DBdN7sDWtAgMq42xpDloLVnPLD2JFXIlcrCIMo5wyn7BxI
	9iCGXKvsiZloi91KotJx6XlibVvRqYVzkyLbLqb1IiDw43ED4BWDHrRrJW8sKv4HDsPNBzhoSuZ
	l9EGeGhQ1EWqOblM3p3OZmtQkbbNrU//dnjC/AU3FBKVHQzEwsS40CZlfkRR2BugJogpsVRgOn7
	BChaRP69nQMQgzgx4tqwGOu9vtE7nuSJOZHRILyMK5NLW4xPb99GbnWmJDAYT/V7uIHDE1iuZko
	A1nRw3QksjJr7AwgxO5ZbJovVIHDJoHzsATnaFLq2NUe0sziV2LEBMuBy9RVAk816R35zYTtK5o
	V6HMEL1jmOMHKSJEKDnl2sR3Yyt8HbQ
X-Received: by 2002:a05:690c:4392:b0:8a8:8d90:a673 with SMTP id 00721157ae682-8b07ee2661amr43935727b3.26.1791943828007;
        Tue, 13 Oct 2026 19:10:28 -0700 (PDT)
Received: from localhost ([2600:1702:d60:1bc0::46])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f21bc65sm51338527b3.26.2026.10.13.19.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 19:10:26 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Subject: Re: [PATCH v7 0/5] alpha: improve Tsunami machine check reporting
Date: Tue, 13 Oct 2026 22:10:18 -0400
Message-ID: <20261014021020.3842132-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013211551.991723-1-linmag7@gmail.com>
References: <20261013211551.991723-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Oct 13, 2026 at 23:15 +0200, Magnus Lindholm wrote:
> This series adds Tsunami/Typhoon system-error diagnostics and Clipper
> ES40 environmental reporting.

I rebuilt 4 and 5 (1-3 are unchanged): vmlinux, W=1, for GENERIC,
DP264, SHARK and EIGER, plus DP264 without CONFIG_VERBOSE_MCHECK. No
warnings in the touched files. Minimal configs, not booted.

I also went through the 21272 HRM and the ES40 Service Guide this
time. The PERROR and MISC decoding, the frame layouts and the Clipper
bit tables all match.

You were right about SERR, the note in 8.8.2.6 is unconditional. And
8.8.2.1 says configuration reads never set NDS, so my probing question
goes away.

Comments on 4 and 5 in reply to those patches.
