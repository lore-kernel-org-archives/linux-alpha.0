From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: convert perf_event to use local_t
Date: Thu, 12 Aug 2010 09:50:33 -0400
Message-ID: <AANLkTikWBky79bd5u78Bkm3P2KXrVU=0dWCehEU7sGZg@mail.gmail.com>
References: <1281606545-20017-1-git-send-email-mcree@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=flAylM84EsTg7xOjdj5iyKqZfsCd79mybQd2V2BakN0=;
        b=lFZ5oz5jazNfz3LVLWmWxGXoaGmHdHlRZ6kq2QmsqDO5/BbGzK5c7MwFz7WCkDBCvx
         +QYRw0GO9i/1D00FrRi6PzLQTWp7ItysS2TcNt+0SfcEsbula0gYsyhx5PrVhenlSXxZ
         yxST/m/foFao7x0gWI4t8we8RjVCwFxQVzSlw=
In-Reply-To: <1281606545-20017-1-git-send-email-mcree@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michael Cree <mcree@orcon.net.nz>
Cc: linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Andrew Morton <akpm@linux-foundation.org>, linux-alpha@vger.kernel.org

On Thu, Aug 12, 2010 at 5:49 AM, Michael Cree <mcree@orcon.net.nz> wrot=
e:
> Updates the Alpha perf_event code to match the changes
> recently made to the core perf_event code in commit
> e78505958cf123048fb48cb56b79cebb8edd15fb.
>
> Signed-off-by: Michael Cree <mcree@orcon.net.nz>
> ---
> =A0arch/alpha/kernel/perf_event.c | =A0 18 +++++++++---------
> =A01 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_=
event.c
> index 51c39fa..85d8e4f 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -241,20 +241,20 @@ static inline unsigned long alpha_read_pmc(int =
idx)
> =A0static int alpha_perf_event_set_period(struct perf_event *event,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct=
 hw_perf_event *hwc, int idx)
> =A0{
> - =A0 =A0 =A0 long left =3D atomic64_read(&hwc->period_left);
> + =A0 =A0 =A0 long left =3D local64_read(&hwc->period_left);
> =A0 =A0 =A0 =A0long period =3D hwc->sample_period;
> =A0 =A0 =A0 =A0int ret =3D 0;
>
> =A0 =A0 =A0 =A0if (unlikely(left <=3D -period)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0left =3D period;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 atomic64_set(&hwc->period_left, left);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 local64_set(&hwc->period_left, left);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0hwc->last_period =3D period;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D 1;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0if (unlikely(left <=3D 0)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0left +=3D period;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 atomic64_set(&hwc->period_left, left);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 local64_set(&hwc->period_left, left);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0hwc->last_period =3D period;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D 1;
> =A0 =A0 =A0 =A0}
> @@ -269,7 +269,7 @@ static int alpha_perf_event_set_period(struct per=
f_event *event,
> =A0 =A0 =A0 =A0if (left > (long)alpha_pmu->pmc_max_period[idx])
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0left =3D alpha_pmu->pmc_max_period[idx=
];
>
> - =A0 =A0 =A0 atomic64_set(&hwc->prev_count, (unsigned long)(-left));
> + =A0 =A0 =A0 local64_set(&hwc->prev_count, (unsigned long)(-left));
>
> =A0 =A0 =A0 =A0alpha_write_pmc(idx, (unsigned long)(-left));
>
> @@ -300,10 +300,10 @@ static unsigned long alpha_perf_event_update(st=
ruct perf_event *event,
> =A0 =A0 =A0 =A0long delta;
>
> =A0again:
> - =A0 =A0 =A0 prev_raw_count =3D atomic64_read(&hwc->prev_count);
> + =A0 =A0 =A0 prev_raw_count =3D local64_read(&hwc->prev_count);
> =A0 =A0 =A0 =A0new_raw_count =3D alpha_read_pmc(idx);
>
> - =A0 =A0 =A0 if (atomic64_cmpxchg(&hwc->prev_count, prev_raw_count,
> + =A0 =A0 =A0 if (local64_cmpxchg(&hwc->prev_count, prev_raw_count,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 new_raw_count=
) !=3D prev_raw_count)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto again;
>
> @@ -316,8 +316,8 @@ again:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0delta +=3D alpha_pmu->pmc_max_period[i=
dx] + 1;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 atomic64_add(delta, &event->count);
> - =A0 =A0 =A0 atomic64_sub(delta, &hwc->period_left);
> + =A0 =A0 =A0 local64_add(delta, &event->count);
> + =A0 =A0 =A0 local64_sub(delta, &hwc->period_left);
>
> =A0 =A0 =A0 =A0return new_raw_count;
> =A0}
> @@ -636,7 +636,7 @@ static int __hw_perf_event_init(struct perf_event=
 *event)
> =A0 =A0 =A0 =A0if (!hwc->sample_period) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0hwc->sample_period =3D alpha_pmu->pmc_=
max_period[0];
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0hwc->last_period =3D hwc->sample_perio=
d;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 atomic64_set(&hwc->period_left, hwc->sa=
mple_period);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 local64_set(&hwc->period_left, hwc->sam=
ple_period);
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0return 0;
> --
> 1.7.1
>
>

Thanks Michael. I'll apply this when I get back from vacation.
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
