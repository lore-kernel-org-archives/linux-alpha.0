From: Jay Maynard <jmaynard@conmicro.cx>
Subject: Re: 2.6.7-rc3 from bkcvs doesn't build on Alpha
Date: Sun, 13 Jun 2004 08:11:33 -0500
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20040613131133.GA29004@thebrain.conmicro.cx>
References: <cagdss$ab4$1@terminus.zytor.com> <200406131159.39672.rezso@rdsor.ro>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200406131159.39672.rezso@rdsor.ro>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

On Sun, Jun 13, 2004 at 11:59:39AM +0300, Balint Cristian wrote:
> > local symbol 0: discarded in section `.exit.text' from drivers/built-in.o
> > make: *** [.tmp_vmlinux1] Error 1
> 	I found that one driver couse this, cant remember which one but i strat do unselect in menuconfig until
> compile went ok.

I had this with 2.6.5 when I tried to include the TMS380 generic token ring
driver...but:

> > #
> > # Ethernet (10 or 100Mbit)NFIG_PLIP is not set
> > # CONFIG_PPP is not set
> > # CONFIG_SLIP is not set
> > # CONFIG_NET_FC is not set
> > # CONFIG_SHAPER is not set
> > CONFIG_NETCONSOLE=y

Where are the Ethernet driver configuration entries? Is your .config file
messed up?
