Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0D61DB95E
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 01:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596370; cv=pass; b=GfmqFkBnKTXde6dijDEAicgi85FOEzmZMRXn4L/MIDtYX75oTM0P9GiO/KwK+SHYfVRIrvAJB4jn4NlcLhVtx3ED/oXsy/xypnom1sLaLjURGdOi2cKjiDNXszXzANgpTXbu1E/ucX2bMXN8beNc1bLd9SEj5ccAlTDENVLOPts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596370; c=relaxed/simple;
	bh=Py0m1Cmsix5Ovia8S5x9H7+61c70VbqzFd88urpR4SM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fuqp65lPjMtOLTCld5fk9t3YVdnAknpCS4pKpz8g6aO+if1Kw21alFaPQiMFb/bUhXeHlfDZVJ0McGQqdBvgYIecOQfxM6eNC2vnMo1t/XiSZh0a5XpdnCOj44kdb9mw+6NLvyrMOBynvO04SCRVSJABYnUs/QWGoCSPHrVwTOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9bxpvuH; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9bxpvuH"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a98fc80925so3421251fa.0
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 18:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791596367; cv=none;
        d=google.com; s=arc-20260327;
        b=U7HDO1bxXgY/Culnx/IFsfxzVzb0N/vPmFbzBtuTbcj5ZbQOnJAfzwqq8ZykBXXggm
         dqNFTGIY0XjGJjhf01eA+fGTDGtFT0OIHNLB9W1crsVnCoB/yV5SAEs1Lmj6859kN7pa
         Jr07bqiojkjypmVyf0zn1P+p6HHqOgTqR7Ja2r/vnBOdHBMmIP/mjj86vvVnqjnIYWwp
         YiyS3Dx0++ARHgxTeYpQzjpiUC7LxCGFH92vzfKAsVu31Rq+I/3o3A9qLW/F7WBRX5sh
         2jGr61b/EolAqexVvps9K06yNy8AlP5R4yrNgruGGuoYaHU0RF4wiphV3qG1rwmBKAFm
         AlCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=faBeTeOeJiD3ztqB5joeMU/OkwY1xLFt2Vxq00Acafc=;
        fh=V0A2Fo3oHSXyYoJz1Q5KyFICGzAFYeGfwz4Vb6n7fg8=;
        b=QqutqB34Yiuwmtz+HR1RNDwB21ylBJveoSBeUoco7AhidRigWdedTi3UMsewiXGt1U
         ocMfpEA6cOBStDRO1iIeICvd3pLDlmvl17JCXRdJOI4odPawQkwlBzybpzRV3OjQGS5u
         gnnDDdgF6Sxf3z3IZAmWRLOkICci3SU8XQbo1T3DcKG3UJNvYZzwtxkbV8ofrsZ/qEmF
         MYTSVzqGcnBlXcU8gotyD5qboEmOrr4a3JBQWW9isxgVE9YMs4rg2hsdx/AXAEXLKroX
         rqNjuJkP8AnqGst3HIAPTqyK1PFIcvcUSXZmnHKcC04g9DUg53qx+5qmBnDxIXfZa4ZA
         U6fQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791596367; x=1792201167; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=faBeTeOeJiD3ztqB5joeMU/OkwY1xLFt2Vxq00Acafc=;
        b=K9bxpvuH2ekAzM25HmGprS3ZFX8epkF6l8ToKW2eBqe3gFuX/98ZA4iiFOWnvae5IE
         aeJflEWuJg7MMlgWzXvuMlkjBe0mE2o4l2sxDKhroPJ/AHc4Qj8fz4jWO/y7cX4ADJuK
         c5MFTD17vDaZ9CNVO4kJxv6dfQ6Fdjy5Kvcv72sSkuxKw3JAKoWbO4RFH45I1jegpMba
         9rZ+nxCDJlRPR2+8LDCEnqkVQmapcIcUQuiCYUwNuWeiLKQCljlBjNhz8bXDH/LpxZ1F
         nf1Lq1bWjeb3ZZGuUV+XRAE9JtyoSeFfzc+eHR83rdYrMqO7WBmtu5j8kMZ7LCKGIRiW
         3aJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596367; x=1792201167;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=faBeTeOeJiD3ztqB5joeMU/OkwY1xLFt2Vxq00Acafc=;
        b=Xl3n6RvI1kruFfBSN1nobWNkl/EBGm6FNsiaSMq6LIJNZpdNscnrlE3GRswdkM89Cs
         f6WSYtNfGpr6nHWqSDa/FDkpNd3Ajj8jLOguDVgkdCdIO+CnBwg8BaPsIGEjGI1aa6b4
         uhd+vfzxKWhyIev67e8xADap48wM/8oLvw+1k+WvOf5xIVqUcBV+ViZZzolGlVl0oK4X
         TKbhF3VJTyrBl8ZAfVb4g9oQO3ylfnWG03/xCFD8DzCXw+ML9dccVRSklPfXn7Uk7jSM
         BsJmaSvHMvTbK3vH/IJ41Tx1qcSluqUIt288JjvCj5Ad7V+9b2ZfB5EW2qG+poAA8J4Z
         6z4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzbn+cy8FueWe/4uDVrnV0/IS2huFr/v1SCfM+PdszR2TTeK/bWUi7j0S6YGgzc3bUwR/67qa367BhpEw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIJXDQc1oZDfDWYpx3qO3uNs2Ueq6/r3N/TLJq2HvOQpuqblcEt
	GvI/R9gycB4XmEHBBlUU3m4pAQC3ZMkZ74TtHuFvks02GV4zIEdKgyGGyEv5oIJ79ys3uzAicOW
	wmuX6jKOxg39CrIN1BIkG7w7LYftgIvs=
X-Gm-Gg: AYBFou0MthBIpafv7IpiRGF6l9OXVJSHKe+K6XHPz5Lgk4z4SGPdTzX14JLbtdnDnxm
	QMW9Eb3Wae9enOz1XUio3vT/bHKpC3VsYrWKXxH0mscXPeZcX0fj96adacL4iHbU3EkhbI/umcW
	XW4rePQE6GJikFbibmSDbtZ5dSzPF69jabceW1kntDXgRGxD4wlU44bHMLo13dBxRzHMaQ2PhfQ
	3l3ObhaQn/nlSR2s9vEPR8oxkQ4v45AQy7iy8Y/gqDa+iX+7Dwtx3/7bpaIKsB/hw3VsUq/oLJG
	jv9NBr1n+w0N4mUzxzFoyJ3dBh8rc39nRYkxHomNMyK99tn3sIwSDNg2TSsoJfp3mgqlotoirBB
	bL7femR6dygAN44c4FCGam8NJqbTH8wv8ykVhHE6OeYwVCzNqNeRBqQVTu4g3usWhOS1S7Ps=
X-Received: by 2002:a05:651c:a20f:10b0:3a9:8408:8c5f with SMTP id
 38308e7fff4ca-3a9c54b827emr5595251fa.10.1791596367170; Fri, 09 Oct 2026
 18:39:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009115627.969047-1-linmag7@gmail.com> <20261009115627.969047-5-linmag7@gmail.com>
In-Reply-To: <20261009115627.969047-5-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:39:14 -0400
X-Gm-Features: AclHuK_6Zvi_sGedYH5sEa7uaFuP23B_qDaBTwk1HdWpW25Qf_sKUEDrxHxpF14
Message-ID: <CAEdQ38Gh_t_XXu0DUGDzS3V6U_HX5R5TGVgYB8640TyiPtk4rA@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] alpha: decode and acknowledge Tsunami system
 machine checks
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 9, 2026, Magnus Lindholm wrote:
> +#define TSUNAMI_PERROR_ERRMASK 0xdffUL

This leaves out bit 9, and errors[] has NULL in that slot, but
core_tsunami.h defines perror_m_rto as 0x200 and has a perror_v_rto
bitfield. Which one is right? If rev 4.0 of the HRM marks the bit
reserved, please fix the header in this series. If it is a real error
bit, it is neither reported nor acknowledged here.

> +static struct el_TSUNAMI_sysdata_mcheck *
> +tsunami_system_frame(struct el_common *header)
> +{
> + if ((header->code != 0x202 && header->code != 0x204) ||
> +    !tsunami_frame_valid(header, sizeof(struct el_TSUNAMI_sysdata_mcheck)))
> + return NULL;

Do we know that DS10, DS20, XP1000 and the others use these two codes?
The vector already says it is a system frame, so I am not sure the code
check buys anything.

When this returns NULL the caller prints "Unrecognized system error"
followed by "Unknown or truncated Tsunami system frame", which is two
lines for one condition and none of the frame. Please dump it raw in
that case, as the EV6 code does for an error it cannot decode. The same
goes for the "layout unknown" environmental message on the non-Clipper
boards.

> + expected = vector != SCB_Q_SYSEVENT && mcheck_expected(smp_processor_id());

Nothing sets mcheck_expected on Tsunami. The only writer is in
core_tsunami.c under NXM_MACHINE_CHECKS_ON_TSUNAMI, which is never
defined. So this is always false, and neither the early return nor the
process_mcheck_info() call at the end can be reached.

I would drop both, along with the changelog paragraph about expected
probes. If you want to keep them for a probe path that might come back,
the changelog should say they are untested.

> + if (vector == SCB_Q_SYSMCHK || vector == SCB_Q_SYSERR) {
> + printk("%sSystem %s error (vector %lx, code %x) on CPU %d:\n",
> +       err_print_prefix, vector == SCB_Q_SYSERR ? "correctable" :
> +       "uncorrectable", vector, header->code, smp_processor_id());

The old handler went through process_mcheck_info(), which printed the PC
and called dik_show_regs(). System errors now get neither. For an NXM the
PC is the first thing I would want to see. Please add
dik_show_regs(get_irq_regs(), NULL) here, as ev6_machine_check() does.

> + if (fatal)
> + panic("Tsunami: uncorrectable ECC or PCI write parity error");

This is new policy. The old handler never panicked, and none of the
other err_*.c handlers do. I can see the case for UECC. I am less sure
about PERR, and fatal is computed from the live PERROR on every vector,
so a correctable CPU error would panic the machine if the bit happened
to be set.

Could the panic go in its own patch, with the reasoning in its
changelog? That would also make it easy to revert if it turns out to be
too eager on some board.

The decode and the write-one-to-clear acknowledgment look good to me.
Writing back what was read is a clear improvement on the old hardcoded
0x040.
