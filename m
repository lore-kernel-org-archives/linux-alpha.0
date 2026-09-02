Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0073859FC
	for <linux-alpha@vger.kernel.org>; Wed,  2 Sep 2026 06:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788328907; cv=pass; b=P8VpOO0GRm792SK60V0CWbRAIvGV8bgorkZbafJCl+nTXmFNz3jZi13Cmu3+0TCY1AJIVD36mUD6mq/HZ7purytikBdYxoWlXO2PQnC2/CqHs331survbKK9eTTx8cfWexejpEJJXX4VrK8XKStyigU61uAXF0cx11y/AQ7xTTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788328907; c=relaxed/simple;
	bh=0/44lYrEk5LJ7Jy6yMWQMzMFrcvbDwUSo5nkI1aJqA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ue7jqL9iOoKjjWIBZuhY7+nOanoEN4jI3jnwFrpzi1AgQwf8CR7je6qQmUuJmXiW+hjOymm9YM0SGIvxpURXZch/19VUUiYxmhAdX30EJGsv9ik5M49pSMxhpv5ArhfrD31F/28AhpTU96apf5PR/JRkYqaPjkWy8oOuFosSdiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qFDG0wPL; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qFDG0wPL"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a668ce86abso1105440a12.2
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 23:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788328904; cv=none;
        d=google.com; s=arc-20260327;
        b=Yqd8oMVdzCihaswgli6LwyQPHQD4nTykOCZxn0ZIAUeyCFEMfofgQxEOcqrRkTRM43
         dWi/S8ARsH3dw5V1Q03B89PTAhBFN9S2wte4t3KSGpxmWc4hdRdxjUAPkXghDdDlyvrs
         +XeZNt2Wh9DxmBIZ9nsDXXF32ecG1YtyN78JsGd7inuLIW+0ROLt1Mge18yLyeWb8Wyt
         bbyvK2dIhfFJSufmHhaNZGo3zrz3XC4GzB+MX0rTCEhIs/GYB8IUOii12k0db7PZcxEi
         h5wQ62aHmnJ5ik+QTKeAAEDgalR79u2ow5ji5+OO2v9EW1YI4dWD9Iq1XON7ruyRHZwM
         9CqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0/44lYrEk5LJ7Jy6yMWQMzMFrcvbDwUSo5nkI1aJqA0=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=pMcY1xmu3mQqbCUx1a8sM3icf3Q0Wh4zTPzU2CtdyRLXWltHy+Zd3PIIYPcpdBPULH
         bMcFWPoeciEfVffebBhA7tBbNEivFZ1B7rusdFeoGnLbZ/+Y/E5vubko1mNjkwoVmtHa
         jBNtrji7idCsJsNxbLa3MU8SyT6VoWVuEDq9VvjXVAI4c4/iYtqJnJUjQj20BlOVVGnh
         P7NU+m+NUrECcElu8LKh4CqWI2jA75KN4dgZqOoWMrDMgqT/Zyw4uehyu9Waw/DVPmqS
         A6HTQAoomv7f83rB15HypGH1SP38XL+NBENIfRuYg2ps+ILtp4TqPaoq/2E1NiZEKVqG
         KEaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788328904; x=1788933704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0/44lYrEk5LJ7Jy6yMWQMzMFrcvbDwUSo5nkI1aJqA0=;
        b=qFDG0wPLoYdgIz28wld6JT2p2iTq9PGtRHq+JJRKB/QjNMhW6Bc0aZAAtAFTwXHqpA
         Clg7ZbLFeYZ+aJyCgmpiRKrUMmUvzEK8o6IJg5sWKBGtcDlec3J8UmFS3BGLOKwgKTol
         8Hx2xo8oURXc4PxcrDrQ9zIuii2Yn6sYtCFVP/ukFUkk87qn2sYOSfm2P9k3a5RCIaVr
         +kwR44c1JNMvHrQ17ib2k4WeNUA1waE+GXIF4UFjKWFiWNkCgWM0dCqNuX0Hmq0mmRvJ
         JhtET7HOoyzo4ArxQ+vpRWzRnwYP9oIP3BG/zopcXlKDGVrPifvqHkuhDk77T4WA4ep3
         MW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788328904; x=1788933704;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0/44lYrEk5LJ7Jy6yMWQMzMFrcvbDwUSo5nkI1aJqA0=;
        b=kNGzIqTPBnhGkpYT/FdnTsK2HHnT5p91CEIkmXmLKVMD2RWb8bbBjL2Vy9U4RosZh4
         qhKc9aywz+cSababnOuozuR/UR+NGA6zjP2YBTDdaPK1gpDPxRaSrbdiEQNeJmlUStx7
         TeCm2Qz9pCUBvzkWpvlFHA0zagJgHbUlHJTl2b1XMG6LCoCnm/e9SNGKTt/gbSG0fMx3
         jcbm2ka/qSeZZyG3I1q54S0nG5DDSck0GUxM3A0IOb3bMNC4lwWzsfgxh1NuLVHjS20S
         tC7OLnmdNmMz7mQkWMPeUt3rIdnw4ODC5JJA7H5UMYv9KXVXEOrn2fK8tHv/74eDy5w8
         cpug==
X-Gm-Message-State: AFuF++mBZ6ks5sphiSvDFDHzHSSa2V1zslHw0Z+P8axE23HLHDGYu8QV
	gEUtQe6krbEPQ8dDcKDFZbb7rTUtW9Tl8GMEbHQL5UuVW7WqifGSwH7L4r6PF1HafI6PayQYUW6
	D95VOs/aH5FOH9c9tR6oc+zeY78sSWYk=
X-Gm-Gg: AYBFou1m8GIX+k3HD/byNqgpVXIxxbTRRpQc0NmSvf8qUXrb9NIdSnbJWoCNjcHv+Ii
	U+FMESafxamrhelHsAs6MB6OrIkqam5a1G6rDpTTvLjTo3Oj77x+lX2xoPzcpAPQQ7Z19BkCWbl
	6BalUkHpPIwc+LJN1Yl7SG61SqYtz8jQsR4O9/nTKBrxGOUkc6V6IC5UaEYNTNKVbBDBiOgMMv2
	DldDNLvCj+rW7N+tF2E+hdNXNjUsqo/CwVd0z6/Thu9qTcOdn8udyVe4DcHxnpb72tyILjw+qUa
	DqOwVl20HDRookp4PmRSagIGwEok7137ttQMjsVf7zObOeV3W1pfDxZeUnYuvV5uKGyJ875pFG3
	bv2TpkfQiAih19j6hXHZTvb/51feJo3w=
X-Received: by 2002:a05:6402:3819:b0:6a1:f7f4:200b with SMTP id
 4fb4d7f45d1cf-6a6829b0019mr759262a12.12.1788328904058; Tue, 01 Sep 2026
 23:01:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <906b726c2f6a84b55365dd78ceb899e2559b76b6.1788277742.git.mattst88@gmail.com>
In-Reply-To: <906b726c2f6a84b55365dd78ceb899e2559b76b6.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 08:01:31 +0200
X-Gm-Features: AcwNN1VxdSqiijdHGCw3UjtuH6Vcfz6CUJ9AQ3IHYQW6HuCjAN6viDA3q4KSZjs
Message-ID: <CA+=Fv5QKQ02-CWHjRr5otSSveFdApBuoFVqWdE3AJV+RR=Lgjw@mail.gmail.com>
Subject: Re: [PATCH 05/24] alpha: select HAVE_DEBUG_KMEMLEAK
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:50=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Kmemleak needs no architecture support beyond the standard linker script
> symbols for the data and bss sections, which Alpha already provides, and
> a scan of the kernel stacks, which is done generically.
>

I tested this on an AlphaServer ES40 with CONFIG_DEBUG_KMEMLEAK=3Dy.
The kernel built and booted successfully, and a manual kmemleak scan
completed normally.

The scan reported three suspected allocations from the sym53c8xx_2
driver. These appear unrelated to this patch and may be false
positives caused by references stored in DMA-coherent memory.
Either way, the patch looks good to me.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
