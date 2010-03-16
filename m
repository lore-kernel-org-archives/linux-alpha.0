From: "Will L Givens" <wlgivens@gmail.com>
Subject: RE: Will's kernel compilation error
Date: Mon, 15 Mar 2010 21:34:55 -0500
Message-ID: <001d01cac4b1$44711e80$cd535b80$@com>
References: <b4198de61003151609je8a94ceyf6dd39acfd1a5876@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:cc:references
         :in-reply-to:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding:x-mailer:thread-index:content-language;
        bh=i+a39n/mPLRz7moQN7qEB9F5Q4qYLr6MoE65ygRMTaw=;
        b=WV/iJY5hT4+dk+A/Yjk+X1bAcd5YBV3W+8hUdaLfSU0LEB7tw62mujU2MMDU0zTkCd
         mR+PIoaO8alMvx8qG6IQUGk361VI0zxtLA9xSvz00w+6GK1awqA5n84bCNTWH49qY+ti
         bVdD4iRUNoB6swVwNw/9NcpyHuW7SCGGu529I=
In-Reply-To: <b4198de61003151609je8a94ceyf6dd39acfd1a5876@mail.gmail.com>
Content-Language: en-us
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

> > =A0AS =A0 =A0 =A0arch/alpha/lib/strncpy.o
> > =A0CC =A0 =A0 =A0arch/alpha/lib/udelay.o
> > =A0AR =A0 =A0 =A0arch/alpha/lib/lib.a
> > =A0LD =A0 =A0 =A0vmlinux.o
> > =A0MODPOST vmlinux.o
> > WARNING: modpost: Found 1 section mismatch(es).
> > To see full details build your kernel with:
> > 'make CONFIG_DEBUG_SECTION_MISMATCH=3Dy'
> > =A0GEN =A0 =A0 .version
> > =A0CHK =A0 =A0 include/generated/compile.h
> > =A0UPD =A0 =A0 include/generated/compile.h
> > =A0CC =A0 =A0 =A0init/version.o
> > =A0LD =A0 =A0 =A0init/built-in.o
> > =A0LD =A0 =A0 =A0.tmp_vmlinux1
> > kernel/built-in.o: In function `kthread_create':
> > (.text+0x1ece4): relocation truncated to fit: GPREL16 against symbo=
l
> > `kthreadd_task' defined in .sbss section in kernel/built-in.o
> > kernel/built-in.o: In function `check_cpu_itimer':
> > (.text+0x21784): relocation truncated to fit: GPREL16 against `.sbs=
s'
> > kernel/built-in.o: In function `check_cpu_itimer':
> > (.text+0x2179c): relocation truncated to fit: GPREL16 against `.sbs=
s'
> > kernel/built-in.o: In function `free_nsproxy':
> > (.text+0x23064): relocation truncated to fit: GPREL16 against `.sbs=
s'
> > kernel/built-in.o: In function `create_new_namespaces':
> > (.text+0x230a4): relocation truncated to fit: GPREL16 against `.sbs=
s'
> > kernel/built-in.o: In function `create_new_namespaces':
> > (.text+0x23254): relocation truncated to fit: GPREL16 against `.sbs=
s'

=46ound a patch for the 'section mismatch'... the GPREL16 error still r=
emains
though.

[root@jericho linux]# cat ../kernels/linux-2.6.x-PCI_REGISER_SET_VGA.pa=
tch
---
a/drivers/pci/pci.c~pci-kill-off-pci_register_set_vga_state-symbol-expo=
rt
+++ a/drivers/pci/pci.c
@@ -3023,7 +3023,6 @@  EXPORT_SYMBOL(pcim_pin_device);
 EXPORT_SYMBOL(pci_disable_device);
 EXPORT_SYMBOL(pci_find_capability);
 EXPORT_SYMBOL(pci_bus_find_capability);
-EXPORT_SYMBOL(pci_register_set_vga_state);
 EXPORT_SYMBOL(pci_release_regions);
 EXPORT_SYMBOL(pci_request_regions);
 EXPORT_SYMBOL(pci_request_regions_exclusive);

--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
