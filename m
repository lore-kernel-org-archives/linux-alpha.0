Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852B943A7E4
	for <linux-alpha@vger.kernel.org>; Tue, 15 Sep 2026 17:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494729; cv=pass; b=CB8uEJ+RnSG2dhvkqliuRM6NRpEyh69CD22wten6JToB9zgsof8eWkgXicO3k2AQY7Uveh2hO07EIScI+/685yrn+sdT9OFdgGP7BwnqnT8QWOMUn2bOsgHYHuHTHovPTfKVhHM9u2HkYfmV3zEZJGGBJ6Zqm2QmStehCiXsrog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494729; c=relaxed/simple;
	bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wl7TMPFlJ8PPi2roC3Rx87K2x2ULHTKuVTh1/2F7eAdtQzKN91MOYGVEI6+ciWfY0qSMV8zPH0LB0SGf6FJYrCdCa7br8g10LF84WSzG6QajOQtxLtyLvezMXiU+F1buEcQWd+wXEhJH8Yu1FsOGMxTywxYniILVDPZDD1kY7LY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WPgx9Wh6; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WPgx9Wh6"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db425c9050so12185ad.0
        for <linux-alpha@vger.kernel.org>; Tue, 15 Sep 2026 10:52:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789494727; cv=none;
        d=google.com; s=arc-20260327;
        b=lligoRXQvXnHawl3Es4DAscCP/QHBSbMobLTbNDUyimCOg4bnGQ6A2EfU9OVhP6Y9h
         pEhUY38H7e2BF//sMQzfxEV47TCCphzoUrro8uRCqhCQo3lSgubB1bULIjklR8HEiwW2
         SK74TmjKh5d4VQM7YHNlpNvFq3fSgYnofFlp+Kho8iKcaGQ3G6aOAQ+DWRnQFNCD062M
         UCjHptELtSoL2cZyfuz0c0/dC8qn8AKSmpVdrenHktAobJMKLUHKGLXalYkM6SLKTfFn
         pwWVEXevxuykOcLAWg1O3HNM50WKvvPPM8MXBQ4+6zCkg4U8muLWeSkTj6pKZLWns5t4
         6tGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        fh=U9a6dQoMnzGkhj1j1HYpLla9gEKj8D8dnty5c8abJWE=;
        b=E9UwblEYsxfZmXvdW85n/F8xixqqEP398PDHptzvFxe7HGX0OxOvJDrbxq9kHSclN/
         +zj5LdB0QjZRISruUZBGg8VY8mb9bMdD9WRMWm/6zaVj+sJOxRxFcdeW8vZfDl8yi2jx
         kVikMFVLUM6rKTT2ORfV7FXysnKlrk7eQF/PKR3iFAvBCKW8cybu1PVFKjGewcalNNJk
         OjtYlfPKfofbMbK4W4T9LRpd8gsw0g/tF3Y9iAFi0nfOR4Uu9AzlDDTldjfMdhywrONy
         IX3Vk86AZyLtt+w7oX2wOIdA3DSQMBM1lBAN/WuOuhir2PiP51Mb18W7vBoibLhp12k7
         Go3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789494727; x=1790099527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        b=WPgx9Wh6g8ehXMOaZf8ZSNtevHb9fzr3lXk5INKsJirqC99dpiARLSwTsIwHA4pbMW
         JbWx8MvBxDUFu6opqA60njTwuSet+XjH0Wga4OKXeEmVhOXoy61UWc3rqiL6EU8/l428
         EjMY1UqvowxmFEZiD+cpXVE0I3gM0Ssco82ZH8FSIs0h6jzSdSLoGG2b/9Ga+W+7Aup7
         R3Y2jKX2VRyqaVjVjF8po02JGQLWYioBTM31SQGX//CGOHsZjgwuKy0KaaC3tSzQflwo
         ISJi8sLOMT0xayOGlmIx3TnuUJAs8/tTEps0xY78QDJPw7a+XDrg4k1OSruo0M4Rr9uE
         eRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494727; x=1790099527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        b=YHIkojIYjGLX/Uvw/cy/rIKN8Txez0Iisqd8fcx32bQ773hzKaKXKzsE3svn4EXBy5
         Xmr/AZLGLN9XmwjQ/2Xbch5rEeLPvhvWBWEHwRUt2Z1HT2U9crTti0No3FTPb/LSSWBh
         BByA4qgukJe9fZ36Kak/vCPYPH7EylHiEb/pPIM/tr/Zgwl4+jUWp91B5LQpFHx4Lf//
         IhcewoelNlPomwGzPt0XxNP6Qr0TrvSJPeJpkGhMcucKFXl1PPeIF9YotLWsYOZI+JgM
         UN5TLaohYUEvLiPx0q5mmJt+AtAklypi3Vp3sXPmDguLiEwKO8+E6quhqQaOUqF5RJLw
         gVmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwT3eJIEXsNySnEgaQCoWH1Q2slDMCN0irL3qgjVd5yQzWQoUtOF1+sjfkcWHJvNXGnnNh9MUqK/6MJ5g==@vger.kernel.org
X-Gm-Message-State: AFuF++kS/r0ac64MKb/xUSfBBgxHipL4IhIz05Ii75ns+4Dyy3Semtdk
	1t7aR54IS4e+TBU8yx1KfKpO6iiNB3sAusuTSaHtaZKMX4eGIYhOiyqtl4Mi9IDo0r2X2qHLCnK
	JFLDoxrdGFAqMfomgTbxVcvWk/dyVmt1R4cPfzwim
X-Gm-Gg: AYBFou13o04RXNnmcAFkl907JpObu5VCTb+LpgaEdSH3iyGqraItHb6TbtojKpW9fhi
	yM+QjQAnabvA8rRmU2p9hcCJoXhQ4bTyqTQiDxG4ym/Li55yAhUVd6mMpXJkFi7TR0/Mv58t8Ku
	E3jDPDXDIUdYUAltKs8QbCppwVPxazVLC4mDfy/NkQzoWSt22iIflFgN8hW09+S6LMIeiVtHcQE
	Jy4PhMQR7C0KbtgZ0n5oX9lF8dJ8/0Zeqcfi/hk/o2w0x73K4DgS9ogueoE2Y/8PLaz/t5eW4uF
	F4AvL8/qq1HWADAwArE1/YQUj7kXlsiGNJT1KLHWyTG50oVjCYwVPi4YY+iHeAb8WabneJDPX4p
	hr1jSaSx5dUgnDhIEJuDdP8dogqJIt+khVeYGhBu+Mg7fXk7T/DQ=
X-Received: by 2002:a17:902:f612:b0:2dd:5363:31ec with SMTP id
 d9443c01a7336-2dd89c0c38amr177395ad.14.1789494726332; Tue, 15 Sep 2026
 10:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Tue, 15 Sep 2026 19:51:27 +0200
X-Gm-Features: AcwNN1Vhgv53PI2-XyXtJBbVzCNkGiiWjtvOE2b-8zHim7-UybJ3H2xniPj1VUE
Message-ID: <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Christian Brauner <brauner@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
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
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 1:31=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
> TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> allocates a descriptor like get_unused_fd_flags() does and records it in
> a slot on the task. fd_stage() attaches the file to that slot and
> returns the number.

I'm not really a fan but I feel like if you want to do this, you
should be using task_work so you don't have to touch the entry/exit
paths directly? (And if task_work is too inefficient somehow, you
could tinker with the task_work implementation.)

> When the syscall returns success the exit path installs every staged
> file. When it returns an error it drops the descriptors and the files.

Is this mainly about stuff like "we installed a file descriptor and
then the following put_user() failed"? Because if so, I think a nicer
fix would be to have a policy of "if userspace provides unwritable
memory to a syscall, just keep going and pretend the access worked",
and maybe have a sysctl that kills the process when this happens to
emphasize that userspace should not be doing this.
