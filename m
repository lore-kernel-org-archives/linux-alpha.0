From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] binfmt: remove support for em86 (alpha only)
Date: Fri, 9 Jul 2021 13:58:31 +0200
Message-ID: <8d3e3257-860a-6766-f598-0d94582db523@redhat.com>
References: <20210420175631.46923-1-david@redhat.com>
 <CAEdQ38FOJdZxB7OGd569Lkn+RGPyjoukriwDfBEf2QKHvYguXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625831920;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FuFxCjGxNh1s//8/+rvZWuY1XbBWxr4LXzkXcXPHOes=;
        b=aRcQvZpdVKV+UY7Dnc/6LW3X1zWkUtBtmIoxMzhySfkju8a5iew36H1bFUdgU2nih+TQA3
        uvfFiTb01SipvqUZml+ioiUhkdwUzKVasIOKsEIvLzZXePck8PMn1gQxt29ykDZrtH8xix
        W1Jx/Xptkjf1YbAvwAoOwvnQBLBQ0gE=
In-Reply-To: <CAEdQ38FOJdZxB7OGd569Lkn+RGPyjoukriwDfBEf2QKHvYguXQ@mail.gmail.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matt Turner <mattst88@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, Linux API <linux-api@vger.kernel.org>, linux-alpha <linux-alpha@vger.kernel.org>

On 29.04.21 04:36, Matt Turner wrote:
> This seems very reasonable, and I'll merge it through my tree unless
> someone beats me to it.
> 

Hi Matt,

looks like this patch hasn't found its way upstream yet.

-- 
Thanks,

David / dhildenb

