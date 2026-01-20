Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8693D34A0
	for <linux-alpha@vger.kernel.org>; Tue, 20 Jan 2026 22:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768949074; cv=pass; b=tUgNa+1+E6fM1xIYUGQjnwQdb3ZuWJb6pSqe0ItpAe5UUkS1G7HiF+vGQLOFmoy+FXI097wiVQs20jXzH2K/QdSSnoc73OpywV0dhZBDaWJpSHS4Uekfv4LGxX3C03fdmxo++ZzyQVINXuc2J7mo/KSsmuSOKhSOUtaRJuBPGM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768949074; c=relaxed/simple;
	bh=F4VEnDJOtkfJWl9oklCUe6ILDLAraZMxfqSxkJGVkqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=pGkU9LbapG9/quDOc2M8nU043DVsQ3Xt09XDFFr0izDQ69mokaw4jh9IytanMM5AMqMf0f5s22k6cSWVriSXI/kTsrTdaycVFmO9AEqtdw3P7KT6vFL+ZLZY4PQm3IaLPvPc02eoj/tWbnDDF9weHQ/1ZZ+gFA+mWom38DiWBCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kR3W/tMi; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kR3W/tMi"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6505cac9879so9879162a12.1
        for <linux-alpha@vger.kernel.org>; Tue, 20 Jan 2026 14:44:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768949069; cv=none;
        d=google.com; s=arc-20240605;
        b=CZw4bti3Urfa2J91NkC2QHqg225MQCc7vJefEx7IumI+5h2+pjg0hKmu+XKgqTMv97
         zfncufDv094YAhFemFEp+nhi25ngA91ijeHq7/q/6/DbyLtMO7lDAuV0fYArE9hBw+O8
         vg81zPOZn7qSy7434Eh/qD9HEsJaIVRx1iQy2kNwFx75NbUhvyjhS9VUj1cEy3hgyoNi
         jgSRM4BxIzyVVixrSV41sW8GrpV9tKJ2fgyyFDyym3QpDysxM/X0ZoX2qtbBM2gtxHub
         5stq6nylecI0rZKu/eJYP/hGzFTQLzBVLqdb+Z9R1TxRB+e5eQT3TBG11WTXmOJZ1rgg
         WP8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=F4VEnDJOtkfJWl9oklCUe6ILDLAraZMxfqSxkJGVkqg=;
        fh=wEu4ucfVFmIcOFgVjEK54FFEnbD9WBA9RrGCA1vRtLc=;
        b=AdDsVcc5zAu3WFWOCw8XoRde59GfEg2YVFNiH8Wz29ZpkDJv2DbPsDcd8BeXn7b46F
         faZZ/vBKalPCnKya1FBqePu7hjFS2dch9MvD12SrBYagJ3PUzNu82N3TgQu3wpog8NP7
         jd7QwBZJzNYaHBLLS7ynkaO+H1NWkrYGD7gtedmZSLXjkA2Uxyccm4h08BdRpVKhndVi
         oaOLF4e3N2V9NkbIQeMZUZemZGsUw4piLXFgs5Xa6zw7zhO1nCATd86fw1dPyRHwHXSM
         iwigPe32V3M6NUCcJFUuV+tLtunBzRsJcu+cVejXdf2D8eIoy/y9pbwGfGZTE2wwTRWD
         1xtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768949069; x=1769553869; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F4VEnDJOtkfJWl9oklCUe6ILDLAraZMxfqSxkJGVkqg=;
        b=kR3W/tMi121viwGYJIMLwzGpja6HLAOfPwSWhUKCgdy+f/khoLO2uWQI2UcI2Vr+gG
         mbEOK6gBOF436gYLj+v/d8tX4ukCnXnHj3ukON2klSCBoaBZYfuJQIf/SC+A/KIq059O
         zOBLGWrLU6KTuvHsDHH5q1rI/Lc/wwu6gehHv3K8yLBiXeu8ZESbcVbXWcMt2bEBMkv3
         sSAt3aTCKUcNUsfbHuKEoT8MWRU7D5PY0hEmuU0DsScj+BJPzeADSr3m9MKzT5Q+mbK1
         w+fU7CX5awfd6HjEGC8ZtYmPHzXLtF8MH+2LqAt/fn/+ruJyfrPpJRazHYmrS9mXlnW4
         OS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768949069; x=1769553869;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F4VEnDJOtkfJWl9oklCUe6ILDLAraZMxfqSxkJGVkqg=;
        b=EBCuEADbCG9F5U8UsYgxEtjTjeU+sh82QVIwalxwwy1V1VGOUYod4mJ1VxfA0o5GoJ
         AkD3XSXDT5XoBFHn+JBlkh7lvziCJO2sApD79ZEbMA2Ra/C7meYGSkMRg0ZRCxCRLtkv
         e8CPb5H68t5PKZ0yANZIMkcrDGGBUZmMn66UJx3rRbEocekpA0jqqjIOJJiITEDJJlPO
         GubWWlliA5y1yi9dZU2GTshZ/+O4JuQckDovbE9rPXuavpqgfSouf4bRgm8c4ac/M8yb
         g6FfnC/7pPjdO51XwPQVBdoHVaRCheGbHfrIU9YJzvlSpvB5FgBL6rAuA28WCGqqBU5y
         4PDg==
X-Forwarded-Encrypted: i=1; AJvYcCU7i1fwW6uGYJsuHSzhaT6jG6ulvHGCwK3sgKzdjhc/YcQpF7h0/Sn02Mwx3p4/5xP+sjV2S1v7aMvB0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUPYeuwwUJSm8SELdPs7uktckywVxe9icT8Y2vC4afila0G3dV
	dJF1ouBozmPSDQXG2Qig6Eez8AaT+uleTs2xrpSkZwAA4SuTEU5NKRYEcZre0DN3Ja+grcm3ssu
	i1ngweBd/MpAXUEvc0TF7e17Uc0HGD34=
X-Gm-Gg: AZuq6aJfeiW/k7lq8HakGeljjHhh8degBoUMtaUDh4gcvG6ZzrQbC6qJChKAod/HlHe
	O8fG1Ux6t7lb5K7q+iibFG/aVZCGWvGhTPU6BLYniE38cmI2Hi0cD5qPPI6s5oavahTKSufeWSV
	+XybsBXwYaYp/49nOYfBXKSjNpgHpDkNv5dMzo1Vdw8nek/MrUUs9zXWcT4D6QDopOmiQ6p4PGE
	TzOZ6eJxyKezeiJblqsFVP4yiSqoJWSQ76YLE6Byja0E22e16vXfgdu8m5D0X9Nnghpf9YZ
X-Received: by 2002:a05:6402:2349:b0:64b:6f56:1e52 with SMTP id
 4fb4d7f45d1cf-65452bce786mr14628026a12.26.1768949069199; Tue, 20 Jan 2026
 14:44:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260102173603.18247-1-linmag7@gmail.com> <63b2087350d6990f0e348a8028f006924363c5d0.camel@physik.fu-berlin.de>
 <aW8yQMNTNEfxu6Fn@creeky>
In-Reply-To: <aW8yQMNTNEfxu6Fn@creeky>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 20 Jan 2026 23:44:17 +0100
X-Gm-Features: AZwV_Qhd_VxjwRFQhKyN1XvQYswfcLUk6oQB_ZQumoxPbSeHcDcZXHbBOLHN4Sg
Message-ID: <CA+=Fv5ROo10tzMMhG1w+s2wWn1rRAehG-F91qQacg4Ag9hE89A@mail.gmail.com>
Subject: Re: [PATCH 0/1] alpha: fix user-space corruption during memory compaction
To: Michael Cree <mcree@orcon.net.nz>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Magnus Lindholm <linmag7@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, hch@infradead.org, 
	macro@orcam.me.uk, mattst88@gmail.com, richard.henderson@linaro.org, 
	ink@unseen.parts
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks everyone for taking the time to review and test this patch.
I plan to take it through my tree in the next merge window.

Thanks,

Magnus


Magnus
