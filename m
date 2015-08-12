From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 29/31] parisc: handle page-less SG entries
Date: Wed, 12 Aug 2015 09:01:02 -0700
Message-ID: <CA+55aFxsH9Lde7wqZi555vqfH2uxeQqC9cjeca9L6Wr=XpyzXA@mail.gmail.com>
References: <1439363150-8661-1-git-send-email-hch@lst.de>
	<1439363150-8661-30-git-send-email-hch@lst.de>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=uE+jlzjQ6ahipSG8Nj+bY6dbWKdWRTbXaVBH8/czOsk=;
        b=EWGoKlkvIHr3rbeEbqmfEVEfwBfTuwmKbXcie9HqS6GBRUIhTJj8H3YeacvEyke3xW
         EXqkqwUax179k+jv0ouv6A6kxbr3m15JimhcbvKlBMHO+8fxdEitdX8s/pouZ9fw55pK
         R0/6uxTeBM0akE9PI7dA8deKMKm3H5VEJJjjUcnzhV1s4/PXIBKyBBrwn+zbr1RtXDIs
         AVWJkPgxBzICco6QNR2YueQqUJnU771+DJEaT3xVrmv3npsfTFLiKF6OxWnnWDVNCvPP
         U97fUWnCyI0USs75jOv1/35gVcLfAs+NNSma76KYz00dHEtEBDMwQF4YDb8qm+9b/wtk
         6Utw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=uE+jlzjQ6ahipSG8Nj+bY6dbWKdWRTbXaVBH8/czOsk=;
        b=Fk/NseaDldn9TyxCB7uoVACB5708PV8X3ygwx8tsPokEDvqev0eVnWQAiNGfBNhVwc
         MB2HrPJIObht4uqCHoVrxUft3IiicZkFTemzOZopeXeTXAoMC1lsFrovvK0UbxZT5JxT
         lSmu8lqZvviynCMBLmLmR5aT9e9PFcN8gQ5bA=
In-Reply-To: <1439363150-8661-30-git-send-email-hch@lst.de>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Dan Williams <dan.j.williams@intel.com>, Vineet Gupta <vgupta@synopsys.com>, =?UTF-8?Q?H=C3=A5vard_Skinnemoen?= <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, Miao Steven <realmz6@gmail.com>, David Howells <dhowells@redhat.com>, Michal Simek <monstr@monstr.eu>, the arch/x86 maintainers <x86@kernel.org>, David Woodhouse <dwmw2@infradead.org>, Alex Williamson <alex.williamson@redhat.com>, grundler@parisc-linux.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, linux-alpha@vger.kernel.org, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, linux-metag@vger.kernel.org, linux-mips <linux-mips@linux-mips.org>, Parisc List <linux-parisc@vger.kernel.org>, ppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-s390 <linux-s390@vger.kernel.org>, s

On Wed, Aug 12, 2015 at 12:05 AM, Christoph Hellwig <hch@lst.de> wrote:
> Make all cache invalidation conditional on sg_has_page() and use
> sg_phys to get the physical address directly.

So this worries me a bit (I'm just reacting to one random patch in the series).

The reason?

I think this wants a big honking comment somewhere saying "non-sg_page
accesses are not necessarily cache coherent").

Now, I don't think that's _wrong_, but it's an important distinction:
if you look up pages in the page tables directly, there's a very
subtle difference between then saving just the pfn and saving the
"struct page" of the result.

On sane architectures, this whole cache flushing thing doesn't matter.
Which just means that it's going to be even more subtle on the odd
broken ones..

I'm assuming that anybody who wants to use the page-less
scatter-gather lists always does so on memory that isn't actually
virtually mapped at all, or only does so on sane architectures that
are cache coherent at a physical level, but I'd like that assumption
*documented* somewhere.

(And maybe it is, and I just didn't get to that patch yet)

                   Linus
