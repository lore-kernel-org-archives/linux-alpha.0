Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792548228;
	b=HK5P9Cx6MEQ4u63DHHdPidqcbSF+VqIZDUR4iIYDA2oN6ja4AJUrvaseX9QyPn0lU4jf
	 alQhC18tbKQ/JJgDs7A45PuANI5YDMbXo3iLXbpN/bQI0ppPuPpQvIrbNS2+zAFWBzTt2
	 eqOhR74vk60Ni2N14p78IqJt3Aea6FLAdFME5kmk7C7fcm4cqvu3kdIsqLXhW07B0bvC2
	 NX/Kx2QuKbl2I0CkmVDuiak0fdj2dwUzI4KwDv4p5Sa8QqkxSmkPcCv+hAzS+cFJue6Nm
	 mzZ6mNV751DCXx9NOIIuI7YypczruK2CIiUk8Hv2AkiU14djd0708VmLg9drybwm+Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792548228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=MgBowOpMqpLnENBNIJoy7ySD+4JhgZXDOvFmbx2l+14=;
	b=T4B1dJgrRwltI2J+NzvyoaRaS+ptbM52pBZJRMN1LDWmX3n5qy60trJVp8oxI1tOL1XM
	 7epJ4OUVRIzwS9AAb/Hzpei5s3tN4/XwR8LjETz4u0WmMsgo3I2nuxvY9uRTvt7FrCP2u
	 /vS0J+Y6lvoSCwPHscJ83VscPQyucme55LlOUL0ljFfUMFqi4Z/o0DVWPh8vYsRnS4FSx
	 pcazDf103WV+KZOiX4fzr4womuQ197SgpybwqObbjS6ab3KniSvDR4slZRb6IrmUc1Ie5
	 W1yX42fc9QpAvxHjRxoYVDajTZhNefTSgrrgetPm40GK+l/wEIte7U/eXtxDpr3SBew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=szzpzZvR;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9BA606A320
	for <linux-alpha@vger.kernel.org>; Wed, 21 Oct 2026 02:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD9BA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=szzpzZvR
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8ab432273c5so2047077b3.3
        for <linux-alpha@vger.kernel.org>; Tue, 20 Oct 2026 19:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792548227; x=1793153027; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MgBowOpMqpLnENBNIJoy7ySD+4JhgZXDOvFmbx2l+14=;
        b=szzpzZvRcT2l2cVzaau+gwUjtSrRclGYP580iw39a/rIIPPUZ0oUKUV2HT0QH5dZNs
         /gIbnF1zHvPvt3Ltd2ddiXD53OxJmM3/s0zzf/PHrB63hrSH0JoATk58V552aWCbUEIA
         di7eU95ka7EWglyQE80IJxLONP9PWXzej67EAPG0gtNbBa0oBXVcV+vdGtmStCtmKeR2
         YvpzI4Xv6R7MY55aphHguLJ8/RUvywnTJSDi8MipU//2BVhM0C/4C65KN68UIcQBsVoJ
         kv9f5YzaSotd5GlgY56vgry1Ah2nw8uo8arYSq/GNxf+YXX1B5xu/Thi513DXh6jVcPu
         tFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792548227; x=1793153027;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MgBowOpMqpLnENBNIJoy7ySD+4JhgZXDOvFmbx2l+14=;
        b=QQn2gxE4NpMsOtPP2+GWPk3y3+Fx/Jxt6hIa4ArSgQ/uK7qzpieuMZmxqlD2/lY9eD
         vpjkq8eHFT/QIpDDfepyQx6wSn2oFSWlMCPieKKuTm07FiGaLDWvoMeYtFQ24FNpIDCA
         snaRxGADD8o1B7OM8OiCFA8OuHT5Xdwn+kFe34+delTiCg6I+WhwShWx5hj8upqBRdRW
         1xzQCyTuZFq4aUwTr81Db/EoJIZLjdgSdNeHnQAbuinF2ak2exwcnb6YW0Patgi0ORca
         +UUfMk71ZS/TSEDpju6m02sELT4BukQlKFidGZuoQPhFzsttMQOGPTxawyPMBElLBD/2
         B2eQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7OZ96lEeGO3LmLgNsNOA4tKKJT3iH2kNWyhh25HO3stO9f3+VHD7wrFnWSR4lC2mlIJQYwSjkr+L5uw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJvw/I98fMxkggVSuxtn/AKC7+9DWuM5G2+mFv52UDOdQ5NJZc1
	Aa/mIn+stx/gDxHbnve3BfbYSJ791eBkvupguzSHXMwkbVUpbWtjet/0
X-Gm-Gg: AYBFou0FpXnXP48OW7LWSJ8CV0ZxjbwAAFy4ruS22HEIXKwlhsdY39k+shYY3+mAa/+
	U1V0930qGNVM4mghsLyWN8lFaodBjVMn8AJSJcQHm8/7P6TXUv6v72JC74cuu0HOdHCP7LBCu8m
	Myvvk7xTkhJ+lKh7Jde14G1qNMMO1tzw/tlO/amB4CJB8r1S0cgwJKmEtHmsq/6lfIfw7HtZotA
	3/Xn/cDo6Uzy5rNsjAZ5mdml16ENh5BKwG0WFJAlo5WVMVx72+lvGh4rov3nBUf3pNkuCys2xMp
	qPrZdcXwy7qcOVMBp/iZFoFW5urRIyboIZmc35ezJoUJwUeQwIDTQvznwWcJlpM5It7Sf1vG+qy
	OBql1eeprRIFkrff91fydgbJSUcv20cukvSpFtohON0GAkThYTgQJVmRFMNByfEXXCnaN6iuRAm
	a3HEzEtLEZ+xaes+uqOQojpumD/seoYvCbJvTgJal+iqCZcrQdp0H/txTtDWlD7o6wauklTW9j8
	2Zb84+nWAAU8GMdB5LLe/McWvfi3mjxxBMMBU+e1aokzakGVj+Fb4/Jr9j9oTho1++uLbY7sMry
	ejEaCZdboZyak6wm1yd0QR99hz9VeS7cY3yW
X-Received: by 2002:a05:690c:9988:b0:8af:5053:5c95 with SMTP id 00721157ae682-8b133e02bf5mr4022787b3.54.1792548226705;
        Tue, 20 Oct 2026 19:03:46 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b1300c85c9sm5641467b3.23.2026.10.20.19.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:03:44 -0700 (PDT)
Date: Tue, 20 Oct 2026 22:03:42 -0400
From: Matt Turner <mattst88@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Magnus Lindholm <linmag7@gmail.com>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] alpha: soft-fp tininess fix for v7.4
Message-ID: <zouc6nnptikib4cpv3sf5ip4gzdzesdth4wgnexnk54f7jmsp2@u6zay3q6pv3v>
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

This is one alpha FP emulation fix, sent separately from Magnus's alpha
pull because it also touches include/math-emu/, which powerpc, sh and
sparc use as well. Magnus Cc'd the maintainers of those architectures on
the patch in September and I followed up in October, but no one has
replied, so there is no ack from outside alpha.

The change for them should be nil: the new _FP_TININESS_AFTER_ROUNDING
macro defaults to 0, and the new code in _FP_PACK_CANONICAL is guarded
by it, so the compiler drops it on the other architectures. Only alpha
sets it to 1.

The two other patches from the same series went in for v7.3.

Thread: https://lore.kernel.org/r/20260803-alpha-fp-exceptions-v1-0-c99d75608e60@gmail.com

The following changes since commit c03c1a14507dfaf8b856c2608f9ac216021fc222:

  Linux 7.3 (2026-10-18 13:14:58 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git alpha-fixes-v7.4

for you to fetch changes up to b74843b38da8f1186fd7d447646c835b47096a15:

  alpha: determine tininess after rounding in the FP emulation (2026-10-20 21:38:52 -0400)

----------------------------------------------------------------
alpha: Fixes for v7.4

Make the FP emulation determine tininess after rounding, as the hardware
does.  soft-fp always determined it before rounding, so an operation that
trapped for software completion could report an underflow the same
operation would not report when it did not trap.  glibc's math testsuite
catches the disagreement.

This adds _FP_TININESS_AFTER_ROUNDING to the shared soft-fp code in
include/math-emu/, as glibc's copy already has, and sets it only for
alpha.  It defaults to zero, so powerpc, sh and sparc are unchanged.

This is the last patch of a three-patch series; the first two were
merged for v7.3.

----------------------------------------------------------------
Matt Turner (1):
      alpha: determine tininess after rounding in the FP emulation

 arch/alpha/include/asm/sfp-machine.h |  4 ++++
 include/math-emu/op-common.h         | 23 +++++++++++++++++++++--
 include/math-emu/soft-fp.h           |  8 ++++++++
 3 files changed, 33 insertions(+), 2 deletions(-)
