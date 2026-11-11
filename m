Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794382999;
	b=RbETooPOg3IA6cWkNHj065bpdw0uwfaJkSB3gTLFVWmNfVRQzAk1aXRTcJ5KO4aMhzZd
	 RRUNXGjDI1co46mLZh9tq1hW+/8tyVGpMT/dcKmhQ6nk472KLN/WI7uc0sglpUjrB/wJ2
	 g9pv6DInS95n9U7cD6unhvGThHJCSonyxACjQAYrCSThknNWsYmX9/Hgk7OFrv8UV/8mz
	 NEaz+1CeBdLNoncy0eUW8nsoTknEXGMGnju0axKLRv8CoEdKGvSSEGppod81cxB30Qrni
	 UrgubXP6CdY+Nm3c3ES0gUj4AyxeTMRO1abFnW40R7iI28S8k1fE4SFtA2q++vUHGmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=27U7oUdIa14bzFyO20wq2H7dyWDMznLD1QtfCXJzapQ=;
	b=1S/pe3xG0JEhXKURmn0+SCeQC+uSN+Ux8SregrZonoDlcsQsAfO4tVOTuQRhfYNfOikM
	 PldAEpJ949B3uhimLo+VXC08x692kzHNehCHsOwLHAkjJYwb2kHUlYrOWlh8ETS0kNHLr
	 p9vOmMrXbSSFxvy2H6QP68l0D9ZP8IMfmL1zUQ/876+k8wryxcyncxuuLn4fE83XFDdmc
	 f1BgiKNi559xOEggRQJqS++cntS4uwd5YprIBimyVjbSMoJIbyuUfN1hBniMVzgIi4VZA
	 pvg4hHeBRYPzxx2+UAonHrcMXoQQCcWg8WIcQITCbT7ie/JhyrRpNE0CeSqawa3n+jw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5NQKG5D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074EC606A330
	for <linux-alpha@vger.kernel.org>; Wed, 11 Nov 2026 07:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 074EC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5NQKG5D
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b757029223so1832834a12.0
        for <linux-alpha@vger.kernel.org>; Tue, 10 Nov 2026 23:43:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794382997; cv=none;
        d=google.com; s=arc-20260327;
        b=Jh0E5ooqICkKLCa4nZ8hOn23xI9w2ARUsJmrgEioDxCnpr3QcOYqI9iFnP8bkQhtsR
         bXtC9pqM8jDFJtfeJZfFN8F+d9OYtdhkHDT9y5VMi9LCYE/8Sro/3sA8AqpkQU2hlDWa
         GyDTwHB3MuHTsoRRNdD3kHBfUBhPEirFMVjOFmyNW9WUCJBObbx5SFQ65jb8DjwBYFQl
         tfm8l13IkdghUY7M538YUem/uBX+S+Pa6WJsxLOajSt0R7C4ofmMQW8E3TXmWPNaJLfY
         jvEXOT9sc39/W+p8KC8ytcT6/zosUZ1B1DbZ2J9JlZA7cPbRW8phYVwrbpK/Hkg5SftE
         fLkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=27U7oUdIa14bzFyO20wq2H7dyWDMznLD1QtfCXJzapQ=;
        fh=1QsC555eyNw7TKZj4/20wwBS9ePLgjYEe98jUPKJBaQ=;
        b=Pww0yUb2VyyZTOhbBTLfPQBcTQzlwpfiTK2/tRYHzXzIlXByAuLMtBJferW+6z8RVn
         4N9sR7tWYfsF7Z/do6aS5lT/0JA4gjcrYqevW439myii/hecvohXrLKsC+5FVvWmU9n0
         WEvpwiX/5acsFuJN/2w1QLd9njBblsjDQK9+uYuKb6flKOk63p6NnxhE7NzXdbivkikk
         NR4fbMI0Rsm171BTsF6nteyiiArvZaSs19q7KquhxiZMdp37vBUwHJx2gTQYlKFK2oUH
         mvS9mmhLVKmtdQOZzqcw0EfzQWCr7fu08OFxTATU5xGsghDdWXpOqzYaIp05AesUwK38
         +YNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794382997; x=1794987797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=27U7oUdIa14bzFyO20wq2H7dyWDMznLD1QtfCXJzapQ=;
        b=h5NQKG5DsH5k0QdRiJVJ86KtbHIpBxOZtiNveHnZG/t4JAkAZl11gGqvbZh2gbx+CZ
         U7R2l09uEN9Mz6txyG/VHZJvSvlNiFdQj+V+bgbOtkQgjiNZU0CA5FMY6smQ/+4XBAH3
         TyiknHwqbS9a1ikRyqP2U11AjltnFdJ0aJiSYxxvbDIdddHQa9rv+KTy80xEhAMzl3C+
         bIpY5WP4LhG5OSEIpLn1ynS3EgjFFWznVldcdS2uIAoKSyrP0PX27WalhA9H67xC1xsv
         oVv9D9PpI4KM5wKfG/3AUYQbehBCy8YKKKaBfMQR6O76UfhYBDJ2qQ9F1ZaCwVdZpUw3
         DTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382997; x=1794987797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27U7oUdIa14bzFyO20wq2H7dyWDMznLD1QtfCXJzapQ=;
        b=hSmG1nTsquSWuT8I0A4OybNo3CzsfU/usHKnBsZyL6qdip8FuGED7OBH7NemDgtuvj
         hJ/RrL67yp78cdHg21m2R27AkB3zH3FjD09X7UkP+JsegPg5mRHIS/0MoLGCiqeLGZI+
         UNm6Uvh1nfcQS+Z2SnuhaSf2ZiG67KEt3d/BFVPiwrG+3Jz+SJnI/4SpqLGX9RLCgIu9
         LZgd0Ow2Kf5V92wZR+pjSZYRMyFAA9oFnQlW/wNKdtqHxPTCc5K/M7tJNS6ZNklkuYXp
         1yxXc7Q8AubSNIq1vqIvvMGq0VxKilAk4i+IghB3VYu4wnjrQPLQ1+TiVMoUf9cknXoZ
         +d1w==
X-Forwarded-Encrypted: i=1; AL+hErHU/WRpI7IbakAaVO49ZoOM40u8frugoZZp9p4dlO/WpUQFpxNq4orV4usY60ebq0cyig2DR5ZIqkNA6g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Dt1AMQp9WWrHLJrIUV3y6/7YR8dsRCoKtDGF1I3nOqaB4Yf6c
	TO09qjcibJLO8Fb2UuLtOw2VB7BvVzT/0QfKrLWoSg++RmKSykzxYU5XmNYOOkdDT6gZ/U1orfv
	zuc9lFF29fzT3X50ZlTVx/fiQ0JirSGY=
X-Gm-Gg: AYBFou0jmrI4ZK6Hyum2dY+k11ncSrZKXo+fj5px6I+mx3O+GU4lQFnSQfFsTO+DxEh
	J1RaOv1dCOn8ijdSLnb5ziVEA/5dE2Q5LjvU4+cbOKLL/0GXddes+Hibd1osjFiWRl8JE/aIqDH
	9jn5RJWYuWXN6YG/zFWAzPis3QDafYzBvaV1cm4ltMr3LWfZUajrS1ysZLBDiaFTHBfztUzyYkc
	TmYYw0o5v1/+CmFgZtlmogYL4f9f3HpTwWn4Wg2gyM3OtW1ZhSM2KGZPSoFldT7xb0APr8LTSYD
	vWVcGg05bJZdpJSNjYfjGJBny/g51yN47RslkDJnIi+9CNd5l+XuyojpmKp7OaGK7aDVpfiduvf
	mNsRFwekMZg2Ah1VPHzxtkmn2CCK6TP5AvXErYH8Ey0HAgcV6fsWTgigtPS4Hpn7HOBG1WQ==
X-Received: by 2002:aa7:c1c4:0:b0:6b5:90b9:e1f4 with SMTP id
 4fb4d7f45d1cf-6b7773edf4bmr819135a12.15.1794382997169; Tue, 10 Nov 2026
 23:43:17 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com> <20261105-tonyk-syscall_table-v9-11-8d1275885d9c@igalia.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-11-8d1275885d9c@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 11 Nov 2026 08:43:04 +0100
X-Gm-Features: AclHuK-WWcZzAuRTugYoSHBXz8aDMS8vLzO87BtuVYEGxCZ10b0uUmgcqCUEPe8
Message-ID: <CA+=Fv5Tm4-DV9KEKxO11ta84EvqigB-KDemhOML1hx9zoxx0cA@mail.gmail.com>
Subject: Re: [PATCH v9 11/15] alpha: Remove alpha_ prefix from custom syscall entries
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, kernel-dev@igalia.com, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-alpha@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9

On Thu, Nov 5, 2026 at 9:26=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@igal=
ia.com> wrote:
>
> Some architectures need special entry points for some syscalls (like
> clone3). The current approach is, instead of having a special name like
> arch_syscall, to name if as __syscall. This is enough to different the
> common entry point to the architecture specific entry point.
>
> Change alpha special syscall entries to do the same. This makes easier to
> join the syscall tables. Leave alpha_syscall_zero because this syscall on=
ly
> exists in alpha anyway.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
> Changes from v7:
> - Fix __clone3 entry
> ---
>  arch/alpha/kernel/entry.S              | 8 ++++----
>  arch/alpha/kernel/syscalls/syscall.tbl | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
> index 790389a15c3c..25d05f45512d 100644
> --- a/arch/alpha/kernel/entry.S
> +++ b/arch/alpha/kernel/entry.S
> @@ -729,9 +729,9 @@ ret_from_kernel_thread:
>
>  .macro fork_like name
>         .align  4
> -       .globl  alpha_\name
> -       .ent    alpha_\name
> -alpha_\name:
> +       .globl  __sys_\name
> +       .ent    __sys_\name
> +__sys_\name:
>         .prologue 0
>         bsr     $1, do_switch_stack
>         // NB: if anyone adds preemption, this block will need to be prot=
ected
> @@ -746,7 +746,7 @@ alpha_\name:
>         ldq     $26, 56($sp)
>         lda     $sp, SWITCH_STACK_SIZE($sp)
>         ret
> -.end   alpha_\name
> +.end   __sys_\name
>  .endm
>
>  fork_like fork
> diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/s=
yscalls/syscall.tbl
> index 8fc4701a6328..59eb066a40bf 100644
> --- a/arch/alpha/kernel/syscalls/syscall.tbl
> +++ b/arch/alpha/kernel/syscalls/syscall.tbl
> @@ -9,7 +9,7 @@
>  #
>  0      common  osf_syscall                     alpha_syscall_zero
>  1      common  exit                            sys_exit
> -2      common  fork                            alpha_fork
> +2      common  fork                            __sys_fork
>  3      common  read                            sys_read
>  4      common  write                           sys_write
>  5      common  osf_old_open                    sys_ni_syscall
> @@ -72,7 +72,7 @@
>  63     common  getpgrp                         sys_getpgrp
>  64     common  getpagesize                     sys_getpagesize
>  65     common  osf_mremap                      sys_ni_syscall
> -66     common  vfork                           alpha_vfork
> +66     common  vfork                           __sys_vfork
>  67     common  stat                            sys_newstat
>  68     common  lstat                           sys_newlstat
>  69     common  osf_sbrk                        sys_ni_syscall
> @@ -242,7 +242,7 @@
>  309    common  get_kernel_syms                 sys_ni_syscall
>  310    common  syslog                          sys_syslog
>  311    common  reboot                          sys_reboot
> -312    common  clone                           alpha_clone
> +312    common  clone                           __sys_clone
>  313    common  uselib                          sys_uselib
>  314    common  mlock                           sys_mlock
>  315    common  munlock                         sys_munlock
> @@ -474,7 +474,7 @@
>  542    common  fsmount                         sys_fsmount
>  543    common  fspick                          sys_fspick
>  544    common  pidfd_open                      sys_pidfd_open
> -545    common  clone3                          alpha_clone3
> +545    common  clone3                          __sys__clone3
>  546    common  close_range                     sys_close_range
>  547    common  openat2                         sys_openat2
>  548    common  pidfd_getfd                     sys_pidfd_getfd
>
> --
> 2.56.0
>
>

This conflicts with my Alpha for-next:

  https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git
  branch: for-next

Commit d38895ba9330 ("alpha: dispatch system calls from C") removes
the fork_like assembly wrappers and changes the table entries to
sys_fork, sys_vfork, sys_clone and sys_clone3.

Consequently, this rename is no longer needed when integrating your
series on top of that branch. I skipped this patch for my integration
test and retained those existing entries.

My for-next is registered with linux-next, so this is an interaction
we should account for when the trees are combined.

Thanks,
Magnus
