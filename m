Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359E6372ECF
	for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 19:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748765; cv=pass; b=q9SEPOJ3LiSi/Xjg/ukqpVz0Ig9BSeSnqp5mOC7sBHTeNFgYF6tXAMuQDcYPbouiiVn+l9MOYTuPTI8XuiFI4UOh2flEvFcnkvhBXyULxqRalSYOIz9hlmAeORwTAI4WZQoZJ+ulxstABzyXizseFap1aZX46B1h32KESHPGB+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748765; c=relaxed/simple;
	bh=0TctbgJzRxrocOpnXWTM41fpGTcZSGqzJfWvrqiimRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h48SNJNQOZ8BNZWwiTFpx4zN/TEVbrbpbVvpLORHzTw3/M1gkCxji3kuYRXNfpjpdBvLDSbv7uaYKovNF4mL3V+rVFtAJgB5ZlaIL6xVZq/q5A54RMAsdb5id174zGhYGoi8fXlLxer7nSuB5TW5QC9bh3/PuX1VlffHVhocqbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tqm8/hzS; arc=pass smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tqm8/hzS"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-90ccb6102a1so17261206d6.3
        for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 12:59:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791748763; cv=none;
        d=google.com; s=arc-20260327;
        b=jsKUEOQGJLq1WGO3vWeESq10HfSplEqeiFc9T4r5VfAnzxua/W+/c8PI8zqt+VY22d
         FqDVcblcpZ+iAYA9l0+d8burq6MWc/u1FQmJZNI7yj01++sHqmcogbIReY3vD/fZV3ph
         qrAEN9u3xVkKT/ZiyAPvTLtQ1a1g85guxmS2UV6JEsDXY8N5QRGsouUIw8xbAU91NZzo
         Uwh4yPpxGxPrxELX9dyXDD+/TbAPzgkvARQltWzvOSUf2mNNZAbG2pZ7DjdFQhcU72YR
         /UVoLV5kAHbIOaTjv8JA/1AWuqbQzIAl4b+BYU+uQUeHBQqpAPSgWsPk0Xc7R+IoDjI7
         0Xcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0TctbgJzRxrocOpnXWTM41fpGTcZSGqzJfWvrqiimRk=;
        fh=FI2RRTv3cCqWLGdT7hweOcPsXijfCGd1st77hW2U/RU=;
        b=olJZoVGNchF4RH15PRUE0W7FAb2C5iI26/cxKTS5o34I0GEem2VpXEDTMuBqPaDTb1
         aTIyQpZs5V+IcFAtER0TSe+sVkX6eXR4dQY8VuRYoxnk7BFhZq+5XrypJOiWpOT3rl5l
         7I/0ZFeqEaOhGpRIfmM3uwNCe+Ad8ZD48ps7Z4iA/CJs5XGLOdWS5RlV5YH8CBMqm0xI
         JaWhZ93c3vXU9jrteV3IuM8qeaSqgg2hEIwJD3CCH2nUZFNxCQVIDFP3l87/wVjQfXgj
         vrhoXYKSYrX06gE/BD2eIartzSlKea8AYaBFXRw29YsKYT8lOUQStCTBnE8rKN/W0HIP
         +xPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791748763; x=1792353563; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0TctbgJzRxrocOpnXWTM41fpGTcZSGqzJfWvrqiimRk=;
        b=Tqm8/hzS4rKcpjROkzpuA78e3a107s+n6DG6xJTyexLkly1FzoTYq9NglpQflfYgVO
         /VloHNF3G6kUxPA3Erwp7U5wbSaqma/l9O/vD32fGU2mX8Jt7bLRZqlWjRB0OytzKAC/
         mKZOUx9M0v/BlTDMCN3JOmpDgU+0yQPz9Jr+QhasAdJtiBXWSKSH450bdIMNwx0/e3TL
         PZ0NPZUehC4XOiGbTKXMHznR2MyAL1VxRwlj6KmMl+lhkuodqlxDzVllCf6YqvyUu97Q
         QnslXMNRhA4HhA+CNAGZToGMtik+lEPRJzgUqn5rUWjdnGao0idjaxLrvnPhpfZ01Qbp
         I9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748763; x=1792353563;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0TctbgJzRxrocOpnXWTM41fpGTcZSGqzJfWvrqiimRk=;
        b=R8wPsvrvOLNalHG853/Z/ZKt4hWXutnb4ViFMPNHaGDDSKvAp0zrZJ/PaYcAUxTX4y
         T7sYp7l+7ma4M1vA0Qvr4IITrWn8UdWE6akX50rwquEsKlB+W45VlrrSs1ejsoC98ULC
         jgB/sD3d9hIz5Ie2cwrAIq7VNDsEZgOg366+xYrHwdTdT4y3ExVw/X+PWfJSRp6BnXKn
         V/WPD9jitTv7DR467MUqKVmjbOzAc2GFaGjBahXnk6uO8tOuzLLFtMbg2nYhdzYcfPBC
         WLy06tevVTa2kWFil1i+UWYu4rppC9JZRO3/BFbpReRkrZ12lazaIw4q4VdoJx+tAyqE
         a90w==
X-Forwarded-Encrypted: i=1; AKwUvBy/elfsehxP9Smi658wuoEXqldEaYSsJIrOksyGyrzLQN9ym2R9X2qMhNaXVgcve4dNXksrrEb8//TPJQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJFQDRJqdLQin4/gcl01xpULcuhlYi4hdAXdnbHApDyJ/RHYBJa
	vJ0SXhSCvaG4uaerJIEuzTun7CzNBLT7/eD62/PdlJrsXfQ3Sc0ncDGIFI8pa7xc6A5IIJ7kMeh
	q03YJlJD7V3G4dyW5yJysqOaDKYoN1I4=
X-Gm-Gg: AYBFou3KhTZnYGWidmzfb6QgG8nZy+W5H2/b38hbQ5lWntjsic5o1hwP0rlMJtE0y5B
	a5e4FUnF1XHMbEs3fz/m1rqP3WrYX76jSCQknVfZWAsx1gqeVceIA52WW2Un+vZjVazpu+nzPDG
	yur4x5J6aUBZAPDnEBWdu3uuSIlZy12tLG17qHeJ3httE2nAdoyMNqchu+uAu5yksMvEbvolAUq
	MXPsqwOUaJu+UQNYUXAN/7pY3ESJJCs0H3rsipTFkwUJsEDVX+y6lvdHT5XewdqSaUPgjOX91dl
	/7YWQpguQbOAqX7OCfY9NUH6DowJCWc3N9ntfYceTmOXg24ijf/QoVnj8/bn8t0MeJrs/W6HH8B
	RLbDCGHKesY+XhF+LqkZ80cHbPa6vDlh3g7zeWhz7wChAeenRyjF5BS7KDJiQjHb27g5xuyA=
X-Received: by 2002:a05:6214:623:b0:914:4511:9273 with SMTP id
 6a1803df08f44-91b557fd224mr139117476d6.31.1791748763139; Sun, 11 Oct 2026
 12:59:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011191344.981000-1-linmag7@gmail.com>
In-Reply-To: <20261011191344.981000-1-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 11 Oct 2026 15:59:08 -0400
X-Gm-Features: AclHuK-eHjqSrV9sl6WmgjGgfhm1eMvc0Cx-U5FPus6aiOV4V3nX5BN-usuhGuo
Message-ID: <CAEdQ38GoGCU_NQ=D1N8A6yiF1Y1-PgHdavFSCwyXKu3RzJ7Sng@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] alpha: improve Tsunami machine check reporting
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 11, 2026 at 9:12 PM Magnus Lindholm <linmag7@gmail.com> wrote:
> This series adds Tsunami/Typhoon system-error diagnostics and Clipper
> ES40 environmental reporting.

I built each patch as vmlinux with W=1 for GENERIC, DP264, SHARK and
EIGER (gcc 16.2.0). All 24 builds pass with no warnings in the files
the series touches, so the err_ev6.o move to patch 4 bisects fine. The
tip boots GENERIC on QEMU Clipper as far as mounting root.

I have not exercised any of the machine check paths, and I did not
check the PERROR field layout, subpacket types 6/7 or the Clipper bit
tables against the manuals.

Comments on 4, 5 and 6 in reply to those patches.
