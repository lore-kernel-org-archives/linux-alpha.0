Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8097D40A945
	for <linux-alpha@vger.kernel.org>; Tue, 22 Sep 2026 21:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111958; cv=pass; b=B92CT9mcRyZRZCIMBANLqzZtWF5AH+SECz8GOQCNJoELs5i/RzcuIVxkzYZduIQ92oTu57Fo/X8tK7W1xLnysMS2BH86AIo0VENVjF2NDeD0XG/bttXV5ULJHegvPq+J4+mcktbA9egwObh+MYbZJVFpOpVocA+kj5gbQyTCqGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111958; c=relaxed/simple;
	bh=6s2aJ566N56xzs6mnOfrOrXWI6H+UVtsDKnvAYnXsFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YYaqu6vh6/CnnqAroI5+mHAc0VJnZuF6xwFuTz7MS2/K6hYhrujHWX9ptqta6l3DxSsoCaGOyxSYZ4nOLtk9pK0cBZR4PKFcEDXi/CHVWECoxGzYEHoZv6zMK/DCgaU6zULmDLGtoXTQg98MlxrNn5qsN6TycKLjqrlno5ONFCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QohbhTr8; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QohbhTr8"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f5603a0so38850866b.0
        for <linux-alpha@vger.kernel.org>; Tue, 22 Sep 2026 14:19:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790111942; cv=none;
        d=google.com; s=arc-20260327;
        b=oQ4WHra/HSc2/wL7SGN0mlFvCQ2wB6Q5fgObLnFg0nKLyaoD/rZMwh60TrHDtqG0eu
         qoo9y0FMUUXfGV3zQA2x6Lq+TJILGRQDTC/UDeaBxb1JXVT1NcGAVy38qJzIPQDfzkOP
         qkW5DkncbY0e53sZk2jOItSSWVgn9WAjS/yxqpxqB6lzRegJ+WgPrvvUJFB6QdgZmEeP
         4ofZsSdtC9+p+uYiFY9MTDfDFH69ALQehmNC1qBDj1+TVdBeLaKgvJV53jOe4mxfLSdp
         G6u2aUyAmuQJxSLQnMe069xiC2lADAbDguJ/dqPCD/5CzipXqPK7VRqDjqt9q+tVTCzT
         Hrbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H5Y5jZEjXZGV7ScO2IS9D3/tf1ou83WxcfQ6AnP5+s0=;
        fh=lTFuyM0mJi/aHEGbrFdeeuBLllSbYJqE3Kknixnd20A=;
        b=MDXWohXFoO8TRD4UTdYOceELvFAERSd9zwFq4w3HGvC/IE2ZtFkFMiVz14cujlVJsn
         XKoUNwzSv3HrgDu1nen5NN/aZpY0q76Rz69kIDxQ5RLTPnY+pMZ7G1OYHxqV+HsqYznB
         LeD4Nvye0940JvzJH2tcme9YAJByAja8voJMCC7myKMrbhX8SsFHe6+i9YjDhUL5y56H
         hjRgNUCnq1cIHKxpapTjIiFCFFbaLQQsgpiUmA0tZgdJFREFrLKqytto3sy7qhGIOrOY
         SDyqoxFJKA3qGYXW6VwGAhYZ18LQPqS9j537+GZ3EJn/GGMjJAJjY9C49QpZGn6VhsIa
         dahQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790111942; x=1790716742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H5Y5jZEjXZGV7ScO2IS9D3/tf1ou83WxcfQ6AnP5+s0=;
        b=QohbhTr8dPeVRr1KRGIfMKAElFof3yHTWsWgLgHSWNyrqOW7FkK/ktDYynyg0Tgrw+
         zH5245I/5eeTXMAyGMKT+8Foq8XkD7dD+xtDXmTTQ4BrRG963snQGlzuwyjx4C9gviW8
         qmjtYG9EAsC19r6PBCm7ZXyGC/q4J6ZVrZWLK3jpmQu3T5DYi8N4+JfUCcDrsL12PiM6
         hVDXAaRf++xkYDRLe9e/xMwfWt7GFkgmforocWOwXJjxi/g3HCdgrWR+cAnI+RIyXAxo
         bysezv4aZ9zfyXnxD1ihXlP87FwjQj62NIF9RdgIrUq0NuewGgQrW6AtsvHorGtFrjr2
         5g3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790111942; x=1790716742;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H5Y5jZEjXZGV7ScO2IS9D3/tf1ou83WxcfQ6AnP5+s0=;
        b=vMmrRur6VXvPAXw4BJBzecaY8iHuXj5c1nR+wOQWD4jpu+aSW+VxyigF4DV5aGUkVg
         TMQ4WofYBA2hxM9Q0PbVx0ZBPMUubXHiA1jpMhb7JNu8gggpqOMs+8dQyIYg3g3PE2vB
         evWeCJRiC7hPsj15RtKh87wgm3i8d4xnwdeGWFVbgzRIxJRIN2GrzrvMZ9dAL3wPXtG+
         AWPt0FRiguR78AfW0bGMf/I7+9Bc6pxqHn3h9HyPZJd/Id60PBhsHb1qRBz3A9LC+Vi3
         T1upmTmGaEKhfxCySnc80Db3nptQiwcEtTHI7UDhT+1bjUdlmgBsaXqw1DVasd5NiLoL
         BkPA==
X-Gm-Message-State: AFuF++lssxnzQeQ9Jkg0NB0KBL+252qtPorRUtRS9o5GUV+bko4hsRlA
	dGNpHblnMWsOykWcDeZ3J6pKBR5V8+gGaEvVQ7d3IKFjsGmi1//u1VnglB2+FLQcYc2YP+TCGhA
	Qx/IPhwUTAP37n/vjSrDaUObjDPkp6DU0H4dnAWc=
X-Gm-Gg: AYBFou0UpiQckNEcIBMeOljettcVskWBDoSVAU8ffN9L+YY3CA89ATad5dn8I29m/ts
	sQSbqbfU/hPkOqfAWDSAULGQivnh1soZIzv0B6jajaPL/+CBi39MoG2KbY+BMatpCeHJIcOzyWE
	Py1QEt1y9egvZat8qhys4FT4qBEL8nY/M2eJZd9YJUb8VxY0C8eLon9Q4wzka2QvqTX/bLuadY6
	Fqs1VxStuEOd0he8p4q7dXqoIbCG9mhO157P1rohlgQuPJ3Zg/JWXD30/9b53t6v3Dsa7krxFxl
	A5KFmgE0JFq97WXzVsSuA/KBlQA1po+KcK0p0Xr9OaAYpzVRWTTYyHKE2BEScPdLDbplSHIAkde
	w07KcXlnnpVmOSQV4bnQWGicgpBVMF7vFXb68lcjGD24KEUUiJEg=
X-Received: by 2002:a17:907:9606:b0:c25:cb9c:2e3 with SMTP id
 a640c23a62f3a-c2aadfcf1fbmr36923166b.4.1790111942202; Tue, 22 Sep 2026
 14:19:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904162424.376504-1-linmag7@gmail.com> <20260922163830.820433-1-mattst88@gmail.com>
In-Reply-To: <20260922163830.820433-1-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 22 Sep 2026 23:18:50 +0200
X-Gm-Features: AcwNN1VfeRUrwYXZXxuwoVv8oDUFhplEyftw8nBHpfaAuUImuST01j7tXaJ46bI
Message-ID: <CA+=Fv5SkuTfsTkKg+q2UBiJ7Hvz=ThbE+cmJO+0xoj2OoiaNUQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] alpha: load the MMU context on a direct mm switch
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 22, 2026 at 6:38=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Fri, Sep 04, 2026 at 06:23:28PM +0200, Magnus Lindholm wrote:
> > Reproducing it. A KUnit test was written for patch 3; source can be mad=
e
> > available on request. It uses kunit_attach_mm(), which calls
> > kthread_use_mm(), and then compares the loaded context against current-=
>mm:
>
> I wrote a similar one and ran it on an ES47 (EV7), on v7.3-rc1 with
> the v2 stale-TLB series applied, with and without this series. Only
> one CPU was online, so patch 2's shortcut never had another CPU to
> look at.
>
> Without the series the ptbr check fails. With it the test passes
> (3/3, including user accesses before and after sleeping), and so do
> usercopy_kunit (4/4) and kunit_iov_iter (17/17). A fork/COW check
> running under continuous compact_memory showed no corruption, and
> fork throughput was unchanged.
>
> One difference from what you saw: the stale ptbr here was not
> swapper_pg_dir.
>
>     Expected pcb->ptbr =3D=3D mm_ptbr(current->mm), but
>         pcb->ptbr =3D=3D 44986 (0xafba)
>         mm_ptbr(current->mm) =3D=3D 42112 (0xa480)
>
> swapper_pg_dir is PFN 0x800 on this kernel, so 0xafba is the page
> table of whatever user process ran on that CPU last. The kthread then
> reads and writes that process's memory at any address mapped in both,
> and TLB fills made that way get tagged with the borrowed mm's ASN.
> That is worse than a fault loop.
>

Thanks, that is the better description and v2 uses it: the stale root need
not be swapper_pg_dir, it may belong to a user process that ran on the CPU
earlier. I kept the ASN part conditional, though. ev5_switch_mm() writes
the ASN field but nothing loads it, so the fills only pick that ASN up once
a swpctx has installed the half-updated PCB against the stale ptbr.


> > Patches 2 and 3 have no Cc: stable: kthread_use_mm() is the only
> > reachable caller on alpha through KUnit's kunit_attach_mm():
>
> I don't think that holds. vhost still has a kthread worker mode
> (vhost_run_work_kthread_list()) that calls kthread_use_mm().
> VHOST_ENABLE_FORK_OWNER_CONTROL defaults to y, and userspace can pick
> that mode with VHOST_SET_FORK_FROM_OWNER or fork_from_owner_default=3D0.
> The USB gadget f_fs and gadgetfs AIO paths call it too, and dummy_hcd
> works on any architecture. vdpa_sim is another. Given that the failure
> is cross-process memory access, I'd add Cc: stable to 3, and to 2,
> which fixes the missed shootdowns for the same borrowed mms.
>

Agreed, and patch 1 with them, since patch 2 is not correct without it.
One thing worth knowing for the backport: several of those callers hold an
mm_users reference across the borrow (vhost through get_task_mm(), f_fs,
gadgetfs and vdpa_sim through mmget_not_zero()), so whether a flush reaches
patch 2's mm_users <=3D 1 decision is caller-dependent. kunit_attach_mm() i=
s
the unambiguous case, and patch 3 is not conditional on any of it.

> Two notes on the patches themselves.
>
> In patch 2, it would help to say in the commit message why keeping
> stale slots is cheap: the IPI makes each remote CPU that isn't running
> the mm clear its own slot in flush_tlb_other(), so a process that
> migrated once pays one extra round of IPIs and then goes back to the
> shortcut. That was the first question I had reading it, and the answer
> is only implicit in the cover letter's fork numbers.
>

Added, with one qualification: the shortcut is available again only while
mm_users stays at most one and no other CPU has since taken or kept a
context.

> In patch 3, the next =3D=3D current test is fine, but the comment could
> name kthread_use_mm() and sched_force_init_mm() so the next person
> knows why the scheduler never takes that branch.
>

Done.

> For patch 3:
>
> Tested-by: Matt Turner <mattst88@gmail.com>
>
> Patches 1 and 2 only matter with more than one CPU, and with one
> online neither the removed loop nor the new check has anything to
> look at, so no tags on those until I can test on SMP.

I pick up this tag for patch-3 only.


Thanks alot for taking the time to take a close look at this series.
I'll be sending out a v2 asap

Magnus
