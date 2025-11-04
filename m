Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39DB30AAB0
	for <linux-alpha@vger.kernel.org>; Tue,  4 Nov 2025 08:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762245479; cv=none; b=mPsHTHygn+BFdSPQdFa1Mvnq9vZHb1/mtDbQ6f3DsmJdbX9qihioF66lSCSkBgAbISPiCRo6CsO+rDn6jk/j0oq7pGb+aeFMxTwQSZcpbmSABj2zSLGkoz/B7WDxhAWlRObaHot8/EcaSlyQ5whrQ/AYF7mLevRz2Tw6V/QHfyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762245479; c=relaxed/simple;
	bh=d2+eAo6NkfT7+chgCzypmzacmxG0Pw8HOq1CUIxLHSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a7+vfuTKzquvbjtXlel9SY4eX+0C3s0xuvXIJrZ3FVXODOBNWVHnqDcFLQN2OfNuYnxBuxYGhfGx72rQYAl95IwEj2qkjgHHsOKtQNI9PNx/5Es4DxOLvkgiUARSP/tZtSQXXUAOTxo1CsjXsxMfMHVwJp9elDBkb+i7NOqclnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YiU/xdf4; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YiU/xdf4"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-640b9c7eab9so3282158a12.1
        for <linux-alpha@vger.kernel.org>; Tue, 04 Nov 2025 00:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762245476; x=1762850276; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2+eAo6NkfT7+chgCzypmzacmxG0Pw8HOq1CUIxLHSY=;
        b=YiU/xdf4LqvdtsBCxz8TWEORFwPFtNFzVKbEMP/6uVQ0bWJvOdprWShz9A4yC4ZVPD
         tMg+e6H0OrfLLvuEk6OzP9B1mNL2MitNCINkJRmTdVxFCILyNYjvM8bRIBiH1yfMDAsb
         aVHmp+xs8Bo7CbmRMbliNzO/MAGzyf9enTApYDE2W3+oW5FRc6TlVgLBNuPRUqZvJN5d
         Sxu6AgFpyYmtHXQ4lwYjqePRTbEJaaRXcM0gZkO8DvBYKGYncWKT5QAifjmTlTB+tl8Q
         zVDHtoVEb09FRtbj0cTmIlC5rj3svhSYzvUUiRSvLbLubKuyzlA2ZVCf7U4199WRxkYW
         A42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762245476; x=1762850276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d2+eAo6NkfT7+chgCzypmzacmxG0Pw8HOq1CUIxLHSY=;
        b=s0YAMEqhtM8jsOcHS3W6qO+lJLvBaycWCyFO3UomD57lH7TezUsEtk/nWhMwwWmfOz
         zmfILbjAzFg0FYj/ac4dpoYFZ0oiedbYkhKLb2Cr99GCwnTqk+FKRrLwR6PcwIYuuY+Y
         CrKrD5eJDM2Pb9jnMCw6JnaTyXm3hdRNNiUwatTbaSkAdespGf6UdbP8Ep8tdbWXK2gp
         8owMQw3yl/LaJ5y9C87x1uOnAsldd6mkUe+iE3iD2Cfg/SY53+huNycRVDhYlmL1NDWH
         LW4TayaexI1VLKRl4IoAuuGD2fNhQ/lwhX7d+IsLLXVo1rl6ZTxJ0MxSc3RXw83gaIvz
         gDaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkgDfGyujFR3FhxGy8LlpiQSCOT/0QJL09LiLWv1zpd9ZxQxexiS8WvID59jOf3001bUX4oHVRZnSM7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXTr+k+ZiVVs0zU8Zi9thR8gz76zYMs9LpN1GdftL95I6xNqKK
	6c0SfAHoJITRIm2WssYDfUp+CwpwHxdduvQ8XjRPHgTWfqw1xMw7SowmmejVXV2lzOiPK6JeF8I
	JlGsGEJ50mK83/IWtLaxvcjdazuwHN0c=
X-Gm-Gg: ASbGncuFtcWYQvKqD9nFPRNRhKpp5kohrJHLMYLLxjGK4ClzG7oZcVCZPmpKkdo4GT3
	StsE32p9FYyO6aBo+Rbby/a3Gk1r7ertgmmlSEbALmpQzA4l8yx7Ypk4n8XVEX9NgREiBAeIdyf
	i3DNwnDge/JePLl2Z3H6Kd/dIxe1nBIp85hMgTQeA12GPAKBq+iQWy7csHSuS9RVbtoj80bFlLA
	LpZ1Pok819ELcAJ3P8nvplvBLEnUSoHoUeNZDrZ0aBel3G+scP1R5Qf5mX96A==
X-Google-Smtp-Source: AGHT+IFQkZHVwcaFP7x6sp3aN9Q9qAekqLNBhM1+eykspKuBoAzSHD59PoifHd7BmivkTUrlh5jggAUNUx1d9Ym1IdM=
X-Received: by 2002:a05:6402:2753:b0:640:6b00:5e93 with SMTP id
 4fb4d7f45d1cf-64077040843mr12588335a12.36.1762245476098; Tue, 04 Nov 2025
 00:37:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103213656.25912-1-linmag7@gmail.com> <0ba150517e0fd331f1227e068fd37e6e6ea42228.camel@physik.fu-berlin.de>
In-Reply-To: <0ba150517e0fd331f1227e068fd37e6e6ea42228.camel@physik.fu-berlin.de>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 4 Nov 2025 09:37:43 +0100
X-Gm-Features: AWmQ_bkOYl1_jWFedzzvw_vd928e1IEifgTLAjl-givq32aMdK1CdaW33XC_xHg
Message-ID: <CA+=Fv5Sdf732mc2c_xGDsJqq2pS-EQU5d0XLBR7v-0GdgFC5EQ@mail.gmail.com>
Subject: Re: [PATCH] Alpha: MAINTAINERS
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: richard.henderson@linaro.org, mattst88@gmail.com, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 8:23=E2=80=AFAM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi Magnus,
>
> On Mon, 2025-11-03 at 22:23 +0100, Magnus Lindholm wrote:
> > Add Magnus Lindholm to MAINTAINERS (Alpha port)
>
> I think this message should be in the subject of your patch mail.
>
> Did you use git-send-email to send this patch? If not, you should set it =
up.
>
Hi,

Thanks for the feedback, yes, I used git-send-email. I can put out a v1 of =
this
and update the messages subject accordingly.

Regards

Magnus
