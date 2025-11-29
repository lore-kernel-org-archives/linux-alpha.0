Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69716199FB0;
	Sat, 29 Nov 2025 15:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764431462; cv=none; b=R7GVIyAaXHXrDdf41z5WZfNj5Yack4DHf5Ij5FLUahtblorCvMdSCecWwahfOH/o08S7dmwzyFxGuS51MXtwRdqXebPdT+fYzdV2g4MYkr4e7HTaB+Mv4iSFsvGR3q73oX+da8QTKGf9REgLthomQENSsfcxRDgvgZDN0P5RUro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764431462; c=relaxed/simple;
	bh=Cptdiu+v4Spa4/uNhqPONwznP7I52CtmtKsREscj7qg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jdDlySyUzKWQA1MGiFhes3PphGybyskkYwNSnUry9y8cHl5wgfkzYtWxQr6CNVzPDpe+9HEqC6Dr77nUgaSj3U+DDjmUlQ2FFtR618BCbpHmhRhTC/KYIHpO2jPO+LdJaVILLf5rqnkj7/n9foXl1Zq8vDCcqKoqt8KHt0/a/MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=hFd3/rrL; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="hFd3/rrL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1764431451; x=1765036251; i=markus.elfring@web.de;
	bh=Cptdiu+v4Spa4/uNhqPONwznP7I52CtmtKsREscj7qg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hFd3/rrLUJPA4qcMPS+QGRLFkQx8SafQy1NwVwZJ4yDHKdrphnbf8FAhl7S/G5b3
	 es94nnzHinG73HmaNMcfYe6iJCk+uIhX0x8hewYHfsg8C2W9B+mJ9UiY+OD7zLby/
	 3BP+1fyqb7Q+dnS4zAq1FA+VTsDMjsp2u8VAO0Q+POfBnB12gIk0a7HaJoWvGqIF9
	 kuP0qKh4dDiz8DLkOF5iD8buv134TS/CD5XcgL6Z0lufjV0zsxVdXbDnaG7bzMQMA
	 ZYEOh/gp5plCISR8lVPupprVjZ4Fw4ceo0zCmdbDMwI9FAMGAbdMkE4Q8RtKBBSpE
	 RQQ4WvPmmdh7mQ+2Vw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.187]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N01ds-1wLIpI3TQk-012Mn5; Sat, 29
 Nov 2025 16:50:50 +0100
Message-ID: <d75cb94b-4df8-41d3-a3b8-e8569f1e8249@web.de>
Date: Sat, 29 Nov 2025 16:50:49 +0100
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: alpha: Use pointers from memcpy() calls for assignments in two
 functions
To: Magnus Lindholm <linmag7@gmail.com>, linux-alpha@vger.kernel.org
Cc: Chen Gang <gang.chen@asianux.com>, Matt Turner <mattst88@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Miaoqian Lin <linmq006@gmail.com>
References: <1605dd43-5e95-46eb-a0c6-78ff8b4d51b3@web.de>
 <CA+=Fv5RDbA-=WFf1bdekhheZfYScbu8J1Eud-sEgTqUGnk00qg@mail.gmail.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CA+=Fv5RDbA-=WFf1bdekhheZfYScbu8J1Eud-sEgTqUGnk00qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:i6gVJRlS2xrPQ7+efOF9BOH6e39sf4EGVKU0b3kxa6xMV1NjkIy
 IUHJxm/f7si5yTFSRsaydHKE19nLwIM5og4OdPJ6ATsKJi17cjAW2YSahbpwpdBqOOOpUIh
 d4hClCtf+e8B83AH0JJbEGRMWdazhJBsX/eHvt6gdDWb1wz/rPlcvzEgzuBlgVoqeDFLsXc
 ewgBNN0OowLvTj07o7Jtw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:c3dXuAjcj0A=;emSGEdODY80T1n1cFyt8C90Tx/x
 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
 6Gk4qP/6eqwZpGazc=

> I noticed that the kernel test bot complained about some build issues,

Implementation details can eventually be adjusted also according to
the message =E2=80=9Cwarning: variable '=E2=80=A6' set but not used=E2=80=
=9D.


> are you planning on putting out a v2 of this patch?

I would appreciate corresponding constructive patch reviews if any parts o=
f
the proposed source code transformation have got a chance for integration =
at all.

Regards,
Markus
