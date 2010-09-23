From: Greg KH <greg@kroah.com>
Subject: Re: [stable] [PATCH 1/3] Fix call to replaced SuperIO functions
Date: Thu, 23 Sep 2010 11:39:07 -0700
Message-ID: <20100923183907.GT23040@kroah.com>
References: <1284005311-15698-1-git-send-email-mattst88@gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1284005311-15698-1-git-send-email-mattst88@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: stable@kernel.org, "Morten H. Larsen" <m-larsen@post6.tele.dk>, linux-alpha@vger.kernel.org

On Thu, Sep 09, 2010 at 12:08:31AM -0400, Matt Turner wrote:
> From: Morten H. Larsen <m-larsen@post6.tele.dk>
> 
> This patch fixes the failure to compile Alpha Generic because of
> previously overlooked calls to ns87312_enable_ide(). The function has
> been replaced by newer SuperIO code.
> 
> Tested-by: Michael Cree <mcree@orcon.net.nz>
> Signed-off-by: Morten H. Larsen <m-larsen@post6.tele.dk>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
> This is a build fix for a regression introduced by 932e0c201d28a728e25d3b64.
> It therefore only applies to 2.6.35-stable.

Why isn't it also relevant to Linus's tree for .36 and beyond?

Or is this the same as 59b25ed91400ace98d6cf0d59b1cb6928ad5cd37 in
Linus's tree?  If so, please let me know that, it's important.  I've
gone and applied that commit, if that is incorrect, please let me know.

thanks,

greg k-h
