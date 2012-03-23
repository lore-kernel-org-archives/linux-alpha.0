From: Kautuk Consul <consul.kautuk@gmail.com>
Subject: Re: [PATCH 02/20] alpha/mm/fault.c: Port OOM changes to do_page_fault
Date: Fri, 23 Mar 2012 12:47:38 -0400
Message-ID: <CAFPAmTTwzhW-jFKhJ4_wXxb33c-MxCBGYgCTog4zasd2_G2i-w@mail.gmail.com>
References: <1332249538-2610-1-git-send-email-consul.kautuk@gmail.com>
	<CAFPAmTTSrDkDLHoh0NQ8iAG-=vBXW3UwhWAXKfBa_Nk0gj07Xw@mail.gmail.com>
	<CAEdQ38G5VVoPKr1ayMZrQ2ba7xa9ofnY+TK4SUqOb8kr5fBsMQ@mail.gmail.com>
	<CAFPAmTQfbNv3A-j9OCRswj-VtB79ZLCSDdMC1KqBQdrVO6K54A@mail.gmail.com>
	<CAEdQ38GOZi7t5BraBMhETuf=cDBVW7txkDH6guC0kZVXyqG04A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=KonA/EVu9AWSXKbO7Xb2LCjIwHSU/NYE3/4seSP+Trc=;
        b=qCnztfQVryQXyK3oTRz6LNjZ9C4jg5uhquJhgiU7Tfc7fg1YK0E2/WgJklygwhcYpR
         HctUCqkZ5U1+v7N+32hWrCoEoudUYnS6zwZpZ6NA9OaGOMGinEDJ0FlaSJftVU7IEUvA
         YXhzw+e2uwFY7JP4tEiChb2zsZQHFMVKHwPWVQMBi3Ga9/wa5/h+cJxC8A1kJ3EXRJme
         QWeRVebtNAqtKwUzPeHKT9QhiPq6QQi7RCYcLFLGzUo2fQAz4UbJ7iokZAySz3Va/wi7
         BZHZHBreoy2cY5MtrsdEnp3EzGvqGwEthSYQtPMHQDmYsizZqj5SzyJglXVAh/uneavf
         k2xg==
In-Reply-To: <CAEdQ38GOZi7t5BraBMhETuf=cDBVW7txkDH6guC0kZVXyqG04A@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Kautuk Consul <consul.kautuk@gmail.com>, "Mohd. Faris" <mohdfarisq2010@gmail.com>

Hi Andrew,


On Fri, Mar 23, 2012 at 12:40 PM, Matt Turner <mattst88@gmail.com> wrote:
> On Fri, Mar 23, 2012 at 12:33 PM, Kautuk Consul <consul.kautuk@gmail.com> wrote:
>>>> Can I improve this patch in any way ?
>>>
>>> Sorry, I just don't have time. I imagine that all these patches are
>>> going upstream through the same tree, so feel free to commit this
>>> patch with the rest. If there's a problem, we'll notice it later.
>>>
>>
>> Sorry, I'm quite new to this.
>> What do you mean by : "feel free to commit this patch with the rest" ?
>>
>> Does this mean I request someone on the list (like akpm) to include
>> this patch ?
>
> Yes, exactly. :)

Can you please include this patch into linux-next whenever it is OK with you ?
