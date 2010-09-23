From: Greg KH <greg@kroah.com>
Subject: Re: [stable] [PATCH 1/3] Fix call to replaced SuperIO functions
Date: Thu, 23 Sep 2010 16:12:06 -0700
Message-ID: <20100923231206.GB15236@kroah.com>
References: <1284005311-15698-1-git-send-email-mattst88@gmail.com>
 <20100923183907.GT23040@kroah.com>
 <409546BE-5A3D-4736-8751-F01F5C313194@orcon.net.nz>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <409546BE-5A3D-4736-8751-F01F5C313194@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: Matt Turner <mattst88@gmail.com>, stable@kernel.org, "Morten H. Larsen" <m-larsen@post6.tele.dk>, linux-alpha@vger.kernel.org

On Fri, Sep 24, 2010 at 08:56:31AM +1200, Michael Cree wrote:
> Greg,
> 
> In addition to the patch below could we also get:
> 
> 3e073367a57d41e506f20aebb98e308387ce3090 alpha: Fix printk format errors
> 
> added to the 2.6.35 stable queue.  It fixes a compile error when
> compiling a generic Alpha kernel without the legacy boot option.

Now applied, thanks.

greg k-h
