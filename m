From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 4/4] alpha: silence 'const' warning in sys_marvel.c
Date: Tue,  1 May 2012 22:27:24 -0400
Message-ID: <1335925644-5192-4-git-send-email-mattst88@gmail.com>
References: <1335925644-5192-1-git-send-email-mattst88@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
        bh=E1Poo2SG0xKi9Hs3ZL2j4L/az27//xoh8LL/WoXe4Y0=;
        b=Ddf3UpFhfjfu5zavYIYmANKNVKkRf2YKxJeURAG1obiuuDdM3N779IQBL5Wv0+PN5f
         W1oEjLTf5azA18pdGzhEbzrFmUEqLzN5tT2dQRrj23vvUIJHY+0GpHOnSN1NSSjPHtfR
         iricfe9kgKC7Z5zCukkI+sGYouN5LNXtcRh2HlGbk9Yp5ICaiQyKegP/PxmaOAh85CeJ
         8noFz3u8ggZWPVhz+y1tjhA8aleU/SgOI6N9yek8e7e8hB97XbCk0OMWR4NSP9Fs9mmU
         wdOY6d8pV9gTWpCJMlds3B6ExVEk3RxHK1HeG92T5iJEkepUM0YAUsBqimNTZKEX6Xeu
         08rA==
In-Reply-To: <1335925644-5192-1-git-send-email-mattst88@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-kernel@vger.kernel.org, Matt Turner <mattst88@gmail.com>

warning: passing argument 1 of 'pci_find_capability' discards 'const' qualifier from pointer target type

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/sys_marvel.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/kernel/sys_marvel.c b/arch/alpha/kernel/sys_marvel.c
index 14a4b6a..407accc 100644
--- a/arch/alpha/kernel/sys_marvel.c
+++ b/arch/alpha/kernel/sys_marvel.c
@@ -317,7 +317,7 @@ marvel_init_irq(void)
 }
 
 static int 
-marvel_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
+marvel_map_irq(struct pci_dev *dev, u8 slot, u8 pin)
 {
 	struct pci_controller *hose = dev->sysdata;
 	struct io7_port *io7_port = hose->sysdata;
-- 
1.7.3.4
