From: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 2/3] x86, irq: Clarify "No irq handler" message
Date: Sun, 12 Jul 2015 17:02:02 -0500
Message-ID: <20150712220202.7166.22099.stgit@bhelgaas-glaptop2.roam.corp.google.com>
References: <20150712215559.7166.33068.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=subject:to:from:cc:date:message-id:in-reply-to:references
         :user-agent:mime-version:content-type:content-transfer-encoding;
        bh=HUOzm81gXDUFMUCVjOKlh//uL1flnRxJxETARgOFxb0=;
        b=iQS6rQ90G5X7KEj2pvi1IiHXhLGdaAkJ+iOd29EirJ+64WQWxidiH+dSZpq67m53xz
         HadszXnFysIn+y6bxcc2pYMTzppEpSmT52yi2ie7xJrYP3BDEikw5UAKUxkCjqDscDLV
         KAXI5AweacDfsGEAIQRxB2+xj1RDbAUiP5VPRwFwEh+r71EBTzHH/2Yp6wMhWUQ21k0M
         EWU124+KC566v1lOJeaHGxtocXuo72/4AQ11aaL4UlfpatZBc9M1KM8FJu4+IXECRUFf
         3PdlvcViGR6toZXB0SJJpFXtn4tKWmr3adAVgpZMIPwcIbwXoTLCs+1s2cN0369KpdiS
         mPkg==
In-Reply-To: <20150712215559.7166.33068.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Sender: linux-parisc-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arch@vger.kernel.org, linux-mips@linux-mips.org, linux-am33-list@redhat.com, linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org, linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, adi-buildroot-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org

Previously we printed, e.g.,

  do_IRQ: 0.242 No irq handler for vector (irq -1)

There's no clue about what "0.242" means, and the IRQ number, which is the
important generic information used by drivers and /proc/interrupts, is
almost an afterthought.

Change the format to this:

  No handler for IRQ -1 (CPU 0 vector 0xf2)

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 arch/x86/kernel/irq.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/irq.c b/arch/x86/kernel/irq.c
index 2949c6e..3c6b069 100644
--- a/arch/x86/kernel/irq.c
+++ b/arch/x86/kernel/irq.c
@@ -224,9 +224,8 @@ __visible unsigned int __irq_entry do_IRQ(struct pt_regs *regs)
 		ack_APIC_irq();
 
 		if (irq != IRQ_RETRIGGERED) {
-			pr_emerg_ratelimited("%s: %d.%d No irq handler for vector (irq %d)\n",
-					     __func__, smp_processor_id(),
-					     vector, irq);
+			pr_emerg_ratelimited("No handler for IRQ %d (CPU %d vector %#x)\n",
+					     irq, smp_processor_id(), vector);
 		} else {
 			__this_cpu_write(vector_irq[vector], IRQ_UNDEFINED);
 		}

