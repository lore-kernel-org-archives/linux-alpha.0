From: "Oliver Pitzeier" <o.pitzeier@uptime.at>
Subject: RE: Root filesystem ext3
Date: Mon, 29 Sep 2003 17:54:41 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <001901c386a2$010f7500$020b10ac@pitzeier.priv.at>
References: <oprv9p0odnluaogu@mail.NairnConsulting.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <oprv9p0odnluaogu@mail.NairnConsulting.ca>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Richard Nairn' <Richard@nairnconsulting.ca>, linux-alpha@vger.kernel.org

> ext3 gets loaded as a module, maybe it hasn't loaded it 
> before it gets to mounting root?  I will try compiling a
> newer kernel and use initrd...

Don't use initrd, I makes headaches! :)

> Does the kernel compile with ccc?

I'm not sure, but it's worth a try I would say. :)

Best,
 Oliver

