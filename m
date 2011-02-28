From: Matt Turner <mattst88@gmail.com>
Subject: Re: [patch 1/1] alpha: Fix use of irq_to_desc in irq.c
Date: Mon, 28 Feb 2011 14:17:21 +0000
Message-ID: <AANLkTi=mysUTYkQ=+K9vLJCo=rG6ZLza7TN0PqNAMWa+@mail.gmail.com>
References: <4D6B99EB.1040803@linux-kernel.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=0+dZ6vTh3HMPK4iua03K9lL2yZ1vg9S7xL/loDGVyzI=;
        b=bS5QQg50MQEO1vUORtYvpXxnoRfPoK2HbweqiYRNg3DlwjVm1y/26Acnv78LDdAIjS
         K7HPrS6bwNGaOJvpq6nM3jFf9JL3wT6csHdljSN2Eche22j8tjO6plOEk+rO+NwS3qA7
         r2TLUAW2A21a3Ke1Q/WMXTX3sV36I9NppOKKY=
In-Reply-To: <4D6B99EB.1040803@linux-kernel.at>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Oliver Falk <oliver@linux-kernel.at>
Cc: linux-alpha@vger.kernel.org, kyle@redhat.com

On Mon, Feb 28, 2011 at 12:49 PM, Oliver Falk <oliver@linux-kernel.at> =
wrote:
> Fixes:
> arch/alpha/kernel/irq.c: In function =91irq_select_affinity=92:
> arch/alpha/kernel/irq.c:47: error: subscripted value is neither array=
 nor
> pointer
> make[1]: *** [arch/alpha/kernel/irq.o] Error 1
>
>
> --- arch/alpha/kernel/irq.c.orig =A0 =A0 =A0 =A02011-02-28 11:34:05.0=
00000000 +0100
> +++ arch/alpha/kernel/irq.c =A0 =A0 2011-02-28 11:32:24.000000000 +01=
00
> @@ -44,7 +44,7 @@
>
> =A0int irq_select_affinity(unsigned int irq)
> =A0{
> - =A0 =A0 =A0 struct irq_desc *desc =3D irq_to_desc[irq];
> + =A0 =A0 =A0 struct irq_desc *desc =3D irq_to_desc(irq);
> =A0 =A0 =A0 =A0static int last_cpu;
> =A0 =A0 =A0 =A0int cpu =3D last_cpu + 1;
>
>
> Seems to be a typo from here:
>
> <http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=
=3Dcommitdiff;h=3Da891b393dd7f6ed84ecee98c0eac4a808ff2cbbc>
>
> -of
>

Thanks!

mhl actually sent a patch for this recently, and it's been sitting in
my tree [1] because I haven't had time to push it to Linus. Sorry
about this and that you hit this bug.

I'll get everything sent to Linus this week. Thanks for the patch!

Matt

[1] http://git.kernel.org/?p=3Dlinux/kernel/git/mattst88/alpha-2.6.git;=
a=3Dsummary
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
