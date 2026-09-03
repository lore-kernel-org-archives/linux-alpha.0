Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C76834E74D
	for <linux-alpha@vger.kernel.org>; Thu,  3 Sep 2026 22:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476318; cv=pass; b=oAxO3xyTpwntW8JF5POQw9QnE6uUkL3W8v+w6HoqOQyDy8ipMR17SixSiH2dMPNDn+hEF4pWZgVJ/HAAHSfgnpKnTvJGZVZSNSUnfne/HciiVcM63zM/axNj23MidEx5Ky6vlC/HU2Jhnlabx4RdVZ7Fp2GA18Hpxdi1Ge5abRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476318; c=relaxed/simple;
	bh=Udt8tF9PQ+yaWtM/r1qdypPjIYTzftQh1II2bNtHw+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FvyQHFq7Gt1kCoIl1wfaXJ5Z3l60JQ05Ri0+C+UDHpwSEHNyVZ9O2gYqXhU5K1mNblxkq6h1biDumoFCt+BNuVD/wQpw950TuhlBndpVzfn0z0QOSllpi276CcmE3u5yzbS7409hPlh/iOML2at/ZqaT/EdZG88VNvXZkDVEMn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfmYtY0V; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfmYtY0V"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a63667b78aso469023a12.3
        for <linux-alpha@vger.kernel.org>; Thu, 03 Sep 2026 15:58:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788476315; cv=none;
        d=google.com; s=arc-20260327;
        b=RWfGWmewZQ0x5OP57lq9e2Tf0FLeOQaDdA/IZ52Hxe8WOix5TYipgMAo50dsdk67ks
         L8ySfHV8ubbbUGNv+HdR0LWJI2zlelr490xp4LFc1hjlSNwMARByN8T35xCuU4jJuNef
         NhnISae9I2+qoizG7fg88ypGO+QxnQv0L0HOyC2ToFTIwKfWYN2n/fm8VwRZ5vC2mTFS
         DjuiWS8cXL3w3gnLfuLjqnLPGfq8JDqmlQQQ1mV3ZfVCMaPZbGxcEPMw9W9h6j5wSKAs
         HqHWbQoG7lyoXof+gPvaPcXbeyboW6gc14Gr9ZfO5vO2gi417dpW7wTfGjCQlpQ0xMSC
         yYIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F5jtNNir4UNaJAkjh5s2D29poa0W8o8SXRWJxMp3EFk=;
        fh=bLXUq4zKMKoVtr4en67hBbn5AghZJydmSMAYDJEBeBg=;
        b=mTWkFB1x6/j7Gyh01my9ALYXUGDPH3WOLIDADkMFk6ENLLK6MZniynI9z5Lv6H7Xfd
         88a2Ex+uUq+vC7DRxjS9yIuX8tcwX5M7x15x6GZ2+AOkDUXut2Mz9SMupq+jMa0ha9qm
         xYVfz0CULiBnu8sud9dxhIewYYv0IXmLgdNRJTMFxqHyB0cdCf5hHQBJxsFnsUAnsJTv
         vGtUufZpU9RiSeulSYoZQQZHn/xYlhRZKSu4oxYsXkbfJFrQ36GeDS4x2b2XWdywK6Qf
         ClQ4rMgL116DcO6wwa+hKAQFMROKtB1sktv3qWpQsXUG8bNgwtNEguVnEDhaxOOPE4Y/
         T7Yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788476315; x=1789081115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F5jtNNir4UNaJAkjh5s2D29poa0W8o8SXRWJxMp3EFk=;
        b=hfmYtY0VCh9H3768rMxZDyDU+copxDcPC0XFg3uCTvhVWNTCW7RUEzn1/m5msXeCkr
         4WZ15CngMgC4Hr44RJ9GbUuStvSJIj88LrFEA8OvGHELdfNmUGh8t1Tkl3hNIaTNysT5
         JZH1Pk9+cyPE6qpWqPpTKxIKE5+R/VdtpKoa1eM1PmO91Zr7j2TIAxs0V+xEpHRysSWd
         ukZ3/PjpPWbZfUpKdc6/wApX+BUbZx+PuYOR9F8GPYOlzoAz7HJ4Pl4TPVJYd2vr33+h
         HVcz1biMu4eAu2qt/db4cgmTWrdfjock3KrSmDXTQcS8uGhtbS2X1ttdkflB+A4p5tIx
         FvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476315; x=1789081115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F5jtNNir4UNaJAkjh5s2D29poa0W8o8SXRWJxMp3EFk=;
        b=QetBY2GM6wm2yToZ5JoD1KPAn5R2kI2iheZcnqZl8aNYHWI4cHz+w5k5l0Z8boUdMt
         Om341qV512tfzeWkRHMcUIYWuc3y5/DsVVpUJt5hzBgtZXaDxISrM7vSZf9nLIRgL61R
         1b7b4X+GazLkP/XFmKsZdFGmW5/j5Hv8vo1IYHZtVkiXJMuQDvibeZNfsRRQFgWuvzbz
         DLjmOfmaKSNuFLgLNU/pAOSYBQnAVZcm3rBT9EvyS/FZJXa/rwvXDJ+ANW0GYhOQsY66
         Ilzo7W0e6yXXDR//k+DX+iUsJpP+SfUFbu26pDCVeaA4reO6Fnrx0XWLqZDyMkfbqNQs
         HB5w==
X-Gm-Message-State: AFuF++mspuAWVXtIKf2fcEg9/UEpZdB1LSQCGcxQma2q4k/7oOiG4NQE
	HdUWloPijv0ul/pHjK6Xt+1oQ1PMkdfqvpOZzgBLqdFP9FpwoFbbpISupRxD61fqhklqhp9m923
	cCIbi8s3NnqqbOpe4PvGX2Tl2Yju1chw=
X-Gm-Gg: AYBFou0bw22GT2CXSIYUCWkdCLIHFMn62mBnBwepfzE2FH15C4tMOMA32stUioPUPv3
	MPFJ8yH2qkqBpftTntcJrRUK3WuMR9/pZL+MNZYAJTN7QoFDMatiIX+BV1LzucSenL1pswyFRWw
	ZE8PwILzVnV+smxEw8HM9o4SIwpKnbAZJSudOHiWRbz6kLUiUCixM9iQ4A4lZJ1FhrIc5kjiABg
	eYDN5dOY9v3m/MVZJcrNFbPLkAjjarMn3YeqjZiyacqGSRjmZOmF/Ktw1zSYRF1EfWXpe4T3fgz
	7zadYIUrb6gYp4gaSJZg74tc1Qk9dST+fPxtbVU742RhVtcDZfW9VonB7LRrb/PhwcnS3PesRKm
	MhL2Nm4YrVDeqQt6FcMC6phCZaZMDk+E=
X-Received: by 2002:a05:6402:450a:b0:6a6:32f5:ff40 with SMTP id
 4fb4d7f45d1cf-6a7e8f99b8amr748145a12.20.1788476315331; Thu, 03 Sep 2026
 15:58:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <b71c51ff7ca699ca6e667a55d9ebce58ef092c77.1788277742.git.mattst88@gmail.com>
In-Reply-To: <b71c51ff7ca699ca6e667a55d9ebce58ef092c77.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 4 Sep 2026 00:58:23 +0200
X-Gm-Features: AcwNN1UOei2zgDUxSPJuNJC6Z9fZXmj2Wvlgh4vJndJcYJdyLsVtnIJfNuyE9QQ
Message-ID: <CA+=Fv5Q4iCnvTqLdHAdXA1ahdPLBJ5nZcdWXc3pki=T6P76Mnw@mail.gmail.com>
Subject: Re: [PATCH 24/24] alpha: add TRACE_IRQFLAGS_SUPPORT
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:52=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Instrument the entry/exit assembly to track hardirq state for lockdep.
>
> TRACE_IRQS_OFF is called after SAVE_ALL at each exception/interrupt
> entry point and at syscall entry.  TRACE_IRQS_ON is called at
> restore_all before returning to userspace, where PAL_rti will restore
> the user IPL (re-enabling interrupts).
>
> The function call clobbers caller-saved registers, so the
> TRACE_IRQS_OFF macro reloads $0 and $16-$18 from the pt_regs frame.
> $8 (current_thread_info) is preserved because it is declared as a
> global register variable.
>
> Together with the previously added STACKTRACE_SUPPORT and
> LOCKDEP_SUPPORT, this enables LOCK_DEBUGGING_SUPPORT on Alpha.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Matt Turner <mattst88@gmail.com>

I think this patch needs to be rebased on top of Alpha GENERIC_ENTRY
v5. Both patches are based on entry.S blob 9f2608de2544 and modify the
same entry and return paths, so they cannot currently be applied in
either order.

With GENERIC_ENTRY, the syscall IRQ-state transitions are already
handled by syscall_enter_from_user_mode_randomize_stack() and
syscall_exit_to_user_mode(). Non-syscall user returns go through
exit_to_user_mode(), which also performs the final hardirqs-on
transition.

The interrupt path already calls raw_local_irq_disable() and updates
the lockdep state in do_entInt(), while kernel-mode PAL returns retain
the Alpha-specific lockdep_on_restore() handling.

Adding TRACE_IRQS_OFF to entSys and TRACE_IRQS_ON to restore_all would
therefore duplicate the generic-entry transitions. I think the patch
should instead be rebased and limited to any entry paths which remain
uncovered after GENERIC_ENTRY v5 is applied.

Keeping these transitions in the generic C entry helpers where
possible would also avoid additional register-save and restore logic
in entry.S.

Regards,
Magnus
