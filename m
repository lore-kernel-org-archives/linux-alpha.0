From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PULL] alpha.git
Date: Tue, 23 Jan 2018 05:23:42 -0500 (EST)
Message-ID: <alpine.LRH.2.02.1801230520020.14211@file01.intranet.prod.int.rdu2.redhat.com>
References: <20180121022542.GA1963@ivybridge.mattst88.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180121022542.GA1963@ivybridge.mattst88.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Michael Cree <mcree@orcon.net.nz>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org



On Sat, 20 Jan 2018, Matt Turner wrote:

> Hi Linus,
> 
> Please pull my alpha git tree. It contains a build fix and a regression fix.
> 
> Hopefully still in time for 4.15 :)
> 
> Thanks,
> Matt

Hi

Will you also submit these patches? The first one fixes a crash when 
pthread_create races with signal delivery, it could cause random crashing 
in applications.

https://marc.info/?l=linux-alpha&m=151491969711913&w=2
https://marc.info/?l=linux-alpha&m=151491960011839&w=2
https://marc.info/?l=linux-alpha&m=151491963911901&w=2

Mikulas

> The following changes since commit 8cbab92dff778e516064c13113ca15d4869ec883:
> 
>  Merge tag 'for-linus' of
> git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma (2018-01-16 16:47:40
> -0800)
> 
> are available in the git repository at:
> 
>  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git for-linus
> 
> for you to fetch changes up to 86be89939d11a84800f66e2a283b915b704bf33d:
> 
>  alpha/PCI: Fix noname IRQ level detection (2018-01-20 16:22:36 -0800)
> 
> ----------------------------------------------------------------
> Lorenzo Pieralisi (1):
>      alpha/PCI: Fix noname IRQ level detection
> 
> Michael Cree (1):
>      alpha: extend memset16 to EV6 optimised routines
> 
> arch/alpha/kernel/sys_sio.c | 35 +++++++++++++++++++++++++++++------
> arch/alpha/lib/ev6-memset.S | 12 ++++++------
> 2 files changed, 35 insertions(+), 12 deletions(-)
> 
