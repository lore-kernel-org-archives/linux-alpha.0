From: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Subject: [PATCH] alpha: fix WARN_ON in __local_bh_enable()
Date: Thu, 13 Jan 2011 01:02:24 +0300
Message-ID: <20110112220224.GB18643@jurassic.park.msu.ru>
References: <AANLkTinLCqS+E8CXmAfs51sWuPS1JtNguA2VcoKK4g4f@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTinLCqS+E8CXmAfs51sWuPS1JtNguA2VcoKK4g4f@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, Kyle McMartin <kyle@redhat.com>, Michael Cree <mcree@orcon.net.nz>

Interrupts ought to be disabled _before_ irq_enter().

Signed-off-by: Ivan Kokshaysky <ink@jurassic.park.msu.ru>

diff --git a/arch/alpha/kernel/irq.c b/arch/alpha/kernel/irq.c
index 5912900..9ab234f 100644
--- a/arch/alpha/kernel/irq.c
+++ b/arch/alpha/kernel/irq.c
@@ -160,15 +160,14 @@ handle_irq(int irq)
 		return;
 	}
 
-	irq_enter();
 	/*
-	 * handle_irq() must be called with IPL_MAX. Note that we do not
+	 * From here we must proceed with IPL_MAX. Note that we do not
 	 * explicitly enable interrupts afterwards - some MILO PALcode
 	 * (namely LX164 one) seems to have severe problems with RTI
 	 * at IPL 0.
 	 */
 	local_irq_disable();
+	irq_enter();
 	generic_handle_irq_desc(irq, desc);
 	irq_exit();
 }
-
