From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] Drop unused isa_page_to_bus
Date: Fri, 14 Jun 2019 15:04:47 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1906141504230.1722@nanos.tec.linutronix.de>
References: <20190613161155.16946-1-steve@sk2.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613161155.16946-1-steve@sk2.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Kitt <steve@sk2.org>
Cc: x86@kernel.org, linux-alpha@vger.kernel.org, LAK <linux-arm-kernel@lists.infradead.org>, linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Thu, 13 Jun 2019, Stephen Kitt wrote:

> isa_page_to_bus is deprecated and no longer used anywhere, this patch
> removes it entirely.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>

Acked-by: Thomas Gleixner <tglx@linutronix.de>
