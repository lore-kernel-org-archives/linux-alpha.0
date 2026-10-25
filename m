Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792963141;
	b=tsajnGGTJXxPzjwV+4+jIKpqQDTCc0OmU48Y4Mwc9leL+aHg7HpE+inQR7IO4GNjVfbi
	 s98sRC3aqljGfk9QsgrdceOuHBdmZ2eitHEjoAy0rkYzxunNfuBOTDe6IQLxPwo3lUDb8
	 KH0rq1B99tsxW8DwxlDYiiJVZG6m7FXh+ZQai4eb6wvITTXauayqs7NRqI3Q/dki/lxpx
	 uSKD7WI7NMlG89btuMi9EcKH5orC2G9S7Nj4/G8pEf1raKcoQY98A8/W+ZkyY+feNmH27
	 n1fziVc9uUTyluSOG3kvWbuciebLoDGaB2NTMLoeycCDv5fxBk5H0KBwCoWRD92IRlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792963141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:Message-ID:From:
	 To:Subject:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=i3t0lc/Qji8NpTIxkEKaLecWA+FEVT+U6Bcp3yhg4gQ=;
	b=oWUDuM4OUD+eJ1y7/Ic8yFZvmN0Negt5enwKqsbYdiAu7WYwBTt3wnrdzfsXNp98WXG0
	 znUznWHz0mCS9yN3x/k+p3cuNizsdtPjbwbjEMXnGgcUQKz2OBP6LfFAIPl79ANLqm36D
	 0d7XhbDcNAvSR9xAiFZRjaODTVY1ZRDY+nQkLZUeyr8CrhZLl3nJpQdZgDoT0A/Dm1isG
	 hI+YCym5ZPv0jnXU9jm8MnubmkBxxjs7DVSKi8egwIzWBg8tNi5owLQlc/87EakfE7GAd
	 c3E6CP9eF6tTMnk8Xv/XnyzRsFiyJytK0D/kbavCCI4KIaEmp5mIhVYcfbaxUqSSqCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IKe8r7hY;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0411606A31A
	for <linux-alpha@vger.kernel.org>; Sun, 25 Oct 2026 21:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0411606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IKe8r7hY
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8ab43af5e97so22653417b3.1
        for <linux-alpha@vger.kernel.org>; Sun, 25 Oct 2026 14:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792963140; x=1793567940; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:subject:to:from
         :message-id:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i3t0lc/Qji8NpTIxkEKaLecWA+FEVT+U6Bcp3yhg4gQ=;
        b=IKe8r7hYZZAxiz6e/hGnKz/Lfg7Ge+Lzn1mp2gJGILP/1mwJVkRHOjFuvmDPSlBtxX
         Js7CECMbG2zTs7q63+dW0g/AaM9fnCDykdx/AYJgDRwuNVFw91ZkgpE7sVKT4pH51Mvz
         ZX/kCR9k+2y06f4KxrZL8Hlk2lIQlqF3wm3duXCtTZrx0pJ5vLaocl12DBdShNbKaDvI
         ef3HyP3NOHRh3ZlSO4IcDwM1KTArLNTNae2waykvLSHpWhO8cFHviIFsXaCsAiEEKbAk
         lEvrZlA0YEz1D5VLXpyq56eeo1VcGn/lx9rQS8rlmUSG9rlv5UqX4XLqZtVIpBLaFJ62
         Wrpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792963140; x=1793567940;
        h=mime-version:content-transfer-encoding:content-type:subject:to:from
         :message-id:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3t0lc/Qji8NpTIxkEKaLecWA+FEVT+U6Bcp3yhg4gQ=;
        b=J9tVKr+uakJCrBFAEP59VptCjRvHcjR6Mv2it2z4JmVNqHGm8uS13pWSY/stWe3w7K
         RkiZQzOp1FFESHd+qzSH3R7vrrvGzxhrGcPb+3oBNFLE9FcojiG4eJ1Pdmzpcla0KPeE
         irZHGxkp6j1L/OFeB5goTSVU7ZF6mqcHNKBWjsBz4My1qO8COCkYkcBfBan40HMFrG70
         eQfgioMP8scBqQ0jYyiLJZ35FLP8NbEcep1elj2B7kfnocpBQZ7HF5XmmJ01F34WV9kt
         zZuWLDE0PCMAjvQj/KgwKZuTRhjSlDSpMqXQUV2cbAveqeSEPZ1ftzjne4Cwwr4oPL2o
         2ikA==
X-Gm-Message-State: AFq9FYJW29kFvNuzxSpY3K9Rmj94fE3/UHojmk2pchc7At2YCJbaHtwW
	5IvyzXUqUTxjo6setDs9WrRc3vPznDh2oIiup3+DaRtp29EHj6W+e1en3vK6Ng==
X-Gm-Gg: AYBFou0UE3VQqDc4GBE+oE/LpR12p5bmCWOvg05EhBn4WM58w63TSUMPJ5OAZhgtrhv
	5pVNuqKMZjBYXs6+iLNeSf+nImUwwkFPmTwQ6AgGp4O+1u6NX7GgYmv11NisRwXLxR/UtTfEcUM
	6QBuzWbU4bky0OyHMSUMB+sDLrcGI+T3YK5LIajvPsJXcId9DNRKvAy47f/BnSabsqYJ2MKQMQf
	TR1KnnqK/Uy8IWPx7up2+WATqgcNQbSNgGDsumnXB3Fdqmid1eE3zbnZCrxCURqCbmkaw6TD8N7
	UKZoMFahmNerX/QziBVfE4fFJVLKlz2u19w+JVbzQ6VO4P0DUt6lNQaitYt6vhWnGVs+6J47kMn
	dWrxJ3RMDNFaaTYiooUbTUph5uKuAQiTUG5VGwT7wn7ktnE08q+7SI8lBqV31jYJSlCF2PlwIJV
	GwqZLjd96qcOMaVZ6Ot5FYniu9Y/ohAlyPfdVa/FpnttnVeHW4XUB5SwDtk/pIvk1+itnFw30bZ
	UtqeNS/p06Xlo91tRKZYHZMzTvSkilC3coXggOZ8CCPzGl8OtW460qy3guoZbEgL4JS+nCMaHZv
	rE9amLkKx7O6+9GSiwlZaHbP/KaD9sOH7j59
X-Received: by 2002:a05:690c:3482:b0:8b0:e238:2706 with SMTP id 00721157ae682-8b16724701dmr35534187b3.14.1792963139584;
        Sun, 25 Oct 2026 14:18:59 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b166eb16c1sm23391187b3.38.2026.10.25.14.18.58
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 14:18:58 -0700 (PDT)
Date: Sun, 25 Oct 2026 17:18:57 -0400
Message-ID: <20261025171857.8ed673bb5900@gmail.com>
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org
Subject: alphalinux.org has a wiki again
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi all,

alphalinux.org has a wiki again: https://alphalinux.org/

The old MediaWiki install was lost in 2012 when the server died
without a backup. The new one runs on DokuWiki, and its content is
kept in git at https://github.com/alphalinux/alphalinux.org-wiki-content

It has pages for every Alpha system, from the early development
machines to the last AlphaServers, along with the motherboards, CPUs,
chipsets, SRM and the other firmware, the boot loaders, installation
and QEMU guides, and a history of the port. Nearly every fact has a
footnote pointing at a manual or a message in the axp-list,
debian-alpha, or linux-alpha archives (those archives are on GitHub
now too, at https://github.com/alphalinux/mailing-list-archives).

There are two things I can't fill in by myself.

Photos. The wiki has about 450 manuals and data sheets but only about
90 photos, and none of the system or motherboard pages show the actual
machine yet. If you have Alpha hardware, the most useful shots are the
front, the inside with the cover off, and the motherboard with the
chip markings readable. Please send them at full resolution, not
resized for a forum. Send only photos you took yourself, and say
you're fine with them going up under the GFDL, the wiki's license.

Documentation. If you have manuals, service guides, firmware release
notes, or SRM images that aren't on the wiki, I'd like to add them.
Scans are fine.

Send a few photos by mail; for anything big, a link is easier. If you
find a mistake, a reply here is enough. If you want to edit pages
yourself, the Contributing page explains how to get an account.

Thanks,
Matt
