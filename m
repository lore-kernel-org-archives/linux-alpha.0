From: Julia Cartwright <julia@ni.com>
Subject: [PATCH 03/19] alpha: marvel: make use of raw_spinlock variants
Date: Thu, 9 Mar 2017 10:21:50 -0600
Message-ID: <0b729cf0f8bf233ed7ef743cd811306fd5c959e8.1489015238.git.julia@ni.com>
References: <cover.1489015238.git.julia@ni.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <cover.1489015238.git.julia@ni.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org

The alpha/marvel code currently implements an irq_chip for handling
interrupts; due to how irq_chip handling is done, it's necessary for the
irq_chip methods to be invoked from hardirq context, even on a a
real-time kernel.  Because the spinlock_t type becomes a "sleeping"
spinlock w/ RT kernels, it is not suitable to be used with irq_chips.

A quick audit of the operations under the lock reveal that they do only
minimal, bounded work, and are therefore safe to do under a raw spinlock.

Signed-off-by: Julia Cartwright <julia@ni.com>
---
 arch/alpha/include/asm/core_marvel.h |  2 +-
 arch/alpha/kernel/sys_marvel.c       | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/alpha/include/asm/core_marvel.h b/arch/alpha/include/asm/core_marvel.h
index dad300fa14ce..8dcf9dbda618 100644
--- a/arch/alpha/include/asm/core_marvel.h
+++ b/arch/alpha/include/asm/core_marvel.h
@@ -312,7 +312,7 @@ struct io7 {
 	io7_port7_csrs *csrs;
 	struct io7_port ports[IO7_NUM_PORTS];
 
-	spinlock_t irq_lock;
+	raw_spinlock_t irq_lock;
 };
 
 #ifndef __EXTERN_INLINE
diff --git a/arch/alpha/kernel/sys_marvel.c b/arch/alpha/kernel/sys_marvel.c
index 24e41bd7d3c9..3e533920371f 100644
--- a/arch/alpha/kernel/sys_marvel.c
+++ b/arch/alpha/kernel/sys_marvel.c
@@ -115,11 +115,11 @@ io7_enable_irq(struct irq_data *d)
 		return;
 	}
 
-	spin_lock(&io7->irq_lock);
+	raw_spin_lock(&io7->irq_lock);
 	*ctl |= 1UL << 24;
 	mb();
 	*ctl;
-	spin_unlock(&io7->irq_lock);
+	raw_spin_unlock(&io7->irq_lock);
 }
 
 static void
@@ -136,11 +136,11 @@ io7_disable_irq(struct irq_data *d)
 		return;
 	}
 
-	spin_lock(&io7->irq_lock);
+	raw_spin_lock(&io7->irq_lock);
 	*ctl &= ~(1UL << 24);
 	mb();
 	*ctl;
-	spin_unlock(&io7->irq_lock);
+	raw_spin_unlock(&io7->irq_lock);
 }
 
 static void
@@ -263,7 +263,7 @@ init_io7_irqs(struct io7 *io7,
 	 */
 	printk("  Interrupts reported to CPU at PE %u\n", boot_cpuid);
 
-	spin_lock(&io7->irq_lock);
+	raw_spin_lock(&io7->irq_lock);
 
 	/* set up the error irqs */
 	io7_redirect_irq(io7, &io7->csrs->HLT_CTL.csr, boot_cpuid);
@@ -295,7 +295,7 @@ init_io7_irqs(struct io7 *io7,
 	for (i = 0; i < 16; ++i)
 		init_one_io7_msi(io7, i, boot_cpuid);
 
-	spin_unlock(&io7->irq_lock);
+	raw_spin_unlock(&io7->irq_lock);
 }
 
 static void __init
-- 
2.11.1

