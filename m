Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754C33126A3
	for <linux-alpha@vger.kernel.org>; Tue,  6 Jan 2026 15:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767712312; cv=none; b=G0T3YSGgBqBLSqiFyXE08xaYs3HqnGXYxY1SfwcEnjw6Fop1221M87EgMg+dkZYn8nNJzbEuDaGqCGxtAnzcKg4JY+f51ikBP2FOtn24qXrEVeH8BEhoRZMSxeXCABwWeYCM7262o76cBiaYskrijElpBu/gXvmceUyJcGcC71I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767712312; c=relaxed/simple;
	bh=25iRmSFuwL+D8roq4uypOGpDklg8NTNbR1SXb2hshR4=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=nM4nTaeen98PcIYiKy+lpfY5lErNBI1G6TRVkHOCW1ksXCTLyfL5rn/0obo8Q3pn7pTeaIE2CVTV5BGXdT+y34N8fcOt8lnHqU7dvVE/GfPZRNJ4eOni77BUN4ZEPf2b8Tx1JF4DoHwpRKei9m2DNzRRy4MudTxy+Csay+qmLbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQWK8dXl; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQWK8dXl"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-45391956bfcso821117b6e.3
        for <linux-alpha@vger.kernel.org>; Tue, 06 Jan 2026 07:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767712309; x=1768317109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hKsffwDmTb+4r5jC/ROuThttSG8MjIGG/prpPNSIElc=;
        b=dQWK8dXljT7rAgrSZyG5us29SXvO2rsi28yA3vzwwiPxs7OmgpZ7UiVHEcNRhSKRu+
         mnmiMHjASqWKrttJ96A4DLPAxlxkgWrq4CtT6bbaad4ZKhEpPpOIu9sOQ7+eQ9Ois9BY
         GSLVS6Zc39qG7amDlpbgDz5RSIaKXZKkbSDQwsB11III1tbu791D1Hn6M0s22q4Fn9yN
         rIYNu1yx7FYoPzzmZFI/a/5rMvY4ccOph1VVo7IB4hJtFrEObxK57B5khLdKwvoLoULS
         LtVnGSS+7M1v+Q6ZRPCIWhYPsneXcheaaokbz0Rn0lCEstY9DnHpExcZeC6U7RNeKSjy
         o6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767712309; x=1768317109;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hKsffwDmTb+4r5jC/ROuThttSG8MjIGG/prpPNSIElc=;
        b=aQq4OVD+w8kmCzlrlz6ZZu1ZmUIArcf4Ltl9wHQkUVw8DPUbIfXaTKE2ieJRZBztxK
         ZU8TG/iy3Thk0HBq6SSW49rRxoHqqTGDYfKxIRCrHm5vllxfSPprU/5mxMA+OfTkMvB0
         RVAdVw2p+M5mmPm11kOO+8iT8vHf1Sw53IgZhpyGMILYZ38SiZS3IcnB2G/RWL4BKnTd
         r9tdNB8d59i/EmcxQFMWDSyGeMESgRryoYggPAPHJUWIVjsxG3bc1Ar9/BB3CcJJKWFv
         W1p8nlTN8iC3TcjkIm6ZHCDq4vwahjpCs6cSUg8JMx3RkkyW3VsiBRcCVjhdvlyI+Y5i
         Mv6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWd2bkrzMaKTqev3NIP///TKK0SlLBrefsxxLnbfSDg03leInkm+TR4r08O/qHHS7mkzkGJHWtr60OV5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzqVX33cKNi7lTaVS3LXfr81Wk5KyntpD6yPgWTC/bYuoNRTH5
	Yfs2Ni+VeNl+WUtYWP+p45oh7CdxkhV/H1VkUcg/YDWY/dlxXduLbcEPoHzaYA==
X-Gm-Gg: AY/fxX4eh7c5lSNBZXGuQnLdIiFShwMTErY1rBjBtEgOTZj8OD5Z+nG57L+SbdobRi2
	0mJn8LdUs52pJY/GfgYAz/+/CLkETVIacK+wj06z/nI946b7uTBicLnUhpMYFKdTDTNdZh1r/zU
	oJWbH0aRMj8i0LAXc8I4oaFJGBO+9XyvbdkZdWjPQnryD2jNStGUN4BNe1wGVRT7+69J2BkSaB1
	+v6Gr8O+IV7PWQnZ6ez1eIaVO8n6o203yNxpfzIfp92ICdukzp4iRp0B3XcJ3bcvpnVa6sZeKE7
	AESIqDcNkmo7CBrgNvnNOqiUAt0v/qkewCyUXymoY13gAid48G7W0tAxxfIg3dMboyWkhXI0rYn
	2Z8Tn1UffER8CQ+zt4Wy4cRmtXgRI911rk+Ga3K0FlMwr1HOSumd+ssLFusjcSX+cLGR2Bo23hG
	M+Tfcu18T25JhEM/yAQkYBgrtN+yyunIQpynnjtL5eNDtuhfrCMr3nwIhejveYYweKXGo=
X-Google-Smtp-Source: AGHT+IH/kVjMXJLsPqWXcn8kSZ3ELVQYHHdFG6UtOJC68eA3mthYgJwMef8DW8mEX3Opv7mL8wv7Fw==
X-Received: by 2002:a17:90a:c888:b0:32e:5d87:8abc with SMTP id 98e67ed59e1d1-34f5f35d5e2mr2098780a91.36.1767706121439;
        Tue, 06 Jan 2026 05:28:41 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7b19ebsm2356135a91.3.2026.01.06.05.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 05:28:41 -0800 (PST)
Date: Tue, 06 Jan 2026 22:28:26 +0900 (JST)
Message-Id: <20260106.222826.2155269977755242640.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org
Cc: fujita.tomonori@gmail.com, aliceryhl@google.com, lyude@redhat.com,
 boqun.feng@gmail.com, will@kernel.org, peterz@infradead.org,
 richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com,
 catalin.marinas@arm.com, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu,
 dakr@kernel.org, mark.rutland@arm.com, frederic@kernel.org,
 tglx@linutronix.de, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org, viro@zeniv.linux.org.uk, brauner@kernel.org,
 jack@suse.cz, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 4/5] rust: hrtimer: use READ_ONCE instead of
 read_volatile
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <87ikdej4s1.fsf@t14s.mail-host-address-is-not-set>
References: <L2dmGLLYJbusZn9axfRubM0hIOSTuny2cW3uyUhOVGvck7lQxTzDe0Xxf8Hw2cLxICT8kdmNAE74e-LV7YrReg==@protonmail.internalid>
	<20260101.130012.2122315449079707392.fujita.tomonori@gmail.com>
	<87ikdej4s1.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 06 Jan 2026 13:37:34 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
> 
>> On Thu, 01 Jan 2026 11:11:23 +0900 (JST)
>> FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
>>
>>> On Wed, 31 Dec 2025 12:22:28 +0000
>>> Alice Ryhl <aliceryhl@google.com> wrote:
>>>
>>>> Using `READ_ONCE` is the correct way to read the `node.expires` field.
>>>>
>>>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>>>> ---
>>>>  rust/kernel/time/hrtimer.rs | 8 +++-----
>>>>  1 file changed, 3 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>>>> index 856d2d929a00892dc8eaec63cebdf547817953d3..e2b7a26f8aade972356c3eb5f6489bcda3e2e849 100644
>>>> --- a/rust/kernel/time/hrtimer.rs
>>>> +++ b/rust/kernel/time/hrtimer.rs
>>>> @@ -239,11 +239,9 @@ pub fn expires(&self) -> HrTimerInstant<T>
>>>>          // - Timers cannot have negative ktime_t values as their expiration time.
>>>>          // - There's no actual locking here, a racy read is fine and expected
>>>>          unsafe {
>>>> -            Instant::from_ktime(
>>>> -                // This `read_volatile` is intended to correspond to a READ_ONCE call.
>>>> -                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
>>>> -                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
>>>> -            )
>>>> +            Instant::from_ktime(kernel::sync::READ_ONCE(
>>>> +                &raw const (*c_timer_ptr).node.expires,
>>>> +            ))
>>>>          }
>>>
>>> Do we actually need READ_ONCE() here? I'm not sure but would it be
>>> better to call the C-side API?
>>>
>>> diff --git a/rust/helpers/time.c b/rust/helpers/time.c
>>> index 67a36ccc3ec4..73162dea2a29 100644
>>> --- a/rust/helpers/time.c
>>> +++ b/rust/helpers/time.c
>>> @@ -2,6 +2,7 @@
>>>
>>>  #include <linux/delay.h>
>>>  #include <linux/ktime.h>
>>> +#include <linux/hrtimer.h>
>>>  #include <linux/timekeeping.h>
>>>
>>>  void rust_helper_fsleep(unsigned long usecs)
>>> @@ -38,3 +39,8 @@ void rust_helper_udelay(unsigned long usec)
>>>  {
>>>  	udelay(usec);
>>>  }
>>> +
>>> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
>>> +{
>>> +	return timer->node.expires;
>>> +}
>>
>> Sorry, of course this should be:
>>
>> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
>> +{
>> +	return hrtimer_get_expires(timer);
>> +}
>>
> 
> This is a potentially racy read. As far as I recall, we determined that
> using read_once is the proper way to handle the situation.
> 
> I do not think it makes a difference that the read is done by C code.

What does "racy read" mean here?

The C side doesn't use WRITE_ONCE() or READ_ONCE for node.expires. How
would using READ_ONCE() on the Rust side make a difference?

