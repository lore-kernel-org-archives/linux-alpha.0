Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F17822A817
	for <linux-alpha@vger.kernel.org>; Thu,  1 Jan 2026 03:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767239490; cv=none; b=IdIPj7p+Sv3mRlpV57JAaf6ntcXxXZpz9bPLEsf62ygf74U1sEV26OtXobfxcaJUZySeBneuFR44a7gz9+b68OIPpOLBv7q0N1ddcPjLu/LIPGKQEc/vwbEVgICJBr6Smsq/oGwp8nAtv5qny1sQxLJyk1uWDQXyOuj7TJUvvGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767239490; c=relaxed/simple;
	bh=/vyg0ynh5LAMEF2mj8X9Csbd5f/G8rOZ2939OPD08pY=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=SGgkI7PHE+/aBZIMvzihZzceLedXCfGq0wo85OhZbnYEX9vvj9N/YwaXEKNNlKsubpIgME4l9a0jPJ16CulV2iYxBoJTfyKBzMz61GwFzSc24AWt7u5WExg2yI4ocsOy4mZDeNPaQpSuBZcnOI+v5qTTu21r78pW2dKk+t076As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ia51ckBy; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ia51ckBy"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4f822b2df7aso50238781cf.2
        for <linux-alpha@vger.kernel.org>; Wed, 31 Dec 2025 19:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767239488; x=1767844288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHJ9HSrCP71SSn2XcU2kZVrOG3UT/v21uGWNywYBtRo=;
        b=Ia51ckByAj62NiWdWUnVek8mb7szIAS/R5UogVG5rhI4enTbF3cFd2Bilfe6ldU8Pf
         PSu3u7bJPJ9jFDnjBsjl4iQ7wyVvRseV78shHgV5Ry2smHCgaGA0xFJr5FeTV3cejGbV
         dlstNhejYEecVQYQETizVYzg3bHwG0wW9o7leLg8bVIEP3uGYK4ijTbYBV+gKkwOc0tB
         SbEQN6weceXROr3jRtKvdSVP6zHDSZIRX8RFH5c+k10eeCpDWk+JzJUEPR2tVEPvFv7v
         qn/KP2ikx/GLXu+ttJD5wGJzHJinRL4xoWffHGDs1vryAbS3SEyQ00jx97fBq87nq03D
         cKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767239488; x=1767844288;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHJ9HSrCP71SSn2XcU2kZVrOG3UT/v21uGWNywYBtRo=;
        b=uCW4oWjopMBWYhb2OSbJdifKUQ3owaKw4qV2tygnNHQ0xsjE24ga41doaUDup2g2Y9
         FrgM3265L3ao+aDqYYT2uOUC5o6jMdMUggalegkivqmbYKgOfhmNjIBQddqCsZJYleCw
         sFxVFmcuEd0QoveKJQbfBasYrWrzK42IoPVbAYMuV8TgXSX5mgs6EXV58r5+81whCcQ8
         uObEX6Loaus1d+wbcDIb1k63HxLnd3WCgObSCINLBmdyShVO9mlxf1gfrY9ddaeYswgr
         E8BLZA2yI4RrsGqdPEXH9bk664IL7uXxqPtiaGBb2ujBehGVmxldImSej30BIlp8MQWu
         QvmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6Ac6DrPrRWK1dakVFG37LwoVtWU7Vscb8HrebKkZCJtEw9QewuXsYG/1NS9x2nT76I1b3IP8CALTOhg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2l6cUBPaLxWPA6fOFkX2SNfgiLht2aTEnNl5djqUjgchGOvYQ
	4FaRqrgDGTeQWhTjRUvNltggmYJnhoW71+8tpoClxF8qpxm2cFZdl9UA
X-Gm-Gg: AY/fxX5N3Mmob4MUfZoo9z060TMzCuNobG7aAuBEUsX5N/JWPKrpxCUHAUMXFPlXfDk
	ff2VTQKM8IkfocYo0mltSRkzr0OJxKzhDkQfIJhPPtmB9wsPxZgiKzVUz0dV1xcZBse+ISzD5f6
	01dKkUEEAlo2U9d4/2zd1fnt1dQMEzCxEBnC/UiPPjizTWUsAtORvx60sE1TMTvMV4aw7bawR0Q
	Kdsim1VJg/i5kmRlmsBXRrRp7lDMDBhtE5ZOPOlOebglcNG/2UyjIPovbb8VnZqIEoXM7EdI9dy
	XQpw2hTOk04dojMRK08v2e4EOfE3j0MRNM3KpNwtU0+ZEebu2yLdhP3ekUKPAPLGRcqUYv4AefW
	ThxEeQVUL9JvuPqgTLqyWHw/Lp5942cgptr4+UpUwgG1vw6AfE6DUSd3GwpA6W+KhwSCrsQ9b2A
	mZOelOAo1y3vSEioQrNGnIoRwtdqA3lTPOkJXwvFzfL/8avT76jugRzWP9AOeAw2h+/1M=
X-Google-Smtp-Source: AGHT+IGM0rVADS2lnU5j12v/LNHM3kU8YwfTvvv4Iz7GzLiaw8hH+kvxJs1uiRf5TU0O+ftRhl7yow==
X-Received: by 2002:a17:903:b90:b0:29f:301a:f6da with SMTP id d9443c01a7336-2a2f2a34f54mr371027125ad.43.1767233502214;
        Wed, 31 Dec 2025 18:11:42 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d776c1sm334899895ad.102.2025.12.31.18.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 18:11:41 -0800 (PST)
Date: Thu, 01 Jan 2026 11:11:23 +0900 (JST)
Message-Id: <20260101.111123.1233018024195968460.fujita.tomonori@gmail.com>
To: aliceryhl@google.com, lyude@redhat.com, a.hindborg@kernel.org
Cc: boqun.feng@gmail.com, will@kernel.org, peterz@infradead.org,
 richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com,
 catalin.marinas@arm.com, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu,
 dakr@kernel.org, mark.rutland@arm.com, fujita.tomonori@gmail.com,
 frederic@kernel.org, tglx@linutronix.de, anna-maria@linutronix.de,
 jstultz@google.com, sboyd@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 4/5] rust: hrtimer: use READ_ONCE instead of
 read_volatile
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20251231-rwonce-v1-4-702a10b85278@google.com>
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
	<20251231-rwonce-v1-4-702a10b85278@google.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 31 Dec 2025 12:22:28 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> Using `READ_ONCE` is the correct way to read the `node.expires` field.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/time/hrtimer.rs | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index 856d2d929a00892dc8eaec63cebdf547817953d3..e2b7a26f8aade972356c3eb5f6489bcda3e2e849 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -239,11 +239,9 @@ pub fn expires(&self) -> HrTimerInstant<T>
>          // - Timers cannot have negative ktime_t values as their expiration time.
>          // - There's no actual locking here, a racy read is fine and expected
>          unsafe {
> -            Instant::from_ktime(
> -                // This `read_volatile` is intended to correspond to a READ_ONCE call.
> -                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
> -                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
> -            )
> +            Instant::from_ktime(kernel::sync::READ_ONCE(
> +                &raw const (*c_timer_ptr).node.expires,
> +            ))
>          }

Do we actually need READ_ONCE() here? I'm not sure but would it be
better to call the C-side API?

diff --git a/rust/helpers/time.c b/rust/helpers/time.c
index 67a36ccc3ec4..73162dea2a29 100644
--- a/rust/helpers/time.c
+++ b/rust/helpers/time.c
@@ -2,6 +2,7 @@
 
 #include <linux/delay.h>
 #include <linux/ktime.h>
+#include <linux/hrtimer.h>
 #include <linux/timekeeping.h>
 
 void rust_helper_fsleep(unsigned long usecs)
@@ -38,3 +39,8 @@ void rust_helper_udelay(unsigned long usec)
 {
 	udelay(usec);
 }
+
+__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
+{
+	return timer->node.expires;
+}
diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 856d2d929a00..61e656a65216 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -237,14 +237,7 @@ pub fn expires(&self) -> HrTimerInstant<T>
 
         // SAFETY:
         // - Timers cannot have negative ktime_t values as their expiration time.
-        // - There's no actual locking here, a racy read is fine and expected
-        unsafe {
-            Instant::from_ktime(
-                // This `read_volatile` is intended to correspond to a READ_ONCE call.
-                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
-                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
-            )
-        }
+        unsafe { Instant::from_ktime(bindings::hrtimer_get_expires(c_timer_ptr)) }
     }
 }
 
