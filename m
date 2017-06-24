From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH] alpha: provide ioread64 and iowrite64 implementations
Date: Sat, 24 Jun 2017 09:14:14 -0700
Message-ID: <a4ecb85e-f9f7-956f-ec9e-4959313a27d8@twiddle.net>
References: <20170624115707.30095-1-horia.geanta@nxp.com>
 <20170624151308.6348-1-rth@twiddle.net>
 <dfc70cc1-09a9-f6d0-83a8-c8ca5d7a232b@deltatee.com>
 <787b4be1-ce9e-6838-27b6-0cd9f8d7805f@twiddle.net>
 <721fd59b-b807-86bf-a39c-bab0b33c57c0@deltatee.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iZh/UXYfzVC/Yt6elvsz6jSzgtgWamxMRQ7qS8QgoXc=;
        b=iOxS76Yixx2532cpNeFytYaTGl9gVjYy8BoGbj19UPwj1KH/hK1yv9vLOlVrL4CpGb
         nwsyMfb8ihOSVH07819GXRJ3KWq3OVSaVcUZeQ5T+XoyvU/qXrNEehk+l3yiFBf7YZhf
         cpb+Vfh11CO2e5No7ekkHLRs5YGcdbtdu8FjlnAriSZMe73RbrvgMDH2n4XyMxnisklB
         Rgn9/NPt5e/PYXQw+AXi4gsnjN4GL9dSr/jxXOBaH1dG2rX6waPVeq2IV+cnUuAnGV6R
         cePHWAUCKRzBh9N9ouLCjdeDQh+u+oTjZmFSF4pzQMywCzlTFlfau9lLhsOZjNDCLyec
         yQVw==
In-Reply-To: <721fd59b-b807-86bf-a39c-bab0b33c57c0@deltatee.com>
Content-Language: en-US
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Logan Gunthorpe <logang@deltatee.com>, linux-kernel@vger.kernel.org
Cc: linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

On 06/24/2017 08:32 AM, Logan Gunthorpe wrote:
> So, IMO, the Jensen inq and outq funtions in your patch, which I did
> read, should probably just not be provided.

So you would prefer a function containing BUG?
Because I have to have *something* to put into the machvec function pointer.


r~
