From: Michael Cree <mcree@orcon.net.nz>
Subject: Alpha:  Compilation error 2.6.34-rc1 git a3d3203e4b
Date: Mon, 15 Mar 2010 20:08:08 +1300
Message-ID: <4B9DDCD8.4070902@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: linux-kernel@vger.kernel.org
Cc: linux-alpha@vger.kernel.org

Compilation error while compiling latest kernel (commit a3d3203e4b) on=20
Alpha:

   CC      init/do_mounts.o
In file included from=20
/home/mjc/linux/linux-git/arch/alpha/include/asm/dma-mapping.h:13,
                  from include/linux/dma-mapping.h:103,
                  from=20
/home/mjc/linux/linux-git/arch/alpha/include/asm/pci.h:7,
                  from include/linux/pci.h:1209,
                  from=20
/home/mjc/linux/linux-git/arch/alpha/include/asm/core_tsunami.h:5,
                  from=20
/home/mjc/linux/linux-git/arch/alpha/include/asm/io.h:229,
                  from include/linux/scatterlist.h:8,
                  from include/linux/sunrpc/xdr.h:15,
                  from include/linux/sunrpc/sched.h:17,
                  from include/linux/sunrpc/auth.h:14,
                  from include/linux/nfs_fs.h:47,
                  from init/do_mounts.c:19:
include/asm-generic/dma-mapping-common.h: In function =91dma_map_sg_att=
rs=92:
include/asm-generic/dma-mapping-common.h:49: error: implicit declaratio=
n=20
of function =91for_each_sg=92
include/asm-generic/dma-mapping-common.h:50: error: expected =91;=92 be=
fore=20
=91kmemcheck_mark_initialized=92
make[1]: *** [init/do_mounts.o] Error 1

I note that for_each_sg is defined in include/linux/scatterlist.h, whic=
h=20
arch/alpha/include/asm/dma-mapping.h attempts to load, however=20
include/linux/scatterlist.h was the one that included (indirectly)=20
arch/alpha/include/asm/dma-mapping.h.  There is therefore a complete=20
loop of includes from include/linux/scatterlist.h back to itself.

Cheers
Michael.
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
