Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E3335CB91
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 01:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791595716; cv=pass; b=pk1ZKbi5Zaa1varqQ7m6GwDibHeoZLEilTHaol2mBnnDJsfvhaaVeQqwO3c+311Tm8DL5Vrx4lm/og0cEWIba1E7Ngyj0mBhvxJMj3LqcrgIYQEKsiLiazmloZuN4vYxyYQmtaXeqWT3lHT0rWy6FwwO9dtpXto+wfFpdfnQUWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791595716; c=relaxed/simple;
	bh=PQqVEjZzdFp6GX6b1o8Wd/bxI6ijPC2wBjMspU1yLMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5tHTaR4ufRXwKJfQ4vJPCqBZxZtbYdoJFq/vmp+JLUBya9+HyV3uF/FpXAflk1GrMfG3q3ApWF+nbFwKPMEUZhkTskcNp0SOQwCJveXqkzUeCUWDfDhiVLMbXiCQjLIELmu1hSpH+Cas52+WseJF/47ysu+CNMS0VALVcMqCRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzT60l2j; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzT60l2j"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a771ad2a9aso18557261fa.0
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 18:28:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791595713; cv=none;
        d=google.com; s=arc-20260327;
        b=ptxEFm46RjposaJnlBL3RreUSCmwllc3M6e4+bKnjSKGoXWN99Wh+cpUwg1UX1QJgW
         0Ey0tlZDpO1kal64o3MEBdqtMreiWU1d+K7S05ciI9sv1xCAZ2QlGGkJBoDFlXzgC+eu
         K5pKzwRD+ygwA+UgRRwDcE6JRx3uiQOMto0zq+onlSPf+grvlkE9LnE9F/rcr1+pAHtl
         iEEWLTjMTRhMPoqhXVlDneY79/4PnMjje817l5c0ccmYFmtpq3YAoQFtYowJK+BRldOA
         wJ8In+C+u/wxz9toozQB4RvhoHHyh9wxXDthbVJLrfgs8sJhsh5xIyzrfDR/JBIt0PT8
         znVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=T/OzwRCxr09DXaCzTWYlnEF4rrRvRgzzD/Ns0ejgdsg=;
        fh=y8ym+iUme36CHKuV39Y7ibhaEvRREhw/s51ZtW8svzA=;
        b=pULUW+lWlH3srx10Zs0vYkevILc9qgDXANpM9rCzUjsNZGEW3jmcXYGeUPZdZHrwGF
         bDRmqKlFAbH8UKkebWlNGnA3N+PkfGjChVTe/jPQd6tcifTv2OAN+dp0W42VFSQplIKe
         RYxer3pSQzPObqPmRfuH55eb0KugH1r2kAKVMlcLsVi8WAk8m8PGlw9RQYf2VVcsuUbG
         L8nm9GYM265yUfhp29xMmImtVopuOROMsvAPoyn+k9FUtrZtpa+XIcrmjbwQSbYer7zt
         +5ZnHsbuZk145ZuPH24GxrzrV3x3UfuVz1EYScVL9RLSLQPPwVsDWH3hYUsDqduE3r5G
         8b4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791595713; x=1792200513; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/OzwRCxr09DXaCzTWYlnEF4rrRvRgzzD/Ns0ejgdsg=;
        b=OzT60l2jIGPMMgXLWRAOXHu3a/uKiubgWpCPialmeFR7MzXzPlteL6nzmBxaiZLsjR
         RT5lQ/TdjJMYVsmgYor+zZ/viJPrbQDoGg9kpjT9pwlUqQ09Zf5y4epvxYJOidElaOhx
         Kj/Sy+FJRQ53U6AXZ6bccMg/6BiVZ/Q1hByBLy8sEJ+x1+foc5+jC3UF3x3hAcj41QT8
         rBRLyBeSGjVK5Oep/YS03/R76wuwnMU7H0POqX4pBp9OBkM0c/t5Yl94/EVUXH9S7Kfl
         qxWMs9CQwZ55IrWX8AtUIcvR4OlUAm5wYbfa1JBSiUtcPeKDPFdfKYcZPn0CtgIHtVSX
         xYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791595713; x=1792200513;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T/OzwRCxr09DXaCzTWYlnEF4rrRvRgzzD/Ns0ejgdsg=;
        b=dmx+/8QhL6EgbUcaDQW31jgRqaJU02vLkr+gkQz+e540wrs539VVDA2Lyd14SIzrLe
         8IcUWZh5y09rsKlfYQt6sJTkTvRYkPW/3yFttwHZehjwmwBAV5ViuPWnZktl9bdp2dCr
         4FpZnykpMyz7oyUGB/nA4cj6v0o2l3l2mvV+6pvygMhLQBaVEZSyYK9su9aJaRiwtYYK
         qh38y2OecIqZZxEbArEnuYQo7WKhNjJOGnnIlGQ0EsMzhBDmFhz2z0RfEi/n6f3yXlwO
         W7d1Lf/x8QNZH0OAl6gQGJ1VPoaF7JJDOYbY+zTQKeXA92LZviv5Aj+cKnUUutu0rTsF
         MGjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzJi4qVjPgHrFTkhT5RZZ4xRMZIG9erolOKd1L7xw2Mu3IGzsPKO5BVk0bEvPOOd//RYuQQDG257B13Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYLf89RFQhoTh02K6pXL31ZARi0UcgL1+pihv03nZPJ/1hsYnEiJ
	NoMrQlgQzVPfdGy8ENDCZtRoWtf/12Np7/HxVJDr6S8Twf2KhKrndLpc08n8ZVrUOfhQlpZ5yvT
	K9At7JtWGAz2dj45AiPLkFr9cIrR661k=
X-Gm-Gg: AYBFou0gOC3PaY0zg8CaJsyML85Xj4UprpGKe+MDEY0zYn3A5D/spI6tht1m9LG7Huy
	olSE9uCb8tbVswfOiKzzwZpoXCdfpY7eZFRArv+ExyfCF4v69L8d35eigQDfGw2J8tJppMfDlh4
	Ul80ZvlIoydLD/0JS3FgLqPkDG38kKcvG+2I/4IXwibcvj9WZw3957BFIU/8qrngqDkkUUO7gpa
	bBJiGH9xz1fn+eTzVs4l7J8Z5m+YUFas+0KluJLPamIt8kk2XGY+v4bGv+V+klWYybYbeV+Uqjd
	cM3ilFuRxnwDPbix3dCGy3/YAAhU4ZvL9mYXGimOYa3Qb4M4CIsdE6XBL7bLaiy5PtQYo9+2cAm
	VuP6s/XdPjEhamQ==
X-Received: by 2002:a05:6512:3b8a:b0:5ba:3534:fb7d with SMTP id
 2adb3069b0e04-5bcdd1c306fmr1257293e87.2.1791595712594; Fri, 09 Oct 2026
 18:28:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009092759.968521-1-linmag7@gmail.com>
In-Reply-To: <20261009092759.968521-1-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:28:20 -0400
X-Gm-Features: AclHuK8uJFVvPcUKKOimU7sHm2iZxU66fHvjABbh1-Xp-I4g_eUpWRz-8ZK04_o
Message-ID: <CAEdQ38FEDRnc6DR0mTtiAfct2WwvSVjrFWtTzQrN-DtECaS-MQ@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/seccomp: add Alpha support to seccomp_bpf
To: Magnus Lindholm <linmag7@gmail.com>
Cc: kees@kernel.org, shuah@kernel.org, wad@chromium.org, 
	richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 9, 2026 at 11:27 AM Magnus Lindholm <linmag7@gmail.com> wrote:
> Skip the pre-notification signal test when /proc/self/syscall is absent,
> rather than unconditionally skipping it on Alpha.

Nothing in the tree skips it on Alpha; that was only in v1.

> +/* Alpha returns positive errno in r0 with the r19/a3 error flag set. */
> +# define SYSCALL_RET_SET(_regs, _val)                                \

r19 is still the fourth syscall argument at an entry stop, so this
relies on the callers also setting the syscall number to -1. Worth
saying so in the comment.

> +     if (access("/proc/self/syscall", R_OK) != 0 && errno == ENOENT)
> +             SKIP(return, "/proc/<pid>/syscall not available on this kernel");

Alpha selects HAVE_ARCH_TRACEHOOK, so the file is there and this never
triggers. I guess that is why you have 12 skips now instead of 13.
Please drop the hunk, or send it separately for UML and friends.

With that:

Reviewed-by: Matt Turner <mattst88@gmail.com>

Build-tested only, with a cross compiler.

Unrelated to this patch: with the selftest setting a3 itself, do we
still need the fixup at the end of alpha_elf_gregs_set()? As it stands a
tracer cannot skip a syscall and have it return a small positive value;
it comes back as an errno. The r0 == syscall_saved_nr check in
alpha_finish_syscall_to_user_mode() has the same kind of problem.

Matt
