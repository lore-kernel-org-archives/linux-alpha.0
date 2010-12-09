From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha/osf_sys: remove unused MAX_SELECT_SECONDS
Date: Thu, 9 Dec 2010 04:15:11 +0000
Message-ID: <AANLkTika4_MwT_FknXGh-Q+Ve_ZL+opWBb5+vaCR-q9t@mail.gmail.com>
References: <1291867641-31998-1-git-send-email-namhyung@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=nHxaK3mEoHn3Ts31HGhVW9GVnNOsZxTS+Si11n14tjw=;
        b=dw5saVaDSOyR1mRgU1l7M7LSgI+6QVhfDo5F9x5u7mfNGU90OVXRnjNk+7YVoVhSbm
         ogDQs051BqkNbmhkf4OLmjDdII4xIXHdNP23dzEIiz6Pvcg0OBShVLpWbOXdRQZT8BXv
         MV2D++4ijxISmCcjje9nnSwa+izXSYH7cnvXc=
In-Reply-To: <1291867641-31998-1-git-send-email-namhyung@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Namhyung Kim <namhyung@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>

On Thu, Dec 9, 2010 at 4:07 AM, Namhyung Kim <namhyung@gmail.com> wrote=
:
> Remove the leftover from the commit 14e2acd86865 ("select:
> fix alpha OSF wrapper").
>
> Signed-off-by: Namhyung Kim <namhyung@gmail.com>
> Cc: Arjan van de Ven <arjan@linux.intel.com>
> ---
> =A0arch/alpha/kernel/osf_sys.c | =A0 =A03 ---
> =A01 files changed, 0 insertions(+), 3 deletions(-)
>
> diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.=
c
> index 547e8b84b2f7..fe698b5045e9 100644
> --- a/arch/alpha/kernel/osf_sys.c
> +++ b/arch/alpha/kernel/osf_sys.c
> @@ -951,9 +951,6 @@ SYSCALL_DEFINE2(osf_utimes, const char __user *, =
filename,
> =A0 =A0 =A0 =A0return do_utimes(AT_FDCWD, filename, tvs ? tv : NULL, =
0);
> =A0}
>
> -#define MAX_SELECT_SECONDS \
> - =A0 =A0 =A0 ((unsigned long) (MAX_SCHEDULE_TIMEOUT / HZ)-1)
> -
> =A0SYSCALL_DEFINE5(osf_select, int, n, fd_set __user *, inp, fd_set _=
_user *, outp,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fd_set __user *, exp, struct timeval32=
 __user *, tvp)
> =A0{
> --
> 1.7.3.3.400.g93cef

Thanks! I'll vacuum this up for the next merge window.

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
