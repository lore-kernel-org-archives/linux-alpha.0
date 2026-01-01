Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6AE45C0B
	for <linux-alpha@vger.kernel.org>; Thu,  1 Jan 2026 05:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767246215; cv=none; b=CBWe6rDVhmhRzuBUYmXuZGvgrAmHNhbHMmWOwQOQeG8ObNEJqIw5x9QiiQveZVu4yyy9DOwOTe0U1jQ8ZgeOQCnJWLrg2KtsXbgVoq8tbMoYVyb08Ir5W+vQSSaXufXFqHHyIyvTSF9Zr3UrD5j6fQQWFCJYLAUdDgbQ6ujA5xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767246215; c=relaxed/simple;
	bh=zqVpYWQdHro+3wRtiOZg0xhuqehIzGXgU+1aXUuukAg=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=H6iAsRo36Fp4cHyetwMtB1VAXzS/715VlM5Q5/mYzJn7lIodWNQdZnWi1Sx7/7Cfb4yPpf/zZpSQO8oYRkktMlqpr0/5yvGbgHlSb4KhbKC9UoV+qQ7y+Mgshtt3Pdt+0hFdnjhcfyUfocmD6IHCnDAkLFXsnZd0yGOJJhwGuTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMZeEfKN; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMZeEfKN"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-55b4dafb425so7750467e0c.1
        for <linux-alpha@vger.kernel.org>; Wed, 31 Dec 2025 21:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767246212; x=1767851012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ndBc6CJ1CpfHe+6bNbyAqigINCzeTpSLc2ByqKZUc4=;
        b=AMZeEfKN2JuHC1nt73hxI/qaNsdvy8CRSEpQo9TqHE9giARPKQbPIobicuRw33ykDc
         Lp5iU/KlPJhbLhZigOtdrlG/6FFbyXlHjZVegMg/0RlvBTvXM8Y09JTHBKejJr1uWB/3
         CrRY5yA6MTxwrJPKPMB9CvhWL2/Cw3Wi9DTpsNjhzZ++q55yoXs/GbgUWb+kp7THG/5Q
         q83GPcIqbhwg73CuipQraCgZ+YEj4D23YIbuj5KaSN0lG2xiQ8T33nfTOQCsR4WFx59n
         xcuGW89USW7Kd293fYXMngPhIQXP6U70tIGjWM76ejUPpmrAnaic49ZUrKa7tbrwSY+D
         Ftow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767246212; x=1767851012;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ndBc6CJ1CpfHe+6bNbyAqigINCzeTpSLc2ByqKZUc4=;
        b=Qr26691NWys1wOjOl7znyjTkwE4E4jMiZFOkVTtimLztwgRxr9MGsXHKu4ALCAl26p
         ooZUI3q7MKrwdbyt2ZziAmyDXYgXn2Dkv/q1S2B0Mkt6j63ddyDpTc64cWZwmSuusQOB
         mSk8jUYTMFB5TyJnIwVy8U3313tB5Ccf+tp3tfbJNUTawy3v3D9YN4ADKgzi08nUk4gW
         5izabUw0Y6egDtt57VEagFTBG4jcf0SaC2mi3KFdYqqqWiLozhnQLyJ1CWH2Y4GvA6FB
         IMMlubGBaa0S7dWH7jvx4a2koQ6sKs90WBtWE4S6//xKZvdAp68+Z6f12gdM2gw0nDK8
         oQ7A==
X-Forwarded-Encrypted: i=1; AJvYcCVUhc/XofM7BEg7QTG0PFCjoDU3ksiTLroeCXPoUxFMRu6s5rRLTdzeNV//VNrekypR526lNHKrFCkA7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDHFT8ESzGMAVVJDwaWXrtsc57P9qaW/xy08M7KBUYLlmfeB7z
	MHTIUbd53Y3S3unvQFNhuq9nVwPjb8aRaEj6EmdOF0xuf7rQk1Xo81i3Uk742w==
X-Gm-Gg: AY/fxX7WIT57Rn/qBUBFU2EM8rFFXqNRybJBhHgeGGVV1A3GkBJ3Lhv4VSxFqGkJ8dd
	4Vxz1f/AAzAgLD1rVgUOjQ1Kf2yqvNhIsHSv+XU0UEj7iTlwHAOJU+GzXjRS35LIM2VEo509d+x
	Q1cqRR/w+7uDQ/xI09LK5JjlEJ+shvok36OYK4wvkOSWp9Du6Fw32dWpCH4mJdxMmKJlPVK+sR3
	Y+EgsY5X+WibG7nK5khygyihQM/zRK4Xsjy7jd3nPORL4T6HUixyqcLTLbSkCSsAq0yc/dzphAZ
	RBhSUMKlX1qL+VRfnJhzZheFrEzs0Tu5DfnEyBbguBqOzk1na9zNXm7H7LgIJprTLmFZUwXLT5D
	nhjHT/3fyMMg/b0CzsKc6VYP4h7A7hrP7FOzJ2JgxBBuQrB+wWErMHjvK6sqhZvStSAKVpONsh9
	oHYzf7Q8Ex4yI4h85IyrgnTZCsEAvUFxde/ajPLIkNS7RICOpUt7qoxusv+xhCeTD7Okw=
X-Google-Smtp-Source: AGHT+IGPae3Q8jZNEse2CMCocxuwZFX5WX9+VfZ7NrPzlgaKICCczFjJjW7e1gwGah3gbqw68yccoA==
X-Received: by 2002:a17:902:ecc5:b0:2a0:e7e0:1d31 with SMTP id d9443c01a7336-2a2caab9181mr464445655ad.11.1767240030084;
        Wed, 31 Dec 2025 20:00:30 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c65d66sm334482605ad.20.2025.12.31.20.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 20:00:29 -0800 (PST)
Date: Thu, 01 Jan 2026 13:00:12 +0900 (JST)
Message-Id: <20260101.130012.2122315449079707392.fujita.tomonori@gmail.com>
To: fujita.tomonori@gmail.com
Cc: aliceryhl@google.com, lyude@redhat.com, a.hindborg@kernel.org,
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
In-Reply-To: <20260101.111123.1233018024195968460.fujita.tomonori@gmail.com>
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
	<20251231-rwonce-v1-4-702a10b85278@google.com>
	<20260101.111123.1233018024195968460.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 01 Jan 2026 11:11:23 +0900 (JST)
FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:

> On Wed, 31 Dec 2025 12:22:28 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
>> Using `READ_ONCE` is the correct way to read the `node.expires` field.
>> 
>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>> ---
>>  rust/kernel/time/hrtimer.rs | 8 +++-----
>>  1 file changed, 3 insertions(+), 5 deletions(-)
>> 
>> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>> index 856d2d929a00892dc8eaec63cebdf547817953d3..e2b7a26f8aade972356c3eb5f6489bcda3e2e849 100644
>> --- a/rust/kernel/time/hrtimer.rs
>> +++ b/rust/kernel/time/hrtimer.rs
>> @@ -239,11 +239,9 @@ pub fn expires(&self) -> HrTimerInstant<T>
>>          // - Timers cannot have negative ktime_t values as their expiration time.
>>          // - There's no actual locking here, a racy read is fine and expected
>>          unsafe {
>> -            Instant::from_ktime(
>> -                // This `read_volatile` is intended to correspond to a READ_ONCE call.
>> -                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
>> -                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
>> -            )
>> +            Instant::from_ktime(kernel::sync::READ_ONCE(
>> +                &raw const (*c_timer_ptr).node.expires,
>> +            ))
>>          }
> 
> Do we actually need READ_ONCE() here? I'm not sure but would it be
> better to call the C-side API?
> 
> diff --git a/rust/helpers/time.c b/rust/helpers/time.c
> index 67a36ccc3ec4..73162dea2a29 100644
> --- a/rust/helpers/time.c
> +++ b/rust/helpers/time.c
> @@ -2,6 +2,7 @@
>  
>  #include <linux/delay.h>
>  #include <linux/ktime.h>
> +#include <linux/hrtimer.h>
>  #include <linux/timekeeping.h>
>  
>  void rust_helper_fsleep(unsigned long usecs)
> @@ -38,3 +39,8 @@ void rust_helper_udelay(unsigned long usec)
>  {
>  	udelay(usec);
>  }
> +
> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
> +{
> +	return timer->node.expires;
> +}

Sorry, of course this should be:

+__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
+{
+	return hrtimer_get_expires(timer);
+}

> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index 856d2d929a00..61e656a65216 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -237,14 +237,7 @@ pub fn expires(&self) -> HrTimerInstant<T>
>  
>          // SAFETY:
>          // - Timers cannot have negative ktime_t values as their expiration time.
> -        // - There's no actual locking here, a racy read is fine and expected
> -        unsafe {
> -            Instant::from_ktime(
> -                // This `read_volatile` is intended to correspond to a READ_ONCE call.
> -                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
> -                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
> -            )
> -        }
> +        unsafe { Instant::from_ktime(bindings::hrtimer_get_expires(c_timer_ptr)) }
>      }
>  }
>  
> 
