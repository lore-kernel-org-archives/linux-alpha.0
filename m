Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EC93242BD
	for <linux-alpha@vger.kernel.org>; Fri,  4 Sep 2026 23:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788563735; cv=pass; b=Y5DbExyrlkCxgUuc1B7D0MvQMNjLA9TzNkfF3r+XYthuBgAWu8i9VTVKBF0poJxeNZrHMr8obI1ybtAZ21FCk27n0KIWTmuMFYYOOqF1V0grdCM1s93Rl78EsN8Gfp05pPXNJvc0gXJfdSQJUXSFGvmmvajdKCMq4e2lf9iis8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788563735; c=relaxed/simple;
	bh=BB6EHdcKaA/c/EJGmaFUXmWq/ZA2wzbj+weVgexRWpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=eu+0HR5phkdCweXxC6rhFkaazPizOBZi7rXh2abJXru1JXMJxe4OBCmeigTPPZwaDgjBIelRh8lKzJDK+p+JlqOmjaxb5CIPnwlS5fchi+ZO5KsbZiHDn4RgjnaYU/hAa93uBdOd+gbrRasKUQB6F3nSSu7aG3QiwIItIw1yUJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOsR0Ahy; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOsR0Ahy"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a682579c72so2051855a12.1
        for <linux-alpha@vger.kernel.org>; Fri, 04 Sep 2026 16:15:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788563730; cv=none;
        d=google.com; s=arc-20260327;
        b=mb2Xfr9rqQW6fH6f6sv74mlGzs/ArPq3/TxC3RswEuV02XFuM8uGQpI7/p6SEXMpdO
         Sj6WVt1xtVoBrHw6I/51uGXa9vjHDZKwySYRi8uSP6BF2VF/XBpWLcbqfR1ubx1J1OYy
         5EvfGEHAHbjdKsBcXaZ4BCyoL8x8hATejb2yqdXlQEIEP1pLPhBINS2cToQmogUTVqZl
         KhgV1Npdnnz3Xs4XBwRgBFHkuXk+HsZHpaqz735dRpW6HnVXSgVJ0nzcbFExmTY+lEes
         1rkCTGnn5GMyb1sCtV4cuSQlXH4Tq8Wtrr7bif0tq0S7H8z6lVu84DI6YHCgqBq5UZse
         WaXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9+oPFVCHlIoWQo6jiz+svGdAWRzZsX5XNSQUMsdvUXQ=;
        fh=LFs70Gv+WMxKg6NtAF5D1dg2w8Xd9FoistFC2b1kyAo=;
        b=CGc72rZafCNZm4Nps3Q8X99kxLMFnxw1dM9Pw/8BBp6XNWloDb2iL9eee5CSd/xU5y
         SnjnqmosqE7+rpxRfwvdS/JE20BEHqQeltO1okASy90x++u/QE5RocjyP5x3Yo162hjB
         qlWCu1iRTlybnPTgFZFG3J5MdHAbtgYTz66HkWRsrcqXVrbRV8nBsmqBxEpKNFswje6/
         9Dbkmrh6/FLATCEHoR4AFxAoRZGhtAwWxHDxQOyetJxCOzrurQ99x1TPzLYI0SSDAggT
         ux0jKtlbFXFCjdzV1TbQjFMJtY8fQ5Ei+3VleTW+0EM5fw21I1C+N7ZfoEoTbYx8kkgC
         UFIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788563730; x=1789168530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9+oPFVCHlIoWQo6jiz+svGdAWRzZsX5XNSQUMsdvUXQ=;
        b=TOsR0Ahyx2rc8fPoCXaAmmdH+JBj/dKF2JsrnSUXh31gxGcDlD+rz0SjrL4nt8NeeM
         OqVBqB4tnXygC7K55VeXl/wPuFm9+3K7cyNfDegiQkIycQ2hiopFdxW4CVpuPtSwoVLN
         OA+FGd/YeIdXjrjgZuOORaJH+VlqS2jWxZcbfYZSCqfGjiY8PRFqtkJLwUdS0CW2DIoX
         MXGXXfx1E5wXNIDAuYgcT2vElR94BrDgCUeZQG/8/exxMdhJgWpnNmshcwD+kD/cgGwy
         mf4nkN8n7+F214FdoYfU7LcNe5owwHUi8VuvZvVH3vx5AAsfsdS5ef3TCF73xI7aPPzG
         ti7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788563730; x=1789168530;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9+oPFVCHlIoWQo6jiz+svGdAWRzZsX5XNSQUMsdvUXQ=;
        b=M2qLO9QtQ0G6MQbkNV3F4iXPbq29wgKB3tCmioPTmAGBSF68T9038++4x2zlgqFFv9
         eEhlXogVViW+D69dhh5/Nk5Q94nE+S2Rmahz7RFEAUZ9z0xyJu0em+u3YqgGxqS+DeoY
         u2C0l+7bZTzchiyJ0d0qwpVL/7PEmtb8CU30g0vptkhUOaTHIoqHl2QBqmv0TKEcDoio
         7azdFTgwFil7O2EcJ3AXHki7u3fkQS3dWaOOgQoheBc0IzAkk87zZN8+HWP8uAkBbd79
         6Jv8T4+RSbLzVYHirt+QA5aFQefnVUe8Lg1zmcpDnHNMAbbW6CSE4rgdKHn9gEjlUyLS
         4xiA==
X-Forwarded-Encrypted: i=1; AKwUvBwYDykaI13eeqPgFHfOvg6x7jTE9zSejkztCygCEh6xTTwsF1mbre4UslZ6xXgMLUPdLr8UxylXrlSubQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nQpj0FH/2fxJIZlzLKBO+wAxyGc6kV76ed2G3gb8AewwrCOXXv
	YkUL6YT6Zy5lMEjD/2COdu1gv/Jp/LKUuBFpyphs4vgt0kJozLe5ypXiISLuYw6hZXAMQRUpJoY
	+qrGkYpEDjsXuniYWYOP/VmiTRYoAFZY=
X-Gm-Gg: AYBFou1oB2rojQVIb5bhksi1q2tUIzxNpAzJqQqs5y4NTst5EyS84OHXPYE0csWCnZe
	36xgOXdjXt4WcJKy2NSo8Z6In5HPjC/AxvlTCN2a2Qv7TGIWmnWarh/z3Sxye28SGc1EPoVCXLU
	ndx4eq14HrRA+oju3eQosIbQtafAdwfGm2boYdMeamErJtlDoEpX8usCD323lEAbSYJHCeQU+DN
	YJCD0qIGHvk1w/TBzjj8Reakl2+nCzbu7ZrPTSN3HcK4jgKoEhYRM6M4iBF95buJg2hKwAVv+21
	U53TxUa0rvMPoL+RR6uG34zk0oPO6GAkkiJyjXnaqlzP7bigIkogdeHTxh2qJtrkL4r08qfBBdN
	Ff5fj4aVNxJKYXKfljzlJ56Ndv5dk5NU=
X-Received: by 2002:a05:6402:27cd:b0:6a4:21c6:1d14 with SMTP id
 4fb4d7f45d1cf-6a7e85e4d77mr5260992a12.0.1788563730187; Fri, 04 Sep 2026
 16:15:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <61175f9015771b6a6d78624579ecc180f57d17e9.1788277742.git.mattst88@gmail.com>
 <CA+=Fv5TYnwcDLPvwScOcGq-7CUSs2bDMqrYEj-Lhf4XfQ=yTzA@mail.gmail.com> <apsqmKw1pLmOXVgg@creeky>
In-Reply-To: <apsqmKw1pLmOXVgg@creeky>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 5 Sep 2026 01:15:18 +0200
X-Gm-Features: AcwNN1VmVYiQOCieWwnQgTF_EcXBKZAMYOMzLNI8gu2I3ggOXSm8eITiFc6_Xk8
Message-ID: <CA+=Fv5Sg1KjAZZ3X=Yh62hUr=5qeRg_ZVq=A_C4bBovde1MeoA@mail.gmail.com>
Subject: Re: [PATCH 03/24] alpha: select ARCH_HAS_UBSAN
To: Michael Cree <mcree@orcon.net.nz>, Magnus Lindholm <linmag7@gmail.com>, 
	Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, 
	richard.henderson@linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Fri, Sep 4, 2026 at 10:31=E2=80=AFPM Michael Cree <mcree@orcon.net.nz> w=
rote:
>
> On Wed, Sep 02, 2026 at 12:34:50AM +0200, Magnus Lindholm wrote:
> > On Tue, Sep 1, 2026 at 5:50=E2=80=AFPM Matt Turner <mattst88@gmail.com>=
 wrote:
> > >
> > > GCC's undefined behavior sanitizer has no architecture-specific runti=
me
> > > requirements. Enable it for Alpha to allow UBSAN instrumentation of t=
he
> > > kernel.
> > >
> > I tested this patch on top of my rebased Alpha GENERIC_ENTRY patch on a=
n
> > AlphaServer ES40. The kernel built and booted successfully with
> > CONFIG_UBSAN=3Dy, and the UBSAN instrumentation is active.
>
> So have I, on an XP1000 and ES45.
>
> > CONFIG_UBSAN_ALIGNMENT did expose a misaligned struct bucket_table
> > allocation in lib/rhashtable.c. This appears to be a generic rhashtable
> > allocation-alignment issue rather than an Alpha UBSAN problem.
>
> But in my case the kernel vomited copious misaligned access reports,
> so many that it took quite a few minutes to boot and I lost much of
> the kernel log before disks were mounted.  A few examples that
> were recorded later in the boot on the ES45:
>
> Sep 03 21:12:36 electro kernel: UBSAN: misaligned-access in net/core/dev.=
c:1401:2
> Sep 03 21:12:36 electro kernel: member access within misaligned address (=
____ptrval____) for type 'struct net_device'
> Sep 03 21:12:36 electro kernel: which requires 64 byte alignment
>
> Sep 03 21:12:36 electro kernel: UBSAN: misaligned-access in kernel/signal=
.c:4362:4
> Sep 03 21:12:36 electro kernel: member access within misaligned address 0=
000000058e1e939 for type 'struct task_struct'
> Sep 03 21:12:36 electro kernel: which requires 64 byte alignment
>
> Sep 03 21:13:04 electro kernel: UBSAN: misaligned-access in drivers/net/e=
thernet/intel/e100.c:1941:36
> Sep 03 21:13:04 electro kernel: member access within misaligned address 0=
00000001c866fa6 for type 'struct rfd'
> Sep 03 21:13:04 electro kernel: which requires 4 byte alignment
>
> Interestingly "kernel unaligned acc" in /proc/cpuinfo remained at
> zero, which really makes me wonder whether these reports are all
> false-positives.
>
Good question, had to dig deeper here,

Not false positives - real UB, but harmless, and I tracked down why.
for_each_thread() and for_each_netdev_rcu() are list_for_each_entry
macros: their loop computes container_of() once extra per traversal,
unconditionally, to test for end-of-list. That test compares against
the list head (&signal->thread_head, &net->dev_base_head), which lives
in a different struct entirely (signal_struct, net) - not
task_struct/net_device. At the real end of the list, container_of()
still subtracts offsetof(task_struct, thread_node) from that head's
address anyway, producing a pointer that looks nothing like a real
task_struct. It's used only for a pointer-value comparison, never
dereferenced - confirmed with a printk inside find_alive_thread()'s
loop body that never fired even when UBSAN caught the same line. Zero
unaligned-access count follows directly: nothing ever loads or stores
through it.

If it's worth fixing rather than living with: the sentinel comparison
in list_entry_rcu()/list_for_each_entry_rcu() only needs the raw
pointer value, not a type-checked container_of(). Splitting that one
use into an unchecked pointer subtraction for the loop-termination
test, keeping checked container_of() for the real element on every
other iteration, would remove the false trigger without losing any
real coverage. Not alpha-specific, so probably wants a wider list than
this one if someone wants to pick it up.

e100.c's struct rfd is unrelated: casts skb->data (not guaranteed
4-byte aligned) to struct rfd *, writes via put_unaligned_le32() - UB
in the cast, safe access after.
Not alpha-specific either - list_for_each_entry is everywhere.
CONFIG_UBSAN_ALIGNMENT just defaults on for us
(!HAVE_EFFICIENT_UNALIGNED_ACCESS) and off elsewhere.
Confirmed on the UP2000+ rather than assumed: 7 reports,
"kernel unaligned acc: 0" never moved.

Magnus
