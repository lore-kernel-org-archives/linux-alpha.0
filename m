From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 3/6] alpha: Unify the not-implemented system call entry
 name
Date: Sat, 11 Aug 2018 08:24:02 -0700
Message-ID: <7521cba8-64d3-c262-5590-791ee0abdb7d@twiddle.net>
References: <1531736638-15294-1-git-send-email-firoz.khan@linaro.org>
 <1531736638-15294-4-git-send-email-firoz.khan@linaro.org>
 <20180811000455.GC6515@ZenIV.linux.org.uk>
 <98937991-cefa-b7f3-11c3-12727b3159b1@twiddle.net>
 <20180811024553.GF6515@ZenIV.linux.org.uk>
 <d223ad23-04ae-408f-2a73-d5fa641ad725@twiddle.net>
 <20180811150731.GG6515@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mTVhSgiWPunea9cz+MQ+oH4PRXA8BAIvBZrrdRZNFT4=;
        b=jFMJT6O3vHO9Rz8PIhSWHD1hsWpspoKmPxLP0hKAGpYQH1ARjRaiN3YI7ZFTwUdk2T
         njvBQl3Z8R230+VoosrQ+xs5bACspCOERpMxcKxq6HJRlHwkuF8zKf4igSngpL/6KAkQ
         Qp9YbYmRsE/bIMOrP8K1BLeaOowP1nHk47dMQl2zysSB3Gh27uv/effmoUk2A2xCw7JH
         LVf62MwgsMWX0z8cy4BQXxcG17zarYwdPZC/rQ+9ALQIj37c7QBnYMmu3fXe0TtW+lxu
         jeyVtuFbM5/OK/h55j9G8hwNjeh/YeF26qFqeGv7t/5rgvRy0VFR8eNeKCUVkDWH53Ei
         n4hw==
In-Reply-To: <20180811150731.GG6515@ZenIV.linux.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Firoz Khan <firoz.khan@linaro.org>, linux-alpha@vger.kernel.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, y2038@lists.linaro.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, arnd@arndb.de, deepa.kernel@gmail.com

On 08/11/2018 08:07 AM, Al Viro wrote:
> BTW, looking through old patches around entry.S, are you OK with this
> one?  Same kind of macro as that for fork/vfork/clone glue...

LGTM.


r~
