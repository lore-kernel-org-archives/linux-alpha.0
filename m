From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 00/19] Bugfix and irq_chip conversion
Date: Sun, 06 Feb 2011 14:32:18 -0000
Message-ID: <20110206143037.124533892@linutronix.de>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Kyle McMartin <kyle@redhat.com>, Matt Turner <mattst88@gmail.com>

This series fixes the SMP fallout of the doIRQ removal and converts
all irq chip functions to the new types. Compile tested as far as it
goes.

Thanks,

	tglx





