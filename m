Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C59326958
	for <linux-alpha@vger.kernel.org>; Wed,  7 Jan 2026 13:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767791654; cv=none; b=T2ywjquRr/xVw25QcE9Q5VNBz7D04qeAptVAqd9I1ebZltoUhmgjrllK0SLY4uCexQ9E0Di5SB4Meo+3r5piAQRiDr/y8Ppj15qvor+4ShdBOO7cAfeWpS1l9vVvPl+9TjqkS+1SdeDve5MpUR9+vuWvBmd14rIPzqo6v4eDxwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767791654; c=relaxed/simple;
	bh=bWSVV22jZh9coEv3ULigZXfiCNuesnPGhW14yA08Rbs=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=iAT+j88dL7SIBIo0zlOIP6VwqHQWp5SwJqcLuwcllHsQne0P2UNWOjOCU6EIXmyt5oHJecwVHOQV5lLxHQa8uRwXeNeS+dMHgUEBNgGHfmtkv64K9eNhpvH22ScLAylmhZeH2nZCY54y1FIKBEtvmqfWmzkNUA2n80/P05DID/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZU/ebEwH; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZU/ebEwH"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4ffa95fc5f1so17162751cf.3
        for <linux-alpha@vger.kernel.org>; Wed, 07 Jan 2026 05:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767791651; x=1768396451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVyX/saFSHkwOAT/HfR9J/XxoKvZtdkuCzZLxL4WCSA=;
        b=ZU/ebEwH56Lg1sfaxGbtuHoXLvSQmXkaOEvM98hGjXSlwDcyOPOe4VobvRSEXllB2a
         R4xLybdutoZjQJSluHLaKawx9LZHO9nq4IV9Lkvk7HJRmcOF3YYKzXIin8q7+fSnlttg
         sWU7YOkqKLsxNiKBOLcIWhg2xcFYfvzL3a3sQXAij4kfC4A5wBaMvOD5JmAlp6VZnBW/
         9LKmagmSB5Auwkpz5avOKvGk48uZcyw15rgcLDRsYR5ZlcUtz3dYz5BH2d/6HP0ysuvn
         JnaL//GjqxGVwE2APDbVHVYaa/jCRiam3j0bT/QiqioJrW2R2B0tGR+0huyoeUJNlkBo
         IJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767791651; x=1768396451;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVyX/saFSHkwOAT/HfR9J/XxoKvZtdkuCzZLxL4WCSA=;
        b=V1gelDD1u6E5jlPlfLnyUHq0dBGS8DWUJ3ztidCrU5k9BX8xIJgLdulhX186RAAjaH
         jroWQJZeO+0ZiXDhj3FEuWhHEuZaxDgAMumtltjQG46NRRgcrGEw75JuytWYaQaY6X7o
         ycg3dAmJlr5m8KhDRsEScah2SKbYCPOMUzagtpDoz8MBO3ONrSZ4Ejss+Ln3cweVMBrR
         67UVRBXdE3UGoGXDmNrFLVAls6eUAiTtZUzRK7qlkpeeUlEuNlKE3BwyNX8K6gH3/THF
         xKZkZMovmWA1UJD926N1tfKrIW/KShRvqRn2jyZ3p5r82lRGLsM5MJodKmYJixGKF9Ie
         fraA==
X-Forwarded-Encrypted: i=1; AJvYcCVBUY4c6nHpyVZu43VKB/n48u0AixwKIAlzT0NKlVMoi9ouPO4GT4CEtjkbpWIw1irdI7VW4qzJsansdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd8iQVbg2GccD6LXchvEuuyHvrL7ob5vPkj2bw5vlj/IAZCt06
	yqmX7nClXCmGb5psy7NpAVQbvFpIUsUIaP5fRMtvzHu5X4uwp8m8z6wq81kX0w==
X-Gm-Gg: AY/fxX5+nndGY9bpS8Pn9LriQicIQKPLnBYavICRdPm6lZ7ph2QDz6LvD1Bj1PKOaEi
	EzfzC554GEd1TS9ngZDc7N+stqgFZYB0oBFYZ0ftWxkzBVouOwkIfhDsR91vApLLXgKic94PVVW
	2e0Pv+mFGlSimZLhKFjvihldIV+9CZEm7jaZB+bWRK5/cEFpF/RaLJ3EE0QkSwLSkU1C7z3TwZI
	AsU48CiXKQWEAkgtlp02fRR8eTqplgGOPGY0xgt2LxF4FwC+vpoKIIngcQuZ0CSMDwTsuwdFRgN
	+aJ1b+3v1fV2ie0GGVY3ZSSxqIwepbmouoms/sBaCeUg6yhUdS+7iBP4n22pUet4TdeBUA3RGWI
	ZnRod956Jc14iclVzBTA3aB8cDxUSF+P3v0WZMQZVc9czQG9oisOi+8aoG2/2TJTV0FdunrJDiV
	5nVXOKMEu9WTJFY2PqE0INhSETFWx63sVW/Omqy9mKEfEa+BUilgkIMaaVmTtwwJGUDYM=
X-Google-Smtp-Source: AGHT+IFka4564yGsxxmwys4Mn7+GTaVT5Y+gqGfi+/kEB3nv8HFKvSn2ve0Sd55L7DEx3kGPj6korQ==
X-Received: by 2002:a17:903:2291:b0:2a2:d2e8:9f25 with SMTP id d9443c01a7336-2a3ee47f0a8mr18571915ad.33.1767784973602;
        Wed, 07 Jan 2026 03:22:53 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88e3sm48170855ad.75.2026.01.07.03.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 03:22:53 -0800 (PST)
Date: Wed, 07 Jan 2026 20:22:45 +0900 (JST)
Message-Id: <20260107.202245.559061117523678561.fujita.tomonori@gmail.com>
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
In-Reply-To: <87cy3livfk.fsf@t14s.mail-host-address-is-not-set>
References: <87ikdej4s1.fsf@t14s.mail-host-address-is-not-set>
	<20260106.222826.2155269977755242640.fujita.tomonori@gmail.com>
	<87cy3livfk.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 07 Jan 2026 11:11:43 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> FUJITA Tomonori <fujita.tomonori@gmail.com> writes:
> 
>> On Tue, 06 Jan 2026 13:37:34 +0100
>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>
>>> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
>>> 
>>>> On Thu, 01 Jan 2026 11:11:23 +0900 (JST)
>>>> FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
>>>>
>>>>> On Wed, 31 Dec 2025 12:22:28 +0000
>>>>> Alice Ryhl <aliceryhl@google.com> wrote:
>>>>>
>>>>>> Using `READ_ONCE` is the correct way to read the `node.expires` field.
>>>>>>
>>>>>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>>>>>> ---
>>>>>>  rust/kernel/time/hrtimer.rs | 8 +++-----
>>>>>>  1 file changed, 3 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>>>>>> index 856d2d929a00892dc8eaec63cebdf547817953d3..e2b7a26f8aade972356c3eb5f6489bcda3e2e849 100644
>>>>>> --- a/rust/kernel/time/hrtimer.rs
>>>>>> +++ b/rust/kernel/time/hrtimer.rs
>>>>>> @@ -239,11 +239,9 @@ pub fn expires(&self) -> HrTimerInstant<T>
>>>>>>          // - Timers cannot have negative ktime_t values as their expiration time.
>>>>>>          // - There's no actual locking here, a racy read is fine and expected
>>>>>>          unsafe {
>>>>>> -            Instant::from_ktime(
>>>>>> -                // This `read_volatile` is intended to correspond to a READ_ONCE call.
>>>>>> -                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
>>>>>> -                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
>>>>>> -            )
>>>>>> +            Instant::from_ktime(kernel::sync::READ_ONCE(
>>>>>> +                &raw const (*c_timer_ptr).node.expires,
>>>>>> +            ))
>>>>>>          }
>>>>>
>>>>> Do we actually need READ_ONCE() here? I'm not sure but would it be
>>>>> better to call the C-side API?
>>>>>
>>>>> diff --git a/rust/helpers/time.c b/rust/helpers/time.c
>>>>> index 67a36ccc3ec4..73162dea2a29 100644
>>>>> --- a/rust/helpers/time.c
>>>>> +++ b/rust/helpers/time.c
>>>>> @@ -2,6 +2,7 @@
>>>>>
>>>>>  #include <linux/delay.h>
>>>>>  #include <linux/ktime.h>
>>>>> +#include <linux/hrtimer.h>
>>>>>  #include <linux/timekeeping.h>
>>>>>
>>>>>  void rust_helper_fsleep(unsigned long usecs)
>>>>> @@ -38,3 +39,8 @@ void rust_helper_udelay(unsigned long usec)
>>>>>  {
>>>>>  	udelay(usec);
>>>>>  }
>>>>> +
>>>>> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
>>>>> +{
>>>>> +	return timer->node.expires;
>>>>> +}
>>>>
>>>> Sorry, of course this should be:
>>>>
>>>> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
>>>> +{
>>>> +	return hrtimer_get_expires(timer);
>>>> +}
>>>>
>>> 
>>> This is a potentially racy read. As far as I recall, we determined that
>>> using read_once is the proper way to handle the situation.
>>> 
>>> I do not think it makes a difference that the read is done by C code.
>>
>> What does "racy read" mean here?
>>
>> The C side doesn't use WRITE_ONCE() or READ_ONCE for node.expires. How
>> would using READ_ONCE() on the Rust side make a difference?
> 
> Data races like this are UB in Rust. As far as I understand, using this
> READ_ONCE implementation or a relaxed atomic read would make the read
> well defined. I am not aware if this is only the case if all writes to
> the location from C also use atomic operations or WRITE_ONCE. @Boqun?

The C side updates node.expires without WRITE_ONCE()/atomics so a
Rust-side READ_ONCE() can still observe a torn value; I think that
this is still a data race / UB from Rust's perspective.

And since expires is 64-bit, WRITE_ONCE() on 32-bit architectures does
not inherently guarantee tear-free stores either.

I think that the expires() method should follow the same safety
requirements as raw_forward(): it should only be considered safe when
holding exclusive access to hrtimer or within the context of the timer
callback. Under those conditions, it would be fine to call C's
hrtimer_get_expires().

