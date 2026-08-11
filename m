Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19AC3264F1
	for <linux-alpha@vger.kernel.org>; Tue, 11 Aug 2026 06:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786429710; cv=pass; b=fvRjQIT6/RQzR/uwZnj0QQ5ZNFYyujwqw+R2LxOqMaFSc3Ow9QHzhNJGV458EeNeBge4bkc2N/mQY1FHfifPR/bCqZyzgrXID2LVPXKYuAHxrE5jwtC0dbJplVTmo4kAMpeTp4+nI6PG2H79nrkHi75c1LyY9Wu+u6wI00ebCrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786429710; c=relaxed/simple;
	bh=VSjp7Ojxo2gJu3Lug4R7N527cggkoqx+sTb29LmpN8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IY1dcnB7so0+QPlBDLysjQBwJ2aFHtoq4sfLzHDqswyudef8WLTmHYsKqjxYfGiN4Hishu+E21YF+W1dnABLK+BZHjA5k5jHQoUVk0HqFr3zaJSra7Axu9+HTarPcpPXYMiciUwoj/lXYu+gYUS8Ywk64ioqiMAgzXkG1ddxcYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpU/Mxqo; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cpU/Mxqo"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c15cb6f5c12so463014066b.0
        for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 23:28:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786429707; cv=none;
        d=google.com; s=arc-20260327;
        b=qH85oJ7GqhRNQduSTNXPWsoVuZLHwLLBKVu+nHowtt5U6nOXW0sBIDJov3y3ZaFi4E
         Pa5PO4M8Bww/p9J+XPhqivNfrprTVXFrgJGqVj7CG9svha0H7FUT8FapEDd4hrFWyHID
         rTcRKla6DEFTBYKNY8nBQHH/Hq2avK97Pu0IMVm0tLrO8ADyZhrINggNJKpyZ/qudo1c
         Z8dHaIZQVNbpf1Uj7PVzDEyiNPQO9Td94E/24AmMBBoCjNeeX8xdnEkZNVAs0jappVFy
         bbIP1AiGZw3WGlXSnF1ytjumJSJgClVbL/8c1f3ShdzWUtHh89301zEsPHVCGvt+BCeb
         12Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+L03eWNTvcjx0hEnZQGhrVsT1G66BanHRbt58Qj1qko=;
        fh=eaUmn+PmDOkQPvqoMe47InwG945Ca0s8s2tCRhukOxE=;
        b=BeM31xdxuC4BuSIlEU82GLYSV3QebfpXbEMiX2UGkIElAzIKge9SQge4LhBJCgiZAz
         9xFwKVQRPDRCz5TYH2nxf0Y6svWfrmoI+noU6KKn20fcCJbUVl3nUccZr/XbqtDkxIW8
         evZoVLmas2BcUr2rl3rfuqduqa74qfd0ZTJ8QVL13zmmrEW8e1q7ojrFJuiF90O0dw+B
         qiKDRncVz4SK5Vicwodu1Cp+V6+3tO/JG3/T40ZFMhrM2E2arIo2k9mvKpNh/Ljtt2z1
         SpgYOQaQ+VgfbF50Sg+7fZQ6lVCaxWWFwd4rPk9k5yVhdGjN0F9mLWx6vbv9nM1XfzLc
         UCgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786429707; x=1787034507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+L03eWNTvcjx0hEnZQGhrVsT1G66BanHRbt58Qj1qko=;
        b=cpU/MxqoS45daMRHeEzhCICRavOyo65qrJlfVBDjfW+CzrPDgvrZi58Al+z2kHYeYR
         6G8exlga6TyBuucUdm8DVBBwVzCM60gS6gK+nl8a9k/IbtyJEK2LVWsH3k/fn0DVYRYd
         7jzKj8sEhu/zTJSMtK9kN4r3GTQw1evj411KE2ar7rzS3M25wtu3rFKO+GoQJFeqxLyP
         f5G8/rJV1YTbziSAjAj7MiDLVdGTyOjJkbCj9fpTdo24ALA+2QwnvYUtfIRCJs4RRDQ6
         23PUcQYSmW61LV83rJQ+RSM+dlB8ZpGH3iLIeAq9svOHxmZylRz/CpWQ6QlGjMRU1aoN
         MOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786429707; x=1787034507;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+L03eWNTvcjx0hEnZQGhrVsT1G66BanHRbt58Qj1qko=;
        b=Y5oHL15P15wpFQbjiyg93YOUCH9QDatoovEMIgYSzRXvi+hd4F9NqnfCMtfRvg0sTe
         5TjchtpOFwlhcGe8FGsrJlu9cfM+yV3M4as1X+6CWrYfPd/5/MKjcpI7H3/tQcgihOMz
         gxmqxQ6w7cyUX1nSC8X69TS7jaUnCGhBXnBn521580vnd8JOfu4+/J596JHPnzoJ4Lzk
         QoujaqCr7sQ/KSVqVMbEg248pXFU13/Ye+RMp/zi2sqzQ3Powvo0r6oe+9P/Lsz98rhL
         ml6XhaTdsCAGgXi4ZGYBUatq+dFAAQH+AcgdVEV7gBTwzQE3pS2rclRIWO1lCBx1b9IZ
         8sxA==
X-Gm-Message-State: AOJu0Yz2V9kckaVhbCSxd0qRfA2ZHNxrJF+sPGGDAH+YqWA0BiT9xHXe
	sn/+zXYNF/ywvWua8MWg1Y4k9QT0eeIurKZ08wa8GVyTi6ALpifFZO0jQTbS6zoAp4PnuiC2MQT
	nd6EtW76pjv6JnUqxsKPFdVNNPJsMiYbLtj9zD1U=
X-Gm-Gg: AR+sD12SQsb00t21S+SNbDBmIHkGsUl8GD/1DurBMHxZzBvPm4jvanbarPHnn2tNI/T
	ziScJ6pO69NhO/LEB2VZdaNzqqfJjtZa2+j0/3BDePqrWNlX054I/JYQrgaJuyjpu3jrR9iew7m
	V1MjIf1OYwPV0I60AeZG7gTb/G4Oal9EeRCNsNA+NFi/j/EU8rZCJM/htUGVV2Pl6Ap/I6SJx5N
	hpHkhpFeYg7rmymkmmgkmo1pjfUbwwBgChi7avWfAPgUNfmhrnwWaB7rpw8TgZYFpjxkRs0fN0Z
	DyD5ku9TOyE0AJTauRYvdoFFeEK8lPGEzNwiVOEh3C3bKMrm2bjDb9ahe/9+IgUyfoTXBwSQU68
	VjK3J2oYu3IG2g+18NPereer5x5k6wP0=
X-Received: by 2002:a17:907:1b23:b0:c20:223e:940a with SMTP id
 a640c23a62f3a-c20e61db3b1mr40929666b.21.1786429706672; Mon, 10 Aug 2026
 23:28:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810202835.3592833-1-mattst88@gmail.com>
In-Reply-To: <20260810202835.3592833-1-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 11 Aug 2026 08:28:13 +0200
X-Gm-Features: AUfX_mzFmEqU-iQRAbANElLXPLaaATr0MpzE57cvOoATd1JyihA7CsBqmjk3FC0
Message-ID: <CA+=Fv5Q0Arwzd3Rk+AcPHJPF=3TrqH-y65AUCDU=0m5WnYjmOQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] alpha: run the remote RTC access in a worker, not an
 IPI callback
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 10:28=E2=80=AFPM Matt Turner <mattst88@gmail.com> w=
rote:
>
> On Marvel the CMOS clock is only reachable from the boot cpu, so
> remote_read_time() and remote_set_time() bounce the access there with
> smp_call_function_single(), whose callback runs in hard interrupt
> context.
>
> alpha_rtc_read_time() calls mc146818_get_time() with a 10 ms timeout.
> That waits out the RTC update cycle in mc146818_avoid_UIP(), which drops
> rtc_lock and udelay()s 100 us at a time until the update completes or
> the timeout expires:
>
>         for (i =3D 0; UIP_RECHECK_LOOPS_MS(i) < timeout; i++) {
>                 spin_lock_irqsave(&rtc_lock, flags);
>                 ...
>                 if (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) {
>                         spin_unlock_irqrestore(&rtc_lock, flags);
>                         udelay(UIP_RECHECK_DELAY);
>                         continue;
>                 }
>
> So a clock read from a non-boot cpu can spin for up to 10 ms in hard
> interrupt context on the boot cpu, while the cpu that sent the request
> spins in smp_call_function_single() waiting for it to finish.
>
> mc146818_set_time() does not poll, but it takes rtc_lock too, and
> rtc_lock is a spinlock_t.  Only raw spinlocks may be taken in hard
> interrupt context, so lockdep reports the write path as soon as a
> non-boot cpu sets the clock:
>
>   [ BUG: Invalid wait context ]
>   -----------------------------
>   swapper/0/0 is trying to lock:
>   fffffc0003690470 (rtc_lock){....}-{3:3}, at: mc146818_set_time+0x74/0x4=
50
>   other info that might help us debug this:
>   context-{2:2}
>   no locks held by swapper/0/0.
>   stack backtrace:
>   CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.2.0-rc1 #1 NONE
>   Trace:
>   [<fffffc000102ebb0>] dump_stack+0x28/0x44
>   [<fffffc000110efcc>] __lock_acquire+0xb0c/0x1060
>   [<fffffc000110f5f0>] lock_acquire.part.0+0xd0/0x300
>   [...]
>   [<fffffc0001b0d834>] mc146818_set_time+0x74/0x450
>   [<fffffc0001f090cc>] _raw_spin_lock_irqsave+0x7c/0xc0
>   [<fffffc0001042f90>] do_remote_set+0x90/0xc0
>   [<fffffc000119c1a4>] __flush_smp_call_function_queue+0x314/0x5c0
>   [<fffffc000119c474>] generic_smp_call_function_single_interrupt+0x24/0x=
40
>   [<fffffc000103d984>] handle_ipi+0xa4/0x230
>   [<fffffc0001037044>] do_entInt+0x1a4/0x2e0
>
> The rtc class ops are always called from process context, so there is no
> reason to run the access from an interrupt at all.  Use work_on_cpu() to
> run it in a worker on the boot cpu.  Alpha does not support cpu hotplug,
> so the boot cpu cannot go offline while the work is pending.
>
> Tested on an AlphaServer ES47 (Marvel/EV7): hwclock read and write
> pinned to a non-boot cpu, twenty times, with no splat.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/rtc.c | 37 ++++++++++++-------------------------
>  1 file changed, 12 insertions(+), 25 deletions(-)
>
> diff --git a/arch/alpha/kernel/rtc.c b/arch/alpha/kernel/rtc.c
> index cfdf90bc8b3f..9e7d714ef6f8 100644
> --- a/arch/alpha/kernel/rtc.c
> +++ b/arch/alpha/kernel/rtc.c
> @@ -15,6 +15,7 @@
>  #include <linux/bcd.h>
>  #include <linux/rtc.h>
>  #include <linux/platform_device.h>
> +#include <linux/workqueue.h>
>
>  #include "proto.h"
>
> @@ -142,54 +143,40 @@ static const struct rtc_class_ops alpha_rtc_ops =3D=
 {
>  };
>
>  /*
> - * Similarly, except do the actual CMOS access on the boot cpu only.
> - * This requires marshalling the data across an interprocessor call.
> + * Similarly, except do the actual CMOS access on the boot cpu only.  Th=
e
> + * access polls for the RTC update cycle and takes rtc_lock, so run it i=
n a
> + * worker on that cpu rather than from an interprocessor interrupt.
>   */
>
>  #if defined(CONFIG_SMP) && \
>      (defined(CONFIG_ALPHA_GENERIC) || defined(CONFIG_ALPHA_MARVEL))
>  # define HAVE_REMOTE_RTC 1
>
> -union remote_data {
> -       struct rtc_time *tm;
> -       long retval;
> -};
> -
> -static void
> +static long
>  do_remote_read(void *data)
>  {
> -       union remote_data *x =3D data;
> -       x->retval =3D alpha_rtc_read_time(NULL, x->tm);
> +       return alpha_rtc_read_time(NULL, data);
>  }
>
>  static int
>  remote_read_time(struct device *dev, struct rtc_time *tm)
>  {
> -       union remote_data x;
> -       if (smp_processor_id() !=3D boot_cpuid) {
> -               x.tm =3D tm;
> -               smp_call_function_single(boot_cpuid, do_remote_read, &x, =
1);
> -               return x.retval;
> -       }
> +       if (smp_processor_id() !=3D boot_cpuid)
> +               return work_on_cpu(boot_cpuid, do_remote_read, tm);
>         return alpha_rtc_read_time(NULL, tm);
>  }
>
> -static void
> +static long
>  do_remote_set(void *data)
>  {
> -       union remote_data *x =3D data;
> -       x->retval =3D alpha_rtc_set_time(NULL, x->tm);
> +       return alpha_rtc_set_time(NULL, data);
>  }
>
>  static int
>  remote_set_time(struct device *dev, struct rtc_time *tm)
>  {
> -       union remote_data x;
> -       if (smp_processor_id() !=3D boot_cpuid) {
> -               x.tm =3D tm;
> -               smp_call_function_single(boot_cpuid, do_remote_set, &x, 1=
);
> -               return x.retval;
> -       }
> +       if (smp_processor_id() !=3D boot_cpuid)
> +               return work_on_cpu(boot_cpuid, do_remote_set, tm);
>         return alpha_rtc_set_time(NULL, tm);
>  }
>
Hi Matt,

The change looks good to me. I also built and booted the series on
an AlphaServer ES40, although that machine does not exercise the
Marvel remote-RTC path.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

Thanks,
Magnus
