From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] fixed formatting issues
Date: Mon, 28 Aug 2023 11:11:28 +0200
Message-ID: <2023082801-cost-radiance-95fa@gregkh>
References: <20230828071829.64366-1-anshulusr@gmail.com>
 <2023082827-craftily-citric-06fa@gregkh>
 <CAPwwkU7+zHo2jpt+ovJDE1ca=K8AKyowyA5Z9pOFAy6iifVEwA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1693213896;
        bh=eUqeVQREvamINg0qpOLldb9GpOoBTq89jsyCq2h3JCM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fbOYFG75Xe/LvyM98CE188KL/eq3TxV6V1hfnbwruqa1nrelJIyqr+W0C7tOyjXsn
         MumRrZ66hAOFnjHIonngnSQ699P9J9bBjWl/1Y4slm6UNoIfEKe+nuPO7rExm2wDVs
         eagRs4KonA1jk7mg9EpCAAbRC/nryYgpVROXwYgc=
Content-Disposition: inline
In-Reply-To: <CAPwwkU7+zHo2jpt+ovJDE1ca=K8AKyowyA5Z9pOFAy6iifVEwA@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anshul <anshulusr@gmail.com>
Cc: richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org

On Mon, Aug 28, 2023 at 01:54:41PM +0530, Anshul wrote:
> Hello Greg,
> 
> > - Your patch did many different things all at once, making it difficult
> >   to review.  All Linux kernel patches need to only do one thing at a
> >   time.  If you need to do multiple things (such as clean up all coding
> >   style issues in a file/driver), do it in a sequence of patches, each
> >   one doing only one thing.  This will make it easier to review the
> >   patches to ensure that they are correct, and to help alleviate any
> >   merge issues that larger patches can cause.
> 
> I believe that splitting the patch is not necessary in this instance since
> the changes are localized and trivial to reason about.

That's up to the maintainer to decide.

> > - You did not write a descriptive Subject: for the patch, allowing
> >   everyone, to know what this patch is all about.  Please read the
> >   section entitled "The canonical patch format" in the kernel file,
> >   Documentation/process/submitting-patches.rst for what a proper
> >   Subject: line should look like.
> 
> As per the feedback, the updated patch has incorporated the changes.

Why are you changing coding style issues in this portion of the kernel?
Do you have this hardware to test with?

Normally coding style cleanups like this are only allowed in the
drivers/staging/* portion of the kernel.  Unless you get approval from
the maintainer of the subsystem you are changing, I wouldn't work on
this as it's generally considered bad form.

> > - It looks like you did not use your "real" name for the patch on either
> >   the Signed-off-by: line, or the From: line (both of which have to
> >   match).  Please read the kernel file,
> >   Documentation/process/submitting-patches.rst for how to do this
> >   correctly.
> 
> I have verified that the Signed-off-by: line and the From: line contain the
> same content.

Your name is only 1 word?

thanks,

greg k-h
