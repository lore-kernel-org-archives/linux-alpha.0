From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 0/7] Remove unused SLOW_DOWN_IO
Date: Mon, 25 Apr 2022 16:16:17 -0500
Message-ID: <20220425211617.GA1658400@bhelgaas>
References: <20220422104828.75c726d0@kernel.org>
Mime-Version: 1.0
Return-path: <linux-sh-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650921380;
        bh=hYLOMTe1/Z2MH6N3yk6aVKeMHTDRSg9Z2C4T2OGqECc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=hwaE9jDaUpBkOfLikisxRqEQgrwvFHBLfDX94LCe6d9c+B89thcG5+fzwWzRgnd4F
         UqUXrmcbmYubtRf7FE8Jwkk5GeEGdqgd1W0d9M3Ortq26Qx+Pzo3/WPJEIVTC7WQXV
         UqJS35401jf9zTe5lsxkUy0T166bIgMuSSN7lwxzplqPNpJ/wNdQpLoMCC6TtgHccT
         M0cMO7eNzOkzlE9ZBqaO/uL2DyV2iLpQzQsHCdz5Ps55sIkShx2Z0vt3n4IP50CnBE
         Hd2GnEAYbJXgRkBeNmR+2LIgqx7mu2Vli7MtwrWAnKBbTjJt82hvzuQRfEDmUCGo1Y
         JC8dirsrUmtgw==
Content-Disposition: inline
In-Reply-To: <20220422104828.75c726d0@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jakub Kicinski <kuba@kernel.org>
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Chas Williams <3chas3@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Paul Mackerras <paulus@samba.org>, Matt Turner <mattst88@gmail.com>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, Richard Henderson <rth@twiddle.net>

On Fri, Apr 22, 2022 at 10:48:28AM -0700, Jakub Kicinski wrote:
> On Fri, 15 Apr 2022 14:08:10 -0500 Bjorn Helgaas wrote:
> > From: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > Only alpha, ia64, powerpc, and sh define SLOW_DOWN_IO, and there are no
> > actual uses of it.  The few references to it are in situations that are
> > themselves unused.  Remove them all.
> > 
> > It should be safe to apply these independently and in any order.  The only
> > place SLOW_DOWN_IO is used at all is the lmc_var.h definition of DELAY,
> > which is itself never used.
> 
> Hi Bojrn! Would you mind reposting just patches 1 and 3 for networking?
> LMC got removed in net-next (commit a5b116a0fa90 ("net: wan: remove the
> lanmedia (lmc) driver")) so the entire series fails to apply and therefore 
> defeats all of our patch handling scripts :S

Sure, coming up, with reduced cc: list.
