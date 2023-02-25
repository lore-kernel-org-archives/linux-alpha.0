From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [git pill] vfs.git alpha fixes
Date: Fri, 24 Feb 2023 19:17:16 -0800
Message-ID: <CAHk-=whwFeuahxGxCidcaaZ-Xawh2drJV6WFwhs7ujDZGNGV4Q@mail.gmail.com>
References: <Y/gvQh5+4k8y+IdF@ZenIV>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LmNBVo7uMw1aKq2gIrda4qCIdgm1A6fpKV1+5VP6zB8=;
        b=CNsccW8tA+8ig58sm067TPguHm1dqrGdvdIfAPEzz6ALh36vuJuyTUG5qKT+eU4uM/
         7fMH3gXsZbB4TC8buks/zia2MSzAQQ6lVZy35U+/aMqF/7piRqQ0lU6oHnGJQfOSwGLu
         QjsHiGsYCvsFkN/7u71yE9bcCEGRxqLZw1Vwo=
In-Reply-To: <Y/gvQh5+4k8y+IdF@ZenIV>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On Thu, Feb 23, 2023 at 7:30 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
>  FEN fault fix deals with a really old oopsable braino

My old alpha architecture manual doesn't even list "clrfen" as a
PAL-code instruction.

It does have "wrfen", but that's privileged.

I have no idea when clrfen became a thing. But it's clearly a later
addition that somebody didn't think through.

             Linus
