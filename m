Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1228F221DB6
	for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 02:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786329341; cv=pass; b=t/+37yk3H/1Hzrqkk1uhvJeqr92WRhv9VEgb3GCHQLSaAcOqK9qpxiKir+Z7065lpLq4rpj3k0OTeza/7ycbJoNv9L2D5eF208Lb4DCXySAdNvLYIBBzhHfaU/RDDdNFCPD+2jGFQFSCFw5DbImaRe3kYBs3/Rd0I3xHairyJwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786329341; c=relaxed/simple;
	bh=NtMPi1VwdVG2phbGdps1AxgTITFZO787UOGKxp0dT9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UsXuyeBH46nHIiWPpXRUOtJXHq1SKTTDK8C0xFhRioAmnhz4fN7wE8wfLMRys8C4aHBfL1nV3ZetQRSOr7fSQeRdQWcjLWX6jQRCIXNUKFI7W0Gao/JYEZzrJmsmY0LVSRjK0ox0P4V9KK2vt2ErBv/5Dcj4YP6vGngv50B0de0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sy6veh78; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sy6veh78"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b01cb18515so1221677e87.2
        for <linux-alpha@vger.kernel.org>; Sun, 09 Aug 2026 19:35:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786329338; cv=none;
        d=google.com; s=arc-20260327;
        b=EwjuK0PKpn4qyUzJ5CQkGW780RPsEOpGlnXHRez4U76GcEW9x59sjmJmalhl1Hvxav
         1izRZwiWCJLg9v65gPNBr2FnRS5WAYcVNzlTMHNJiSyEm0XhlAxXgctvKZBcZvbyyb+/
         PkAEIo7io7dwGJMw6uYa7ty/0Uy48S1EZXUwHI68qulYmAZRXBm2EhuLTmgxnTIwUmJS
         3rnS2LUdLqhRLcx4V+8Soat8kHGs57Y7ax2JL1HQfBWJHjRIJcd734REUgolGqMxqBuW
         +CKbwiTUcdj/HUBKKLPkucvoE1cXutgwt77VUauIH/ljLbbDe8AJxsxZzECoBdXERIlv
         erjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S18XSaognKjMjxs026IO6SnZhssf6Cp0TJFb0DDOCwo=;
        fh=b9QjFcv5wLsq6XTfoy74T/m+mU8NJ1qM71OgoCOxszQ=;
        b=SGyj8iSHNMOISqE7cYVdGPWYj4huIgpxNtGYE80Cuh47KVvCpWXuaGgAz5njlqYVtp
         5VVuy/luRabREDy7rTs9iUGw9UH99OfapjGbxPzcV7LF3dO9fs2tACECWlmzolyc56m1
         ntTWwa/Qh00H6LHBmZk5xJ/KqYtlXeUeOYL7Pfw/GgVL/VLSw42MueREWO96ecnhoqZN
         z+qKDlb0ja8dos9xcsjh9hghhrdPIG1kEPcef9XyDPZZA/2qNqg88tnn3KBmiJ9L0eSG
         tcF0yVEeClMQtqpPeoCfFZ4dtvnruTg02f7J6MTp7clBzOIG0k59TJOZa7K4MVQ421tD
         9eLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786329338; x=1786934138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S18XSaognKjMjxs026IO6SnZhssf6Cp0TJFb0DDOCwo=;
        b=Sy6veh78aVOE9Ub+vnbtpywR4KrP23GfBqQvm4StiRiNHs6oP02oBgOf6dVkxBNbyK
         seWgS1Cxm/WqLsPKfj8UkHul4HRafjHF5w1fh4t1BhU9GXONy49p0yn3tvEzRhK+2E2q
         as+d9EA/ETqi8a2LsXceCPAAoAvBAEpM8b4blqnmCOR4Ox6oy7IX3C2hjXrXqu5L4wc3
         D9qLsaON2F0mw7TtbBPmMJ0jtIt8qF6lGJSuWRXWLngk51Xm/MJi4wj2juTblZZLdFjf
         pdAr7Ii9+qca5yCsgtJ1cnNl491LjO5g01PuLS6CXDDvrNtwU0v91vaI6Hw8PSfVeGh2
         XXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786329338; x=1786934138;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S18XSaognKjMjxs026IO6SnZhssf6Cp0TJFb0DDOCwo=;
        b=UtNDKfQc6d2RNa7INPcW3xmeCR6YMsGO52t7R9mjZQqU/+lSCRwSjV5gllE83/EDJi
         5PVTJFeCwUmpQ96YNLO2dN96MlsgN4WUKrVA0bDZGBjUpqYV3O1C7fBbDnOluAeNb+Gd
         S2rv7E+jctaTy8ZmYZtSmxWsSjLGY0z/CyZMETF9x3EvV/Oo9TIdA3LJVPyVz40/BrFQ
         aHem7qjfeb3GG8R2ihMuqFD3fIBAp/zqS1RIMRBxhHokUocq5eC3fb2mzLhKlTjJlUZv
         AGBCtlb889jSnyZKfOVsJXgIVrqtHqsWQJxcPoCaBmUk2B3GPmsFn/CZebAyM/Uc5qGN
         bc8g==
X-Forwarded-Encrypted: i=1; AHgh+RoQbX3gL30mRQ8MlCYhuZwpSBZa5M2OJQDuqNS09kc2YmEfRWA1JoAv6A7wWq34aMzrG91WMlYO2578hA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtnCvh8YE+fdw7vxg3+2O+IaDJ9Nv6BS6fFHiM/ZPt0ESt+ZrR
	tjoNB10hOUqkX6ni25WoVaUCp/QPwy3Xaw3A8t+5ZUz/YJi8JWSXF8Ukz9+iX7iCJKdAlv3AzAx
	W+Pz4UzvdPBKuO35ZoPeGmk8DawwHNF28VfM7
X-Gm-Gg: AR+sD119Neet0g8uFO3Z6hHD5gVey5StgZ5clWFhukirPCCo3OOagwIPtslHDG07Ni0
	sPvIoLyToH8gRm2/w2a32gxvyOFjAk3bAibsU84uWbsfcWXE+hR8PD98qpA/jiQPyX7nKd75Jr2
	u6M2GkqTUQh8tFm198c75v5jDDaYPl0NvrvSnJGey99l0lFFWujrfmGE7CDX8jrOFuPUah6HXkC
	Ea6a1InchanKNs1aCIIv9hB++DEL1UjXPNNSn0bwPHwpiIS4+EV+aWAlUXOPGA1Yy3I1ROAdMA5
	LmPE+krXlgrdfldatleuliGnTok0xA+MWgmXzMqU465ppljYnRtuDEQrSSb8ZAvo/lwqY81XK21
	PcA==
X-Received: by 2002:ac2:54b3:0:b0:5b2:8ce9:10f8 with SMTP id
 2adb3069b0e04-5b2f4b92d8fmr3874045e87.20.1786329337390; Sun, 09 Aug 2026
 19:35:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809085208.3262799-1-linmag7@gmail.com>
In-Reply-To: <20260809085208.3262799-1-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 9 Aug 2026 22:35:24 -0400
X-Gm-Features: AUfX_mywA-_17yjuZGkxRJ1ZPNcBml5FqAQ85kGlQWyCbfFxu1j3nTqex8t8YU4
Message-ID: <CAEdQ38F_pP1a2ZC3DKSWx5mdEjdoPWc92ojXvaO61tMyBLLjRw@mail.gmail.com>
Subject: Re: [PATCH 0/6] alpha: fix stale TLB translations breaking
 copy-on-write and writeback
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de, mcree@orcon.net.nz, 
	ink@unseen.parts, macro@orcam.me.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 4:55=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com> =
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
>   configured, completing the bookkeeping is safe.
>
> The second problem is a targeted tbi() issued against the wrong context.
> tbi() acts on the address space context currently loaded on a CPU, so it
> reaches an mm's translations only when a thread of that mm is current.
> current->active_mm is not sufficient: under lazy TLB an idle or kernel ta=
sk
> keeps an mm as its active_mm while a different ASN is loaded, so the
> invalidate hits the wrong context, and nothing retires the old ASN -
> mm->context[cpu] is still valid, so the resuming thread reuses it.  Patch=
 2
> fixes the shootdown IPI handler, patch 3 the local side of
> flush_tlb_page(), patch 4 the uniprocessor flush_tlb_page().
>
> The third is an omitted caller-side invalidate, covered by patches 3, 5
> and 6: when the target mm is not the calling CPU's active_mm, nothing
> invalidates that CPU at all, because smp_call_function() does not call ba=
ck
> into the caller. The UP flush_tlb_mm() and flush_icache_user_page() alrea=
dy
> contain exactly the missing branch. Their active_mm tests are left alone:
> both load a fresh context through __load_new_mm_context() rather than a
> targeted tbi() against whatever ASN happened to be loaded, and only the
> targeted tbi() depends on which context is loaded.
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
> Where the remaining patches are reached, counted the same way:
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
> Reproducing it. Two self-contained tests were written for this. Source fo=
r
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
>   mkclean4.c covers patches 3 and 4 (needs root), and fails on both SMP a=
nd
>   UP. A single thread writes a small MAP_SHARED file while background
>   writeback cleans it, and the file is then compared against the mapping;
>   every round loses data. It forces two conditions that are rare in norma=
l
>   operation on SMP: the flusher kworker and the writer on the same CPU, a=
nd
>   a working set small enough to stay resident in the data TLB. That is al=
so
>   why this is hard to hit in the field - any faulting write from any CPU
>   repairs the dirty state. On a uniprocessor the first condition holds by
>   construction, so no pinning is needed there.
>
>   Patches 5 and 6 have no reproducer for the bug they fix; they are
>   justified by the contract of the functions, by the UP implementations
>   already having the missing branch, and by the counts above. Patch 6's
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
> Testing. ES40, EV68AL (21264C) Tsunami, 3 CPUs. Generated against
> v7.2-rc6; the results below are from v7.2-rc2, and the series was
> re-tested on a clean v7.2-rc1 tree with the same outcome.
>
>                                            before          after
>           smoke test, stale-read check     7 of 9 rounds   0 of 9
>           lost stores                      11 of 40        0 of 400
>           writeback (mkclean4), SMP        10 of 10        0 of 10
>           writeback (mkclean4), UP         every round     0 of 8
>           tst-malloc-fork-deadlock-
>             malloc-check                   8 of 10 fail    25/25 pass
>           ptrace breakpoint exerciser      -               result matches
>
>   Also 10/10 pass each for tst-malloc-fork-deadlock, tst-malloc-check,
>   tst-tcfree1-malloc-check and tst-tcfree2-malloc-check. No measurable
>   cost: 1470/1038/206 forks per second with 0/2/8 sibling threads against
>   1472/1043/199 unpatched. Patch 5 changes a function none of the
>   reproducers exercise, so it is covered for regressions only.
>
>   Also run with CONFIG_COMPACTION and CONFIG_MIGRATION enabled, with
>   compaction forced continuously underneath the tests: 368522 folios
>   migrated during the run, no failures.
>
>   Also built and tested with CONFIG_ALPHA_GENERIC and CONFIG_SMP=3Dn.  Th=
at is
>   how patch 4 was found: arch/alpha/kernel/smp.c is not built there, so
>   patches 2, 3, 5 and 6 are absent and patch 1 is inert, and mkclean4.c
>   failed on every round because the uniprocessor flush_tlb_page() carries
>   the same defect. With patch 4 it passes 8 of 8, and the rest of the tes=
ts
>   above pass there too.
>
> Magnus Lindholm (6):
>   alpha: run check_mmu_context() from finish_arch_post_lock_switch()
>   alpha: only use a targeted tbi() when the target mm is really current
>   alpha: fix the local TLB invalidate in flush_tlb_page()
>   alpha: only use a targeted tbi() when the target mm is really current
>     (UP)
>   alpha: invalidate the local context in flush_tlb_mm()
>   alpha: invalidate the local context in flush_icache_user_page()
>
>  arch/alpha/include/asm/mmu_context.h | 28 +++++++++++++++++++
>  arch/alpha/include/asm/tlbflush.h    |  9 +++++-
>  arch/alpha/kernel/smp.c              | 41 ++++++++++++++++++++++++++--
>  3 files changed, 75 insertions(+), 3 deletions(-)
>
> --
> 2.53.0

Nice work!

I think we should have a Cc: stable@vger.kernel.org on all of these commits=
.

I'll send comments in reply to the patches individually.
