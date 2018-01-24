From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PULL] alpha.git
Date: Wed, 24 Jan 2018 04:55:56 -0500 (EST)
Message-ID: <alpine.LRH.2.02.1801240454070.30247@file01.intranet.prod.int.rdu2.redhat.com>
References: <20180121022542.GA1963@ivybridge.mattst88.com> <alpine.LRH.2.02.1801230520020.14211@file01.intranet.prod.int.rdu2.redhat.com> <CAEdQ38GPD_u1hD8zS0T+F6F_i6_cHmQFsum=1iaKg+VZ4MQg1w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAEdQ38GPD_u1hD8zS0T+F6F_i6_cHmQFsum=1iaKg+VZ4MQg1w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Michael Cree <mcree@orcon.net.nz>, linux-alpha <linux-alpha@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>



On Tue, 23 Jan 2018, Matt Turner wrote:

> On Tue, Jan 23, 2018 at 2:23 AM, Mikulas Patocka <mpatocka@redhat.com> wrote:
> >
> >
> > On Sat, 20 Jan 2018, Matt Turner wrote:
> >
> >> Hi Linus,
> >>
> >> Please pull my alpha git tree. It contains a build fix and a regression fix.
> >>
> >> Hopefully still in time for 4.15 :)
> >>
> >> Thanks,
> >> Matt
> >
> > Hi
> >
> > Will you also submit these patches? The first one fixes a crash when
> > pthread_create races with signal delivery, it could cause random crashing
> > in applications.
> >
> > https://marc.info/?l=linux-alpha&m=151491969711913&w=2
> > https://marc.info/?l=linux-alpha&m=151491960011839&w=2
> > https://marc.info/?l=linux-alpha&m=151491963911901&w=2
> 
> Yes, I've already queued them up for the next merge window. I wasn't
> sure if they were appropriate for 4.15 so late in the cycle. If you
> think they are, I can send another pull request for 4.15.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git/log/?h=alpha-next
> 
> Thanks,
> Matt

It's OK to send these patches in the 4.16 merge window. They will be 
backported to the stable kernels anyway.

Mikulas
