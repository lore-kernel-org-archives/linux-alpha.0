From: Richard Henderson <rth@twiddle.net>
Subject: [PATCH 7/7] alpha: Fix type compatibility warning for marvel_map_irq
Date: Tue, 16 Jul 2013 10:04:40 -0700
Message-ID: <1373994280-12047-8-git-send-email-rth@twiddle.net>
References: <1373994280-12047-1-git-send-email-rth@twiddle.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=3dSiwWm5oltJVjxHXh1p0euab4eRT1zbPU5E1a2KEHQ=;
        b=W9pI6XmNFUF4PojupxBrH8nRKn198cbndy+2woQ1k6G9gSCFsclrPmbXlBmw5iUeme
         8dSvtp57gTbNA80pJft/8fYcxIWJIFUAVZgdQ8h99CjhpfE4jWwzJrBOCO982HhEDXrd
         7AxVN4QeVgyZjMUxp9NO2jMHQMFwznBXiYNaM0DC/6KIVEU90At64ncEinzV/gn3M8Qc
         IcCJTl4D3o2UWVvUcVNC/ERHiYr60K20SZqxdMRNgI9sjANjt6/Mhbi5+4CvgcwjBPUZ
         oLIu/INgCQ66MoABtOmFp35+HW1auJk6XO9C7I4fAUt7j1FfHbce+VSMR6OXzvb827Xb
         6LOg==
In-Reply-To: <1373994280-12047-1-git-send-email-rth@twiddle.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 arch/alpha/kernel/sys_marvel.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/sys_marvel.c b/arch/alpha/kernel/sys_marvel.c
index 407accc..53d6e4a 100644
--- a/arch/alpha/kernel/sys_marvel.c
+++ b/arch/alpha/kernel/sys_marvel.c
@@ -317,8 +317,9 @@ marvel_init_irq(void)
 }
 
 static int 
-marvel_map_irq(struct pci_dev *dev, u8 slot, u8 pin)
+marvel_map_irq(const struct pci_dev *cdev, u8 slot, u8 pin)
 {
+	struct pci_dev *dev = (struct pci_dev *)dev;
 	struct pci_controller *hose = dev->sysdata;
 	struct io7_port *io7_port = hose->sysdata;
 	struct io7 *io7 = io7_port->io7;
-- 
1.8.1.4
