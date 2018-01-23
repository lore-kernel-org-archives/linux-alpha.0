From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PULL] alpha.git
Date: Tue, 23 Jan 2018 09:56:02 -0800
Message-ID: <CAEdQ38GPD_u1hD8zS0T+F6F_i6_cHmQFsum=1iaKg+VZ4MQg1w@mail.gmail.com>
References: <20180121022542.GA1963@ivybridge.mattst88.com> <alpine.LRH.2.02.1801230520020.14211@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=1g94zZGWAXBll6WI7TiAaK9twcjeF2fmeGS1mjZ/um0=;
        b=kARLLPiyLfNWWiEW7y1o2Q90oBk4VWhuV+kqjOPmnM1IxehYiW6DRYQWsQBNILdLRs
         iVdcWF5v9iu6iVPgLElYxQSuxynF60ev8luQjbJTd4UBfSvN3JqVxs4vUnpuXA/+I51q
         jxUqFcOYxtbwa5So013TLwGuJMaRit8WkVQ1nq5wALoyItDSJ7tZnPJD7sjtdCfJzD+r
         ZYeI3cSWAIBJNN2VTk8ZOJ9UTHG2IE9QL/mF6LETT/meiq/aBURgb/1bS9hM9CPpcF4P
         0DzHCZ4krICnggndnurBYYI+21TIM8CTmJkGR/SCQTbVdirpDsW1GO4hV7xnqKDWPp5k
         DmNQ==
In-Reply-To: <alpine.LRH.2.02.1801230520020.14211@file01.intranet.prod.int.rdu2.redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Michael Cree <mcree@orcon.net.nz>, linux-alpha <linux-alpha@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Tue, Jan 23, 2018 at 2:23 AM, Mikulas Patocka <mpatocka@redhat.com> wrote:
>
>
> On Sat, 20 Jan 2018, Matt Turner wrote:
>
>> Hi Linus,
>>
>> Please pull my alpha git tree. It contains a build fix and a regression fix.
>>
>> Hopefully still in time for 4.15 :)
>>
>> Thanks,
>> Matt
>
> Hi
>
> Will you also submit these patches? The first one fixes a crash when
> pthread_create races with signal delivery, it could cause random crashing
> in applications.
>
> https://marc.info/?l=linux-alpha&m=151491969711913&w=2
> https://marc.info/?l=linux-alpha&m=151491960011839&w=2
> https://marc.info/?l=linux-alpha&m=151491963911901&w=2

Yes, I've already queued them up for the next merge window. I wasn't
sure if they were appropriate for 4.15 so late in the cycle. If you
think they are, I can send another pull request for 4.15.

https://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git/log/?h=alpha-next

Thanks,
Matt
