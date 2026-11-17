Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794939219;
	b=o8ORnlYzE9n+1pzOmjXVZ0d5rcOsApTLnMiBm+MKTkzUeyNVvrbe2FLczyJHMSZGZUnd
	 CasKjuYJ0qaYHex8I3pRqCMHRKsPp7LUUEkNoG4xC3NiU9UFOpJRGijj+Abe6W3SKxsNY
	 mhQvhISEoAmadGIUww/AYyTobb3NxxbPzG0gFfsDEXMpC0aCelNfIolslKYIQIVgv5QAe
	 wvPWdaBpFJjZ8GD579f1KmEl33IrEMafc/JCyyCSuEGWSLDg4uMYpR2K6fd50YoXmXPwK
	 EqCCqLCK0Z86/Z8rc+j/OIzkJ81pfOOJmYptzXrj1cmrsNNVzilC7IutWzzr3ZDbJlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=erlUER00uutbOeUXRe0dMlrIK7k5YTIn1N9SBf2g4jc=;
	b=RtyDbpPx9enwOl4hDAbC3a0judmnz8jABbcVUnAOpgt9ZwLwd6TywyDJzv5grYixs94c
	 68e5nrbHFv1bBiFGhTDKF1Yd9SggDGqjypF0HKy9VXXAXAmFPFCmiIxNlPYI2zxvf/k5l
	 O4XqKhY2sN197Glk3s608sD3YrDSXjqXjDdAO5WRTRL1ZB8Z5XcrneqOECz3m4bhq5Kna
	 2hSq0GYoZTPqNrUJhKwVNYPeaP5gsO9/yqU1IvpNGOrABNy8BFjKTyVelaPHb/d+jpT4b
	 zvTed3GrnmZ1EQzF3UeAsNR4RJ+45MSwJEPMUkrewIyIIabXdgDT4DpoVLYuAItkRwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yWq8fIRK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C6F606A894
	for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 18:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0C6F606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yWq8fIRK
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ae0d0b9db2so1821971fa.1
        for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 10:13:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794939217; cv=none;
        d=google.com; s=arc-20260327;
        b=YT3GQcR8lNiTcojKIrRm+zOkcZ2nLIwQ/fWdhUAeIGBc6C90PC3mbQN9ryhurBHq0S
         cQcRYr13we5ckhFSbmuFgv4aRNAIvngJJ7wpK5yMw9uvZM6CEoO3VhPUdLLEwqI3I+tF
         tu0iCkVYISTGX0QlD+/DYROSFjBU2wLVzEEUe/fxlGPCHtQX85ZqI4iuT66JqqOzUyqL
         fogc+FbrOuRVqVPeo41mNRxWykhrV3usR0pRSH31uhcObQyd2TePZ3sWJpQ6fvhMLSD+
         5NHWnpTDz3blzkM+GiXnYEMBpIyZFV3jl/11V4JwFrXQ008gjTzn8lIh34zfJIhQLei5
         FszA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=erlUER00uutbOeUXRe0dMlrIK7k5YTIn1N9SBf2g4jc=;
        fh=jAgazOazLdPZ3AdLTQfqlJIP65YskAkBeqX+vbV3688=;
        b=sRJOk+Oy2e7Yl/42gwwONU6uDaeQZ7PQnfh/2hs10I48g5QM0KxFKoDYr1P9/zrDbw
         IN9yk2iZIBl0ZkwsHIMRqCs5W0/UQ6eThUFxj4X9mKv5UV3xUGEnSA6vxS3vTB/mc4tJ
         6ZTcK9P0YCv/6KMV4OH1AigPaJ7dH1uZgkCnjaQuqIPWgqX40tVBiXG5p+WFMGZ+86dF
         jfnrVWf6WS7dz+pvyt934VYrFW5H37jscTIe2dTfbOgUGKZeeyAdzu/GngwcnOO3v/Ew
         Ydfos2HIN5RSQG+zorPBbL+l2WLALP7VzOh13QJjOTDNro4yU6zpo5806kIAx8w5/zMt
         9iNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939217; x=1795544017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=erlUER00uutbOeUXRe0dMlrIK7k5YTIn1N9SBf2g4jc=;
        b=yWq8fIRKsYvOVYJkN+zuhrDf5zzTzUqBNqndE5f6I0NuyPm5k1QYBU1TxuA6LUrayP
         u9g/rJO1y8oNXunkiwTxK/PEnIDGWko/TH/y6fdqeoZVr5MsQ38hY+z2KpG3sgq6BJWk
         Uk+PxgsWz4df/3Q3gszOS0a28AGCRXK7qrNrs1liYe8mvfvy0RnMZDm+HY4rEK2OLNdl
         D2O2ciFFGs/v3uIhVFRIcdDMCp1tY8Cx2whBmtqPrFLKaSr1dI29ZNSeJFdbxCrEUFQW
         HB6ed0+jh3NibJOScnRUnJw3EhuLteXt9rttaO5Wl9w1CYEPMjG8/8bAlAkv7VxP311K
         I4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939217; x=1795544017;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=erlUER00uutbOeUXRe0dMlrIK7k5YTIn1N9SBf2g4jc=;
        b=ZMRW1O+qCm/Q05JALD1Y/ZUkmz5qWM2igtLs86BjdHo+nuLcwHI8sZEG6qZ1/pUmZN
         O3dldliPsl+4LHFHgRrFYvcvdmoPVWv52CjRUX/vrdcOtwqbz3ghK+UMc4dazvTL7/3S
         RzNzzDGSMPoTT4gVoBh1rkHPHEGhNgj0+WLCh7JHRQF6SMfX8w1eufUWSi8nrTWvdjqf
         0183Dxe3mO7cQoLBkRsU3Hq6PdpW3p1iz4BHWB9n4fLmWfkQt1w/M4RSbs1kycG+TD/3
         u69ydMVSXfzZKe6nlpwJlxj+esIpiT2MN0qswiO1GaGh9NPnOyRVLH/cyIZvyThqVWse
         K1mQ==
X-Forwarded-Encrypted: i=1; AL+hErEouIFDSYkdfJJs6V0lUEyqOgg1NSfJYIUJ4sJxVYVwqQm/p9NpjyNQKu2yguNiI+AUMYDbxk6Z5ka/cg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+peQtMji1NqPhASQDP9vKJZLva46YkKlncjor49G1nwBsCNfwn
	3RIkG6JKtujxrXHQa3I6urROn5POPTqcfEEYNEhmwymcmz4ZSiycbX3ZQ5+huA1CDwqUhsgtVLs
	tCWuuTIs7Qu0K36h5LeqVX/ZQcMKyAYo=
X-Gm-Gg: AYBFou0pOWyhRj193nXeGSowxeyaG2oHGrZdiAqj5vuIKC8G3ISmPEbFUWYn2kPD6AT
	NXTTdh/ENNO7692u+CEk0qTivx/TGL0E7q8MzakwcI0E9Z/ANiabuWbCuZtWU7txaBxS1P5+Ds+
	mgyxW63OoE2dUTFNZeSiyTTE76T8lAa0ejF4lF/gX47Z1bTZWZpDbqot6XUS1r0OBn0jPbeRVPu
	alBY91Ttl3c+ETyeUN8rd68g3LCZbqHX2g4+aI0Gi9jNGGldSeJKYNPFqWdejHiPoOfDYwUeWFO
	DbmvfNJsfMXPNJect/7Sl4/0QEiEZaJg+8RVDz9IpJe9M2QEXkkygfmb47AOBJuHFAGK8Kw4FdL
	7Kxz46pChx7jgGe1iWCvPNXUsf8GnjIe+MsZOjl8fjoEVvKlLMitWKsW4Z3wKfSCh3TgK8cJD0H
	eGPB5kFTu4uVFdHGPBTERW9KP0tYcLcuXZ5lX3o4UmHROYVvI=
X-Received: by 2002:a2e:ab0c:0:b0:3ab:f9b:974 with SMTP id 38308e7fff4ca-3ae2b6b6de0mr41375121fa.29.1794939216626;
 Tue, 17 Nov 2026 10:13:36 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
 <20261116-marvel-env-v2-6-ef614eb2e7f1@gmail.com> <71d115df-0380-4724-8cc1-ca7da0aa5fc4@roeck-us.net>
In-Reply-To: <71d115df-0380-4724-8cc1-ca7da0aa5fc4@roeck-us.net>
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 13:13:23 -0500
X-Gm-Features: AclHuK_oNiRl-U7dZo5t_PUbIvckg4PZjah-4kUWpzh4pr8I4MHJijK9LPm47r0
Message-ID: <CAEdQ38G0hC3QvZrM-YLUGUT=0DQqjJi=G=CWu=2fUwZLs1wLBQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] hwmon: Add driver for Marvel AlphaServer
 environmental sensors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 11:13=E2=80=AFAM Guenter Roeck <linux@roeck-us.net>=
 wrote:
> This is not how the update_interval is supposed to be used. update_interv=
al
> is expected to be programmed into the chip.
>
> Soft intervals should be hard-coded.

Understood. v3 drops the update_interval attribute and refreshes a unit
at most once every 10 seconds.

Thanks,
Matt
