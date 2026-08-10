Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA6D23D283
	for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 06:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786342294; cv=pass; b=KYRQrZ4Wwpds94kv0FcHMeZ6Fg/S1yJmP4Ee4lOibr9v3/rgZgbTmJYUVhz1AqMNrWfxnJKkZ33TdeQbaz9Z7nuWLduHgsC9IgJkaXAOIomSIOIk28xIlIIrYPVMA1NpJkaxHDkHBbpnFXJFdeZOyjCV/LOMe0ULq8kQMBnD050=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786342294; c=relaxed/simple;
	bh=S4sYHbXY528o3eIKJWjMLhVPh03Z0NK/Bwr8AsSAImc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ehot1I5QvzZbtn3MtClHO9fRoSjLGx4ZLtQeCQ3mNShFmGb7BrcomqLlp8ZTgrUV9ijQuCsjTxHnRL0rZNHhCHvZhtf9pmx4NnMguXoirGTplPnoOwpOd5pJS9MIpYvQvMFfjNdQIgvGEOcs54rdjVJhyj2LVy3hc6KJn96F3OA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTnyFXcE; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTnyFXcE"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so1662652a12.2
        for <linux-alpha@vger.kernel.org>; Sun, 09 Aug 2026 23:11:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786342291; cv=none;
        d=google.com; s=arc-20260327;
        b=gn7RaSTiZuw3Nrk51Vs5Bqzn+cvyWEocpUD29qWCES9ugh8kpwBJK231MVikyZsrZX
         WSRXuy/ND5Sj3NzVvY+qPIrJLk8OsgZd9akjsv9ysrZHmwp+4EquWJmz5pq7XuJkPqdA
         IB9OWcij+LGab3f7pugwxeXzR9jTPC3gwgtLm4HjaMnmEH3zGRrOXfo/bya6KstDmAnc
         EX4bexRTbpaq7yyw/VEg1WogcP5bVob2H9zOjPDUfzE9VD+sDF91hN6BPl2d83EHAcJG
         CPNOgS7noicOm2jNQ/5JKsQwcwt8dz5xgn04fNrgVX7w4AjzVKd+/b88JWW7g7EQIRNt
         CC2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S4sYHbXY528o3eIKJWjMLhVPh03Z0NK/Bwr8AsSAImc=;
        fh=B1AieZIVwcutiTFi+p+AjHuGmuwYCoZHI7/YzR5RNhg=;
        b=qfzMbnM4mxXE2n0aj+hni4UaJxsfTOkQe01FPSVMldTodULjTVAht9gEXclv4HM7Gl
         Eb5SAiGat/hIUz6RoodwSryx5Apl+UNvetHYJio8CRPrtJpV8hJyIJ+EVkKHaq8cgt08
         dfTZveL1RPn/sh2I1hN3jdJ7jnxRniGcyf9CIXJoEqeekrikv4Ecc5VA4yBXnPdkhj8K
         ubmuWTWgKpnvCk+MePvBYHsx7JU88P8ylhmUqxllT0jwXxdukciXAaAY5wdIvE8VtiBd
         d8a7dvDNOCgeFEs3kv0Kk6fEJW2GMGp/pnU0SjhaTughHl1igR/B9McuDcmzuqD5MHzV
         BDHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786342291; x=1786947091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S4sYHbXY528o3eIKJWjMLhVPh03Z0NK/Bwr8AsSAImc=;
        b=FTnyFXcE+6W3V9VLU4/mb96oFhCT47HjUfSOsspjGOihu3CdQTcni+iL6KqQJQ01mB
         BwxE11Nb+SUs+9ATZk7fNfyt3NWoQuKElK7TnfYm8bHMtYloCAiSuUVfeWlfIsOuI1jO
         A0uNNbG6QoOLyFsQ6ALQs4Pn4v8On6LKel1z/gpNiacONQWlfhygQTsbgC9uElp3eOe5
         B6C4MX943N92VC9Tzzuh+DY1L5e7SQmHo8/YcaNM2OEyhXM8Dj4rmR9vm/lag0HFH74+
         XafhKhFzGmDWhkF/AaeaGuqt8rVn0IrpHvz9uziQKScYW+51dV+NlgGj2N4nmK2WuvIl
         WxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786342291; x=1786947091;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S4sYHbXY528o3eIKJWjMLhVPh03Z0NK/Bwr8AsSAImc=;
        b=G+QxNCPL3pb071xU+Up7wMqr8B95b0FXP2T2XD8cSHAinJJxK1oQukgt5Ak/dmM8k2
         AfOyHEnLtBU+KSbwGUspc0n0dclUPtx1kMWQOT9WCrf3R6cGsnKib4FJ4L7DXw3cnX6y
         xC1YuZPAZmNQLX/fyHsosHeVExWEXp6DHPhNfzBKP4xiSBh0YL+XdWi0aQGpaEEG1+Y5
         806AVB+Er4u9xcvSwROB3dfewZrBgIVejqxoIykg5h/b0e6A6m1ZBTZGAX+uWoDAELUc
         f0oMFsTE0Zc7HygHuWhZ949rAbm+wP4+dZYDK7oChUjbigAOYb+S2Qkl4v4hyNBfu/Ox
         mZwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpeOcCIYs88ao6+g6tSPQzBlqCmdIl+UsRHMOB33JjIbI7LXkOF/IhkJ5aMqdy0MyowPp6MxBPCyDkPHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3sDMY2Qwvj8EmKOh5vTIDvAKa6+bEJF4dcpEbKTf5jbVvA5I0
	LHGbysHi3vfJgvEUFFB251fwJmC1aZcHWnkXLzaTuSZG+HQWIjoFxCY4KOA6+RJJYJUna4xAf7+
	/mJLSINoNo3x99A/w5OZKUilfsMekPOI=
X-Gm-Gg: AR+sD11Ycx6rsKT8Ci/Sg6L+RK6QPzNKoCYxLRvQfPh2klEFPG/2csOUt3OAl4Z4RRZ
	4/YOIx5b7sulLDtRTPo8qZCf5ydig/STLGWoGP4Dr1B1qpVvtdT0YyEpVBRk3ODCDbTmTcTFbLd
	fH3pKDro9yV0aUN/iwaARt64fZJkY9X1fuXrJ6fJTRe7kwLw+zG9I8rPonuuQx7fsDrSHumKjyR
	Skq6+CKTrFytO3FTddQ1EbYlLraNmgLavrOT2eKVKAVbW3I5KuQxt/cc0AMrOdK1PxUMel07PE6
	dhHsPcCQpIUUN89FV9MjCBetyC8EvJwuDe1S6gKOVnFoinK744Rz0VNwd4pcklB9kejLoNthCc3
	KECCBUcddaOOZUEtFNqaO9afBayd7CWrcVpD0V3vVVw==
X-Received: by 2002:a05:6402:a0d3:b0:6a1:f26d:ba78 with SMTP id
 4fb4d7f45d1cf-6a1f26dbd36mr8007667a12.11.1786342291041; Sun, 09 Aug 2026
 23:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809085208.3262799-1-linmag7@gmail.com> <20260809085208.3262799-7-linmag7@gmail.com>
 <CAEdQ38FEmxBu4xyf9FO9qqOO3OJewSCA-qoQ+M+X9JE+vGwa7g@mail.gmail.com>
In-Reply-To: <CAEdQ38FEmxBu4xyf9FO9qqOO3OJewSCA-qoQ+M+X9JE+vGwa7g@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 10 Aug 2026 08:11:19 +0200
X-Gm-Features: AUfX_mwBdgwnGsO8tCOeOaZwCrqKPwVHRJJ2l3VWxSvDrcs0X5QKO4aaxDEsxXU
Message-ID: <CA+=Fv5QFQ6KD4nd3K8MMA9UFNcMASNTjvYi6Ym=KZs4fQmBWjQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] alpha: invalidate the local context in flush_icache_user_page()
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de, mcree@orcon.net.nz, 
	ink@unseen.parts, macro@orcam.me.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 5:03=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:

>
> ipi_flush_icache_page() also doesn't issue an imb() here, so I'm
> guessing it's not actually needed... but I could see why it might be.
> Any theories?

Yes, ipi_flush_icache_page() intentionally doesn't execute imb().
Alpha's userspace I-cache flush relies on changing/invalidation of
the ASN rather than physically invalidating the I-cache. The old
entries can stay because they're tagged with the old ASN. An imb()
is only required when ASNs wrap and can be reused, and
__get_new_mm_context() already does one in that case.
The problem patch 6 fixes is that the caller was omitted from this
ASN-invalidating protocol when the target mm wasn't active locally.

Magnus
