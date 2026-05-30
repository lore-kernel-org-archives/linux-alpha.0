Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9640432B120
	for <linux-alpha@vger.kernel.org>; Sat, 30 May 2026 20:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780172761; cv=none; b=b1ir8pXxZn32IV++f8lnp/tIQqIcXyy1nvd3HzZE92xDrFV37RcZCur8U7GLMtsN8Px0FfY+jtIq8j38SkE/ZaFvtaXvFP4vu6B4uTQmf6hOljkcJMzAfRaJfeoJGPiLcft9W7Zj0lDIOpH7KCVOv4b4JZj21DlYh0ZwgfJ0ngA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780172761; c=relaxed/simple;
	bh=n4AGz24M5GLwEPKVk9GktKTYqeRU516otaiicLFGZiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=frAD66OA97h16MyztB3+1jXAXGyYIkxBMLuDa5C9Nq4S3O/xR0TarIv/PvciZ6WfzhrmH1Ywe2btlOl1Dx8cGQtpqTBh0VPdYZDy+/b7ekvWq/rGcsIXT7Xr8TpJ6bp9eaOCYnmuziqR/2F8vCSegHLJVefP4g4c/20PkbzY/vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTooW571; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTooW571"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7e053987001so7344237b3.0
        for <linux-alpha@vger.kernel.org>; Sat, 30 May 2026 13:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780172759; x=1780777559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iHK+S2glwuPmsOgGedv4oHCNosQeePFYhqMY+PrJ7Og=;
        b=PTooW571KEckH1DP+bjqgWuaKosZufCOsJY408xKkCrH+V8ei/q8fgcJF/PCCQkJzZ
         oG4/7oDZm+DTe3KCqIo6pLdPIGAs8Ho7T2xjvboI2cNf5UiOIDEuIYCptFWB3QPI+Bvo
         eA7F5dGXuKkhwN1xYeBId1vG+rbMIwafXCDoxpyXqtoYTSli1iInE4gryexaK5GzOJSA
         yG6/8PNLHindKNuWHfGWpu2yRjrqi5I+miaJrwAFDY2mU6FL/e4sheZXyvx7EOhDJknb
         Yq5zAlyjevQIgctQ4iHz9gohusDpEoIF+tZxaJHrwv3UgwEe28w2mhKN9deLf3WpCt5K
         7DBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780172759; x=1780777559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHK+S2glwuPmsOgGedv4oHCNosQeePFYhqMY+PrJ7Og=;
        b=Wa7uH7jgSyAUxBSQWJY7Vs6O1iSvpVY+N1eU6UwOK6wKG+Z3+aFG+nfdjRB033pvhw
         RJzltjs7e5MLVQob+0p8DhmY8ewmX4Q2kAgUF/qPJ4I6wY7WhRtTZhXBaGizQyFv20k9
         Jw1zRbRLgCbAKpPDQmwduHSx0RNww/ZnWKJHbHaf8wt2beaSoD/f25henTEf9zWweqKZ
         LnMYet0fUxBVgENrSjSwVuZDGkbgvc7VbRA6ETdh0a1v0qxuTfELP2/UNY7Oy55/VTjJ
         P7oZ5RYfseium48PmMT1LBEfTbmMmwSY+Z7jRSsrnA8VztEOchIbd7phthGe0SNQ+syh
         bTPQ==
X-Gm-Message-State: AOJu0YzOY1CKFU2WjqUwLN8ggV3ItFKW8XITp0rNgjkJU1o1UgaUfcWC
	90rqkUINDHigjGS93q/JtvrKf43DU0ZFYeF7wyRGDII2oRIa0vywYq+zUCgudLj1
X-Gm-Gg: Acq92OGPxnATQ6kcSyP2oVUh5KHZ0BvzBHlPSiRu8EPfPlVE4kEEKTfjeH8ru2Nb3Ff
	qLV48UflrAuxc/yivrL7w9Td7vKRe/wGlW0UVTQGh1+pzQ+JVLPrK7/POZEybpsazgGBk6ir6xo
	82A6SsEp1zMn5X/naJ1o3CrHoZl6rYwtODg4aP0ePDI2qKzcGPTleZD00GV7mZP3e/Lwo/HJ7Lc
	vxgZJOUsUbj8lRTrXHFFe/eUzZv30vVIgNr/elyKzFzpV9UEZ7u9yvG/sJw/G8S8fs6G3u5L+b1
	i6GOG2A3CR9Gnx/kOUrsg+4jNy0DByPypUGaNbjlJi62hB5+t/Ov4NmPWZxeCWH0Q+1ztJmalAr
	flTmEccxKrpLrXUVbTa5/6ZPf8gXpaQOd8SXiTw8s/yBU26cO2bWskxZ1t4TE9mCccZo4AmlHTZ
	2fBTLDHQh0JERE0g2hrx+vYr+4dpY44jPw0w==
X-Received: by 2002:a05:690c:2f09:b0:7b9:f136:56d8 with SMTP id 00721157ae682-7de26ed84c7mr48015747b3.30.1780172758537;
        Sat, 30 May 2026 13:25:58 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7e17ae7e1b5sm12633007b3.28.2026.05.30.13.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 13:25:57 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Magnus Lindholm <linmag7@gmail.com>,
	Ivan Kokshaysky <ink@unseen.parts>,
	Matt Turner <mattst88@gmail.com>
Subject: [PATCH 0/3] alpha SMP fixes for EV7/Marvel
Date: Sat, 30 May 2026 16:25:41 -0400
Message-ID: <20260530202544.59231-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I acquired an AlphaServer ES47 in 2010, and it's never been stable --
deadlocking after random amounts of time. I could never make any
connections with load, uptime, etc.

The only dots I could connect was that the git test suite would always
trigger the deadlock.

I spent some time over the last week playing with Claude and have found
*a* solution. With the first two patches in place, I've successfully run
the git test suite 6 times in a row. I've never previously seen it run
successfully without deadlocking the system.

The first patch is generally applicable (not specific to EV7/Marvel).
I'm unsure why this would never have caused problems on other systems
(or why it would only be relevant for EV7/Marvel). That gives me some
pause.

The second patch applies only to EV7/Marvel, I believe. tl;dr: IPIs seem
to be lost.

The third patch adds some accounting to /proc/interrupts to report the
number of lost interrupts, confirming the problem from patch 2.

Please review.

Matt

Matt Turner (3):
  alpha: smp: Serialize all synchronous IPI operations to fix SMP
    deadlock
  alpha: Fix SMP IPI loss when target CPU is in interrupt handler
  alpha: Break down rescued IPI counter by type in /proc/interrupts

 arch/alpha/include/asm/smp.h  | 12 +++++
 arch/alpha/kernel/irq.c       | 12 +++++
 arch/alpha/kernel/irq_alpha.c | 29 ++++++++++-
 arch/alpha/kernel/proto.h     |  1 +
 arch/alpha/kernel/smp.c       | 97 +++++++++++++++++++++++++++++++++++
 arch/alpha/mm/tlbflush.c      |  3 ++
 6 files changed, 153 insertions(+), 1 deletion(-)

-- 
2.53.0

