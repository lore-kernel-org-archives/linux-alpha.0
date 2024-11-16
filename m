Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFD18BE8
	for <linux-alpha@vger.kernel.org>; Sat, 16 Nov 2024 15:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731771621; cv=none; b=EHCmDHzSFGoMQTmGW1Pff9brZ2o2tV6FWLesTG6GnlUfEVuDh3YbNNvZwcr6UivizqLUVHknWK27q08zaXYqmkpmqduWoZ+P9eb69t8eAHOJWuqfv7d4g0ALKoDj70B6oT5q6cPAECBIW+rygMbwmLNCCasbN54H1hYtKFmPIKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731771621; c=relaxed/simple;
	bh=Wd+7kLQISUZlzyPvYmSUTVOb8NV4Vyd3OpsFXw6X7a0=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=RQZO0VpL2sRBkB/qjF1stRsjSsB6XATha/kIgpoZN82GMOUhojfXQRCDtj6u1zZLZh67WQhueBORQVoatPneHXBO0w61D/ZEZG0a8ryrbY6mMYV15+BBTWfwPKsdduGwtu8BdP+H46nPl+6Nm56VYU9ycYB9NSaPWaluwKpFN6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+A680Ay; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+A680Ay"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e3010478e6so488038a91.1
        for <linux-alpha@vger.kernel.org>; Sat, 16 Nov 2024 07:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731771619; x=1732376419; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=W+A680AyZzJPLVmBHf/baoXmqU3gio4HcXNj2glBzE7tTyOQIyWcA/UGudttnc9agt
         DKI0DtbU7RlsDRIDnnxiO7UrlKXOP50UWYYpXbX+mLs8P248HvmNiHIwFHh9sOHIIJIq
         SjhPdCJDOZnMUZHEP5YmK/bRDXpr0Sbt52wCNUM1hg5FCINYcq2QBJcgtLBVncsgPpK5
         kKBSwdHgI2KUKAUmeO9oMWELvXGClsd9imBZhR+jtG4KPERhc4IU9caZz4aAMcjmFQP4
         MMZ2QgXv0lXjLJm8mRb5/L3JRcU4XdbCHmSCcpUqF4QT1KndgS5v/G6oaXqqFQumTzJ5
         J3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731771619; x=1732376419;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=QobLxZIkJhxlFK5ApJXJHs8gzCY/YnuFErOMC2wsikdxJLWC+4dn3QcD7aVuecU9Cb
         3fn5K8VviFkqNCLsL1tAeLOZINzxkamtlVehHKzGNtlGG7KSsoiEc+scaTCQSb7cvgVt
         koqjHQIPF++H7QcV6qvBW6p2H74x4OnfkdiuzPY0s+uvoi+us5oWPLmAhpp6bnF8Mp2q
         nvNKyq9csZ4Th1TZrejja2I80zVXpoiHaaSgzwRbTZLAFaVylEYqhEkaVdhPNnKvNxc6
         tt25Bcctzt8tYuyd4DBBPIt17EdUkV6Tu/9Uq4cY7jC1fcx3YZ57unESFGCGy6UwBdu+
         Gi0A==
X-Gm-Message-State: AOJu0Yx3/gZp5+qKkWsB4AtuQuDw/dr7+dUEAG/R0Awvnw8xFCaWljGX
	3Fs9AbqcdGzhRkc0A7z5ln7KPpbfNUERAfjInUg1xnzTC4sKY/JJHcgHtQ==
X-Google-Smtp-Source: AGHT+IH1FlNLEhcwj1Je5vT7YNwvZY7j8Bo/u1LCJ5Ip8aUzXFs5mU0LOXwDUYITsF5ocwbz1pWvzw==
X-Received: by 2002:a17:90b:1844:b0:2ea:3f34:f19d with SMTP id 98e67ed59e1d1-2ea3f34f399mr2035992a91.18.1731771619383;
        Sat, 16 Nov 2024 07:40:19 -0800 (PST)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea06f9c64esm4644320a91.42.2024.11.16.07.40.16
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Nov 2024 07:40:17 -0800 (PST)
From: "Van. HR" <garciadaecioe@gmail.com>
X-Google-Original-From: "Van. HR" <infodesk@information.com>
Message-ID: <5b4a66292bb6a053c86b880c45ae664ee6443c9fc36ac6a48dd49149d39cc78f@mx.google.com>
Reply-To: dirofdptvancollin@gmail.com
To: linux-alpha@vger.kernel.org
Subject: Nov:16:24
Date: Sat, 16 Nov 2024 10:40:14 -0500
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello,
I am a private investment consultant representing the interest of a multinational  conglomerate that wishes to place funds into a trust management portfolio.

Please indicate your interest for additional information.

Regards,

Van Collin.

