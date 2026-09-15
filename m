Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3103C10B4
	for <linux-alpha@vger.kernel.org>; Tue, 15 Sep 2026 19:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499837; cv=none; b=KV/2OIeFmz8wub8fzyjK/ZdwhRqrfea7VOPUDJqZAtZOKBAcop51xDgFUCQgYliraqc1CwfacuBpQH/haleMLrL+ey6KiTOP9RYBYVvPOIsShsHtMnwykRfg/zyBefV7ey1T2ochAzTYQYjGxnEuohve8P6FASUWbjwHF+33muw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499837; c=relaxed/simple;
	bh=AGk4y8oFpNibhByHKIxcRS7KnQx6z20Q8VC6dFl1tNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jtAzE3d2Qp9eWLIFI0xJzW1lo8g3Q/k+jWFySqdcmwPuSlffcUBCcrWyIX3VqXWyPasXOfkupAR1l2a646JfHLplBq9UOTeyD/PdTygYrwoVdBrQ+YWmsJnrZbpz55Ai5qI9AV6EWVu5yg+CzccI2fBm1Jp1a3RU0HrqCQ0xrLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=A74F3Qaq; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="A74F3Qaq"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f15b7aso109310e87.3
        for <linux-alpha@vger.kernel.org>; Tue, 15 Sep 2026 12:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789499833; x=1790104633; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFFk9jJtDswBQpA8QWIooO6lLG4HdlvPT/LqykRjG+U=;
        b=A74F3QaqC98bgAL0vHXyLdDlERt9mODK6YzAPPdU2ue8LKn6nMr0UBSjBdD4UY+ltx
         mLzvQhqITYetfPdYoDKgEW8kCsT22oeHZA3U0knbNemIDNbrEFfaTFG79CY4o6Jia0lS
         jNYODv3PRjCa8mW+G3NwhGgt66qAfuTGkhX7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499833; x=1790104633;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XFFk9jJtDswBQpA8QWIooO6lLG4HdlvPT/LqykRjG+U=;
        b=lL2IjrzoEzFEr/lGEC9LYjXy3stgKyNktqI5ahgMUo0pZ9QUtG6fjFJ7rN5Gi5863X
         lmnHxDJ/9nqGawLAxtc3mWbtczTBRubgWAWWNR8pIKMww1uHmZUx3dalMYAIEC1KQh3b
         tRDCKaKL2dxeFPiAtISpxVdoldKzfoO+L3XKeQIbHxQ8jRtX+5D6PrbHxECOYlE+7CMb
         y9UofGhiBem4HzpiOcUI2JxK0m6vBjwZNiFHsJGxxBBJiAYPgdAEINLjTVNKh4AP0OqK
         qDZdkjDZV02Abv0wSooONmDc9qxyPmHZkcI9uXP6GZVzs5El1+Twsdt6rhVnCQQwTJjF
         K9+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwuzqotXjjFm5WanV1/8HJJQHuTnsAa784I+QjDBtAchg6EI5+Qe5fzZiBCsERghvb0583U9qPJYwD/rA==@vger.kernel.org
X-Gm-Message-State: AFuF++kgzUT8geJ/uO3ojUCX6uOogr7qkDUNomGFsQooBcMA0fXmedgl
	umzxWuFa+WAz68p23kLDusOv/LKuV4fzv+Sbuos/O5XSVbvHXiizjz1VmwaE/cf7zxYWSxg6wwB
	ZxVqX23tJ3xRV
X-Gm-Gg: AYBFou3viMR1ArinRTcSUQsto1BaUudyihSpUIJFtFZCXa7tI4EHXMM5/nKgmO+evFA
	p+wFAELclh4UOBKxtUNwBXmRnGqf1Urgpa/AKfxzKAasLp4HWh4luX8C1mSJmuzokT2ukOvEPtm
	LMZm9Q1Cj5ObQgj01fi+SXsjtD67pYa6pkcXkfHd9SnOJMphrgKUk3vks9K8hl0P+ipyTVnsxrT
	ogJlBLK1ZwyCy+YuRZ+VlYRDQQnEe3NsJEiIqeYVSmE5iq812gktVyQ5MpxQo4ZqklfhqVCQt/M
	phSyVHM9cDMOdQXSqPVthzqLPZEszcw0Le/Vh0oRlQfDgScB/15x5LT3BWtdd/u89GwiExaX1UB
	HwZNaTZY9+Zo2v8yDbrxxJF4dYT6gBD7mPi+jjIBPE2fi80GnlNUUF5m5lgFa4JRglolO1scaXu
	25FZ/bhPaKIIijXLAxXCB1WhDJsQGi7CHmcj88eFLzJKg1mjUnv8VZv1zFzB93D7R39ho3Dl9GV
	PLsB9n5LQtHw5STFZlE0Xj8r0Bzb2WY4UGxqBLc6u+KIltjKg==
X-Received: by 2002:a05:6512:2256:b0:5b2:a558:b222 with SMTP id 2adb3069b0e04-5b8ae68c48emr5063195e87.10.1789499832871;
        Tue, 15 Sep 2026 12:17:12 -0700 (PDT)
Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com. [74.125.229.205])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57e0bdcsm167367e87.58.2026.09.15.12.17.12
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 12:17:12 -0700 (PDT)
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so95441e87.2
        for <linux-alpha@vger.kernel.org>; Tue, 15 Sep 2026 12:17:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy3OMLthgUlHXE/itkjbRSH+WHLwH2flMhO9a56vQKfG2s/cQp/mbzpfOMjJmj30ymGv9sa+aMn8e0oNg==@vger.kernel.org
X-Received: by 2002:a17:906:7309:b0:c25:47a4:fedc with SMTP id
 a640c23a62f3a-c29b839a057mr1176039766b.2.1789499355710; Tue, 15 Sep 2026
 12:09:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
In-Reply-To: <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 12:08:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
X-Gm-Features: AcwNN1VCm0LMG7z3Jned014oJh6WBcf4uOx0OBk98_hrtHKbrhcQiMMJ_A-fmB0
Message-ID: <CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Jann Horn <jannh@google.com>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sept 2026 at 10:52, Jann Horn <jannh@google.com> wrote:
>
> Is this mainly about stuff like "we installed a file descriptor and
> then the following put_user() failed"? Because if so, I think a nicer
> fix would be to have a policy of "if userspace provides unwritable
> memory to a syscall, just keep going and pretend the access worked",
> and maybe have a sysctl that kills the process when this happens to
> emphasize that userspace should not be doing this.

We've done that before, where we just ignore put_user() errors and the
user gets whatever the user gets.

It is maybe not optimal, but it's fine. You can find quite a lot of
unchecked put_user() calls with a pattern like

        git grep '^[[:space:]]*put_user(.*);'

and some of them are in core code - see the two in kernel/fork.c, for example.

One of them says "if userspace has not set up a proper pointer then
tough luck". The other one doesn't even bother with a comment.

The scheduler has two cases too, although one of them is admittedly
for another error case.

So yes, saying "if you pass bogus arguments, you get what you get" is
a valid model. It's perhaps not the *preferred* model, but it's not
wrong.

It *would* be wrong to take code that already has error handling and
remove the error handling, though.

                  Linus
