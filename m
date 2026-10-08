Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A913955C7
	for <linux-alpha@vger.kernel.org>; Thu,  8 Oct 2026 21:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791494917; cv=pass; b=cUF9lILyA7LTN/of9bjrjthAnGeLPYz6Ytefug0V+4fBFqabh2CkbblwvHVZlkiqimofp6UKqDdO5H/FFCudvuVEJdvd4rPonPtHAqifZul+PVjTdT0sWqz8O+EV4feutrCYinrqBHYBuakp0I7sdYhxSDZ5a/Fgj/chZzoiYFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791494917; c=relaxed/simple;
	bh=hw71EnNIbbz++xqDviTBnAlWqT5921Me/DS4ajh3QtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GlH44OfYGGUaX2roPNecBVdlljJi498uOgCdC/rWvkq4/261Rlg9PjJywq7fRYvaScEWfdH4+ZYYVjNFFmNwTpMesRQrAj7A3+YBB10tCSW3zseseud+23UV5Y2pTc9Jih9R7Q//dDi5qA7cDCviBTp91akAGSAZf3XF/yXqfdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bd5kijtB; arc=pass smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bd5kijtB"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93e635220b9so250723985a.2
        for <linux-alpha@vger.kernel.org>; Thu, 08 Oct 2026 14:28:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791494915; cv=none;
        d=google.com; s=arc-20260327;
        b=IMkrCofOov3MifKMgQJ/tB30lU7+cc7werPKYjML3rmFDq2gzfKYD26UaMRV4Xuq7c
         Q1SPSslerK1quNdfc42xkHCoKu3CpMWstFEwmN/KX0kFXuZ1GXnBiGEuDDbiOWJ1Zx/j
         wvGX0ynzkg6r/VTQcfPd1fvVnnF0NiIpop/4ivlwB4aMuwrpf/i/Uivg2L+QWLAWs+bP
         i9rEETMB//vLktYrOhKVWGvIQ+EAbYSI3QyZF7Mnz478VZK3hwVrQjiR0uVhknmFga1S
         PxxP1AIO+XxpPvaujWOvn7kjD6pUcIfbWguhlQtejeNyGCVDjj4Nh2wsoVoC50pND+Fj
         uR+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hw71EnNIbbz++xqDviTBnAlWqT5921Me/DS4ajh3QtM=;
        fh=3EK5ZDjzx5H6Q2gaST4qplH/3S5hSG6QIqMlrcGjGbo=;
        b=EAUo1qxqDLBHWaxMUDdx3rgWnva3ft99OzSDoR8Zs/v56GlHRONXWEVKNvsTLTv8wn
         5CTB8gTJDA5WmZbmXiaBPwm8JlMx8G+r/LWkYOvYHWI7NyimkErCVMvIuCRjl1jIV84B
         hNcMc6TlTsH6FssuH4x2XPprt3zqVS3EfwZUEKquingTuMnAH4MtVIdE2PYMoBAz/sMj
         IBssBLz2nXWr/usnRaoAmSpnXin4iVuasPt2D+eI/y4H/DtNa3Ow7PMR4CyxunJUWQqe
         Mt3J0xY6AtfKzcg4bK4QvXBVu3BjrHfOPScdQvjYD8yWj1OkCVR1haRiE7UR+qmxRNpe
         C6yA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791494915; x=1792099715; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hw71EnNIbbz++xqDviTBnAlWqT5921Me/DS4ajh3QtM=;
        b=Bd5kijtBRJHLwxAG6RdRDj2aCF/qwobpb7etpgOExy87iOCEFJN6XgJGNAi+N4S6qI
         6ATQFsnpbCCiWCtR8eM+kVxkdlk9t2TJvDEw76pehYfVHCXZDxxf/TvRJCzUF4c4Ssd5
         dPsAqG+pEssVhnRjWnad6ZKfyy+46GUHT+ULnFi5YZML07S+KukpdCTKFJNKsQ4NlZNj
         pUQKcJY6H1AqyZ2vXVdZDQL+kbqiT9LsIA2juNyLWYk9YDlyuxTy52e1aVTkJ+33eovD
         htM4vEjJR11FwMa6lN5vCNnCO1tcjEv6KZV/vkuCZYiI/M+5TuETWZM8SnVrX8zsco/v
         7/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791494915; x=1792099715;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hw71EnNIbbz++xqDviTBnAlWqT5921Me/DS4ajh3QtM=;
        b=V4hbS3cMgYPdNPVD/2/op5C6/+muJtDW1fIhbPw9R5wos6b6Qhw6tZHMuls+Q7NXlM
         SpCH/JeDLp+q9L67qLESa0WPuYlOUjoL1sgfVdJCt/f86ngkXbokhZL4sT4bmLJu5oia
         n4b2kb/1izssV8YneXyKMOufKVdB8YXgaeoyPZKGkLfoXpTbxoeP0V48YQd67oE5gvxr
         qK8WUDI5dr7Zpt4xgyBoUVfSHwQi8Q4RgcUXs3fE09db5rjUqP++eeDJnjGtN9oL33D1
         sRu3c3DD2MVgOyT61iHTmjXBPs4C1N4ES6wsYFoAlz3mFzdhwwaIc00ap7Z+3iLtfgcz
         apEA==
X-Forwarded-Encrypted: i=1; AKwUvBwqmZp7BT2kBKUp/AIK2xKHioEeQZALQeTC9MYYTWOqmGI52KDB11J8+LjIDX6+eOl45D2IQVKTwTAmBw==@vger.kernel.org
X-Gm-Message-State: AFuF++kHwy3Zvaydv+/hHAJR7GivHxa1Lxax5cwwop7bxUPjdWLI6lu1
	S/o1DGOYy2OUDwH7XIWVkoSS1l55iY3db+to98NBQEZAFrCzcF4wkOQfiKYMUQNSYEe1AZk53U8
	mMoF0YXUQlXyhG+AoUqDrNUCRZIjn3hA=
X-Gm-Gg: AYBFou21kw0NsAOZZ6CO+gccBXNpHhL2BnnYo8GWosvg1+X2gIJnOQMzBZZpN+5qtI6
	yWTkGSMjgZZULaMz5IfP/T7HdVjshKR4fJIXUo5JVGfembYtiqUxjro0VsEd8aT+DN/Z7k1uJPm
	hWQev41rScfHa8a7NFVauJMZm8wCKQtqTtVNu2K64bMkCTeToFvNZlWZhk+LiQm7s457tekmcqQ
	QnGR8U+QyQw1y3yXYPxARp61YMBVoP1cf71H4cLOmQ0wogH2uEG4uijsKxJHaBB9IBDA2J/4itX
	//ymQ5iWltqZ64WwEzAdFL0KJ7oT4/Cry47EFrKgjpoMzlrq4maCjytrd22pakVqCB5QQHyfAuE
	ThQbpZTeE0pBFi14wx3pp9fVj
X-Received: by 2002:a05:620a:2844:b0:93c:612e:9b57 with SMTP id
 af79cd13be357-93e9b84f3a4mr1267578585a.56.1791494915507; Thu, 08 Oct 2026
 14:28:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923074903.862898-1-linmag7@gmail.com> <20260923074903.862898-4-linmag7@gmail.com>
In-Reply-To: <20260923074903.862898-4-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 8 Oct 2026 17:28:11 -0400
X-Gm-Features: AclHuK9egL7OGGTcAjait5dUGNk7qK_dDOKjCh1w7fS59DRwMwvQhD3rT6J8mjc
Message-ID: <CAEdQ38G4G6QyYScfDGuAFvzjyzOXrd=2K-gQM+ob8EMsWUkD=Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] alpha: fix the local TLB invalidate in flush_tlb_page()
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 23, 2026 at 09:47:46AM +0200, Magnus Lindholm wrote:
> Test current->mm instead. The calling CPU then has no local invalidate
> at all when the mm is only lazily borrowed; the next patch adds it.

Please swap this with 4/7. The else branch is correct on its own, since
it only covers mm != active_mm until this patch widens it. In the
current order a bisect that lands here has a lazy caller doing nothing
locally, which is worse than before on a machine where the tbi()
against the wrong ASN happens to work, as it appears to on EV7.
