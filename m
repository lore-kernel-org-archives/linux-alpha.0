Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422231DB95E
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 01:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596126; cv=pass; b=nR+UiI0uxDsGfl/k8A2m+8mMsAo1wf1YR3+8dBF0062+j3WKAeB7cS+tMeU9io3DiO+NsDazSxlbPszRtWbjYRoy+b1d2zvHDeY3Fhl0ViXFUDteug9knCpV4EqEReqo44oTBOoyCnIZXFhclS2UI20lsgVFcRPFaKhXzPWlIso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596126; c=relaxed/simple;
	bh=Wv9b/dFSHpxedb0iwRWO+tjnufr/6VDhHuR/YLZGbtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BXagD9YTGbG6pNokJZtaNZAk+4QaXCgOxN9CjPL5ZW4BPIEPgvh92mpLEzLdt1ZD1Sr9z8hZGBLJk4A1QU8ffbMuYJQWgZ7SbZ7RWCDdCBZz3PihzIYfBXf50ydxhkQ9wXYUml0cxVzeSSqnbAGUgFRehaScefkujtOqkKd/MEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NprT668N; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NprT668N"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5ba3fba0080so135500e87.1
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 18:35:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791596123; cv=none;
        d=google.com; s=arc-20260327;
        b=JKXl6WvGickxFaHVVDss7+JjMABx/tfJabHkoLl338kEnC3r0Ai95VJMIv5pD/Pe/m
         EC2B5TEIDe2uwtSv2ltcfqu8p5fdQoWPm2QEMS+8Ob0mbVNrSfJzXvqMPmGXqkEskHXM
         NTUPrYOLYLPgPlNvHYD+rQmomsTt6oZtOlHuO2do2cKpelKqmbc+uter0xL8U03fkMtY
         QFRs6wlog2IRFfWDdhUqxh+o9a1/rm/v6mn0pv7RvoQ8Y5LN1jHCG7xADJpXZav/GjSZ
         OQg9JzLOFol7ZeAq4xNAssbhWMRp0K/WKkp6rmMnmOMQlbGnf6oOgeUybEzaNhJRkbtT
         HSFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zejVRKXMz791oqNwhKPCP6K/7f8h0cFo5JM43ONmEBU=;
        fh=6XDh/uMaYJlShCr1IpK++CC6LqvlRw8ujPrWnXlkAiQ=;
        b=ewfA6z8oQ9Jl5lxZFn3OHGS1vi+jW+2X4jCpPoMOAyaRkKMrYFHL1Vm5moKSkUNXqi
         g7VI2xs4q0PA+HF/EQbpYB+V8H13xSRrAnlScdephQlZmxtN7czw6BMowZ1sGNg6p3Zq
         b0/5zILVJ5lrC+3/069+Eb3SXzUr/0cM9xmFKnG3q2/27sbEAQiDS8OaUQs3J+zhskCi
         7f4HkjXetnMziBMsj80ivYnplhBa5aYpO0rgVIMVSxWorhNDcxCHJtbuDFINtVStRCKZ
         aBjM3P1kEKCBIUncXD+Pa9CyDQlW4Kb7IhNpdf7c/RcOH4FJpx6UHQfPieJ3QjOMFGzu
         QZbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791596123; x=1792200923; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zejVRKXMz791oqNwhKPCP6K/7f8h0cFo5JM43ONmEBU=;
        b=NprT668N6QdFNZFeOkh3WwwbiuwV/8nOameUxhTnLJ4rCyOllRoxdNxj+7HPicUK7j
         zFJhykYZfxwLwJPbOHyW7VkYGp6BGpgNUdbucVAB/Bhga0DfAY4mza2EWnmD+ClgGNb0
         xVZ01u3lOcDFkjL8P2rnLbnNe86DkDSJjV10/WbAyDeM+Tg/K8AJZbUVq88J8Th2BJUY
         UL5St18IisUIKrAxTCB0a1nYd0Gh+xTGOKtF5L8vflNQOghjEdM0/sYZo8tdaZ8uY6Qk
         9tCN5zgJc3J+B6QfssiskdmVzOM1kplQTVDJPi3zdir+oxfXpPl6RWr5Dg9xfW1+6qfn
         r1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596123; x=1792200923;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zejVRKXMz791oqNwhKPCP6K/7f8h0cFo5JM43ONmEBU=;
        b=p0xZ7QYYeNWIogkjRzJNu5Jlj8Uj3UxemBXWLKKRqf0b58yUsUviFtGK76KPrJ3gsF
         OrnVI9TSzvg1UHMCb8IuWl1KDSOJfOquPJG2Fux8pfx5bL0xGzjZ5wBp0Sq8++CyqAdL
         I/Si967mtI+dpflA46t/4MY6+JV9tenkdDCs0BKe/XFJnN/7dGR36Ifx8lnh82ZyFHmV
         degPqxR5z5roinAO2YhiUC6Wu1fG7kexoyGoFW7+szsQhkT8UZqoWhZnEbli+Xaod+hR
         kZOg47iS1kIlSEce7/X0NklYZDfVB/urp+DY6f0ycQ0Q35PqrjrKAeZuKtC0t6cMtGt3
         pn+g==
X-Forwarded-Encrypted: i=1; AKwUvByUOkHRb0hoLodM/1ywPlcjMU/rkKNxCWWx7IcFlaj/EMX+zS0f3PeKiaV0V/YSROIZpGwiCBX+YTeaOA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJmBQS7fb1eCR4ZL062SQlOJtqzSfa0pYghesCyLY6CXLkdlHGc
	V9d64lY2+Uhskyqw6oIPW+R8tg2dVXF76Xh41L9zpnp04oTqRzlvqCk+wXGJq20wb2fY4GVtVfe
	o3fSHlQw3wAUTc1RMW40UAf7/b3wcUO+tt026
X-Gm-Gg: AYBFou3VSGMpggmlu4lkyvTwhonTcB1bKZh2ZS5NLqRWMrINc17Z+KeE7WoLA/jrazr
	enUJPMPwYPjKuIg1FrrN+jaekFlctSntOOGzsf2C1mmhUOa+uFjeUW1M0S4AuTUyioViATHXT/B
	KH7h7aT1b/0gCGAmC0cYo/hhwTwDRJMALgw9M4aUUlQqjghrKx+3qw3dObFyuUxmQTxL1qQj5gZ
	95lZm+xUk1kNEJRz4VCycZ4DzY7qzOMihZI+XCGc7Sb45JwKPtcM+UcDrO9nFnSoJ5o1mWDRRz1
	I05iPKZ+PJSCv7ayAu9x3bi4Z3LLU57UsT0AMTXjwbxuC4yNfTHJlAOlWNrPk4BvbUDfma2nrhQ
	fo3PLAbdHNCxYKl2I51RvWVCP8KZxlSCY1PerdRiFWYgjqrArddlu67biHaVB/j7BoimWkDU=
X-Received: by 2002:a05:6512:3b99:b0:5bc:b67d:ad05 with SMTP id
 2adb3069b0e04-5bcde6bdbe3mr1095860e87.11.1791596122879; Fri, 09 Oct 2026
 18:35:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009212501.971158-1-linmag7@gmail.com> <20261009212501.971158-3-linmag7@gmail.com>
In-Reply-To: <20261009212501.971158-3-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:35:05 -0400
X-Gm-Features: AclHuK9__AOLeUIrfKM5_aOsqjMFrmHUxw8TEZQfjZHjbxOf5LFd1-CxAppwYVY
Message-ID: <CAEdQ38Fdbx=pZ5=HmCU0C1=O+gAePAQEtd7w3oGSUX-gkQM4EA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] alpha: do not skip TLB shootdown IPIs for
 kthread-borrowed mms
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 9, 2026 at 11:19 PM Magnus Lindholm <linmag7@gmail.com> wrote:
> Change ipi_flush_tlb_mm() and ipi_flush_icache_page() to test current->mm,
> like ipi_flush_tlb_page(). A CPU that only retains the mm lazily then
> clears its own slot through flush_tlb_other(), rather than publishing a
> new ASN on every IPI. Once these historical slots are gone, the shortcut
> is available again if mm_users remains at most one and no other CPU has
> taken or kept a context.

ipi_flush_mm_and_page() in arch/alpha/mm/tlbflush.c still tests
current->active_mm, so a lazy CPU allocates and publishes a new ASN on
every migration rendezvous. The next flush then finds that slot, sends
IPIs, and the lazy CPU clears it again. Nothing breaks, but with
compaction running the shortcut is lost after each migrated page, which
is the case this paragraph says is gone.

I think the handler can take the same test as the other three:

diff --git a/arch/alpha/mm/tlbflush.c b/arch/alpha/mm/tlbflush.c
--- a/arch/alpha/mm/tlbflush.c
+++ b/arch/alpha/mm/tlbflush.c
@@ -66,7 +66,7 @@ static void ipi_flush_mm_and_page(void *x)
        struct tlb_mm_and_addr *d = x;

        /* Part 1: mm context side (Alpha uses ASN/context as a key
mechanism). */
-       if (d->mm == current->active_mm && !asn_locked())
+       if (d->mm == current->mm && !asn_locked())
                __load_new_mm_context(d->mm);
        else
                flush_tlb_other(d->mm);

A lazy CPU then clears its slot and still does the tbi() below. Any way
back to the mm from there gets a new ASN: ev5_switch_mm() sees version
0, and kthread_use_mm() goes through the next == current path. I have
not tested that change.

The callers have the same asymmetry. flush_tlb_mm() and
flush_icache_user_page() test current->active_mm, so a kernel thread
that flushes an mm it only holds lazily publishes its own slot. That
one also takes the shortcut in that branch, so I would leave it alone,
but the changelog could say so.

> Order the slot reads after the page-table changes with smp_mb(). On the
> publishing CPU, the store in ev5_switch_mm() precedes the scheduler's
> post-switch barrier in finish_lock_switch().

The barrier there is the mb() in alpha's arch_spin_unlock(). The
scheduler does not promise a full barrier when it drops the rq lock, so
this is an alpha property, and nothing at the store says it is being
relied on. Could the changelog name it, and the store get a comment?
Something like:

                mmc = __get_new_mm_context(next_mm, cpu);
+               /*
+                * Ordered before any use of the mm by the mb() in
+                * arch_spin_unlock(), when finish_lock_switch() drops
+                * the rq lock.
+                */
                WRITE_ONCE(next_mm->context[cpu], mmc);

The rest looks right to me. I went through the window between
finish_lock_switch() and check_mmu_context(): an IPI there clears the
slot under asn_lock, a flush on another CPU can then take the shortcut,
and check_mmu_context() sees the zero and loads a new context behind
the new smp_mb(). The three points from my v2 review are addressed.

The fork numbers in the cover letter are from before the handler
change. It would be good to have them again for this version, along
with an SMP run under compaction.

With ipi_flush_mm_and_page() changed, or the changelog reworded to
match what it does:

Reviewed-by: Matt Turner <mattst88@gmail.com>
