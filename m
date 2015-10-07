From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v2 3/3] strscpy: zero any trailing garbage bytes in the
 destination
Date: Wed, 7 Oct 2015 09:31:52 +0200
Message-ID: <20151007073152.GA8974@gmail.com>
References: <1444159429-4788-1-git-send-email-cmetcalf@ezchip.com>
 <1444159429-4788-4-git-send-email-cmetcalf@ezchip.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=EUHa/UiJEshSPe/rBp2wyiljPT2OTpeAwgUIx0QGVf0=;
        b=DGwlIAR3pBwp9YZwmuUbE1pvuLLRj8D5ZgA5Ulg0OMTw/8pPXjoCtEJe87l3xfpeTB
         46UMLpTO+IsX3oih8GhLF3gUTkAYcMKTljVDcLncmPl7XSi9VEEDcGGriTAleNAxNInK
         zaIkghUKxSv/iR6AlJJduT9WlRgoywnpsoucIieNf44xRbNN0PVgOcxyZc1Aet3LsEHk
         r6FDpvSZbeVrOY1sYXxM7tyPw/WKQCSc04dodFg4IKSK0Bsk90NQROc0QCHji7CVnpGG
         exvlKXwB/VoF3JhNBhvrBdalxTWek03zZxart7oohFfS3e0e9mDNkCyBmDA0YYqc6Fip
         YnqQ==
Content-Disposition: inline
In-Reply-To: <1444159429-4788-4-git-send-email-cmetcalf@ezchip.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Metcalf <cmetcalf@ezchip.com>
Cc: Michael Cree <mcree@orcon.net.nz>, Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Yoshinori Sato <ysato@users.sourceforge.jp>, Alexey Dobriyan <adobriyan@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, linux-alpha@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


* Chris Metcalf <cmetcalf@ezchip.com> wrote:

> It's possible that the destination can be shadowed in userspace
> (as, for example, the perf buffers are now).  So we should take
> care not to leak data that could be inspected by userspace.
> 
> Signed-off-by: Chris Metcalf <cmetcalf@ezchip.com>

Please always preserve credits for who found the bug:

  Reported-by: Alexey Dobriyan <adobriyan@gmail.com>

Also, you should credit the kbuild-bot for the cross-arch build breakages that 
your other patches address:

  Reported-by: kbuild test robot <fengguang.wu@intel.com>

Thanks,

	Ingo
