From: Matt Turner <mattst88@gmail.com>
Subject: Re: [patch 2/6] alpha: cpumask_of_node() should handle -1 as a node
Date: Thu, 14 Jan 2010 13:24:15 -0500
Message-ID: <b4198de61001141024p4d21bbb6i6e24aa55c1876239@mail.gmail.com>
References: <20100106045509.245662398@samba.org>
	 <20100106045524.959942683@samba.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=VcAwLdvopfhP7v/171JhOg6WGe8VBo3p+6ASpLbFbNA=;
        b=hJNol+7AATqFgeU2auE2AJ0DwO1b8aGmCrfPqJyuzdPwAiy+eHkouOKwNSX2hiV4cW
         k3vxg6AUmeAtfnXpnHbtJ3xcRtiXoIB96aiEj37zDtfzOi1UG8Ai0JYAA9tgMcTJNtt3
         QZ1oXEzmzm/8v2GZrjHd8GuuTjjqk+21CrrkY=
In-Reply-To: <20100106045524.959942683@samba.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Anton Blanchard <anton@samba.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, Andrew Morton <akpm@linux-foundation.org>

On Tue, Jan 5, 2010 at 11:55 PM, Anton Blanchard <anton@samba.org> wrot=
e:
> pcibus_to_node can return -1 if we cannot determine which node a pci =
bus
> is on. If passed -1, cpumask_of_node will negatively index the lookup=
 array
> and pull in random data:
>
> # cat /sys/devices/pci0000:00/0000:00:01.0/local_cpus
> 00000000,00000003,00000000,00000000
> # cat /sys/devices/pci0000:00/0000:00:01.0/local_cpulist
> 64-65
>
> Change cpumask_of_node to check for -1 and return cpu_all_mask in thi=
s
> case:
>
> # cat /sys/devices/pci0000:00/0000:00:01.0/local_cpus
> ffffffff,ffffffff,ffffffff,ffffffff
> # cat /sys/devices/pci0000:00/0000:00:01.0/local_cpulist
> 0-127
>
> Signed-off-by: Anton Blanchard <anton@samba.org>
> ---
>
> Index: linux-cpumask/arch/alpha/include/asm/topology.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-cpumask.orig/arch/alpha/include/asm/topology.h =A0 =A0 =A0 =
=A02010-01-06 15:20:22.952583839 +1100
> +++ linux-cpumask/arch/alpha/include/asm/topology.h =A0 =A0 2010-01-0=
6 15:20:46.610083557 +1100
> @@ -28,6 +28,9 @@ static const struct cpumask *cpumask_of_
> =A0{
> =A0 =A0 =A0 =A0int cpu;
>
> + =A0 =A0 =A0 if (node =3D=3D -1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return cpu_all_mask;
> +
> =A0 =A0 =A0 =A0cpumask_clear(&node_to_cpumask_map[node]);
>
> =A0 =A0 =A0 =A0for_each_online_cpu(cpu) {
>
> --

Thanks! I've added this to alpha-2.6.

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
