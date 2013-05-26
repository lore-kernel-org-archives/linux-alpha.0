From: Jiang Liu <liuj97@gmail.com>
Subject: [PATCH v3, part2 05/20] PCI, Alpha: use hotplug-safe iterators to walk PCI buses
Date: Sun, 26 May 2013 23:53:02 +0800
Message-ID: <1369583597-3801-6-git-send-email-jiang.liu@huawei.com>
References: <1369583597-3801-1-git-send-email-jiang.liu@huawei.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
        bh=h1I31wETswUoXtWIyRRpXgTWsJnaPFJtEiqitC2LKDU=;
        b=oOx/GsnpGcwtb4suHT53rZjFkkVJlHi3MZpk0ZnUKxvN4AjLNr8ZwgGPGyqWVJ8pil
         /8PQljzct5zm/O7Hoz2HYKEEDKm/pKoWT+El7EJpm1evEc4D/HPQI3T4KkrVw7d5Zbhq
         DjoCNJMkh7DpuBSN/zZ+/zsZ4qtL0JmuwnzGcnOov6TkXPQx4BRjCaGh5cnNMMJcyTBk
         EYBnNkVoaJncnQ5nGzKzUUaxZg1qZ1wLdYHRD0fUsnv/CatT80EIStut97sa7vvs93FN
         844IIdqOEeEWQuNUkfRhv2q5pOVz1qdwcuwUu8W+o3naLDUjyV/xV0IZ4DtKnAiuV+OO
         6X7Q==
In-Reply-To: <1369583597-3801-1-git-send-email-jiang.liu@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <bhelgaas@google.com>, Yinghai Lu <yinghai@kernel.org>
Cc: Jiang Liu <jiang.liu@huawei.com>, "Rafael J . Wysocki" <rjw@sisk.pl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gu Zheng <guz.fnst@cn.fujitsu.com>, Toshi Kani <toshi.kani@hp.com>, Myron Stowe <myron.stowe@redhat.com>, Yijing Wang <wangyijing@huawei.com>, Jiang Liu <liuj97@gmail.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thierry Reding <thierry.reding@avionic-design.de>, linux-alpha@vger.kernel.org

Enhance Alpha architecture specific code to use hotplug-safe iterators
to walk PCI buses.

Signed-off-by: Jiang Liu <jiang.liu@huawei.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thierry Reding <thierry.reding@avionic-design.de>
Cc: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/alpha/kernel/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/pci.c b/arch/alpha/kernel/pci.c
index edb4e00..094cd58 100644
--- a/arch/alpha/kernel/pci.c
+++ b/arch/alpha/kernel/pci.c
@@ -305,7 +305,7 @@ pcibios_claim_console_setup(void)
 {
 	struct pci_bus *b;
 
-	list_for_each_entry(b, &pci_root_buses, node)
+	for_each_pci_root_bus(b)
 		pcibios_claim_one_bus(b);
 }
 
-- 
1.8.1.2
