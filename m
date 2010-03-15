From: Jaswinder Singh Rajput <jaswinderlinux@gmail.com>
Subject: Re: Alpha: Compilation error 2.6.34-rc1 git a3d3203e4b
Date: Mon, 15 Mar 2010 12:56:24 +0530
Message-ID: <3f9a31f41003150026j6adba38em1e08e8e788c7c063@mail.gmail.com>
References: <4B9DDCD8.4070902@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=rJoeEDKGzsxYmbMY8GWfgMKrT3fJDQ2ZfU4bcdJV3+M=;
        b=pH+Cq7m4KAbTQYJgKz0bKR4K+ElxUQCv30zlVM5jTaa/znzJbWNbKfZKste3M0YuQW
         azDN7OdyxI9gvfrK52wYpV7+m/J7PBcLv0ZeCMgE2HJ3RZU4U6gNUZAgA4BhcixBuaBT
         /N+Noff1m7rYN2a0rWKcu8E56lotV/wEtnqp0=
In-Reply-To: <4B9DDCD8.4070902@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Michael Cree <mcree@orcon.net.nz>, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On Mon, Mar 15, 2010 at 12:38 PM, Michael Cree <mcree@orcon.net.nz> wro=
te:
> Compilation error while compiling latest kernel (commit a3d3203e4b) o=
n
> Alpha:
>
> =A0CC =A0 =A0 =A0init/do_mounts.o
> In file included from
> /home/mjc/linux/linux-git/arch/alpha/include/asm/dma-mapping.h:13,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/dma-mapping.h:103,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/mjc/linux/linux-git/arch/alpha/include/asm/pci.h:7,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/pci.h:1209,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/mjc/linux/linux-git/arch/alpha/include/asm/core_tsunami.h:5,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/mjc/linux/linux-git/arch/alpha/include/asm/io.h:229,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/scatterlist.h:8,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/sunrpc/xdr.h:15,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/sunrpc/sched.h:17,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/sunrpc/auth.h:14,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/nfs_fs.h:47,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from init/do_mounts.c:19:
> include/asm-generic/dma-mapping-common.h: In function =91dma_map_sg_a=
ttrs=92:
> include/asm-generic/dma-mapping-common.h:49: error: implicit declarat=
ion of
> function =91for_each_sg=92
> include/asm-generic/dma-mapping-common.h:50: error: expected =91;=92 =
before
> =91kmemcheck_mark_initialized=92
> make[1]: *** [init/do_mounts.o] Error 1
>
> I note that for_each_sg is defined in include/linux/scatterlist.h, wh=
ich
> arch/alpha/include/asm/dma-mapping.h attempts to load, however
> include/linux/scatterlist.h was the one that included (indirectly)
> arch/alpha/include/asm/dma-mapping.h. =A0There is therefore a complet=
e loop of
> includes from include/linux/scatterlist.h back to itself.
>

CCing to concern person.

--
JSR
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
