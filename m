From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH RFC 3/4] barriers: convert a control to a data dependency
Date: Wed, 2 Jan 2019 13:00:24 -0800
Message-ID: <20190102210024.GJ6310@bombadil.infradead.org>
References: <20190102205715.14054-1-mst@redhat.com>
 <20190102205715.14054-4-mst@redhat.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=M4IGlqEQFNqwliRsSyTfnKKOspsRl2QEciHUCHKHBN0=; b=mIeAx4XVHfAq1tTMDZX8ChgGK
        kAxwG2LXSgH6Wm6fsEETnxI6IlDSIePpmkA7ns1A8K823CvsVsHYSxnUB8QfOrqgIBqJM4KVFslHk
        nwJ+Vt30zxTIv3iZU27h7W75GbjIGoqKl3XksGTd0xd6alAOyb+Yaj1p7L46p/96fXy14n8yY5ElO
        SKqBGLBv3j71+qDvoBOVHjrXfCnj/wTGscOhZ3LKCEnbPdMeD+L2K8/fpY1AWddSKfnqPv62015sO
        tGsuHjrT9OC5VUqRPd+Yhq3Zs6aRBwjs50rKDQctY9vWrxWUtFRdliQs4CdjjfyF10lhV2nwKl6z9
    
Content-Disposition: inline
In-Reply-To: <20190102205715.14054-4-mst@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jason Wang <jasowang@redhat.com>, Alan Stern <stern@rowland.harvard.edu>, Andrea Parri <andrea.parri@amarulasolutions.com>, Will Deacon <will.deacon@arm.com>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, David Howells <dhowells@redhat.com>, Jade Alglave <j.alglave@ucl.ac.uk>, Luc Maranget <luc.maranget@inria.fr>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Akira Yokosawa <akiyks@gmail.com>, Daniel Lustig <dlustig@nvidia.com>, linux-arch@vger.kernel.org, netdev@vger.kernel.org, virtualization@lists.linux-foundation.org, Jonathan Corbet <corbet@lwn.net>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst>

On Wed, Jan 02, 2019 at 03:57:58PM -0500, Michael S. Tsirkin wrote:
> @@ -875,6 +893,8 @@ to the CPU containing it.  See the section on "Multicopy atomicity"
>  for more information.
>  
>  
> +
> +
>  In summary:
>  
>    (*) Control dependencies can order prior loads against later stores.

Was this hunk intentional?
