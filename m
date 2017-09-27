From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: [PATCH] alpha: fix build failures
Date: Wed, 27 Sep 2017 21:16:20 +0100
Message-ID: <20170927201620.GA5215@sudip-laptop>
References: <1505668810-7497-1-git-send-email-sudipm.mukherjee@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ys3bvpfVBKVoZPi3hKjXHW6N2SbF42BhOdK/TUEdxe4=;
        b=MhpzXsxN9H/CndE37S/uO1qdDuPPY1t3tREY8csaYwW3viipi3MoUXUAKt5TFy6g+3
         1kUbyNWZQ9T20pTaKj5EYFiIYJyyb2bBwe4x5MQisbCmRasFylL8OOhotUVz4QJEJ2iw
         RAjtAOf+WI6y4b8S0gIVHisP7nPpdO1HxbT+i9eG5peB0OFEwRODaYe3lgasPfpsYOdY
         E/fEmbdAV0WKZ6Xx3LRJi7u6oSOM898WF0YIknffg94nptRvyJrMvspao27mh4JjjcBw
         tTc/332+yzkQBACTj9nxAbgu0kl6D/BPvZOJM6M0EXf5y2OKqqqd+4+wvwoR1GJ6Tq6H
         f2MQ==
Content-Disposition: inline
In-Reply-To: <1505668810-7497-1-git-send-email-sudipm.mukherjee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>

Hi Andrew,

On Sun, Sep 17, 2017 at 06:20:10PM +0100, Sudip Mukherjee wrote:
> The build of alpha allmodconfig is giving error:
> arch/alpha/include/asm/mmu_context.h: In function 'ev5_switch_mm':
> arch/alpha/include/asm/mmu_context.h:160:2: error:
> 	implicit declaration of function 'task_thread_info';
> 	did you mean 'init_thread_info'? [-Werror=implicit-function-declaration]
> 
> The file 'mmu_context.h' needed an extra header file.
> 
> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> ---

Will this be picked up by you? I can see the builds failing in
linux-next and also in v4.14-rc2.

--
Regards
Sudip
