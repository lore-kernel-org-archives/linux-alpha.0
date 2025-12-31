Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08449322DD6
	for <linux-alpha@vger.kernel.org>; Wed, 31 Dec 2025 12:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767183764; cv=none; b=rTsHhFhuMN4Omv1Br1pNAdgvrCYiybPw33SMNs9LvwduQJscSK3dnnlwSYoZIRaa43yHfuimvphm0C3VbllArmgSRM9ddEWSnUsLc4pQg5yWzJqUr0vTilO61bh1UsBC5O5391x1GH1ltExvk/RzC/UGnPF2B/KKR5xsFbPahQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767183764; c=relaxed/simple;
	bh=f+ElsItk3DSISt1bsxPjTx60qDfLwGd+MdLyPyzjyQI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KUhYlY1V5cZzpY/BgawbdC3Xc9xlOntbtfLu1iYUzAkDq+u9ZR2RRzylOWcHD/kaljYD48IEbUP8bW2Jo9V8enQ79OqNb/gtYterflO8a5qJK111q8IHxxiIE5pPuih5nkwL/hS3xFPAhpMKfCQ918fA/ziGYowq2SHpwgT8eJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BU9WJOai; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BU9WJOai"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b79ff60ed8eso1358503666b.0
        for <linux-alpha@vger.kernel.org>; Wed, 31 Dec 2025 04:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767183760; x=1767788560; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=m0aSDGMKyT+fMQNL6kGw597IXO3k2kPPSUGq+qvudkw=;
        b=BU9WJOaitrVt6PfvkjkWkxeV1Lf+qreGMVZh3tOZ2Nd+mvgYwxGYyJIf+TLnmMn6n2
         XtzQFi26YaG5INjCjj5ODjFcSHzIbYfoPFFiHJqXqV1S2vtvENmKEioHO9R9AtJAnzBt
         yeid0ul802VnCPE+G/JB/9ufpPI0tl3gEhV2KAU4nh6YEXKbf+0kXXAm74vyIZdBgvn7
         0CYWDQCdh4DM1zEAQbQKY/mbrBWr7HGnwOpN4nLWMggkll1pPl4rVYV4FADDqzkK32ru
         wOTicV7IPGTmZyJt8pNOY+z53eeN6LbwGB0WjXzH3DklXBDQC2xgnmLNRpVJX+lxlWRb
         9tJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767183760; x=1767788560;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m0aSDGMKyT+fMQNL6kGw597IXO3k2kPPSUGq+qvudkw=;
        b=xUmi3x4/xF0Ng1hC53J0NvXpTx+3y2yF12EjidzuTAwzd6Su0V3+EIKl3AAtifAmzf
         BbpKpvDz1m+7u73cvFud+yBFzZ3Lq+kPMfNimdTxhoQXOQ0cj93mww0yxBrQh0BP2JBu
         iccoBmQlV7dz1BKr72DXpJ7aMxt1j8c66RJf2UQBg899kJj9qh4xbtMRIKiyGLQ1yMKN
         2usU4F+YKDVQncsnKkw0JX77Nk94ftTwOJMwDdQeh+oua8d3nSXn7MPNQ45VrmvRaXqa
         3l2W38YBx24IGiuevH0/9roSIyOvMyAXnHeMpe/jpgcXqUDGu7J1zj3Jj0EPhTFqraH+
         Uu/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3uG5lQyujqM8aXL8qztuw7H9B7Ag+z4HIJ/gbC9mJx0u+XH6QZQkX7AkROXecbitThXhx/5jR7e4gdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5zlOO4bQG9EVuq1Q43rgMlr7Rn0Xz/Tbb6uPPfTGNtJk6JbIy
	/oLURBy6N0vLXHLAQBQvZIle6URUoOZ0CWxYxiR43q1IZmIuytpG4iHtvcbxCBms02mX4X3wkAw
	APtRsneuQ0/uykSgssg==
X-Google-Smtp-Source: AGHT+IF6QCK61/Taq0LVCEy6u2Lh/f9qkwECTfyeXwyFZObuLicNLjWSsvwiJ+SkeSLRWE4V1R+yhLQS/6l+gLk=
X-Received: from ejbva10.prod.google.com ([2002:a17:907:11ca:b0:b73:7b14:6671])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:c10a:b0:b83:972c:7862 with SMTP id a640c23a62f3a-b83972c7a78mr466276466b.45.1767183760503;
 Wed, 31 Dec 2025 04:22:40 -0800 (PST)
Date: Wed, 31 Dec 2025 12:22:27 +0000
In-Reply-To: <20251231-rwonce-v1-0-702a10b85278@google.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2011; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=f+ElsItk3DSISt1bsxPjTx60qDfLwGd+MdLyPyzjyQI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpVRWL4oDnxIVIQOubpJwcZRLcyzDfMlz7wIFAM
 FONlx/oCYKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVUViwAKCRAEWL7uWMY5
 RmH6D/46KKFKWvICb3h6YXEsXSSffucVzMDtCNxV/nON8HqUTVC9QRwy+QA5BR0hrfvViIl1dKx
 QFW5mE6zsjqHKs9m3qdyng4MUI8hLxBMk3ZddZ5++5KMoowDj7M9YW79F70Q5JL8cPNiGTxEn8T
 VOpmnKD0W0uqGzPVPn23nyrMXrCuGOSOlv1Gd7VlP14rVqitTFZNDbO/h3Jxy6lNTukLQ+koVaY
 IfTia3CyF5IhIS2g511uFdNOICKH6TDOYX8thm7ndly6HHx+6ARDy7WILR47BIDGvXOQdbt1kLi
 V6/5WiEP3hVfSFSXEsvYYHcIWFmsvvPJOUUlHKqLTHmMiG5YzhOcIMdWR2xCLaCeAb147Thitc8
 +Ze9StLM0Z7stUstGbYjIUZFQ+V4Rndjy2ocRJH5Ed52rnZN9G1Iy0NTMogqlQ8hkUiNoISzYer
 7JORef2rWkONYm1I2EyDd+XsVaBfYDD7SBf7gj1LjEzjn/cJZqNNetKASeZnYDGe8oD8X/hfN41
 /K11v2L2aZsQ/aZx/TvPkBaD5UlBxpRXYfQLDLE0Xgz2TNev4vNJ6gzjLvwaHsk+5wi29msQ69Q
 ZqqGYocGcZHMGcf7aalYz96ESMDQx6plGafNctmZtxnbAR6RDeb4Gt0M3Bf/FonllPV4dkLOmiO +fYoPkvnNt3oL+w==
X-Mailer: b4 0.14.2
Message-ID: <20251231-rwonce-v1-3-702a10b85278@google.com>
Subject: [PATCH 3/5] rust: sync: support using bool with READ_ONCE
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Normally it is undefined behavior for a bool to take any value other
than 0 or 1. However, in the case of READ_ONCE(some_bool) is used, this
UB seems dangerous and unnecessary. I can easily imagine some Rust code
that looks like this:

	if READ_ONCE(&raw const (*my_c_struct).my_bool_field) {
	    ...
	}

And by making an analogy to what the equivalent C code is, anyone
writing this probably just meant to treat any non-zero value as true.

For WRITE_ONCE no special logic is required.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/sync/rwonce.rs | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/rust/kernel/sync/rwonce.rs b/rust/kernel/sync/rwonce.rs
index a1660e43c9ef94011812d1816713cf031a73de1d..73477f53131926996614df573b2d50fff98e624f 100644
--- a/rust/kernel/sync/rwonce.rs
+++ b/rust/kernel/sync/rwonce.rs
@@ -163,6 +163,7 @@ unsafe fn write_once(ptr: *mut Self, val: Self) {
 // sizes, so picking the wrong helper should lead to a build error.
 
 impl_rw_once_type! {
+    bool, read_once_bool, write_once_1;
     u8,   read_once_1, write_once_1;
     i8,   read_once_1, write_once_1;
     u16,  read_once_2, write_once_2;
@@ -186,3 +187,21 @@ unsafe fn write_once(ptr: *mut Self, val: Self) {
     usize, read_once_8, write_once_8;
     isize, read_once_8, write_once_8;
 }
+
+/// Read an integer as a boolean once.
+///
+/// Returns `true` if the value behind the pointer is non-zero. Otherwise returns `false`.
+///
+/// # Safety
+///
+/// It must be safe to `READ_ONCE` the `ptr` with type `u8`.
+#[inline(always)]
+#[track_caller]
+unsafe fn read_once_bool(ptr: *const bool) -> bool {
+    // Implement `read_once_bool` in terms of `read_once_1`. The arch-specific logic is inside
+    // of `read_once_1`.
+    //
+    // SAFETY: It is safe to `READ_ONCE` the `ptr` with type `u8`.
+    let byte = unsafe { read_once_1(ptr.cast::<u8>()) };
+    byte != 0u8
+}

-- 
2.52.0.351.gbe84eed79e-goog

