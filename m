From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PULL] alpha-2.6.git
Date: Wed, 1 Sep 2010 11:30:20 -0400
Message-ID: <AANLkTimRJO-BEhEsPxaERHx=3vzM6iyH21emwD4qPgqj@mail.gmail.com>
References: <AANLkTi=vmbZqvkyB3JM8TQK1G=hBYZafhE31sVh930=k@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=waaHJzriBHt0+zntyZm4o4fKtzFDrcaLvrcMeAKUa0s=;
        b=ganbpA7J2LVl7fiNdkRmnF3Wguo7tmUZukb+lBc4cbuf+21HRUWcYiAyKeCaxKEQF2
         Gux+LgFjQGWR4gHqPGXWFApr2BotS7fAxlgOJKcefMuEvkWo/yfNKCT9XB1aiofJe3lF
         srq0UTw2BrqHjS+W3iEFm5AQ6IBmOKtI/+L1k=
In-Reply-To: <AANLkTi=vmbZqvkyB3JM8TQK1G=hBYZafhE31sVh930=k@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org

Hi Linus,
I've added an additional patch that cleans up some printf warnings
that I missed in my patch queue.

Thanks!
Matt Turner

The following changes since commit 2bfc96a127bc1cc94d26bfaa40159966064f=
9c8c:

  Linux 2.6.36-rc3 (2010-08-29 08:36:04 -0700)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha-2.6.git =
for-linus

=46UJITA Tomonori (1):
      alpha: remove homegrown L1_CACHE_ALIGN macro

Michael Cree (2):
      alpha: convert perf_event to use local_t
      alpha: Fix printk format errors

Morten H. Larsen (1):
      Fix call to replaced SuperIO functions

 arch/alpha/include/asm/cache.h    |    1 -
 arch/alpha/kernel/err_marvel.c    |    6 +++---
 arch/alpha/kernel/perf_event.c    |   18 +++++++++---------
 arch/alpha/kernel/proto.h         |    3 ---
 arch/alpha/kernel/sys_cabriolet.c |   19 ++++++++++++++++---
 arch/alpha/kernel/sys_takara.c    |   11 +++++++++--
 6 files changed, 37 insertions(+), 21 deletions(-)


On Tue, Aug 31, 2010 at 9:49 PM, Matt Turner <mattst88@gmail.com> wrote=
:
> Hi Linus,
> Please pull the for-linus branch of my alpha-2.6 tree. It contains a
> few trivial changes and a regression/compile fix.
>
> Thanks!
> Matt Turner
>
> The following changes since commit 2bfc96a127bc1cc94d26bfaa4015996606=
4f9c8c:
>
> =A0Linux 2.6.36-rc3 (2010-08-29 08:36:04 -0700)
>
> are available in the git repository at:
> =A0git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha-2.6.g=
it for-linus
>
> FUJITA Tomonori (1):
> =A0 =A0 =A0alpha: remove homegrown L1_CACHE_ALIGN macro
>
> Michael Cree (1):
> =A0 =A0 =A0alpha: convert perf_event to use local_t
>
> Morten H. Larsen (1):
> =A0 =A0 =A0Fix call to replaced SuperIO functions
>
> =A0arch/alpha/include/asm/cache.h =A0 =A0| =A0 =A01 -
> =A0arch/alpha/kernel/perf_event.c =A0 =A0| =A0 18 +++++++++---------
> =A0arch/alpha/kernel/proto.h =A0 =A0 =A0 =A0 | =A0 =A03 ---
> =A0arch/alpha/kernel/sys_cabriolet.c | =A0 19 ++++++++++++++++---
> =A0arch/alpha/kernel/sys_takara.c =A0 =A0| =A0 11 +++++++++--
> =A05 files changed, 34 insertions(+), 18 deletions(-)
>
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
