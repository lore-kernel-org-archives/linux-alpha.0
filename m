Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC35454705E
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 14:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791642360; cv=none; b=kgYN2LqYYsnkmFrgqWpYLEJTjMPsAupIYlLh3UbGzy1mVxZ3ir20qRD7XrCJodgbEmEf+8uYG6kqrXGQN4WPwBiUHTEa6LueWC4KEzpuegN6OAF2j6JXxmiLmMAMtAKo+emL1lrRbqeN1+j1qu8+OYWpnuQWoPzHE1I0sQPn/sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791642360; c=relaxed/simple;
	bh=qhtwvGDBXxuz/27lCoFuaDbYtnj0oyQ6yLwPkWANBxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ipl4JwoCiDJQjjLv4B2nv6JZ74kS3dhBTCotJFBVd254bYkWcVSOFkKbA2PaWugfa+NnpZePWxqcj6yy2NL9E5P/rSJjAkEoN+UAMykEIX0j6rYd+IiVGu5m8DzmIiao1HS28yJ5Z8nH76CACgPpgBuaZp8bnSq2+SnQgW+qQAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bx79SBVY; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bx79SBVY"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso907406a12.2
        for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 07:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791642357; x=1792247157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FCUBSVWptzcvT6OSxO9Zn5kkji5kybgcPd9DFV2WDWo=;
        b=bx79SBVYxk46ImVS2+jrJHpnkHjNXI8J0oSRBZKqHtwqPVbXkrM5eOKh3/XdtaLdGf
         nc3MhOGSW1TABmvQjCB+H+VKFQw6QSWittLASyHc3jYVuI4vY6ZPTJJ8RAjllvujtpKV
         jmfA4BRrS35tYNJa+4IWwVFT0Ww73TRK7nTk6hY1ZJwqPX3wH6+3DIkK6ncUhBtS0uHP
         /nK02LZUTQFNk0JW6tpmIKAsqY2tJWHyd34mmNjP2hfsfOynbIZIC+2KvOg8IjtQpza8
         o36QMeDYjRZurCXG9QIJWb3Bj2cG24jJznNKd/bCQp3mlj6m9BPENAW7kZuEQB5TR4U7
         YYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791642357; x=1792247157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FCUBSVWptzcvT6OSxO9Zn5kkji5kybgcPd9DFV2WDWo=;
        b=KbgFHg9qGm6EFyJMwiGZzwCcSbdPeajUIzN1TrKYK9akfWKuBiNAXNDoOt27Nqi4Ef
         Xp+shj/HWRBcAPf+a41R45xVWhUEBvQ5E9UVdWVJqvMM/KcwSlZ7j+UgrFvSAkg0A5bJ
         JtCWOpJXeqz+pUix5RKQVO6Woq3cKCZoxz7CvWJYF7i1u0jrd9taVy2KDrH0GN+24tVB
         M8cMR1pGhkFl7/ykOf66Lpq4Jg2s4N73JO5/oEcuCKSTgC+sunqvDLVVaYRxx4RJwZVR
         1ZQeEQ6IWwuPMxOA1bAFdkJ7ykkyZTjWyQ3+6LugOjU5LiHCAxwq8vCSnKAy5mFP+OfW
         3raQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhH90jAwX0s24j/TqLz5smCb01mkT9VEjxKTt1yc/Mzer5cTKsLEBakryPH03UYP8euhoTrbUWrNsVgg==@vger.kernel.org
X-Gm-Message-State: AFq9FYK77zoL4n2jLtWyalpl8gIL/iIybZ0OVgOHF3P/7aIJKPjRuknM
	eg1HC9ITXvAY5Xmk8RPA9B/aQ22STW/FxwWT+UUqg+mOmAHh+ZhEoGJO
X-Gm-Gg: AYBFou0seheUeVQqnfkceOSwid8IJQDlgBhJFz9Vp5kGUwWJORzZlkggQf5y51BbL3g
	Wz0uB09WdFzJ+5y2QdfEstPWmTnhfc4JPsQREF47TmukCs1ObTXdD65zG5FH7Z6ov4D9jD7ip3q
	Yqt0hyQYjsZ1sfB0tr5vgnzhALEGkua+1mhQdHAmpSyh4v4WVcNwA2BZ+OjhBCLwRPZCdXVMsRR
	8XaLmr0AO69F/0xT0uwR5WI+zyrkQN721uz/zysHpXPUuXS+1TrwhahrsN16VB3GP4TCLLj29st
	hD2e+6BbvIw/AnYgBT8elOygYdbhgjjlSD6SVtHIEOSvGYZ6/kID1+bDtO8ssgTwHNCdl1du9QI
	u1ZRUZbIJEMUUfKFzJftpLIgT5HgyXbr2ECPKzLyyCo+HnMuRLzvlEK2c71HrA38av2qthzwx6P
	g1s9ecE68+XNUNgsWSwLhNULuEHm7AP+ZzmNRZA6rWmfNjhL0JZ+xf3Bi7ln1zx4PhvDfI7OKS/
	tmLVGIlGB32qeviNX299RKKVZfrHcpX5cZ+D2x9
X-Received: by 2002:a05:6402:4605:b0:6aa:f809:ef3f with SMTP id 4fb4d7f45d1cf-6b17c1dec27mr3805245a12.5.1791642356805;
        Sat, 10 Oct 2026 07:25:56 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dfff40sm2635586a12.34.2026.10.10.07.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:25:55 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v5 6/8] alpha: fix the local TLB invalidate in the UP flush_tlb_page()
Date: Sat, 10 Oct 2026 16:24:32 +0200
Message-ID: <20261010142533.974797-7-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261010142533.974797-1-linmag7@gmail.com>
References: <20261010142533.974797-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The uniprocessor flush_tlb_page() in asm/tlbflush.h has the same wrong
test as the SMP one: a targeted tbi() is only guaranteed to invalidate
the intended translations when the target mm's context is loaded, but
the gate is current->active_mm, which a lazily borrowed mm also
satisfies.

Test current->mm instead. The else branch it falls to already exists
here, so unlike the SMP side this is the whole fix.
arch/alpha/kernel/smp.c is not built with CONFIG_SMP=n, so this is how
the same defect reaches a uniprocessor, where the flusher kworker
necessarily shares the only CPU with the writer.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reviewed-by: Matt Turner <mattst88@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/tlbflush.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/tlbflush.h b/arch/alpha/include/asm/tlbflush.h
index 0c8529997f54..9ae1902faf8e 100644
--- a/arch/alpha/include/asm/tlbflush.h
+++ b/arch/alpha/include/asm/tlbflush.h
@@ -87,7 +87,8 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 {
 	struct mm_struct *mm = vma->vm_mm;
 
-	if (mm == current->active_mm)
+	/* A targeted tbi() needs a thread of MM to be current.  */
+	if (mm == current->mm)
 		flush_tlb_current_page(mm, vma, addr);
 	else
 		flush_tlb_other(mm);
-- 
2.43.0

