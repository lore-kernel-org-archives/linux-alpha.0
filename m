From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: alpha: Replace __get_cpu_var
Date: Sun, 4 May 2014 20:55:45 +1200
Message-ID: <20140504084613.GA13864@omega>
References: <alpine.DEB.2.10.1405011537360.21035@gentwo.org>
 <20140502081844.GA6891@omega>
 <alpine.DEB.2.10.1405021007150.30890@gentwo.org>
 <alpine.DEB.2.10.1405021010290.31444@gentwo.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.10.1405021010290.31444@gentwo.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Lameter <cl@linux.com>
Cc: Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

On Fri, May 02, 2014 at 10:11:10AM -0500, Christoph Lameter wrote:
> v2 rediffed aginst Linus tree and fixed the macro def in time.c
> 
> Subject: alpha: Replace __get_cpu_var

Yes, that compiles and performance events is still working okay with
the built kernel.

Tested-by: Michael Cree <mcree@orcon.net.nz>

Cheers
Michael
