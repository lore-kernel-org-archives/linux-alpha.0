From: Anshul <anshulusr@gmail.com>
Subject: Re: [PATCH] fixed formatting issues
Date: Mon, 28 Aug 2023 15:52:29 +0530
Message-ID: <CAPwwkU77=FvjtEFM9gzoMRLdporY8F7y1zXNky1Rj4cL0UpXHQ@mail.gmail.com>
References: <20230828071829.64366-1-anshulusr@gmail.com> <2023082827-craftily-citric-06fa@gregkh>
 <CAPwwkU7+zHo2jpt+ovJDE1ca=K8AKyowyA5Z9pOFAy6iifVEwA@mail.gmail.com> <2023082801-cost-radiance-95fa@gregkh>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693218157; x=1693822957;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yEaJWeBAVOoawr4c33mkvjoKOidJHOfAi0d6D3J7utQ=;
        b=nVU2W7l+NmxVDoUJL2WyJAGvhjit71AAHto0Hp6vd4G3o3tDeOnth7/rtm5+CafRBa
         FU3U4IbbtzjJjCAYNdlUnXH6Qj8Qep/bUf4KvB0lelGn7Mfoj68ULuvWwLzorZaYugdH
         zo6JmPxza0/p/K9y1/utstUzy9tLotzQs7+IHqzYSsqSykziMqaf9bYzdXqg533TtDlC
         zhUj7pc0ctVglVDy0VkYTk0Wwj3+F93yg8qP7HSKuF/uQhioRSMTd6PrqucIn8ItdWI4
         tuiDwcLZx1zFttMJHGWhTcB3L9v+mmWkzdByUKdjDjU287NRKzWpPd2bOJCtao/ZANpT
         lu5A==
In-Reply-To: <2023082801-cost-radiance-95fa@gregkh>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org

> Why are you changing coding style issues in this portion of the kernel?
> Do you have this hardware to test with?

I was exploring the source code and noticed a few discrepancies in the
coding style and followed to run `scripts/checkpatch.pl`.

> Normally coding style cleanups like this are only allowed in the
> drivers/staging/* portion of the kernel.  Unless you get approval from
> the maintainer of the subsystem you are changing, I wouldn't work on
> this as it's generally considered bad form.

I was not aware of that. I apologise in case my actions caused any
undue inconveniences, that was never my intention.

> Your name is only 1 word?
Yes, my legal name doesn't have a last name. I could change my From:
or Signed-off-by: lines to have "Anshul A" or add my informal last name
if that aligns better with kernel standards.

I appreciate your feedback and apologise for any problems caused,

Anshul
