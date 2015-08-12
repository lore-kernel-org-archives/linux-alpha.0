From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 31/31] dma-mapping-common: skip kmemleak checks for
 page-less SG entries
Date: Wed, 12 Aug 2015 09:05:15 -0700
Message-ID: <CA+55aFxfZM81HNfo2ysfhGwrhx6GX-+F--+jLFmMVv+Z0id2rw@mail.gmail.com>
References: <1439363150-8661-1-git-send-email-hch@lst.de>
        <1439363150-8661-32-git-send-email-hch@lst.de>
Mime-Version: 1.0
Return-path: <linux-mips-bounce@linux-mips.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=MJzZL+CgMUY3GKm3z8wa7otA0jR+vzieLcQ/5SMgzCw=;
        b=kkRRSsFoxIgSo1Bdk5Nf7Qd9PT5CZnku1e2US7Qyl67N8W8T6l8sw2TGRk3JQq+orD
         unGyut8KkW8nSP/+sHKJZ9pr8yEi5u1NWYdyChPLptQq1wr3t0S86QVr9le8ffBISLCj
         pVsu4LHPq/9xSWTbOuf3stzG85HzlrGlfJMc07Uz61mFENyv85ps9FWjUawvjR1RuymI
         Kkpdb2pxKS7bs1PqDf+KKlSdl38uKGfF7XkZTyk2Gb/peUH31XlUifWHo1dZI7nGwFwB
         1M/BxvpCJvILSJCkPizNDUyMkQF3jCwhQDzxUpo2zH4m/hEWM6CifvSsYJXMKziMe58s
         pQUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=MJzZL+CgMUY3GKm3z8wa7otA0jR+vzieLcQ/5SMgzCw=;
        b=CIH6VHeEYKQEZR6ycpamm1sYQdzNAvDu4IfBfFaAHPyoUdawGq8YuoAYg8JKjFvKi/
         ISCpUT3kA22ttz7Ts6qZ2qoIVNxIe0i/+vGjSY+2RlSisZMfHUa693/kWh2uMM87TLht
         JvVLGTH3430jAnnGE9wUoFngZHFAD96MXL0Ww=
In-Reply-To: <1439363150-8661-32-git-send-email-hch@lst.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-Id: <linux-alpha.vger.kernel.org>
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Dan Williams <dan.j.williams@intel.com>, Vineet Gupta <vgupta@synopsys.com>, =?UTF-8?Q?H=C3=A5vard_Skinnemoen?= <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, Miao Steven <realmz6@gmail.com>, David Howells <dhowells@redhat.com>, Michal Simek <monstr@monstr.eu>, the arch/x86 maintainers <x86@kernel.org>, David Woodhouse <dwmw2@infradead.org>, Alex Williamson <alex.williamson@redhat.com>, grundler@parisc-linux.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, linux-alpha@vger.kernel.org, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, linux-metag@vger.kernel.org, linux-mips <linux-mips@linux-mips.org>, Pari

On Wed, Aug 12, 2015 at 12:05 AM, Christoph Hellwig <hch@lst.de> wrote:
> +       for_each_sg(sg, s, nents, i) {
> +               if (sg_has_page(s))
> +                       kmemcheck_mark_initialized(sg_virt(s), s->length);
> +       }

[ Again, I'm responding to one random patch - this pattern was in
other patches too.  ]

A question: do we actually expect to mix page-less and pageful SG
entries in the same SG list?

How does that happen?

(I'm not saying it can't, I'm just wondering where people expect this
to happen).

IOW, maybe it would be valid to have a rule saying "a SG list is
either all pageful or pageless, never mixed", and then have the "if"
statement outside the loop rather than inside.

                      Linus

