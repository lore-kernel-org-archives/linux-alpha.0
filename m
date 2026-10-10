Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC07F22157B
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 01:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596454; cv=pass; b=IB0lHygZQ1dl+VhEa6QOyPnoJzAtcnT1N5agmJkEZgHfT7hKbo17Qg6cc9z8RASlRJs2Oo/OpW4Rpd37sy15GeBVZ+BOLo6kLPap7mm536vbExvhqOeqEX21LOdGgDROJm/fC6w2ATslgI94b+XfKagDBANJhYz4W7OgZcgtiNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596454; c=relaxed/simple;
	bh=P9I9jEru7z33DVV4H8bL0xlg/En68kLgOq9/vrn0XsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D6kBUuP0mc8J/ak6Rxd/DGoHpjA2uIGk88HAT7PjBhZT4lQuR257kbTe9tuWcETkljXmG4fb4CFPfHejSw5YdJGF9HWvfbyp6YxU2OHwVvG03pgZn8cH6abN0ctu3LlsdmIaUYTSKLQQGHwSi+xU5cTSAVdIVx0yITZYJnN5eSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/sOccez; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/sOccez"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bcbb82dbadso160359e87.2
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 18:40:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791596451; cv=none;
        d=google.com; s=arc-20260327;
        b=CO+TG3sLz2za9y20HqFJSPsGIrbMqUj1qQ0oXW0nD5nRkqt3EUsnLqGC4/qQEXZEbg
         8Vk/1xBTkhJSMzIjWmlk/quAPLT6AnUojv4o3dt8iT9dSO5iXd2TY97oQUYPvRsqbHoN
         //WXyiEW3ogAcTwlM+tFOg7afrXLMX+NiszSLVpTD2Yvw0NViJHcm/ffPATwFbm7X4IL
         3lf2NIVh2NraoEcWbY2Q9ZqAKZISxd3+AwnwYgI/773KB8ADV1wPBUcZ6gPl5ZMeJgqq
         2hlynrkVmpDWLg7Fci4eF+wEIiyfxrDheRzyNOo1ZkF16YkyYBD8jr2Hg+HOxS9ZrBhZ
         n7mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=P9I9jEru7z33DVV4H8bL0xlg/En68kLgOq9/vrn0XsQ=;
        fh=HRctQm9f1xbuecoh8Pebxv0NyqcXwvqg9IQ3GVzFSdY=;
        b=iGU4P8ROn1pFiJ9PNHTxg0oVQQgeVrCVaai2axo6VqIMfIuUmS6AAbZNQvzewo1m98
         k7v6B3txzJ4jltGIHDUCLNpWKIBDmM36Ow1jp0/HWtokkONWCcDMY9QzMtpqQ+IMwMfD
         twyf7OHH23AXS/VvnrpiFaT5jGFk8td+FvqXp/rB1IEWX9LPW8MafM9I/1VGWkfj6+cR
         UcnbwCBx/oWWy1PkuyFVYnmWj3tHniRgSwrEpLtGzl6VU/wS/MIDnePt4e0gIHIOGYvs
         FLGrQAVebSYIeYshI+/+nVRAj5M00X4dWoGU+aw1M9DihIvhk9a6ZJzHTCsazEAVKRMq
         EZ/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791596451; x=1792201251; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P9I9jEru7z33DVV4H8bL0xlg/En68kLgOq9/vrn0XsQ=;
        b=F/sOccezD/1MzYMPvqWGchmgKpcKF0CBWVKeoS7C/BdY1ok/4R4vg79+DqOajbte2m
         kVxNyA1BwC19UlY+MVaRXLMoCiyrc0psRVzE1x+appXOb47iioAvsayTPPE+wJD7qSaQ
         fnLQsf3vnfmMpVbwNSUGHHVyZV4dG+DopwNuSgsHW4kDumwA6Y4v0sSwcwFmzluMNNEc
         PCUTCv49stLExYi72RzG1Rvii9Lau5lXcPDtw/A8mFHl9zNOCYh1xzJWWdqjSJ51+u1q
         VnMko7Ybr9nZtnXOkn12xkDsj1dUmUCrnJqoMBGen8TohtbGJj5p9IgWbEjyhHfs22q+
         7rhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596451; x=1792201251;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P9I9jEru7z33DVV4H8bL0xlg/En68kLgOq9/vrn0XsQ=;
        b=FBazztzH8hgR1Zv7WAPpqAbgWwRJgjafkVGBLUqPz6PZBg5H9oTPUrrrW6zt4XxMMT
         L8z5/p9oRWerg9y+fJdjzU2IVISWqVqevF7I6MwetkgaqzhMiBbm+09ci9yaB/QzLhbr
         5L/FM87Au/+ZBWa4HkUwDIKKPl2mFAOKAKkeJlNDWYqczDCMBwBCOE7nUfOI1RpiPBPX
         7oaG7MlcXehwzzdE097bNCw45BteVElYD72qHJZrGNfFU6fcxYWxLNuhH/zXs1qPe4Mf
         yImLB94WPxrSbpnyWPEsgc5q9PspUYxTR5CJvhsyI19CEJEjvUsPQzmBZF+R0ar9DK2h
         dSDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTDf/md7IK0IJvleTxzIvRGmLzpodZV813ibfYNnlp0FNN+DcC9qVfzQvWz3d+CTxA7VujZxpZzkDyWA==@vger.kernel.org
X-Gm-Message-State: AFq9FYK2RG56Lcw9WClZmh5tXxJ4SHX6TcW/oODpUqbv4pG5v5kXVWJ9
	AJg8GklnOCdr51f3+G6trtdv7d5JAIhS2v1sqBQbMwc+pEI+5lkMRKaljPlTMMNW7C4KluQXR+n
	nfxwUsMr+gWE0KnG3jWOGkMjSJ4ujZcQ=
X-Gm-Gg: AYBFou3FBv75fI21mFSmKc5fafP2MD9eBuD8mgBxNVvRYbtfTE1IGjvUjlhT3kzXcpE
	aNKIEXtcJvqL2ax9MfmWbLMJ93Qe6//wDxAPUvV+I4K8U10Lbg00DZKPd2hxaFXDhqN2WmIvucu
	SsddQStesQSbWJrSlgpxEOB2Cs7JbJGEzsndEtuMZe5mt8k8FtHZBNOEhrInCEaPL+CvgAsM5kN
	CAHF6nMPAxs6rfvN7SQXvDWl1R1LAMor/7IoIrLM408AWu+2acm5fuTqSIGgnt4Z1trBHM9STsY
	2Fc3IpWLvogTkQ3AZ3nNvGqUP1rjfKDKGZKGr7cyeI9xS4gtHhG+biPkSfaU+VqA26DVKyrkeho
	N2kiV2P1q8o6hpdXiDcK3lpYSwMPRWYY3yJSMcG/lRuy1yEmw2MeKHXTYnEbXLlD96+nxMXs=
X-Received: by 2002:a05:6512:2399:b0:5b8:f59c:dba3 with SMTP id
 2adb3069b0e04-5bcde8bc89dmr1125385e87.35.1791596450694; Fri, 09 Oct 2026
 18:40:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009115627.969047-1-linmag7@gmail.com> <20261009115627.969047-6-linmag7@gmail.com>
In-Reply-To: <20261009115627.969047-6-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:40:37 -0400
X-Gm-Features: AclHuK96QFXn59Dytod4ItuEQL7Xrad0iEBKrBEPVvoPQYB56CGwDVZXR7SW2Fc
Message-ID: <CAEdQ38EGE3sq07jLUv4C0q2-wbc3xAFj4JOkVWiU3G0FgUW-Kw@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] alpha: decode Clipper environmental events and
 retain Tsunami console logs
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 9, 2026, Magnus Lindholm wrote:
> +static const char * const CLIPPER_EnvQW5DOOR[] = {
> + "",
> + "Set = System CPU door is open",
> + "Set = System Fan door is open",
> + "Set = System PCI door is open",

The "Set = " looks like it came along from the table in the manual.
"System CPU door is open" reads better in a log.

> + if (!(status & MCHK_DISPOSITION_REPORT))
> + return MCHK_DISPOSITION_DISMISS;

An event with no fault bit set is dropped, so a recovery (door closed,
supply back) is silent unless some other fault bit is still set. If I
read your cover letter right, the "enabled again" report in the PSU test
was only printed because SMIR bit 0 stayed set. Is that intended? I
think I would want to see the recovery.

> +void __init
> +tsunami_init_pci(void)
> +{
> + size_t i;
> +
> + for (i = 0; i < ARRAY_SIZE(el_tsunami_annotations); i++)
> + cdl_register_subpacket_annotation(&el_tsunami_annotations[i]);
> + cdl_register_subpacket_handler(&tsunami_subpacket_handler);
> + ev6_register_error_handlers();
> + cdl_check_console_data_log();
> + common_init_pci();
> +}

Two things here.

cdl_check_console_data_log() follows console_data_log_pa from the HWRPB
on every Tsunami board now, and this has run on an ES40 only. It is fine
on QEMU's clipper, which I booted, but there the log is empty. I do not
know what older DS10, DS20 or XP1000 firmware leaves in that field, and
a bad pointer would mean a crash during boot. Can anyone on the list try
it on one of those?

It is also odd to have the PCI init hook in the error file. Titan has
titan_register_error_handlers() in err_titan.c and leaves the init_pci
hook in sys_titan.c, which calls cdl_check_console_data_log() itself.
The same split would work here.

The table sizes all match their masks, and the subpacket length checks
look right to me.
