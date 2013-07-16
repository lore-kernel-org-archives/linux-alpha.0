From: Phil Carmody <pc+lkml@asdf.org>
Subject: Re: [PATCH 7/7] alpha: Fix type compatibility warning for
	marvel_map_irq
Date: Wed, 17 Jul 2013 00:12:59 +0300
Message-ID: <20130716211259.GA11841@fatphil.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: linux-alpha@vger.kernel.org

Greetings Richard,

Your

+       struct pci_dev *dev = (struct pci_dev *)dev;

should surely (i.e. I'm nowhere near a compiler or kernel tree 
presently) be

+       struct pci_dev *dev = (struct pci_dev *)cdev;

I guess post that, you can have:

Acked-by: Phil Carmody <pc+lkml@asdf.org>

Cheers,
Phil
