Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF07246A5EB
	for <linux-alpha@vger.kernel.org>; Thu,  8 Oct 2026 21:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791494888; cv=pass; b=L/AEM7jZ3t9V2IPDyJX+wpFdlCNn2k7paZvktmqfYAJ/Hdu4k9Olo8zZVtz897iGi1FUZmTGhz0n/2hdwrDg3988g65QNGvl3ZMNfUiPTinJIciLE2pbdzrHOZmnNmHpU2BqnjyP4ISaRpvGHqwbYTe/O3m/UnDnmVP6rE9aXpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791494888; c=relaxed/simple;
	bh=VuYIQRRuB94W7Kox+M3XIrBI3vc27TwoZHp/3bqtfhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GN1GglyzljNiUevHcIN6xVimQzTiwIZ9iE2aRr72YzSHlft/tWdjualJKnGiS99sy58XHEX5UwA/a5vceYCmbuRNCy9MNLWZMhfnhpJZSgckhAhALkJ5u+kRwMVezwY7m6itLriF7C1NODmksxtwauljrjKLevLaWyU5h8L20j0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1FQBep5; arc=pass smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1FQBep5"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-917a707f37eso37869946d6.0
        for <linux-alpha@vger.kernel.org>; Thu, 08 Oct 2026 14:28:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791494884; cv=none;
        d=google.com; s=arc-20260327;
        b=Y4KNFmz+ZQym4gDYYdNHlRGTkuBvpu52NTSei49leY9r/2JfktqDEhNWZ9LACW+L3f
         3ACrpUoq8SRRQ5udw29UhTHSVcWo1M+iXHSuXtX2EhkQTFMX2m8mqhOloyLl5pEy5amh
         sY8UOp7HUmFuPYK+kJxByG+P784DJi/kYuy0omdC5xVDRMAbH5lWlAUr+7kcvaTahKN3
         0bzs9IOid/JY4WWjxRFtqdQyiOjB9kacGPkHRatJ4VZ4LWkGKLeSXZQw1iZvY4XSPEAa
         oQ2Ql5q0GvYIiJc25wiaFrNisNIKLJ+9pfOPJiCJgH3TENrfEvqwKOvHf0zAx7E2kOam
         ChpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VuYIQRRuB94W7Kox+M3XIrBI3vc27TwoZHp/3bqtfhY=;
        fh=6iXbhM2ziUIWTI5+scW2Kqe/DhC4Jx1tQQMQV1fppCs=;
        b=huDq0e03Kt2xhcPzdsOJiLXZdc3mVZ2rWCyIuPrgXO0PyBN3LaLtUut8/+8pWfVE8g
         CvNuRHFeFzRj0YWpioV9O0wiu5dLhkX8+/+gm47y75/u8PkBP5mDJFsHwMxtOpLncNbf
         qTdtryv9I9qpyF8CoSTETskaoPFyIZ6Vwn1q0hy6IS49ZjZ1Wuopdy4RnLwZHlknj9z0
         s1R+GrSUWeZFGv6N5OCllkxST/AgnahQGkbjzMszLxVc2vwlSSo5tEKhJODbjOfAVKCL
         kKhIQMwyRiR1C3aadFk3Rr2L3RdxsImlzlZnBFjy/M6V5lR4PE54KiPc4EgGdM84nb2Z
         tpbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791494884; x=1792099684; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VuYIQRRuB94W7Kox+M3XIrBI3vc27TwoZHp/3bqtfhY=;
        b=S1FQBep5rIbS2NRVh2ZkoFax+01UnH4BJIAUdJmdGIbuzORGGgeykIUXKd5p8S7RFW
         JA3x4H9ENgldTPyXa2IHWIiMMj8HdVV+7Ykxt73jdQTB0ATTdzNmnqJ9sEUVqAAzt5ZT
         GUEN48xs5ueGurG2aH2+4fd3kuWMA0tH5EJI0Uw4D++AJgl6fZR7vqwIQ5FwOCPuBSLS
         5oFH9GsHDa3sVxx+c0G64HQ0qGZfnqZ3N9BBOHz5UObudBauhfw7VQpdh04H1nF9t0fe
         H7phWVWs5W/OEo3p7229+ec/95ITwExDtxli6Va/SSrIXFlWVkPpw33iyVoIPirL4ue1
         WC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791494884; x=1792099684;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VuYIQRRuB94W7Kox+M3XIrBI3vc27TwoZHp/3bqtfhY=;
        b=k5m037YhfQh7+jv4HpwdzMCgdHHD0fU5nOWOk3e317ZIS/mZXbg4VlJOn0Y+kRiG6x
         bAtk7yARWk3LZaifR8EKDDGAIHEK3TXpwohfEZ5tZgNQpAUMWzAV3eQhyap1p5L25n3P
         mwVCGhap4kg2t02bjtNDD0o4UmUfCAk315gS9IaOgjrANmCq5dN4lkVNTLzXLkWb2vfX
         3m+LDYWZ5x56Aspef3KpnKHv2ARME5Rz4ROjEi2ezKlgtJNykn+Ub3sYcB7tpYDS2hRc
         8fdEi8BZhv0pDugJmy756oNTjMdXMPqDSvb1W1csC+Oprde3Mi25Q+lKdfyrQ5GXR75P
         lhTg==
X-Forwarded-Encrypted: i=1; AKwUvBz4k2DI7B34tJlEUJfI3ZR5Nx4j4c5OleGhj0KjC5cHBaKfd3b7dzXoP2/zIfbRRTkYtZGD13riMYNrCw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI0V+4NSM1zUL2kMgWCQoOs4Ke9sRorJ8zV46ppPecHgrRo72Fy
	SXhhdOJ25GTEtDOg2lpYeifRF2zGTINXaAScG/OCp8OPfblUAnLdSwPBAbyaClJ5iwEj16RYPfF
	FIVMffgV1bkrxOCJXvjTBGC3W2GvBzNg=
X-Gm-Gg: AYBFou39ZyFTZ+qyajHIuwnprEiiC2TFA9AzsgAUjGbb9WuF4IWaiaY1fW3G8Q8WdV6
	gXu0/6QTTvwjApWU4FjG2Sxgtaiu3k6n7vxrA61Dn2qebFGAXcNWVo0GoBZNLl2QaV9qUkCKsLu
	DrZko6sYIq9x+lEKvS378X6scIyJPVU0GxhH+9SQghZcNszh0YtM5X3FB3MMfIX9WZD9DaG4AHD
	+2pM/tGtJtgcAQ/8Zkaxhc2qSDJ/kqp95qZ6xUrddK1g1zQ+I+FUr9TKBOv6eVjNOK6esG+VRu7
	dMexC6w8A8pp/l9VrTt4q1TbhSKCKkOaOOWEgj0Mg0YrAv1T0soJEQShE5qkIj6sdJWR5XSmX/F
	nwILKimffVJ8bEA==
X-Received: by 2002:ad4:5c6f:0:b0:914:501c:6d08 with SMTP id
 6a1803df08f44-91b554f0389mr257436d6.14.1791494884320; Thu, 08 Oct 2026
 14:28:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923074903.862898-1-linmag7@gmail.com> <20260923074903.862898-2-linmag7@gmail.com>
In-Reply-To: <20260923074903.862898-2-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 8 Oct 2026 17:27:48 -0400
X-Gm-Features: AclHuK92Eilo9AIrsmVEgSCURzevr5CYUX7NRSheSjbh494ve_VZ5MYQZo-3BMI
Message-ID: <CAEdQ38E6pTdnfzU4tTvoJOFVGv6jSQ2HrhLTFet+2qMiYU4kZw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] alpha: run check_mmu_context() from finish_arch_post_lock_switch()
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 23, 2026 at 09:47:44AM +0200, Magnus Lindholm wrote:
> so testing preemptible() expresses the required condition directly
> rather than naming particular callers. alpha selects ARCH_NO_PREEMPT,
> so unless something else turns on PREEMPT_COUNT the test is a
> compile-time 0 and the hook runs everywhere, including at the end of
> kthread_use_mm(); it only takes effect in PREEMPT_COUNT builds.

The only way I can find to get PREEMPT_COUNT on alpha is
RCU_STRICT_GRACE_PERIOD. DEBUG_ATOMIC_SLEEP depends on !ARCH_NO_PREEMPT
and PROVE_LOCKING only selects it if !ARCH_NO_PREEMPT.

In that config preemptible() is true at the end of kthread_use_mm(), but
the task still cannot migrate there: there is no kernel preemption and
nothing sleeps between switch_mm_irqs_off() and the hook. So the test
never prevents anything, and its only effect is that one debug config
leaves asn_lock set where every other config clears it. I would drop it.

> A shootdown IPI taken in
> that window either finds asn_lock still set and defers, or finds it
> already cleared and flushes directly and by then PAL_swpctx has
> installed the incoming context, so the direct flush acts on the right
> one. need_new_asn is only ever set while asn_lock is 1.

The deferred case has two halves. If ev5_switch_mm() reused the ASN,
need_new_asn is set and check_mmu_context() reloads. If it allocated a
new one, need_new_asn is 0, the IPI zeroes mm->context[cpu], and the
task runs on with a zero slot. Nothing is stale at that point, but the
follow-up series reads a zero slot as "not running here". More in my
reply to v2 3/3 there.
