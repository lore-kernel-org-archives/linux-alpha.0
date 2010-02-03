From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: PTR_ERR overwrites -EINVAL in syscall osf_mount
Date: Wed, 3 Feb 2010 10:52:54 -0500
Message-ID: <b4198de61002030752u24ae20bbt2c09dc9d1c141503@mail.gmail.com>
References: <4B699B06.2040202@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=PJTWjAxmS1Wiu/qdhBmWjZj1OhU3wkoCukQc54DiKcg=;
        b=S1aHd8AqgARvcKO0LS9lP6LQiaIl40MyH77F0jHa1aC51m/skktYWkkwSJFheQbLnw
         nwlpex/yf0gcyR22lSu6TkfyMsAQ459eaFFf3+iKD21lufrVas+gqmzxzSwqZdsHS240
         u0IZCXI7a4bXU7ZHM97+gSyfqvgt5eHcAPs1A=
In-Reply-To: <4B699B06.2040202@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Roel Kluin <roel.kluin@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>

On Wed, Feb 3, 2010 at 10:49 AM, Roel Kluin <roel.kluin@gmail.com> wrot=
e:
> The initial -EINVAL value is overwritten by `retval =3D PTR_ERR(name)=
'.
> If this isn't an error pointer and typenr is not 1, 6 or 9, then
> this retval, a pointer cast to a long, is returned.
>
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
> ---
> Was this intended? Not sure whether this can occur, found by code
> analysis.
>
> diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.=
c
> index 62619f2..53c213f 100644
> --- a/arch/alpha/kernel/osf_sys.c
> +++ b/arch/alpha/kernel/osf_sys.c
> @@ -361,7 +361,7 @@ osf_procfs_mount(char *dirname, struct procfs_arg=
s __user *args, int flags)
> =A0SYSCALL_DEFINE4(osf_mount, unsigned long, typenr, char __user *, p=
ath,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int, flag, void __user *, data)
> =A0{
> - =A0 =A0 =A0 int retval =3D -EINVAL;
> + =A0 =A0 =A0 int retval;
> =A0 =A0 =A0 =A0char *name;
>
> =A0 =A0 =A0 =A0name =3D getname(path);
> @@ -379,6 +379,7 @@ SYSCALL_DEFINE4(osf_mount, unsigned long, typenr,=
 char __user *, path,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0retval =3D osf_procfs_mount(name, data=
, flag);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 retval =3D -EINVAL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk("osf_mount(%ld, %x)\n", typenr,=
 flag);
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0putname(name);
>

Looks like a bug to me as well. Can anyone else confirm?

Matt Turner
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
