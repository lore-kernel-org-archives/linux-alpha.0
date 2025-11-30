Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89F121FF3F
	for <linux-alpha@vger.kernel.org>; Sun, 30 Nov 2025 18:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764526464; cv=none; b=dSinJ5I9/yuxapq5aSmQpJ1IQ1t980+S/m31kKnOwr8QLAiYEsi2EHXsn6djUYa1RzWKntxznbM5dL68qzB+JQXCcf1eQM/S851h3QrOkU8E9Y0fpf5byt+g6smHaNAmZcidoWLuO6Pj10cg8CI5YSIZPYrpr+RX9SXizMplsfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764526464; c=relaxed/simple;
	bh=RYgpP/0JnR6jncuG+HbiYZ8RR2p0fJL4bdSomeIePY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dnTWP9R8U9HjbaeOGbmGbIZKxr4i38Yv3YoWi90TyHBapgX5ILae8k6iICLeMPGmAcK7D56l8ZzXY9PhXHUB3G9hhRHidpGZebUs19jEOC8abLXCcFS8ySopnBq5SZzRLvVaWeazWFBsjiMIRMjx50Ry19l99rEOknSglDayJss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=np4usgzA; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="np4usgzA"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-640a503fbe8so6455396a12.1
        for <linux-alpha@vger.kernel.org>; Sun, 30 Nov 2025 10:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764526461; x=1765131261; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBLsT1Kt5fCGBYy/tImoC4leU/BBbgTB0sTZXBRw36o=;
        b=np4usgzAUD8r2D6ZTM0Pak/lXL2RN5Z+cFrBxTvkr8z7ntfTV9vT6TF1dH+QvJiev8
         hSWc/3gQW8aKPwWSxuoRiaoZusmdYW2lZ8FWdcZ5oMTp4D753xuK6pf7XHUIAN/nNwcn
         p5XKUoFeqEZuskOwWBGBxPR4j4pxHNfBxbzn8Rp3MY4r2iUYww93T4JlY3prOmLVOD6/
         Sa7YI/Y/pbW2clOGYwevaDLM8sqRkraoUkOTTu2RvuDzTiPGqywig5xfo2Pj7c6nAFCE
         DvJnhrdRfSybPpea/hKa2MuH5KTSBZQRtajC0yPb4Ol6HwaSZbs8ZxOd7++GEZqzG7pX
         OlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764526461; x=1765131261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KBLsT1Kt5fCGBYy/tImoC4leU/BBbgTB0sTZXBRw36o=;
        b=r8y3xQ41frPVSl8lbO70Bmbv/tTzYW6L5szPAm79wf56y1TIcb5Xl7ysbfc1WERTgV
         EN2YJYCY/FIycNw8gUnjl8kDhvgztodow/VchzXe9GZWKB6hIQaki1UNXP11SlFDg/OJ
         6opf2/FNIyBYzlVIbsAVTaEI0muEHPp7tyA2+rCRmvSrDzZpXF/kPY+Ud27TRZCcpc5D
         9EF0DBWA460nww8V8xG5QLkUn573qYW/jELoJmaK/euhY+9q3REPQx//Z/4EnRpJyYX4
         KVso307cV4HHT53tYIpFWuOF3xSeNDCwkxkX6oRN9cdlew+wRDXfkSpSKMFkU3I89L0f
         h6Qg==
X-Forwarded-Encrypted: i=1; AJvYcCXAAgKJ4T65sVhtOrbh1DSsJ4b1eUTod5WCUa2a0f1Z0YiTSZKItwV2bnMQZazstK3vPsGkmdj/Wu1QeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4lVZAHE3kV3eU70lYZa9hjQ7Af7xAyo1atN9nJHa/GMGwHH0n
	yH6awdsWBgd3vxTGX2UTMwyw28swd4LqoPvhqhmqzlE7Q7zSRhkjmu9IOaoiIh1xF3So1rIITQt
	yAtu7Suw2pZJm7JaXII5BjpTckkudKtc=
X-Gm-Gg: ASbGncuwxHCr0BlAHJQct8gDvmNudqKfOmJ9WSn/z7RTPmYYwH1/WXG9xeCjBFvqUS1
	8tynX/ZDQp/oQKdtzcCy7xE8/SEmaKW2AyUUnoEwAXwhjfWSLw/G6LIG+e0ki9zVrh7owYZiIwy
	KjIaAHukAj+DEWDYYfMc+reJzFXUKPUNjXcQ2t2laNFPSkUJ2LCLR2VBB9hygi5tsViU342kFHB
	EU4+aD4ihN/uTMEb5fUNBlMowPljBQ81LRoqodDp+NlJoBpsyPkd+hfKouhfNzzoKXcLF+3
X-Google-Smtp-Source: AGHT+IGupBFdrEOmRl5k7yY5aSkJW5q5+XQv+nRU93u5Qo5WO8nScYPZTMUsiFSkhWy9i9ITX10ojEFa3wagCBqPerA=
X-Received: by 2002:a05:6402:358c:b0:640:be87:a862 with SMTP id
 4fb4d7f45d1cf-645eb2b54b5mr19121191a12.24.1764526460968; Sun, 30 Nov 2025
 10:14:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <20251126185545.GC3538@ZenIV> <c375dd22-8b46-404b-b0c2-815dbd4c5ec8@huaweicloud.com>
 <20251129033728.GH3538@ZenIV> <20251130030146.GN3538@ZenIV>
 <20251130113213.40c8e7a0@pumpkin> <20251130164348.GV3538@ZenIV>
In-Reply-To: <20251130164348.GV3538@ZenIV>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 30 Nov 2025 19:14:09 +0100
X-Gm-Features: AWmQ_bm-wMIuBmzcPhNWr-LzkAv5-980q0q5uk1rnCb2E9BDvqCfeZa_S_apEGA
Message-ID: <CA+=Fv5QNL6q5vioEd8D9UqN10yM=EP1sMtYKYda5PoRqXngaQQ@mail.gmail.com>
Subject: Re: [RFC][alpha] saner vmalloc handling (was Re: [Bug report]
 hash_name() may cross page boundary and trigger sleep in RCU context)
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: david laight <david.laight@runbox.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 30, 2025 at 5:43=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> w=
rote:
>
> On Sun, Nov 30, 2025 at 11:32:13AM +0000, david laight wrote:
>
> > How difficult would it be to allocate the pte for the next 8GB on deman=
d
> > inside vmalloc(), and then propagate it to the per-task page tables.
> > That is a path than can sleep, so being slow if it needs to synchronise
> > with other cpu shouldn't matter - especially since it won't happen ofte=
n.
> >
> > That should be moderately generic code and would let the vmalloc limit
> > be 'soft'; perhaps based on physical memory size, and even be raisable
> > from a sysctl.
>
> Considerable headache and pretty pointless, at that.  Note that >8G vmall=
oc
> space on alpha had been racy all along (and known to be that); it was
> basically "could we squeeze more out of khttpd" kind of fun.
>
> Do we have realistic vmalloc-crazy loads with high fragmentation of vmall=
oc
> space and total footprint worth bothering with that?

Hi everyone,

In my opinion, for Alpha I=E2=80=99d prefer the static preallocation model,=
 as
it fixes the LARGE_VMALLOC race cleanly and keeps the fault path
straightforward. I don=E2=80=99t see many realistic Alpha workloads that wo=
uld
benefit from a more complex or dynamic vmalloc setup, and compile-time
adjustment seems sufficient. Al=E2=80=99s version solves the issues without
adding new moving parts, which feels like the right tradeoff. Removing
code that has never worked properly should not cause any harm.

FWIW, I applied Al's patch and I'm running it now on my XP1000.
Seems to work as-is.

Regards

Magnus
