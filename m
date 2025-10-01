Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7723835977
	for <linux-alpha@vger.kernel.org>; Wed,  1 Oct 2025 22:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759356738; cv=none; b=q/xcaFg4qKLuNEoOqDekws6Nc2QsXe1mndWh12X0jc3ufjr7g9qLXjOTCIvwug7NZJQy4cdzhnZwQoRndpXS4819JA+DEga0NOky1MzsDzBS9ZLSKgvFCl6Bx6fZw4n+vPC0ZmqFswqKPcAxFt32RU0q1C+PVWwk1yAJeweg4uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759356738; c=relaxed/simple;
	bh=WrzVffmDsNjJiCDEF5KAcYVwh280/AsFYAlQDRppDys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LrbrDbU0wqaANlom2Ud8NuG2O0MxAkH7Efbb8bzBKn8U8zfwXo3xs+OpCawTRRoDfTm2ea2fSpFZR2ghBZLEZMtjQ5ntL0AbhZkoQwqWO+k/Y4+wpasI6eobsP5ncr04buabe361xpXo9lsRxZQVehKpofZnrKk2GiPIZpeiQYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E2JHhPxn; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2JHhPxn"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6349e3578adso517413a12.1
        for <linux-alpha@vger.kernel.org>; Wed, 01 Oct 2025 15:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759356735; x=1759961535; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+4M0gfdv2LO5VIxrtcNUP3+z5CTBxfNX3uE59t+KH/Q=;
        b=E2JHhPxnJpd+a77zfUhETE5kZshbTFWXz0rprsVqs05eBnEVCMOPs4d65N4xLsqaSo
         A6jjtvImaahNhBbaEFcXsBAYEJQL+5f6Gk9SVUOmRcssL3Vyh3rU3d6UYLqorFDZaDl5
         Vfcs1rSVQwnCRVHYEGanh8EKdMmLB9PwuS7HgDZn6+fFyjnvMvRmqS+rltu+bF1w+q9h
         mhttBwgbwMPneWYvCEUiQRvAr5EP/aYzKPDw9SeXrwDgmXU1Zzc7GS8eCENkM+c51KaA
         /42+fBEYjB8fJYZ7F/j+xBFhFAH8yXtxS4tUjVGkytDQsCz6tstKf4Z4TIB625qG1JcN
         dOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759356735; x=1759961535;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+4M0gfdv2LO5VIxrtcNUP3+z5CTBxfNX3uE59t+KH/Q=;
        b=uZL1LfiFR4Aelzm+ALoLmDxWcPWqfegYHFLJifVxuS87fOWH4ZHlEyLgC4ta1eJvsP
         BthU1XKljlVVCJoB8IUkbPGaGRgRJcNZ+o3leK7aAim9vAGbOmIeT+DklvtvpQOMDzdh
         xYh4Hry4fJzNxynYWa02ANRO3o4rXFSWhsEQOnOQaPtHHbyNuShlLe4tNq0QlnGvL964
         8uO2qEUMTKNSM/1w381O5D7X3YO9hOKIv1RVbOpMYhHx1hMh/h6Mlmutx03hjww7U8LA
         CJeU1TH5JKryLnc0DcNBN8VGyY1sVADMbOKzCWg4QEPP3YYaCZdzODhGuNe7ixWn4sC+
         EKVg==
X-Forwarded-Encrypted: i=1; AJvYcCXkwRXPu1VLqeSteoWlwpiK9mxhMAnC/ImdHa8X4S7JSy/tQNTHhWAuTkRnU9H9V2kUKDzUyUvjuH0fJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUPvRCUb6UR9s69N1UoQ4gBMyIMFuUTrrzfueEHk/GAe4xWmNM
	NqXFgP3P2J3OUSNbFyBG8Z5+/aSkZ+IaWGyJJHwe0VW4TSeVpAaEQ3kYdUExiR4Cc69NEEWSHqt
	TR+kmuWc1kd2ynTUUfMPln9UTmmglQIY=
X-Gm-Gg: ASbGncvWOyyTcJ8szq5QdU7IvUnqpiohPFikC/uUXOYfAfRsHs8+rpRqVG+vbhrBU1W
	8E4OBylgVNTno2UDXxk+8DS/wHTsRMqJFacUHhmZCcAcT+zsi0Uxquikb7vW70VeCqmYqi/H1x5
	fjlrqU5ITm59sbz5xDwQfZlJqvBoT4Y6G6/+4YMg5MItANeLyMtJZoquY/5RXnDDbZO1ygiBQzD
	v6w0ek9qqk4qxMBsjfLkjJ43/gTb37NgeMg4cwmR8E=
X-Google-Smtp-Source: AGHT+IGRyaQeOqp1+iTUh7IToyq/JkqeZjebvRFOS8YTTLCI2P+NJylcPhZZZvabKFfY8JxGMtgbEptWC4JSVeRb6NE=
X-Received: by 2002:a05:6402:13ce:b0:634:5381:5301 with SMTP id
 4fb4d7f45d1cf-63678bce51emr5793018a12.3.1759356734605; Wed, 01 Oct 2025
 15:12:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fc2e8775d55f43e08eb79d326d6fdd89291898dd.1759347737.git.sam@gentoo.org>
 <b6a724419773598d75ace5629bf4b05726d45218.1759347737.git.sam@gentoo.org>
In-Reply-To: <b6a724419773598d75ace5629bf4b05726d45218.1759347737.git.sam@gentoo.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 2 Oct 2025 00:12:03 +0200
X-Gm-Features: AS18NWA38cHrRQFrTLOvXPxXoKh4oNZB8UDWgPCymue5VOHaQKIi0-RE2TAvrCk
Message-ID: <CA+=Fv5R=Gtt2BQqRRQz2tntW4nqTB3d-wb9R-0GjHnm-uXgA6w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] alpha: don't reference obsolete termio struct for
 TC* constants
To: Sam James <sam@gentoo.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Stian Halseth <stian@itx.no>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +#define TCGETA          0x5405
> +#define TCSETA          0x5406
> +#define TCSETAW         0x5407
> +#define TCSETAF         0x5408

Hi,

A similar patch aimed for powerpc (commit ab10727) had the following
definitions:

#define TCGETA    0x40147417
#define TCSETA    0x80147418
#define TCSETAW 0x80147419
#define TCSETAF  0x8014741c

On Alpha, if I do something like printf("TCGETA = 0x%08x\n", TCGETA);
I get TCGETA = 0x40127417, but on an intel/x64 I get 0x5405.
Is this something we need to consider here?

Regards

Magnus
