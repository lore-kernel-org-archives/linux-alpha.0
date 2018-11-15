From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 2/9] alpha: force PCI on for non-jensen configs
Date: Thu, 15 Nov 2018 20:05:30 +0100
Message-ID: <20181115190538.17016-3-hch@lst.de>
References: <20181115190538.17016-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=kW4IZ50dTVLE0ZGSEmrOaBcjCtzndNxGLa47dnAiUQI=; b=f2Jh0KMiTEjztiqW6Rfg8QrrIy
        EbYyB1SUGTOFIJQxSYYLoPVZglVWmYoabBCNVi0l7wGq+lPGwlT+4T2E+oIcW50sKBw5MaNSjH9p4
        TfvSrdsPnWbJvbA7lPsldZ/CAqYgiMarNoXeMPZbjMiQqqoUFxCczz4ZMNKaK2qohomrEAb5gKTHX
        tdFfuLqXnD6e+hPiNBYHAJ/TD+6EVWAGNMLiVERYGwJ/+j7Gm3IrHJJuIG09Amu1r2EQ5PxJuNlT5
        +4zDRJtx6sWQVvCCnJRvARtgeP7ayqxKmUrrT3t9SJAR1UymG7vPlzyBQWfh/eppfVxVV55D0j3ha
    
In-Reply-To: <20181115190538.17016-1-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Matt Porter <mporter@kernel.crashing.org>, Alexandre Bounine <alex.bou9@gmail.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-mips@linux-mips.org

Without PCI support the kernel won't even compile, so force it on.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 5b4f88363453..65f6d0bf69d4 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -6,6 +6,7 @@ config ALPHA
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select ARCH_NO_PREEMPT
 	select ARCH_USE_CMPXCHG_LOCKREF
+	select PCI if !ALPHA_JENSEN
 	select HAVE_AOUT
 	select HAVE_IDE
 	select HAVE_OPROFILE
-- 
2.19.1

