Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78997568525
	for <linux-alpha@vger.kernel.org>; Tue, 22 Sep 2026 16:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790095121; cv=none; b=cjamtGyc/QHhMBTDahCzFzFE8w/FdqnKMcaF4gCL7uCQvs1dcySB6HAwF3+9A7ovjbQJbaWvmqxpJNdrcyfmcWYVwt1t4sZaC7969O/iRtYKBL7pAZ9OnJRWeaxx8BIGctT2JYVw1H+VAWX6m950ntuAn0UMXgLNVlDsDSPioqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790095121; c=relaxed/simple;
	bh=fkoF7CQj50sZ4obBMqZ7KYkylTsTeYMyQdL2owgmFkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nso8SLpOwM956qLmmGUYNC9p06OIQ4bN9XcfKhUHevfoz45Gk6gaxY4UdVWnXt3ZOfjskzz5EKJp9naaHm/kI3bcB1mmFnjmZ4ITh0/unQkHsHkLgCV8hfr+UM7n7U5f1YmFOCOjO2Nua2jLKX1Auu/8uO79R8GcXhYWKMgmVXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6fr6TBN; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6fr6TBN"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43daa8f4so1664337b3.3
        for <linux-alpha@vger.kernel.org>; Tue, 22 Sep 2026 09:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790095113; x=1790699913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7I5T7fwcWZlSrGfPPvkZcX4vNhqGwcWuSt39ScHxYHk=;
        b=B6fr6TBNMztt+tblw9PrfLmE0TWh37ad/z2lR++pcoTl78QZUiNJ6Zk/A0BxX/Yw7u
         exhRewgqQ5deCoelvTpJFlahYXSyeUwAFRWIARNchCP8n4rb+pwrrnOAK0JRuIZL/fT3
         eNgFew5bxlxMk2sxHDtsQ5ZIn9+DBLwrFI5EvFMGIsfrJe/AbKBHycQ5gr7+Q0dUjAsz
         lHJ4rZT6Ky/KNdSyFmPEwMxonSxRd/g0PkjFSQGcHIri6Rm0LZHF+5mv8lAH30EEBdoX
         eszeTwgItt5reb8t4vM7J9/eas5LXHjdWETmvxHnkdQ90rOAjnx+8UGj+2YRQ1xFnSQJ
         +CGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790095113; x=1790699913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7I5T7fwcWZlSrGfPPvkZcX4vNhqGwcWuSt39ScHxYHk=;
        b=IdXOaLxHogZBwJuocKeYjLD+kE2y2Gp5ZKqYXspTO7fR+H6WaP09m5bDeRIfrb8PLK
         UJKxKCr7LF46L3eOF/74urM3C+jfqlqZR3IfhMrG1QLX8XGofeyQPFpe7EABn5QvTXzd
         C+SSCoCmy+I7bTfRR17QEpYmLVXADAtu4vhAsq+8XU2NDz5aRzMQtzrM9ExqO6CPXft4
         PSnLkZYat2OKJGMh+pLPZ0JJ612DxhXI5/vwW5f8nlDdo2Xxa8rKFglqD2THqPtdaQHC
         IKOmuxKHhaHa7X7JBp8WsIYSZZg3Gp0XrZTUXZaAw2GATQID4/vcm2+IFXH7TBoThQE0
         cfAQ==
X-Gm-Message-State: AFuF++mzQJoFj6VOIieUaK4VJJvZmyCaC+/k4tsTG1UTvsnkmIdIYyJ5
	Rp9it80M+mvbRP114oDI35JusAhc1iOriS8j9GiUV9W9lTmGTlOYwwcs
X-Gm-Gg: AYBFou0y4sIyrCpt/e53ht/ReGcwH5u8AV7Pf+t+I/xAc6D35XgBfOfqdS7kKFP4Lqp
	2oL12zQOzAF0IzgijB1msL0q4JfVtYZTLhT8Yz6ibG/bUywYOCAptaa4M+/3DMrEQEPCr3XlJa2
	8mT7LQlJ/icdkGmOr6tStKD880tklTyllTz7TI5PbLWzaSyA8jYf8meBqPrk69XqieDDyhD2R80
	28UL+KzeoW9jMl6/CYR3nDlyi3vYGbiEOxboqvN+TD1KbwsAAqGP2274fNVCGE9VR+mRH34dJml
	h6NUYJnUa4lNJDOR+D1RPOmGs/efzAfNSzKcNTfLB0lp587zdNuvzn8+UG5ODyOvgJorsMfbuNB
	sFcyTTUKzH8JHMr30M3FC0hBJdQlV+RSnCWvrap9fDie60GktrRUj8s7d5VdgxJbBd+KnAstRas
	twhIMHcov/YdXjFaRP0wQ+C4dF65IAXd/sbMeLaoC+wT7njF6sQ3J5nUzmQF6C/8p2j6hKbxI=
X-Received: by 2002:a05:690c:47c8:b0:88e:3683:6ae7 with SMTP id 00721157ae682-8a45b593061mr250727b3.50.1790095113064;
        Tue, 22 Sep 2026 09:38:33 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a2c1b02abdsm8519727b3.17.2026.09.22.09.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:38:32 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org
Subject: Re: [PATCH 0/3] alpha: load the MMU context on a direct mm switch
Date: Tue, 22 Sep 2026 12:38:30 -0400
Message-ID: <20260922163830.820433-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260904162424.376504-1-linmag7@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Sep 04, 2026 at 06:23:28PM +0200, Magnus Lindholm wrote:
> Reproducing it. A KUnit test was written for patch 3; source can be made
> available on request. It uses kunit_attach_mm(), which calls
> kthread_use_mm(), and then compares the loaded context against current->mm:

I wrote a similar one and ran it on an ES47 (EV7), on v7.3-rc1 with
the v2 stale-TLB series applied, with and without this series. Only
one CPU was online, so patch 2's shortcut never had another CPU to
look at.

Without the series the ptbr check fails. With it the test passes
(3/3, including user accesses before and after sleeping), and so do
usercopy_kunit (4/4) and kunit_iov_iter (17/17). A fork/COW check
running under continuous compact_memory showed no corruption, and
fork throughput was unchanged.

One difference from what you saw: the stale ptbr here was not
swapper_pg_dir.

    Expected pcb->ptbr == mm_ptbr(current->mm), but
        pcb->ptbr == 44986 (0xafba)
        mm_ptbr(current->mm) == 42112 (0xa480)

swapper_pg_dir is PFN 0x800 on this kernel, so 0xafba is the page
table of whatever user process ran on that CPU last. The kthread then
reads and writes that process's memory at any address mapped in both,
and TLB fills made that way get tagged with the borrowed mm's ASN.
That is worse than a fault loop.

> Patches 2 and 3 have no Cc: stable: kthread_use_mm() is the only
> reachable caller on alpha through KUnit's kunit_attach_mm():

I don't think that holds. vhost still has a kthread worker mode
(vhost_run_work_kthread_list()) that calls kthread_use_mm().
VHOST_ENABLE_FORK_OWNER_CONTROL defaults to y, and userspace can pick
that mode with VHOST_SET_FORK_FROM_OWNER or fork_from_owner_default=0.
The USB gadget f_fs and gadgetfs AIO paths call it too, and dummy_hcd
works on any architecture. vdpa_sim is another. Given that the failure
is cross-process memory access, I'd add Cc: stable to 3, and to 2,
which fixes the missed shootdowns for the same borrowed mms.

Two notes on the patches themselves.

In patch 2, it would help to say in the commit message why keeping
stale slots is cheap: the IPI makes each remote CPU that isn't running
the mm clear its own slot in flush_tlb_other(), so a process that
migrated once pays one extra round of IPIs and then goes back to the
shortcut. That was the first question I had reading it, and the answer
is only implicit in the cover letter's fork numbers.

In patch 3, the next == current test is fine, but the comment could
name kthread_use_mm() and sched_force_init_mm() so the next person
knows why the scheduler never takes that branch.

For patch 3:

Tested-by: Matt Turner <mattst88@gmail.com>

Patches 1 and 2 only matter with more than one CPU, and with one
online neither the removed loop nor the new check has anything to
look at, so no tags on those until I can test on SMP.
