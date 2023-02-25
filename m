From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PULL] alpha.git
Date: Sat, 25 Feb 2023 12:51:47 -0800
Message-ID: <CAHk-=wjsLh9KONXRQvPW85fNx=0i=GsCz7Pb93b6Oy=bndOYGg@mail.gmail.com>
References: <20230225204001.eostfx5mcba5vaiq@framework.mattst88.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8djA6j0kZiFMB42aE6l5auvpuY5SqYMA0wy5MPfcCVQ=;
        b=M0sPJWPjAfoHB0n+VWVMJdfhSR10t830dJeFHLJkRDKijAYEdPDKAyXHiOiG+iRVuE
         drlWhRDz4zUAv/zp9PYzAZBemgZ8p2wB8YE09bRsTZpM4YMi0rEVz0R1F/+cSX2V/yAw
         53CnXDZx9bClrgAHRY1+cgW9PCgUCxOOOhK/k=
In-Reply-To: <20230225204001.eostfx5mcba5vaiq@framework.mattst88.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Feb 25, 2023 at 12:40 PM Matt Turner <mattst88@gmail.com> wrote:
>
> Please pull a few changes for alpha. They're mostly small janitorial
> fixes but there's also more important ones: a patch to fix loading large
> modules from Edward Humes, and some fixes from Al Viro.

Tssk tssk. Much (all?) of this hasn't been in linux-next, and some of
it ends up being duplicate from Al already sending his parts.

I've taken it, because.. alpha. But please stop doing this to me.

              Linus
