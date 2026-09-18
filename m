Received: from mail-ej2-f36.google.com (mail-ej2-f36.google.com [74.125.228.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B19A363C48
	for <linux-alpha@vger.kernel.org>; Fri, 18 Sep 2026 10:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729051; cv=pass; b=hgHsTX9+6jRkcRS5T8lwvTp5a9ZQkHmZxTNmoGf9MKc+RxsuUUwvjmji5Q+fQRSui8JOT3SfD8ajeiZ+kb6+grpiodFCL/bOd0M8NtugDPWLRKWWkrZRjj1h7ERdaB7EDfAvpXDUcDYDx2Vx4CbPW631Jwnb6ZGGyBEI7sHIhc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729051; c=relaxed/simple;
	bh=6iYGIhTpi7LuKPSoQodSj4LWWam1JDnzz7YKjGx7zA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pGcmcuGYEoL6vWhSPO+XCeg7tcDfI3H1nZEXpAS3M0f+h8p/1VV4GzPOB5kIYMK16b4GiDQKuMETkR6FRx1KtBNSCK0Ato31+sBMxVpxkaqjsJqnQXM46+X7ZpdO9cR3y6TJ5jwhBscgfpMPWf/iXfG4U4TtdGVPW9cpRtzRfjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oLrD+Ext; arc=pass smtp.client-ip=74.125.228.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oLrD+Ext"
Received: by mail-ej2-f36.google.com with SMTP id a640c23a62f3a-c254f9f0b1eso93072666b.1
        for <linux-alpha@vger.kernel.org>; Fri, 18 Sep 2026 03:57:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789729041; cv=none;
        d=google.com; s=arc-20260327;
        b=RNA2B4Onm36fTaquYmTgs1abSxhKw8uKp81WUy3MIHWOxdvhmqU9zFdYU86oIbHrAn
         iR+MUJ9bUUuqxMv+AN9gcPLvA+cq1EDVuNQFpPPzpDlnVmMEPFj4duDKt2S8IJmjTd9/
         qcAcrugi7hGXKao5G+uG/Ozn+HPM+wU5VV3yBFFkqoTPiB82TGhJMneWlZTzKBBcbN6w
         jMFz1Vq9GWREipNzcDVOVDrB1QSoXJKDS/QL/NQujhgh/7SPtfbrlOzu0KS6SkZrS6Gk
         DAIIRf3OL2D916m5IpZ321X1DIRpoe0J6nmNhMF0j56Qnaza42kx+INp683ALlQsRjqG
         AIVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=STfWB7GvLQfZTNQp3BOqhn0t82awjzhOdLfYzJJuSYw=;
        fh=Wua2OpLy6F71NAqDd2EQxgN/qgAvzjPnk57mcGVtURc=;
        b=oHFD5R+3KiEeU/cVsZ+PY5LplfKAC9HfNAcxhSK5jNA+laZhjoAQMyqA3pWunzPxc2
         u48bf9T10vpIzBu21m33J3JrcoO4wsNp2Umm1vREMmBlioR5pW0qQ71AgL2l2Y7PWRYP
         L44wFsqJ3eV+xsxwXQTiBfx0Rbju/5um+UnNG5dMESvLw/eaODPaXNBgwNZcuKYWQpjx
         7wk8ySyzTPWa/54pQ/xStn6zJRBtZ6QFaH/ttYS/uI1EqApbxO6Y7wjwqfVY/cTOP4Q6
         Ct6R0n98On/m1m9mnyA378cgfxyogvQJda8Vy4axhsB+MCeBAnI05VBbzbggVk0llXWT
         TcZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789729041; x=1790333841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=STfWB7GvLQfZTNQp3BOqhn0t82awjzhOdLfYzJJuSYw=;
        b=oLrD+ExtTSe1LUoDVHkc7lP6hqeH0hwwOBdmRSHJoRFQQu5MhepiER7DYUevRXwIZC
         5E/GZX2pQpWwzhE0j0jfV5L+vDzhPdjJuYSYmR/ba0tKs4SBWa0YmnqbUgEwuCN6PMmw
         DmL45bEw2s51tHtRZnpD2WJCkIRJaIDluitHtggjnNWB+dLt4EGAXBLhwibA8/+hQH20
         wugPlTAzF4yC+9vyKR9JCWZKFVxomKUXx8Ex/aLqi9Npgo4u40TDNZ0vPZeCdWaCaWlZ
         5vHzXRUBT0Y/WEI0yhMM7NGec5KcU/Q6nUf+NAsu2O72ykn5Hxk9/+DfduURQuMqal+z
         4Bnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789729041; x=1790333841;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STfWB7GvLQfZTNQp3BOqhn0t82awjzhOdLfYzJJuSYw=;
        b=CjQ+Gp0ARU4GLzIBTBqwr27mZBs7JujJ6EoULpmU3e0f7j+6CeapCGzCXVQb2vaDjC
         a/Y8RPWjAz5Raljxnw2eKqOMkaAUd6LikFQ9iCizbR1OTUXlyatG8ny3DIuSqYilZRUV
         HDEz4rBVRRLMUtczMVkWWi3ymH3vZiL0gcNgYqZAObK47D5sDlyGBcTw8QqodGiHPXyl
         QTiQpt+8qinwYabH7xpwIVxuNF/pSOiTaQI09GkESuquU2GYsX29AxI/k/dz0br/F5cj
         lhpIKoWwIW0ENnPsZrRj05g+bBmOtgBcqMqvTN6l0LytFgVBIYjRjcatsOQ2O20bhOhI
         JkuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrOIb+F5QHr1KFYwZXBsM2nWvdcUnj/+EBQoNnp2v7RuHDaW863hAzJGyybBRkbLd4S1gctQ3CeeUszA==@vger.kernel.org
X-Gm-Message-State: AFuF++n+N4ZF1XvHuT1hAeFYO2BHBMB4QF1VuKxRCorPG9r/48EKv5QX
	oEKnXZhoog3PlmabUcjnEQoru4pasoYUfmQ6bOKX12UlRZaiw6yAE9J6lNaCX4wxcIQDRQrO18d
	E92sfIYp4fbtMBBPQfw0dSsiQAlfpIGc=
X-Gm-Gg: AYBFou2HdCERXLT1xxp9pMFRLWcylLkefn7fH1jyfWOT3D0YWb5dkwBchzOqwFMBti4
	xof5albf8PuK5Vk4BLmpTDa43dLZuSbdPOpybcxpM/Fm9I39P279bQZK1yzgXxNz9y8O+bF2pb0
	fVD71keiRDSjWHAdIOOkg0RKaIZVc1sjBPujwSQnRyeCat481he3R9t06e7KX7uWG1bU3Nd0lr2
	tu1oN3kXvAmD4SPthRz0Y0gMhM493bfwXhFTlf9Eow7hvg5vxeKJ010Qa1rRxzlhlpWaynUG3DN
	oD9gosxr3nYNXW0jHz0qq2c0wbsQduDrsJQcE4lkUMgBCP3pZEIEJrtnLOSQk+2T85+O859mnz9
	UGBxKYb/1z6OV7aEc5BgYiRX99m5xWV12LThtT9wAcWOeYWE2y63U
X-Received: by 2002:a17:907:3e9f:b0:c29:f5d8:9c6f with SMTP id
 a640c23a62f3a-c2a15802e80mr221037366b.30.1789729041100; Fri, 18 Sep 2026
 03:57:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-tonyk-syscall_table-v7-0-f4cd8f8e3265@igalia.com> <20260917-tonyk-syscall_table-v7-13-f4cd8f8e3265@igalia.com>
In-Reply-To: <20260917-tonyk-syscall_table-v7-13-f4cd8f8e3265@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 18 Sep 2026 12:57:09 +0200
X-Gm-Features: AcwNN1XuAITXWKYUHlzEkxHeHjQM9QwjDHbUkRpVnBkp7VsqOue8wy8fg51lcyo
Message-ID: <CA+=Fv5Rx6Ccmxi2a2YmiMgc0Z7TaWvx8=27jpFE-k3Kfn8Q-ug@mail.gmail.com>
Subject: Re: [PATCH v7 13/13] alpha: Use the common syscall table
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, kernel-dev@igalia.com, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-alpha@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Fri, Sep 18, 2026 at 1:48=E2=80=AFAM Andr=C3=A9 Almeida <andrealmeid@iga=
lia.com> wrote:
>
> Remove some of the duplicated code by using the common syscall number
> table.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  arch/alpha/kernel/syscalls/Makefile    | 14 +++++++---
>  arch/alpha/kernel/syscalls/syscall.tbl | 49 ----------------------------=
------
>  arch/alpha/kernel/systbls.S            |  1 +
>  3 files changed, 11 insertions(+), 53 deletions(-)
>
> diff --git a/arch/alpha/kernel/syscalls/Makefile b/arch/alpha/kernel/sysc=
alls/Makefile
> index b265e4bc16c2..03099daff6b9 100644
> --- a/arch/alpha/kernel/syscalls/Makefile
> +++ b/arch/alpha/kernel/syscalls/Makefile
> @@ -7,17 +7,23 @@ $(shell mkdir -p $(uapi) $(kapi))
>  syscall :=3D $(src)/syscall.tbl
>  syshdr :=3D $(srctree)/scripts/syscallhdr.sh
>  systbl :=3D $(srctree)/scripts/syscalltbl.sh
> +systbl_common :=3D $(srctree)/scripts/syscall_common.tbl
> +abis :=3D common,__clone3
>
>  quiet_cmd_syshdr =3D SYSHDR  $@
> -      cmd_syshdr =3D $(CONFIG_SHELL) $(syshdr) --emit-nr $< $@
> +      cmd_syshdr =3D $(CONFIG_SHELL) $(syshdr) --emit-nr \
> +                  --common-tbl $(systbl_common) --common-offset 110 \
> +                  --abis $(abis) $< $@
>
>  quiet_cmd_systbl =3D SYSTBL  $@
> -      cmd_systbl =3D $(CONFIG_SHELL) $(systbl) $< $@
> +      cmd_systbl =3D $(CONFIG_SHELL) $(systbl) \
> +                  --common-tbl $(systbl_common) --common-offset 110 \
> +                  --abis $(abis) $< $@
>
> -$(uapi)/unistd_32.h: $(syscall) $(syshdr) FORCE
> +$(uapi)/unistd_32.h: $(syscall) $(systbl_common) $(syshdr) FORCE
>         $(call if_changed,syshdr)
>
> -$(kapi)/syscall_table.h: $(syscall) $(systbl) FORCE
> +$(kapi)/syscall_table.h: $(syscall) $(systbl_common) $(systbl) FORCE
>         $(call if_changed,systbl)
>
>  uapisyshdr-y           +=3D unistd_32.h
> diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/s=
yscalls/syscall.tbl
> index a41276634923..7066a3920899 100644
> --- a/arch/alpha/kernel/syscalls/syscall.tbl
> +++ b/arch/alpha/kernel/syscalls/syscall.tbl
> @@ -463,52 +463,3 @@
>  532    common  getppid                         sys_getppid
>  # all other architectures have common numbers for new syscall, alpha
>  # is the exception.
> -534    common  pidfd_send_signal               sys_pidfd_send_signal
> -535    common  io_uring_setup                  sys_io_uring_setup
> -536    common  io_uring_enter                  sys_io_uring_enter
> -537    common  io_uring_register               sys_io_uring_register
> -538    common  open_tree                       sys_open_tree
> -539    common  move_mount                      sys_move_mount
> -540    common  fsopen                          sys_fsopen
> -541    common  fsconfig                        sys_fsconfig
> -542    common  fsmount                         sys_fsmount
> -543    common  fspick                          sys_fspick
> -544    common  pidfd_open                      sys_pidfd_open
> -545    common  clone3                          __clone3
> -546    common  close_range                     sys_close_range
> -547    common  openat2                         sys_openat2
> -548    common  pidfd_getfd                     sys_pidfd_getfd
> -549    common  faccessat2                      sys_faccessat2
> -550    common  process_madvise                 sys_process_madvise
> -551    common  epoll_pwait2                    sys_epoll_pwait2
> -552    common  mount_setattr                   sys_mount_setattr
> -553    common  quotactl_fd                     sys_quotactl_fd
> -554    common  landlock_create_ruleset         sys_landlock_create_rules=
et
> -555    common  landlock_add_rule               sys_landlock_add_rule
> -556    common  landlock_restrict_self          sys_landlock_restrict_sel=
f
> -# 557 reserved for memfd_secret
> -558    common  process_mrelease                sys_process_mrelease
> -559    common  futex_waitv                     sys_futex_waitv
> -560    common  set_mempolicy_home_node         sys_set_mempolicy_home_no=
de
> -561    common  cachestat                       sys_cachestat
> -562    common  fchmodat2                       sys_fchmodat2
> -563    common  map_shadow_stack                sys_map_shadow_stack
> -564    common  futex_wake                      sys_futex_wake
> -565    common  futex_wait                      sys_futex_wait
> -566    common  futex_requeue                   sys_futex_requeue
> -567    common  statmount                       sys_statmount
> -568    common  listmount                       sys_listmount
> -569    common  lsm_get_self_attr               sys_lsm_get_self_attr
> -570    common  lsm_set_self_attr               sys_lsm_set_self_attr
> -571    common  lsm_list_modules                sys_lsm_list_modules
> -572    common  mseal                           sys_mseal
> -573    common  setxattrat                      sys_setxattrat
> -574    common  getxattrat                      sys_getxattrat
> -575    common  listxattrat                     sys_listxattrat
> -576    common  removexattrat                   sys_removexattrat
> -577    common  open_tree_attr                  sys_open_tree_attr
> -578    common  file_getattr                    sys_file_getattr
> -579    common  file_setattr                    sys_file_setattr
> -580    common  listns                          sys_listns
> -581    common  rseq_slice_yield                sys_rseq_slice_yield
> -582    common  fchroot                         sys_fchroot
> diff --git a/arch/alpha/kernel/systbls.S b/arch/alpha/kernel/systbls.S
> index 68f3e4f329eb..9a67d29f7818 100644
> --- a/arch/alpha/kernel/systbls.S
> +++ b/arch/alpha/kernel/systbls.S
> @@ -7,6 +7,7 @@
>
>  #include <asm/unistd.h>
>
> +#define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, n=
ative)
>  #define __SYSCALL(nr, entry) .quad entry
>         .data
>         .align 3
>
> --
> 2.55.0
>
>

I tested the full series on my Alpha for-next branch, which also contains
the Alpha GENERIC_ENTRY enablement.

With patch 13 applied the kernel builds and links successfully and boots
normally on my UP2000+.

The issue I mentioned on patch 12 is hidden by this patch, since the
common table correctly selects __sys_clone3 for the __clone3 ABI.
Other than that issue in patch 12, I haven't found any Alpha-specific
problems with the conversion.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
