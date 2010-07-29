From: Matt Turner <mattst88@gmail.com>
Subject: Re: alpha defconfig build broken in 2.6.35-rc6
Date: Thu, 29 Jul 2010 12:56:54 -0400
Message-ID: <AANLkTi=zaf-hGOuNX05Qq+dw3Wq_xYxT5EvKTS_dRV0s@mail.gmail.com>
References: <1280422122.17322.14.camel@groeck-laptop>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type;
        bh=WKsH8uOln66vH6ZlWLEhyQJCbUvLovvkH6NmhhC3ePQ=;
        b=tJoy0dIQiGEq3Y+1J4PdZNvpb/jYzqJcdPKPhuL19pfQ135IxzKF0I78Io/jVUL4KH
         8IKsYhWoyj4fLrgG6W1jy30RZozTupXpj+eXizQ2QIKaVTYpb2M8u49mu77ZJk9Whcui
         GIwNSI41JWuU+pQikxbQTgqzn7C39GKb/umlQ=
In-Reply-To: <1280422122.17322.14.camel@groeck-laptop>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: guenter.roeck@ericsson.com
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, "Morten H. Larsen" <m-larsen@post6.tele.dk>, Richard Henderson <rth@twiddle.net>

On Thu, Jul 29, 2010 at 12:48 PM, Guenter Roeck
<guenter.roeck@ericsson.com> wrote:
> During unrelated testing, I noticed that the alpha defconfig build is
> broken in 2.6.35-rc6. I get the following error message.
>
> arch/alpha/kernel/built-in.o: In function `cia_cab_init_pci':
> /opt/scratch/groeck/linux-2.6/arch/alpha/kernel/sys_cabriolet.c:249:
> undefined reference to `ns87312_enable_ide'
> /opt/scratch/groeck/linux-2.6/arch/alpha/kernel/sys_cabriolet.c:249:
> undefined reference to `ns87312_enable_ide'
> arch/alpha/kernel/built-in.o: In function `cabriolet_init_pci':
> /opt/scratch/groeck/linux-2.6/arch/alpha/kernel/sys_cabriolet.c:242:
> undefined reference to `ns87312_enable_ide'
> /opt/scratch/groeck/linux-2.6/arch/alpha/kernel/sys_cabriolet.c:242:
> undefined reference to `ns87312_enable_ide'
> arch/alpha/kernel/built-in.o: In function `takara_init_pci':
> /opt/scratch/groeck/linux-2.6/arch/alpha/kernel/sys_takara.c:267:
> undefined reference to `ns87312_enable_ide'
> arch/alpha/kernel/built-in.o:/opt/scratch/groeck/linux-2.6/arch/alpha/kernel/sys_takara.c:267: more undefined references to `ns87312_enable_ide' follow
>
> Not surprising since ns87312.c and thus ns87312_enable_ide() no longer
> exist. The problem was introduced with commit
> 932e0c201d28a728e25d3b641aa95bd28ceb08b4 (alpha: Detect Super IO chip,
> no IDE on Avanti, enable EPP19).
>
> Guenter

Ah, thanks for the report. Either I or Morten will knock this out quickly.

Thanks,
Matt
