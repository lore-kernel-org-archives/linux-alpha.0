Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510F2334C26
	for <linux-alpha@vger.kernel.org>; Tue,  4 Nov 2025 17:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762277563; cv=none; b=s1P/yeHF+0fILYesv7zkZWkMlSHObO8ubajW0TP+3xZj4AfP9HwnqSYwxslOU7JOz0zPIl0PZJOCzs7Qe99fElkpR0aGsDClvyT5t2WfXE0YOVzIBG88NKUD2NsVVUgT0G5deP4VusZe/3YRXXHPG9v0w9X4vgIFdPjHFKz+AqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762277563; c=relaxed/simple;
	bh=SzM3QuPCpSLxXdGGco1ngdrEoCX9QqchdJ7DcUdSPxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J4hP26J55w5Ql5Srr4wbQHTHyGsc1LIvCYJ9xIyf+VSWmAWj7Wtz3oko2sxGI3blOZNVW65c5cyPGaZXihGNvDTQ08mO8I0m77XMF4Z/lc7sMJutk+P09wD6TRdxHv0OVh5yAvYHBXQJxV0LTaLp0Cqpk+LLEuEZp4Stc2/J6eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+CT1P90; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+CT1P90"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5942e61f001so1989168e87.1
        for <linux-alpha@vger.kernel.org>; Tue, 04 Nov 2025 09:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762277560; x=1762882360; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzM3QuPCpSLxXdGGco1ngdrEoCX9QqchdJ7DcUdSPxc=;
        b=m+CT1P90i9Y1oP5NhNXKq37Koow+3nuUbCmY3uUFiMtfGxvof0Ic/xTASERS2qvhuj
         osPlh/hqiZbaazBo9L1WgNZ5h1vOoD/jj+h15dHtTrD1e88SbjfSx/CMitKoHf9K6rER
         3VsU3arTkV+wxLM02HplL4FIUozHZ0gSBaqj9VlWwp5ZYFYxeq0KazGy19OpaDZQPFiU
         tkuNofn35rnguMONhmwo00odGtrSG842ewdd/8KkdWa8MHSBwu80xR6gAVbbuKPG0D7F
         cwMpKPV8lGF2iuKrnkgtW7kFtjhmuo9cxhJIkMtNcKSS7GHS0gNQ9j5CovWkdjcwCxJo
         XfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762277560; x=1762882360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzM3QuPCpSLxXdGGco1ngdrEoCX9QqchdJ7DcUdSPxc=;
        b=Z06wFb4J+lZBPlbLnr7AjnrW/OSOwJkjXAOFrgviqQq8rIK8MXPqz6u9nUkO9is/hc
         eDRWHRY3GINkvbQSMjO/vd2eiaZKu/HIBTZPY0l+8V8dGDXH6H6i6vz5qRExgLzfZ2Lc
         3B91/dOmc21Mkapuh4IeE0U8WVfwR8FbMErEwLvoh1TGqkURCZjpYUNZw7ZVtt8e4cGC
         Qu8RMxlxR+gLe1FwlhLIPRpLetigjg6xNT0UvOvl3pMd2rJelI+WEU7TuPo354MqQI2V
         0FjJgbdOAq4ZrsiYYi15U9dPhUlxOt1RF3IFbchSnVadu4vJKxZ0OvXZlodcw2mZAxIG
         x+Vg==
X-Forwarded-Encrypted: i=1; AJvYcCXvXo3eVpcskw7QJKkV3cZ0dlIkBvEivVWF49s6pX40yRVzYSWz0/Lfiq7drl1qB+rcskqnsxuFOtNEVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEdgvrhqh5lCkfLmb9vI5DjQJ59F9qs3Nss24hhotWTGhHfAaq
	Gfczwx4dL5sY4TUr/GdirCtj0wwqEneh4e7ASrYNfoVsNIYD9sSHEPXRT6g76/AT+qz7Vg+yAtm
	2ReDVutMBkq+GkYVyonbd2XEbgwrco7E=
X-Gm-Gg: ASbGnct4qc6eIJhaNQSyXkFOdpI/MEayC1FPf2cY8dfihQ01H45f6Voc5k/auHClbPn
	K6zOmT55artgBH+9oFHo4Zl2KqMdilKyD8Kez7S/LWdPqd0VZhuZUZIo2/eO2QIDVQ1PP09w5xS
	r5z5wLAD4Em0jmBQ3DKkm5hjD60tC37h8BQqMfrPtQiPSc4kBc21huLlEbBCzQpi9DeHrYzAZZ/
	nYZp45+IBXa/dB0eIQo9ZSAXp1vKw1WoZb21vjuXyY8wT597u0ekqOXSg==
X-Google-Smtp-Source: AGHT+IFXI0b26Xu2rKqQvjM4aCQpacUKpmY1KjXZETX93PxYlp9C+bCDV5fm09oDr/KGDn8H7OyKaA5fDQv4TCtmtZk=
X-Received: by 2002:a05:6512:150f:20b0:594:261c:1ed0 with SMTP id
 2adb3069b0e04-594261c22b4mr2564678e87.54.1762277560179; Tue, 04 Nov 2025
 09:32:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251104103525.26410-1-linmag7@gmail.com>
In-Reply-To: <20251104103525.26410-1-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 4 Nov 2025 12:32:27 -0500
X-Gm-Features: AWmQ_bnuBM-eGvsdkAbseo8EWUGi1fvIqcWoT54YTpb8Ju7ny4iXd1Z7El2G21E
Message-ID: <CAEdQ38E9hWDy65vOdjwmTcy5tqtNvY8eebV7c9Sxx3e9Y4y8JA@mail.gmail.com>
Subject: Re: [PATCH v2] Add Magnus Lindholm to MAINTAINERS (Alpha port)
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 5:35=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com> =
wrote:
>
> Add Magnus Lindholm as maintainer for alpha port
>
> Changes since v1:
> - Rephrase commit message and email subject
>
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>

Acked-by: Matt Turner <mattst88@gmail.com>

Thanks Magnus! I will take this patch through my tree ASAP so we can
get your kernel.org account set up sooner rather than later.

Matt
