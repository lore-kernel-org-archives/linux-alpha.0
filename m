Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37056437845
	for <linux-alpha@vger.kernel.org>; Thu,  8 Oct 2026 21:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791494906; cv=pass; b=i83Agppo+N+4AZfkEnhbBBH6+duB8fSG/Rne22HgG2QRoafrBURxebe7gbaRDreZl5uAtYPTJgkXRQxfXK+IxHFNzd7vRNaY3kyIRLaxfUPDdFkbBFrBdAEjCEEUrHks2lpyjrdprDD71H0zMgxRg5AWEbiBbqvVsMYfYfctFPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791494906; c=relaxed/simple;
	bh=sOo5ZsNNGsGQiZwpgJJ2ixqV5Tik4GMRuotfh6aeKrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nat+bJyKU5WXFTC0oppSrfAeyxKjbvCwJFPg18qA+2MU2Wfh3LlYTYxIa2iNirYyILYfD6Pj7QgC4Qaa+uABMLK+t4P0U3q3KvAIv+RJm/1Jz79RX1mMb6SsbXSYLOMbhVr6xlVhoOU+z8mznpT9MuStimVKkPcVSJjeQNY18lI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWo8hRKZ; arc=pass smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWo8hRKZ"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93e635220b9so250711185a.2
        for <linux-alpha@vger.kernel.org>; Thu, 08 Oct 2026 14:28:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791494903; cv=none;
        d=google.com; s=arc-20260327;
        b=CkXb7ZDMppWFNZhztXbYQtBEGHjzRckeiAWeJPYDYH7yKxDMq/s/qR5mON5h/cfSB+
         QE3s+Xs9yHN+wbkUCZcZbiTQ1thHqNWpbW85CK7+j6phmy6Bvwtv8oRW2j0zRpHIvQhD
         IA/38ubwg8USq9JJFfvHfNgB/3fYH9PRVyRbQjJFbwymvWyi4m4VQjWY4nFoVlMf2tBz
         ERuVFHgoZmlG1qfJasEYYN6m4xKmAVB5zPAw93tKA5fN2hnrB8VDxRr1KG9sGantOIDa
         Kq8dj87QUO3uH6sTusjMVyFnfimKFeeKhqf7bU10zt8wlSBpC35C5CNeVRyswiB6gdWo
         cKsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TKGh5fGyovMi1N0oy13od8GluCezAILkMvJB3lm88kk=;
        fh=k5LmjX2SDioJ+wGlFYnMUXFZWijtcCNb3JQQwYGBQMY=;
        b=Zid20BdOVbrsZbsxCWA+NWYuhLyhdTzIvXigAR0EU5PuNa41LbsxhihuShZ31XscTN
         WBV12hT0NVJEzw47UUu0El3NPygSsEAxiGklZI85TxUHZm2dyzV2CmisfGL66PImWDrO
         iMyzbsAgKeUDnIWLsSrH2plUCIfIfPfMpExLdXwdVwuiDWfNRP8a0oosQq3LZpkIabKC
         plYYgNix8PCeKzJcP4Czn0iDjYrROOBCeRB8YCxVxh414DTIDSZDgPcX6UssTcwL0Sla
         RO2+uBdcZ0eekLPoFt8Sb5Cdo35ymDbTFUa7nPIoUi13RNvaehQtcs1SSK7BXqNgnez5
         TODg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791494903; x=1792099703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TKGh5fGyovMi1N0oy13od8GluCezAILkMvJB3lm88kk=;
        b=ZWo8hRKZNTsBw+RVOwWbFqlY5R3L7Wunr594/4/Llreul6DG/jRiyIuFP2b7Y67RCl
         Z0CZTpMH08K/5B9vVZOeX6yaRE1vEPv++DFs6Jd698erO+Aj05fg0SbKVF2EIExL7iIF
         hqNJZWeJTnR+mRp4LMYtJ2Xw2fow9dUJ5bJM0JZdQBHZ1Fbg5BDHeMXBJfh9D8xXq9nK
         09bf4JV47yi4BZLxXhYIAkOsRw1zF3GBv1PsKA8CPbQvUmU4DqOQYSHkG6B8hWBWf4WU
         z9xjv/Z1ERPy310m7r/VRinVATMtfYuvpSnAy04FKl4T/UBMEJtbnWNBHdWJOHNCeG36
         CihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791494903; x=1792099703;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TKGh5fGyovMi1N0oy13od8GluCezAILkMvJB3lm88kk=;
        b=yfEZusbj9f7FDixl9XtSlZ4cKOoajxBeQ8sQ8oXEDIhC76sObvKNgapU3cI6WsAIVO
         bW6juZ/yp4Ui2DC9gIC3CJNjE/h4OE0luHos4F1wbftcQgIAZXp1QWaQ6hmMbHgnLehA
         DlJX6Vk+fOe819JcpETZ95IE4XFZsTXOLjZC83NyVvM0A04RuCits2c52ISQds422sFr
         5ifeqhs5b7Nur8Zx+fLwxcf6PrdQjchoMdSf28GFKDL5jL/9MdqlyaQWbFBMJbv9ElI3
         wrZWR3YtGGDayYmg48hM2bpwL3IaDcxW5TLMqzimu0MSaucA8asUL870g4mAPwRekuF7
         IQmQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3mlcIIMz5yg7hnZbph9YM+c+gULg/9Upx7KpU7+31zkQ0MFTs5mLeR9Qgdinp4Q17OYsB4av5Kt3LYQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nxTTBmSA19V+7B0EbOldQjdFWnIGvOj4EPmSTITYGCo/c4PREs
	xexW6e4n2/GP0GLS/yI5Db7SmWpH3PFY9F5Do8/ecav3l/xSEtRvhoZ7H9SCS73yfPmgVt3GeMB
	tKkudu3zZUuOf44b9C8+O4M/XaiUC5HQ=
X-Gm-Gg: AYBFou3M24fl/rZ6YL9cxwoXJqOxLF54fsmdJ9xOYq+kAaCljVtfMDk5yM87WclltXc
	CYKHMPWTIrte+CbnyHgCDxmJNBnRbl9jHh1fsFy0HurcnsSUQ8Bs3U03zDkRa5VXvXlQlsMPbL1
	67207zEoFrqKtlg7cxjTTItkyrThWn8q5kLkBKnfxI3EY4/3rFk9o09kn9wjV/nY7iBoP6CwDgD
	IcHzGAcr+GiDh3ZZYkVo9R62DZCnFJ/9j9qzN8RSGeNe1U6YF1YCBLGbt/InfzoX/cTb10wotzO
	0PCRLWmFlxVRqhWae10NFT7B+yRl5WkW5mJHRFl3OiCSqVtLoxa4KR5dm4+dATGTRd8U41QVs+o
	lK08+oHlhdzV+hw==
X-Received: by 2002:a05:620a:1d03:b0:93e:9809:dbff with SMTP id
 af79cd13be357-93e9b8ecbf4mr1189424285a.82.1791494902782; Thu, 08 Oct 2026
 14:28:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923074903.862898-1-linmag7@gmail.com>
In-Reply-To: <20260923074903.862898-1-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 8 Oct 2026 17:28:03 -0400
X-Gm-Features: AclHuK_W6VZSW0bCtKRqfPqEi9-k8rTDCPN2l5ScYxdMceoNLFljK9sdAQEknaE
Message-ID: <CAEdQ38Fkyz6kPfX8smF8JkG_rA=4zkhj9HJ84k484Jrj4N7q0g@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] alpha: fix stale TLB translations breaking
 copy-on-write and writeback
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 3:49=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
>
> On Alpha, stale TLB translations can break copy-on-write and shared-mappi=
ng
> writeback: a multi-threaded process can lose stores to its own private
> memory, read data belonging to its own child, and lose data written throu=
gh
> a shared file mapping. The copy-on-write failures need more than one CPU;
> the writeback failure also happens on a uniprocessor.
>
> Three related problems are fixed here.
>
> Patch 1 is stranded deferred-ASN bookkeeping. check_mmu_context() clears
> asn_lock and acts on need_new_asn, but it runs only as the tail of
> switch_to(), after alpha_switch_to() returns. A newly forked task never
> gets there: its first context switch resumes at ret_from_fork instead.
> asn_lock is left set and the task goes on to run user space with it set a=
nd
> interrupts enabled, so a shootdown IPI arriving in that window takes the
> deferred path, and the need_new_asn handshake meant to cover it never run=
s.
> finish_task_switch() calls finish_arch_post_lock_switch() with preemption
> disabled, on the CPU that ran switch_mm(), which is where that bookkeepin=
g
> can be completed.
>
>   kthread_use_mm() and sched_force_init_mm() also reach the same hook,
>   outside the scheduler's preemption-disabled switch tail.
>   check_mmu_context() acts on per-CPU state, so it can only complete this
>   bookkeeping while still on the CPU that ran switch_mm(). The hook
>   therefore tests preemptible() directly: where migration is possible it
>   does nothing, while where preemption remains disabled, or is not
>   configured, completing the bookkeeping is safe. alpha selects
>   ARCH_NO_PREEMPT, so in an ordinary build preemptible() is a compile-tim=
e
>   0 and the hook runs everywhere; the test only takes effect where
>   something turns on PREEMPT_COUNT.
>
> The second problem is a targeted tbi() issued against the wrong context.
> tbi() acts on the address space context currently loaded on a CPU, so it =
is
> only guaranteed to reach an mm's translations when a thread of that mm is
> current. current->active_mm is not sufficient: under lazy TLB an idle or
> kernel task keeps an mm as its active_mm while a different ASN is loaded,=
 so
> the invalidate is issued against the wrong context and the mm's stale
> translations can survive - and nothing retires the old ASN either,
> mm->context[cpu] still being valid, so the resuming thread reuses it. Pat=
ch 2
> fixes the shootdown IPI handler, patch 3 the local side of
> flush_tlb_page(), and patch 5 the uniprocessor flush_tlb_page().
>
> The third is an omitted caller-side invalidate, covered by patches 4, 6
> and 7: when the target mm is not the calling CPU's active_mm, nothing
> invalidates that CPU at all, because smp_call_function() does not call ba=
ck
> into the caller. The UP flush_tlb_mm() and flush_icache_user_page() alrea=
dy
> contain exactly the missing branch. Their active_mm tests are left alone:
> both load a fresh context through __load_new_mm_context() rather than a
> targeted tbi() against whatever ASN happened to be loaded, and only the
> targeted tbi() depends on which context is loaded.
>
> None of these patches covers a task that borrowed an mm through
> kthread_use_mm(), and patch 1 makes that case worse. Such a task has
> current->mm set while ev5_switch_mm() has only prepared the PCB and nothi=
ng
> has installed it. Today asn_lock stays set for the whole of the borrow,
> because check_mmu_context() runs only from switch_to(), so a shootdown IP=
I
> for that mm finds asn_locked() true and takes the conservative
> flush_tlb_other() path, retiring mm->context[cpu]. With patch 1's hook th=
e
> lock is cleared when kthread_use_mm() returns, so the IPI instead issues =
a
> targeted tbi() against the context that is actually loaded and leaves the
> slot valid. Loading the context on the direct switch closes that window;
> where both are applied, that change belongs before patch 1. It is the thi=
rd
> patch of the follow-up series:
>
>   https://lore.kernel.org/linux-alpha/20260904162424.376504-1-linmag7@gma=
il.com/
>
> No user-space data race is involved in the reproducers: every slot is
> written and read by one thread only, and the main thread inspects them on=
ly
> after joining the workers. The other writes come from forked children wit=
h
> their own address space, so observing one of those in the parent is the b=
ug.
>
> Deferred-path behaviour after the fixes, counted with the counters reset
> before each 6-second run of the lost-store reproducer:
>
>                                lost stores    runs entering the window
>           no fixes               11 of 40      13 of 40, 11 of them lost
>           patched                 0 of 400     15 of 400, none lost
>
> Where the remaining patches are reached, counted the same way, on a
> CONFIG_COMPACTION=3Dn kernel:
>
>                                           thread of mm     lazily
>                                           current          borrowing
>           writeback of a shared mapping       51577          50688
>           reclaim under memory pressure       17609          14827
>           anonymous COW / fork                144237             0
>
>   About half the calls during writeback, and none at all on anonymous
>   memory, which is why patches 1 and 2 did not cover it. flush_tlb_mm() w=
as
>   entered with the mm not this CPU's active_mm 2934 times over a fork-hea=
vy
>   run and 632 times while otherwise idle.
>
>   The writeback row is config-dependent, which v2 did not say. With
>   CONFIG_COMPACTION=3Dy, asm/pgtable.h overrides ptep_clear_flush() to ca=
ll
>   migrate_flush_tlb_page(), which rendezvouses with every CPU and handles
>   the context itself, so folio_mkclean() does not reach flush_tlb_page() =
at
>   all. (That the override is guarded by CONFIG_COMPACTION rather
>   than CONFIG_MIGRATION looks like a defect of its own - MEMORY_HOTREMOVE=
,
>   NUMA_MIGRATION, MEMORY_FAILURE and CMA all select MIGRATION without it =
-
>   but that is a separate patch.)
>
> Reproducing it.  Two self-contained tests were written for this. Source f=
or
> both can be made available on request.
>
>   alpha-cow-smoketest.c covers patches 1 and 2 (pthreads only, ~40s, need=
s
>   more than one CPU; confined to one with taskset -c 0 it does not fail).=
 A
>   failing run reports:
>
>         stale read after COW fault       FAIL
>             thread 2 read 0xdeadbeefcafebabe, expected 0x1000002   <- the=
 CHILD's value
>
>   Two details in it matter, because getting either wrong hides the bug:
>   slots are 128 bytes apart so several threads share a page, and a thread
>   writes its slot once then reads it many times, since a thread that keep=
s
>   writing refreshes its own translation. Its lost-stores check fires in a=
t
>   best a quarter of runs; the stale-read check is the reliable one.
>
>   mkclean4.c exercises the combined SMP fix in patches 3 and 4, and the U=
P
>   fix in patch 5. It needs root and CONFIG_COMPACTION=3Dn. On SMP it take=
s
>   both: the flusher kworker has no mm of its own, so patch 3's current->m=
m
>   test sends it to the branch patch 4 adds, and without patch 4 the calli=
ng
>   CPU - the one holding the writer's translations, and the one
>   smp_call_function() does not call back into - is still left alone. The =
UP
>   implementation already has that branch, so patch 5 is the whole fix the=
re.
>
>   A single thread writes a small MAP_SHARED file while background writeba=
ck
>   cleans it, and the file is then compared against the mapping. It forces
>   two conditions that are rare in normal operation on SMP: the flusher
>   kworker and the writer on the same CPU, and a working set small enough =
to
>   stay resident in the data TLB. That is also why this is hard to hit in =
the
>   field - any faulting write from any CPU repairs the dirty state. On a
>   uniprocessor the first condition holds by construction, so no pinning i=
s
>   needed there.
>
>   On COMPACTION=3Dy the test does not exercise this defect, for the reaso=
n
>   above, and passes on an unpatched kernel: 0 failures in 103 rounds acro=
ss
>   three unpatched
>   COMPACTION=3Dy configurations. v2's Testing section did not record whic=
h
>   kernel its mkclean4 numbers came from, and this is the correction.
>
>   Nothing isolates patch 4 from patch 3; the two are exercised together
>   above. Patches 6 and 7 have no reproducer for the bug they fix; they ar=
e
>   justified by the contract of the functions, by the UP implementations
>   already having the missing branch, and by the counts above. Patch 7's
>   path was exercised for regressions by driving gdb to set and clear a
>   breakpoint several hundred times, reaching copy_to_user_page() ->
>   flush_icache_user_page().
>
>   Originally found as intermittent heap corruption in glibc's
>   malloc/tst-malloc-fork-deadlock-malloc-check. glibc is not at fault: wi=
th
>   MALLOC_CHECK_=3D3 it is simply a very effective detector, and every for=
k()
>   runs __malloc_fork_unlock_child() in the child, which writes to allocat=
or
>   state.
>
> Testing.  ES40, EV68AL (21264C) Tsunami, 3 CPUs, on v7.2-rc2 and v7.2-rc6=
.
>
>                                            before          after
>           smoke test, stale-read check     7 of 9 rounds   0 of 9
>           lost stores                      11 of 40        0 of 400
>           writeback (mkclean4), SMP [*]    10 of 10        0 of 10
>           writeback (mkclean4), UP  [*]    every round     0 of 8
>           tst-malloc-fork-deadlock-
>             malloc-check                   8 of 10 fail    25/25 pass
>           ptrace breakpoint exerciser      -               result matches
>
>           [*] CONFIG_COMPACTION=3Dn; see above.
>
>   Also 10/10 pass each for tst-malloc-fork-deadlock, tst-malloc-check,
>   tst-tcfree1-malloc-check and tst-tcfree2-malloc-check. No measurable
>   cost: 1470/1038/206 forks per second with 0/2/8 sibling threads against
>   1472/1043/199 unpatched. Patch 6 changes a function none of the
>   reproducers exercise, so it is covered for regressions only.
>
>   Also run with CONFIG_COMPACTION and CONFIG_MIGRATION enabled, with
>   compaction forced continuously underneath the tests: 368522 folios
>   migrated during the run, no failures.
>
>   Also built and tested with CONFIG_ALPHA_GENERIC and CONFIG_SMP=3Dn. Tha=
t is
>   how patch 5 was found: arch/alpha/kernel/smp.c is not built there, so
>   patches 2, 3, 4, 6 and 7 are absent and patch 1 is inert, and mkclean4.=
c
>   failed on every round because the uniprocessor flush_tlb_page() carries
>   the same defect. With patch 5 it passes 8 of 8, and the rest of the tes=
ts
>   above pass there too.
>
>   Matt Turner tested this series on an ES47 (EV7) on v7.3-rc1, one CPU
>   online: no regressions in a gdb breakpoint exerciser, a fork/COW check,=
 or
>   a writeback test, on both an SMP-enabled and a CONFIG_SMP=3Dn kernel. H=
e
>   could not reproduce the writeback failure on that machine on an unpatch=
ed
>   kernel with CONFIG_COMPACTION either way, while confirming with counter=
s
>   that the unpatched flush_tlb_page() does issue the targeted tbi() again=
st
>   a foreign context a few hundred times per run. One reading is that the =
EV7
>   PALcode invalidates by VA without matching the ASN, which would make th=
e
>   same defect unobservable there. Patches 3 and 5 rest on the contract of
>   tbi() either way.
>
> Changes since v2:
>   - patch 1 no longer claims that the hook does nothing after
>     kthread_use_mm(). alpha selects ARCH_NO_PREEMPT, so preemptible() is =
a
>     compile-time 0 in an ordinary build and the hook runs there too,
>     clearing asn_lock; the claim held only for PREEMPT_COUNT=3Dy. Patch 2=
's
>     last paragraph carried the same error and is corrected with it. The
>     shootdown handlers therefore do not cover a borrowed mm, which is now
>     said plainly in both patches and in this cover letter.
>   - patch 1 records that moving the call from switch_to() to
>     finish_arch_post_lock_switch() means the bookkeeping now runs with
>     interrupts enabled, and why that window is safe. v2 described this as
>     no functional change, which undersold it.
>   - patch 1 now records that it makes the borrowed-mm case worse, rather
>     than v2's claim that swapping the active_mm test for current->mm leav=
es
>     it unchanged. That comparison was right about the two tests and wrong
>     about the series, because patch 1 also changes when asn_lock is
>     cleared. Patch 2 no longer draws the "no worse" conclusion either.
>   - patch 3 says that its folio_mkclean() counts are from a
>     CONFIG_COMPACTION=3Dn kernel, and that COMPACTION=3Dy routes
>     folio_mkclean() away from flush_tlb_page() entirely.
>   - the reproducer is described as exercising patches 3 and 4 together on
>     SMP, and patch 5 on UP. v2 credited it to patches 3 and 5 and listed
>     patch 4 as having no reproducer, which was wrong: patch 3 alone leave=
s
>     the calling CPU without any local invalidate.
>   - patches 2, 3 and 5 describe the targeted tbi() as guaranteed only whe=
n
>     the target mm's context is loaded, rather than as failing on every
>     implementation. Matt's EV7 result is that a mismatched loaded ASN did
>     not produce the failure there, and the argument for these patches doe=
s
>     not depend on which way that goes.
>   - the mkclean4 rows in Testing are labelled with the config they were
>     measured on, and the COMPACTION=3Dy result is recorded.
>   - rebased from v7.2-rc6 onto v7.3-rc1.
>   - no code changes.
>
>   Thanks to Matt Turner for the review, the EV7 testing, and for finding
>   the CONFIG_COMPACTION dependency.
>
>   v2: https://lore.kernel.org/linux-alpha/20260810193902.3286353-1-linmag=
7@gmail.com/
>
> Magnus Lindholm (7):
>   alpha: run check_mmu_context() from finish_arch_post_lock_switch()
>   alpha: only use a targeted tbi() when the target mm is really current
>   alpha: fix the local TLB invalidate in flush_tlb_page()
>   alpha: invalidate the local context in flush_tlb_page()
>   alpha: fix the local TLB invalidate in the UP flush_tlb_page()
>   alpha: invalidate the local context in flush_tlb_mm()
>   alpha: invalidate the local context in flush_icache_user_page()

Reviewed-by: Matt Turner <mattst88@gmail.com>

on patches 2, 5, 7 (and 6 with a change, see separate reply).
