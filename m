From: "Theodore Y. Ts'o" <tytso@mit.edu>
Subject: Re: ext4 corruption on alpha with 4.20.0-09062-gd8372ba8ce28
Date: Sat, 16 Feb 2019 12:45:36 -0500
Message-ID: <20190216174536.GC23000@mit.edu>
References: <fb63a4d0-d124-21c8-7395-90b34b57c85a@linux.ee>
 <1c26eab4-3277-9066-5dce-6734ca9abb96@linux.ee>
 <076b8b72-fab0-ea98-f32f-f48949585f9d@linux.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCLVr1lpXaEao7TBabQv6xMARFml7qIzbAltAhUxWQg=;
 b=B+fwx7PG6boFSFf4NQUZWFBQvbUYMHytdB4cRHXf9FySwk/mOWJoM9BRUGpShyI4TonzoB/xe4VDvG6NjM4vzVWS59zNISKCkOgN47J0oceHhbMoWHZ+Yih1NOgsYhM32FLOtS5PyrnbWj22w75S8rYXCJKRVRjsqCKycuEr2wU=
Content-Disposition: inline
In-Reply-To: <076b8b72-fab0-ea98-f32f-f48949585f9d@linux.ee>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: Meelis Roos <mroos@linux.ee>
Cc: linux-alpha@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org, Jan Kara <jack@suse.cz>

On Fri, Feb 15, 2019 at 06:59:48PM +0200, Meelis Roos wrote:
> The result of the bisection is
> [88dbcbb3a4847f5e6dfeae952d3105497700c128] blkdev: avoid migration stalls for blkdev pages
> 
> Is that result relevant for the problem or should I continue bisecting between 4.20.0 and the so far first bad commit?

Can you try reverting the commit and see if it makes the problem go away?

    	    	      	  	     - Ted
