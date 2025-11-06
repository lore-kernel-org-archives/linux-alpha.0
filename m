Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBFD306D3D
	for <linux-alpha@vger.kernel.org>; Thu,  6 Nov 2025 22:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762467668; cv=none; b=qQSIkmltl7XEKUkjGUHjBI5msepCMJd7k5C3tzSRHMHx0UCISKkrH+oBn6Zf5wF//5gZI9s/Ye1zy/4fOnoGz49qrqJklG1YTy9Y9GFhIBMuBtS895gaqjmkqEvTo4JY9T8KkaMZVXdbaW6c7twZMA5Ly+6vLV1Z1eopZ7MmxiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762467668; c=relaxed/simple;
	bh=/ygoso68qxAo+I1gPqHR/S2bVV2Aj+Lzf1IsI2FGUc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HnyzuSImqxwekGJA+RdNzKzqrGX4Abndxhb/aZOfrebGNcn1NqQeQZQns0msNrePPEDnAUsfRg8UHCrpfepb3cf11+mR51EuwpdqlEkTg5Y79lsgcuF++3bT/kn5V05sRBJvOm8mHeCloRoLvCWvw7SzoxufOPV0tN8j2rUGamA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVp1GdWZ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVp1GdWZ"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-640a0812658so222110a12.0
        for <linux-alpha@vger.kernel.org>; Thu, 06 Nov 2025 14:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762467665; x=1763072465; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ygoso68qxAo+I1gPqHR/S2bVV2Aj+Lzf1IsI2FGUc0=;
        b=nVp1GdWZQSoLCTtWBPI/wQW40cdUNt6zcXDRIdPzHfJOBfxXz4i6nG2tb+khDun3en
         GSA/UGRIBiZFarKPMvQWbZrs/y1FL5A3jxVyWHvo8Oh0mP+G0GOEFqjnPHEpnqwzScia
         Mol9ViPXk6slEs6GTB9KIYAEhPj091PrlNcc7jxfMspExOGixUVV2vDuCiirCM852WTX
         1k4j8Hcdp0jC+mGDc3nGomiLviDMxbC5UBBltJYJmxweAFkUybUs8mhiEL26lIJVyEMR
         thLL5SXSrVYFMUUcWVHIIbhjCttk5WNo82l7U8//In6FBJTwVvy5zJaFKBqGvdJ9d6Ej
         wBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762467665; x=1763072465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ygoso68qxAo+I1gPqHR/S2bVV2Aj+Lzf1IsI2FGUc0=;
        b=BUaBgeokguRKifGvuJG+zME7v1OMA7i1f6knk6fUdEZV19CeyLcDTWEfQYOzQq+9Wr
         neo+qrp4/lKuM40aZNXiWr6O2o7uBTawTs8+TmxYW0ZSpkXnyBWFieGeawh12Ri3lN/T
         aoa/58yr9OnBTzDne0pQdiURlRZpD0FYGdRC25ivRpBwkJ6aVtVnKKHCmhCbr3IQaMbm
         5zRBtnSxTPTWnLxqT7KOwbu33Zpgs57muT0GW7V3EJYOSQAxpDIMtk/Xa5EDYV3SLltV
         PuphU3/c7rD/fha2lcLUOljy/2CKfonxp4i8hd0FdUAVh6QQpCtAKBuH4jipL9820v0u
         VL1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQMOtA1uCWehd0zsXzAkJ7m8gMWSDCFYBnOsZeIFh3RmLp7EbgGUGD21dzaAvJ/S6CmcYGDjqp+57KXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx2npPefvAw/GUO5UW21VzaEsX/7o44oyXc7Pc1dPqRZ+8Sskb
	jK0elV7ev3lVWHKYo+BmfZ3o0YIy907yE2tyt9ZadePdybDY9jr86Vr1WMn2+WLKqc9yGkZkogF
	btfZAhEz4Re+If3E/M8b1gfGYJWc9Mwk=
X-Gm-Gg: ASbGncu5ZN/ibajnxQ7La5ihSqDfaRB2FbxUfohCV2VivJ7xCiZXZAbLqC1ldLJPGXJ
	122kBkTccz0/PAGuf/sLSV4aIQxQ1yy8+e60vf4x64Z1hNEZKqcLqqR3wadEmN3C4JBFxsUPDv1
	wxhg+ONqofLp+zZNaLyB/FI4DuxGRnpI957rS8lyIfgOV7zpf3SXW3+FcddkgiA3nCtXFpYOv37
	8pu6hOQEp2bfbnOerdarPRy94QmNYYMtY77dKO8T4xUXWMajDOoa9rhKlJIFBGENJDwMdp1CSO4
	HSmutJ0=
X-Google-Smtp-Source: AGHT+IG+TIAJ8IOua7l1mEprD2KTfqDGE+T9uMgK3wmEihVKudTfZaDUPZk/PP9mSw+jigEdELh8riemQen7Kc2izxY=
X-Received: by 2002:a17:907:60cd:b0:b70:68d7:ac0c with SMTP id
 a640c23a62f3a-b72c0ad942bmr82880966b.42.1762467665046; Thu, 06 Nov 2025
 14:21:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251024034701.1673459-1-danisjiang@gmail.com>
In-Reply-To: <20251024034701.1673459-1-danisjiang@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 6 Nov 2025 23:20:53 +0100
X-Gm-Features: AWmQ_bkDYJ3Fr-1arvEyDEO1bXJ01gqbCdu39kZW9fG-2HstgXs4j71OYjmvDxQ
Message-ID: <CA+=Fv5REZNSH584Sy2cA2-iKqfRzV64=d4_nwOCT5vtH+1jX4Q@mail.gmail.com>
Subject: Re: [PATCH] agp/alpha: fix out-of-bounds write with negative pg_start
To: Yuhao Jiang <danisjiang@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	David Airlie <airlied@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 5:48=E2=80=AFAM Yuhao Jiang <danisjiang@gmail.com> =
wrote:
>
> The code contains an out-of-bounds write vulnerability due to insufficien=
t
> bounds validation. Negative pg_start values and integer overflow in
> pg_start+pg_count can bypass the existing bounds check.
>
> For example, pg_start=3D-1 with page_count=3D1 produces a sum of 0, passi=
ng
> the check `(pg_start + page_count) > num_entries`, but later writes to
> ptes[-1]. Similarly, pg_start=3DLONG_MAX-5 with pg_count=3D10 overflows,
> bypassing the check.

I guess the bounds checking in the AGP code for Alpha has some limitations
as to how it's implemented. I spent some time looking at how bounds checkin=
g
in alpha_core_agp_insert_memory() is done on other architectures and I see
some of the same issues in for, example parisc_agp_insert_memory() as well
as amd64_insert_memory(), which even has a /* FIXME: could wrap */ line at
its bounds checking code. I guess even agp_generic_insert_memory() has
similar limitations. I'm wondering if this is the case, because at some
point, it was determined that this will never become a real problem and no
need to mess with old code that isn't really that broken, or just that no o=
ne
ever got around to fixing it properly?

If it needs fixing, should we try to fix it for all arch's that have
similar limitations?

Magnus
