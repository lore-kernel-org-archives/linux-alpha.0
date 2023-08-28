From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] fixed formatting issues
Date: Mon, 28 Aug 2023 09:28:24 +0200
Message-ID: <2023082827-craftily-citric-06fa@gregkh>
References: <20230828071829.64366-1-anshulusr@gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1693207711;
        bh=slm9CrxF1yLvUV/zI70I+YlWfwClgXFNzqfBzAe14N0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HxArU1xS4V0VPOWdWywQeccFFA3omAgAH7MPdTUaMA3oAYM1t1Fmoqnm1dci+lfKu
         hH6MY3PbCGmyL5v5cB03SO8xrNdkcS7R74Hg5l2ifwiu75A+OT0CENGVmYZnmCiECV
         GJSaC8RVKM5iPJqQKESRTZwblhBBCq6sc2vADMZc=
Content-Disposition: inline
In-Reply-To: <20230828071829.64366-1-anshulusr@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anshul <anshulusr@gmail.com>
Cc: richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org

On Mon, Aug 28, 2023 at 12:48:25PM +0530, Anshul wrote:
> Fixed minor formatting issues as per `scripts/checkpatch.pl`
> 
> Six changes to the file and their severity are as follows:
> * [WARNING] Removed unnecessary braces from single statement blocks
> * [ERROR]   5 fixes are to pointer formatting
> * [ERROR]   Removed a trailing whitespace
> 
> 6 errors and 1 warning of the previously present 6 errors and 5
> warnings have been fixed.
> 
> Signed-off-by: Anshul <anshulusr@gmail.com>
> ---
>  arch/alpha/boot/main.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

- You did not write a descriptive Subject: for the patch, allowing
  everyone, to know what this patch is all about.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
