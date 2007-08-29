From: "Jeff Chua" <jeff.chua.linux@gmail.com>
Subject: Re: [1/4] 2.6.23-rc4: known regressions
Date: Thu, 30 Aug 2007 03:07:19 +0800
Message-ID: <b6a2187b0708291207tfbf9d6dr43661f15dce33e44@mail.gmail.com>
References: <46D5902C.1040905@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=HSfmcJlDLftk6+ppQPklEYY7jUAfcfcei/cFdDvq1HmumT2gIV2xWt0BYJgNgawXHxaifGLpnmv6l8fS6AqdwSjUlSva3rOydSAzGIoIw9cbVOvSZXdsgrL6E3S/7789kwg9oGcSA99EkEUaKA61TnEb34j8qSXEG2rzeMpJI2E=
In-Reply-To: <46D5902C.1040905@googlemail.com>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Markus <lists4me@web.de>, "Antonino A. Daplas" <adaplas@gmail.com>, Jan Dittmer <jdi@l4x.org>, Christian Zankel <chris@zankel.net>, linux-alpha@vger.kernel.org, Stefan Becker <Stefan.Becker@nokia.com>, Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>

On 8/29/07, Michal Piotrowski <michal.k.k.piotrowski@gmail.com> wrote:

> Subject         : console is messed up after resume from s2ram or switching to console from X
> References      : http://lkml.org/lkml/2007/8/4/6
> Last known good : ?
> Submitter       : Jeff Chua <jeff.chua.linux@gmail.com>
> Caused-By       : ?
> Handled-By      : H. Peter Anvin <hpa@zytor.com>
>                   Antonino A. Daplas <adaplas@gmail.com>
> Workaround      : "s2ram --force --acpi_sleep 1 --vbe_mode"
> Status          : problem is being debugged

I'm satisfied with the workaround using "s2ram --force --acpi_sleep 1
--vbe_mode", and so is H. Peter Anvin, and he uncovered a different
bug while debugging this.

Please close the case.

Thanks,
Jeff.
