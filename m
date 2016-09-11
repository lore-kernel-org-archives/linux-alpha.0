From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] alpha: squash lines for immediate return
Date: Sun, 11 Sep 2016 15:26:51 +0900
Message-ID: <1473575211-24416-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com u8B6QvP2017166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1473575221;
        bh=Z8MMYsBSRYzrGIy99ohBDsb11PPki5gjeIeOnW6IXI0=;
        h=From:To:Cc:Subject:Date:From;
        b=APN/1u9gwzys/fh2UDSNx7wbXJCsLg1NUpwDeC33s4jZdfUrO+ea9QsnGrXdxn+4O
         rZegadvtHBgZRhrXF+rsHpHbhSPEwqMxDHAo27aWcfIo3jeHwa+whEnMiTAwEhNLMn
         WB/mingi072dbhtaxcohT+9YDGuLAkrhWNjXUJEfsBPaQOJSrPjliLDE36AV/2u4Va
         reBLrcFJGSfPTdm1Ubvopl7zm1e//2cqtDtLeGQsq80IxFhF24X18C/6qI7RvfeZgu
         jTnknZPt+YAmVPnaU6L5TxniuaxEOsGMyMLBfvtkpWiSrnZGdDXFwi69xC1G2+T6rK
         WK/gtz20eJVQA==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Vineet Gupta <vgupta@synopsys.com>, David Vrabel <david.vrabel@citrix.com>, linux-kernel@vger.kernel.org, Matt Turner <mattst88@gmail.com>, Robin Murphy <robin.murphy@arm.com>, Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>, Yinghai Lu <yinghai@kernel.org>, Joerg Roedel <jroedel@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>

Remove unneeded variables and assignments.

While we are here, fix the coding style of SMC37c669_read_config():
  - replace whitespaces at the start of lines with tabs
  - remove unneeded whitespaces around parentheses

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/alpha/kernel/pci-noop.c  | 6 +-----
 arch/alpha/kernel/pci.c       | 6 +-----
 arch/alpha/kernel/smc37c669.c | 7 ++-----
 3 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/arch/alpha/kernel/pci-noop.c b/arch/alpha/kernel/pci-noop.c
index bb152e2..4166827 100644
--- a/arch/alpha/kernel/pci-noop.c
+++ b/arch/alpha/kernel/pci-noop.c
@@ -42,11 +42,7 @@ alloc_pci_controller(void)
 struct resource * __init
 alloc_resource(void)
 {
-	struct resource *res;
-
-	res = alloc_bootmem(sizeof(*res));
-
-	return res;
+	return alloc_bootmem(sizeof(struct resource));
 }
 
 asmlinkage long
diff --git a/arch/alpha/kernel/pci.c b/arch/alpha/kernel/pci.c
index 5f387ee..8322df1 100644
--- a/arch/alpha/kernel/pci.c
+++ b/arch/alpha/kernel/pci.c
@@ -379,11 +379,7 @@ alloc_pci_controller(void)
 struct resource * __init
 alloc_resource(void)
 {
-	struct resource *res;
-
-	res = alloc_bootmem(sizeof(*res));
-
-	return res;
+	return alloc_bootmem(sizeof(struct resource));
 }
 
 
diff --git a/arch/alpha/kernel/smc37c669.c b/arch/alpha/kernel/smc37c669.c
index c803fc7..4dbd4e4 100644
--- a/arch/alpha/kernel/smc37c669.c
+++ b/arch/alpha/kernel/smc37c669.c
@@ -2007,11 +2007,8 @@ static void __init SMC37c669_config_mode(
 static unsigned char __init SMC37c669_read_config( 
     unsigned char index )
 {
-    unsigned char data;
-
-    wb( &SMC37c669->index_port, index );
-    data = rb( &SMC37c669->data_port );
-    return data;
+	wb(&SMC37c669->index_port, index);
+	return rb(&SMC37c669->data_port);
 }
 
 /*
-- 
1.9.1

