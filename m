From: Kyle McMartin <kyle@mcmartin.ca>
Subject: [PATCH 0/3] alpha: __do_IRQ just say no
Date: Thu, 14 Oct 2010 18:28:06 -0400
Message-ID: <20101014222805.GA8332@bombadil.infradead.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, kyle@mcmartin.ca

Hi folks,

Please test and review the following changes which convert alpha away
from calling __do_IRQ, which is deprecated and will be nuked at some
point in the future.

It's been cross compiled, and should be bisectable, I've put a bit of
effort into ensuring that each patch stands on its own, so if there are
any issues, debugging them should be fairly trivial.

(In most cases, it's literally just a renaming + using handlers, the
 generated code is almost byte-for-byte identical.)

Thanks!
 Kyle
