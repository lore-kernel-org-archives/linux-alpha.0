From: Robert Richter <rric@kernel.org>
Subject: Re: [PATCH 02/29] alpha: Avoid comma separated statements
Date: Tue, 25 Aug 2020 08:37:42 +0200
Message-ID: <20200825063742.jopjozosvg5h74fp@rric.localdomain>
References: <cover.1598331148.git.joe@perches.com>
 <4facd57f80c70437f085ba3a1bcf13ae0b63c3bc.1598331148.git.joe@perches.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+8J0SMn0DeaTAP1G5XZRDMqDI4C3yEDmcbeRVLLld+A=;
        b=mnVmkRUn6UwjZ7JzQHaQs097X30CHeAIcUM8gXZJXxbz9UzTWzNWiVADcbcGXiSoR1
         j1g8q7WdR8PMG3RPhh0gPyq13YFsLxQ5CqIMko/XwVPuYAN1JO9+0ROyxmUehRI7Db69
         j7xkhYcXWi0BNsm+Aph+dwIZx7EMkLC8pRSebcsmRMvljJWgE4FVXvrYeLF72yNglF8X
         u+rteBw1n/+ZHQ0+EDI1Pm62AcYOPNSjQ3zNNUl73/gyt8b2R9ZFC+62toNOdfIGWlLJ
         HhPgc8uwkHno/75s5bY4Knmom8kUkSkTw0zDIReRuqVun62no/SnF/Qhp0OyLrt58sQ/
         tgrA==
Content-Disposition: inline
In-Reply-To: <4facd57f80c70437f085ba3a1bcf13ae0b63c3bc.1598331148.git.joe@perches.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Jiri Kosina <trivial@kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, oprofile-list@lists.sf.net

On 24.08.20 21:55:59, Joe Perches wrote:
> Use semicolons and braces.
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  arch/alpha/kernel/pci_iommu.c      |  8 +++++---
>  arch/alpha/oprofile/op_model_ev4.c | 22 ++++++++++++++--------
>  arch/alpha/oprofile/op_model_ev5.c |  8 +++++---
>  3 files changed, 24 insertions(+), 14 deletions(-)

For oprofile:

Acked-by: Robert Richter <rric@kernel.org>
