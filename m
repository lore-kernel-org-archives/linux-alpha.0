From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH 0/3] alpha: __do_IRQ just say no
Date: Tue, 26 Oct 2010 11:09:38 +1300
Message-ID: <4A366B22-C911-4BCD-B052-0278E94824D5@orcon.net.nz>
References: <20101014222805.GA8332@bombadil.infradead.org>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20101014222805.GA8332@bombadil.infradead.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Kyle McMartin <kyle@mcmartin.ca>
Cc: linux-kernel@vger.kernel.org, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

On 15/10/2010, at 11:28 AM, Kyle McMartin wrote:
> Please test and review the following changes which convert alpha away
> from calling __do_IRQ, which is deprecated and will be nuked at some
> point in the future.

I had this running on a PWS600au for a few hours without any problems  
showing up.  That tests the generic Alpha code and the irq_pyxis and  
irq_i8259 machine specific code.

Tested-by: Michael Cree <mcree@orcon.net.nz>

Cheers
Michael.

