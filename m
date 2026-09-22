Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B8D3BED59
	for <linux-alpha@vger.kernel.org>; Tue, 22 Sep 2026 17:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790099797; cv=none; b=pVZyLX+BT77BOFgbTnwG0o0oF73oDVUv8TCeXEGryEUjJWZIi+4ByFo6pHeK2XxTmYoM4IDN+V2gMHBRu9b3nnSYlerrbE7CuyLGWTqRbcFN40EI9SGHTRMnVk0my3D9ePkdrE0/eGch2umI1mSXQWoACc2GB7tO066lquaNQhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790099797; c=relaxed/simple;
	bh=BOF+Q2WGCVwN/AhlACP5VDw/3HTadZkPsI1wpeTFoTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TmhD37b7dkN3VueO0tJDlgD1C6R0mCwX6yTbz++tt2Erm6FNT0QOJ7T4atI9y4AlNH4JhzZbTVKYRC5QSyDmZSdjNSAs6YpQ6dhEAUimB51wvND2i1arIy3dCu8JTFtWpOnQIMd1+PdoRmMacFIq16ch0rSa9/0YUj+U+n1F0XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sURcIMO7; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sURcIMO7"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-8a45b788a71so1216447b3.0
        for <linux-alpha@vger.kernel.org>; Tue, 22 Sep 2026 10:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790099794; x=1790704594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjIySXoeEgAof9kECbTnLoFPnxFlcyYEVgGtFZYUNok=;
        b=sURcIMO7wa7a5/nQjFbxCLMtBlNtfnavc0qF3H/iUKwM88e6tFvUhbWklq0e8ME/xB
         chG3Ndh025sfG0ENrEcmOw4a5MAQFDnECBkw6x4L45pb4sR4208Rakkl1WJlPA07qxam
         ECKTZ0hf6vJzjps1bCsvuDV73yggtxngbivhmfylWdZtDOz3qP1bAnVygzZEY1lKij5z
         cAV8v+ATuMXfqsPhbCwNa3lzJgvv6PQUvsnBe9MG0V8qG6vW/gnB1eMpmP71DP3hCvkZ
         NWjeImT2fb1dW3w0Dy/7ZQXapjGtqiUrFP1YLO/Up/nRY7seeDGTtcrg/2tQvpNZXYJf
         /AyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790099794; x=1790704594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tjIySXoeEgAof9kECbTnLoFPnxFlcyYEVgGtFZYUNok=;
        b=zRI7noet6mRiYd+I16a3QT1XW2GfX98moCs2jqYFal1D2ovjYAfUDgQzYsLfEyfTkF
         Ul8KMXRD9ZnKDya/IG5d5jlqw0lW+L3T2157uzAajEkfOIdVYrd2Ev8McPx6cWgwOZy/
         hq+3wTpT1OiWmotEmUXgk1LFlykdOCRoc0YfJj2sk1UWRVekm0clNtpeh4IDqyk2r2VF
         BY8R2Qd37LcAJP/H8ATI3eU0Lnu3qXT0J4xGZjtjopupOh4JzVsEsczlnwiD++9e9ThQ
         BNeQN0iO13X7l0kQRGv/3HqNeEKAYg/lXJBvqO8nhtNL2+FklgCkj/3wqpdh/AMCoTXu
         W6BA==
X-Gm-Message-State: AFuF++lJ8CCOqWSi1N6w03+8tdTF4tMDWWjq6PvJKdZ9rwtmdcttxHVR
	Es59AdST7r2e45GVS+zjKVf302JHbh3t/Rs7CqkU9Il/reE4mgSAEEyzXhJYpKg9
X-Gm-Gg: AYBFou0PXAVAgtiaE6sBJpEEM+UCODIvMs/TYyk5OAwITZNDEgZ6DHWy6EsRGpRPxkm
	TvppbogKC/ZQxGNMyLygSR98jbKfdjnVvtjYqk/FgAuAEoKrjPt9P66mUjyXJipOeX+VBB2YnFP
	01txBFg65XCHFB53L5MPORe184WufRvSE2Mkk/PYfGE44/AZJHJsCWS2wvxIptKInRpeNcXCN0g
	JTQifOavhapc8zCJnVUEfJESihOnAxaQnuCb+863YWWhCY5XUjTsDp7DpKadZgdV18cFMsH0I9Y
	IikScpD/hJ9fqwCigO7NZ48ojSVTXNZgHS7K6Q7OLYuQrF1kgp8TVwMlkz2piwLxa1TQW32q0oc
	7BIok0lmbAvSX+pmPpUW6e5njQMysjB0np2F8XCFodX01ZCt0Aaynl2EkS8MfAA7dI0f8rIEWwZ
	loYm2GvGrV29ZFvfYHoG41cR0tl3awoU+ddFtsetYhdFFW3UExGdV7D7cR7NLph7XWpx1H3pA=
X-Received: by 2002:a53:b16b:0:b0:671:5543:52a9 with SMTP id 956f58d0204a3-672d58b093amr158591d50.50.1790099794096;
        Tue, 22 Sep 2026 10:56:34 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-672d60a2d52sm44743d50.16.2026.09.22.10.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 10:56:33 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org
Subject: Re: [PATCH v2 0/7] alpha: fix stale TLB translations breaking copy-on-write and writeback
Date: Tue, 22 Sep 2026 13:56:31 -0400
Message-ID: <20260922175631.1022886-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810193902.3286353-1-linmag7@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Aug 10, 2026 at 09:34:51PM +0200, Magnus Lindholm wrote:
>   mkclean4.c covers patches 3 and 5 (needs root), and fails on both SMP and
>   UP. A single thread writes a small MAP_SHARED file while background
>   writeback cleans it, and the file is then compared against the mapping;
>   every round loses data.

I wrote something along those lines and could not get it to fail on EV7,
on v7.3-rc1 without the series, with and without CONFIG_COMPACTION, on
both an SMP-enabled and a CONFIG_SMP=n kernel. Only one CPU was online
throughout, so none of this exercises the multi-CPU paths. Writeback was
running underneath: 850 to 1700 pages written back per run.

The path is reached, though. With counters in flush_tlb_page() on the
unpatched kernel:

    ftp: cur=77824 lazy=324 other=466
    ftp lazy: loaded asn=0 mm asn=79 pid=12 comm=kworker/u4:0
    ftp lazy: loaded asn=0 mm asn=138 pid=12 comm=kworker/u4:0

so the flusher does issue the targeted tbi() with ASN 0 loaded against an
mm whose ASN is 79, a few hundred times per run, exactly as you describe.
The writer keeps faulting afterwards and the page keeps being redirtied,
so nothing is lost.

The reading that fits is that the EV7 PALcode invalidates by VA without
matching the ASN, which would make this unobservable here and observable
on your EV68. If you have a way to distinguish that from the console I am
happy to run it. Either way the test is wrong by the architecture, so the
patches stand on their own.

One thing that confused me for a while, and may be worth a line in the
changelog: since dd5712f3379c ("alpha: fix user-space corruption during
memory compaction") alpha overrides ptep_clear_flush() to call
migrate_flush_tlb_page(), and that override is inside #ifdef
CONFIG_COMPACTION in asm/pgtable.h. With COMPACTION=y, folio_mkclean()
never reaches flush_tlb_page() at all, so mkclean4 should pass there
whether or not this series is applied. I take it your failing runs are the
COMPACTION=n ones. That also raises the question of why the correct
flushing in ptep_clear_flush() is conditional on COMPACTION in the first
place, but that is not this series.

On patch 1: alpha selects ARCH_NO_PREEMPT, so unless something drags in
PREEMPT_COUNT (DEBUG_ATOMIC_SLEEP, say) preemptible() is 0 and the hook
always runs, including after kthread_use_mm(). The changelog says the hook
does nothing there and that the later patches rely on asn_lock staying
set, which is then only true for PREEMPT_COUNT=y builds. Since patches 2
and 3 lean on that window, it would help to say so.

On the changes since v1: dropping the check_mmu_context() call from
switch_to() means the bookkeeping now runs after finish_lock_switch() has
re-enabled interrupts, rather than with them still off. I convinced myself
that window is harmless, since the CPU is in kernel code throughout and
the case that matters sets need_new_asn, but "no functional change from
v1" undersells it.

For what it is worth on EV7 with one CPU, with the series applied: no
regressions in a gdb breakpoint exerciser, a fork/COW check, or the
writeback test above, on either kernel.
