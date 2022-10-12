From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] alpha: Use generic <asm-generic/io.h>
Date: Wed, 12 Oct 2022 07:05:19 -0700
Message-ID: <20221012140519.GA2405113@roeck-us.net>
References: <20220818092059.103884-1-linus.walleij@linaro.org>
 <20221002224521.GA968453@roeck-us.net>
 <fd905ca5-fe0d-4cfb-a0d0-aea8af539cc7@app.fastmail.com>
 <57200020-c460-74ec-c786-9a2c16f4870e@roeck-us.net>
 <2e110666-7519-4693-8a89-240cbb118c7e@app.fastmail.com>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LBlu7tPT0Tx5MrjvdiscmABwb2kCDpiFMguHWsE1qRI=;
        b=TriEn0TBit/DhtfVmixexLUZ4cUN9xq7qt7CmMgifx0UYigJtkT8QUVnkhv34TEPqV
         WvL7xPmd1PvCBxp4IEbGmJOfyAH3pw9dFJcFEaRY2ghKvoMiSon30uxminzvjSS6s1gh
         7hRpGaqX7MCzROsRMGzLYNd4HM4lbnEdvkNPjgwYFRx8UzsZ28boB3Y09SiyEIJxxIQ3
         ZRTs/GO0NM23bjGMkHwdX8dklDjz+orMbj+wRThAa0YxQyFPq02854mvleJ2oxRgHwRO
         +8DR32cLkSVyBJuRrD27zQxAzzakPoSzrXiUuyMNBsSTwFKUhozZ1fbiJ0F9XNy8mSB/
         Mn4g==
Sender: Guenter Roeck <groeck7@gmail.com>
Content-Disposition: inline
In-Reply-To: <2e110666-7519-4693-8a89-240cbb118c7e@app.fastmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, kernel test robot <lkp@intel.com>, Mark Brown <broonie@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>, regressions@lists.linux.dev

On Tue, Oct 04, 2022 at 10:28:24PM +0200, Arnd Bergmann wrote:
> On Tue, Oct 4, 2022, at 9:42 PM, Guenter Roeck wrote:
> > On 10/3/22 06:03, Arnd Bergmann wrote:
> >> On Mon, Oct 3, 2022, at 12:45 AM, Guenter Roeck wrote:
> >
> > Looks like something was missed. When building alpha:allnoconfig
> > in next-20221004:
> >
> > Building alpha:allnoconfig ... failed
> > --------------
> > Error log:
> > <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
> > arch/alpha/kernel/core_marvel.c:807:1: error: conflicting types for 
> > 'marvel_ioread8'; have 'unsigned int(const void *)'
> >    807 | marvel_ioread8(const void __iomem *xaddr)
> >        | ^~~~~~~~~~~~~~
> > In file included from arch/alpha/kernel/core_marvel.c:10:
> > arch/alpha/include/asm/core_marvel.h:335:11: note: previous declaration 
> > of 'marvel_ioread8' with type 'u8(const void *)' {aka 'unsigned 
> > char(const void *)'}
> >    335 | extern u8 marvel_ioread8(const void __iomem *);
> >        |           ^~~~~~~~~~~~~~
> 
> Right, I already noticed this and uploaded a fixed branch earlier today.
> Should be ok tomorrow.
> 

Unfortunately that did not completely fix the problem, or maybe the fix got
lost. In mainline, when building alpha:allnoconfig:

arch/alpha/kernel/core_marvel.c:807:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'marvel_ioread8'
  807 | marvel_ioread8(const void __iomem *xaddr)

The code is:

unsigned u8
marvel_ioread8(const void __iomem *xaddr)

The compiler doesn't like "unsigned u8".

#regzbot ^introduced: e19d4ebc536d
#regzbot title: alpha:allnoconfig fails to build
#regzbot monitor: https://lore.kernel.org/linux-arch/202210062117.wJypzBWL-lkp@intel.com/

Guenter
