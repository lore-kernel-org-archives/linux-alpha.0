From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 29/31] parisc: handle page-less SG entries
Date: Thu, 13 Aug 2015 20:30:49 -0700
Message-ID: <CAA9_cmcNA__N_yVTKsEqLAKBuoL-hx73t6opdsmb7w-0qKXaWg@mail.gmail.com>
References: <1439363150-8661-1-git-send-email-hch@lst.de>
	<1439363150-8661-30-git-send-email-hch@lst.de>
	<CA+55aFxsH9Lde7wqZi555vqfH2uxeQqC9cjeca9L6Wr=XpyzXA@mail.gmail.com>
	<20150813143150.GA17183@lst.de>
Mime-Version: 1.0
Return-path: <sparclinux-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=bjXLH5/e3N/AsOZUEYEZobHeJmOkpGKb2isa0VQp1k8=;
        b=KeY49bDDQPWnDw82TrEBfw/p5mccAACHCoAJp7JGLdm5aHqsmEHLJdHQhjDXPe28tD
         LgAj/6MQVwc38L8KAlqJvxxedBrC0QWjT/Aqlaun8xPnZWfCfbcp0/aob+naoru+YyaW
         yZmsebi/RvW+miRpWxDEHekr9+3er50T7r0JMOfy4MmX13ipo4vY59Ar9tJ9ZN6RXKoe
         CN2UfoBPA/K5EBwvmHAiVBkHB5kLCr/a44CCQRLK7rWLvj+7jS74iD61PCaTZOJiGnrZ
         virePPAUPke2RTlr6JIGt13fDKY4DTeaVHubIyNLWySUgi2OSMsFlfIxvbq6wUmrpS6v
         gXaQ==
In-Reply-To: <20150813143150.GA17183@lst.de>
Sender: sparclinux-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mips <linux-mips@linux-mips.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-nvdimm@lists.01.org" <linux-nvdimm@ml01.01.org>, David Howells <dhowells@redhat.com>, sparclinux@vger.kernel.org, Hans-Christian Egtvedt <egtvedt@samfundet.no>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, David Woodhouse <dwmw2@infradead.org>, =?UTF-8?Q?H=C3=A5vard_Skinnemoen?= <hskinnemoen@gmail.com>, linux-xtensa@linux-xtensa.org, grundler@parisc-linux.org, Miao Steven <realmz6@gmail.com>, Alex Williamson <alex.williamson@redhat.com>, linux-metag@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Michal Simek <monstr@monstr.eu>, Parisc List <linux-parisc@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>, Linux

On Thu, Aug 13, 2015 at 7:31 AM, Christoph Hellwig <hch@lst.de> wrote:
> On Wed, Aug 12, 2015 at 09:01:02AM -0700, Linus Torvalds wrote:
>> I'm assuming that anybody who wants to use the page-less
>> scatter-gather lists always does so on memory that isn't actually
>> virtually mapped at all, or only does so on sane architectures that
>> are cache coherent at a physical level, but I'd like that assumption
>> *documented* somewhere.
>
> It's temporarily mapped by kmap-like helpers.  That code isn't in
> this series. The most recent version of it is here:
>
> https://git.kernel.org/cgit/linux/kernel/git/djbw/nvdimm.git/commit/?h=pfn&id=de8237c99fdb4352be2193f3a7610e902b9bb2f0
>
> note that it's not doing the cache flushing it would have to do yet, but
> it's also only enabled for x86 at the moment.

For virtually tagged caches I assume we would temporarily map with
kmap_atomic_pfn_t(), similar to how drm_clflush_pages() implements
powerpc support.  However with DAX we could end up with multiple
virtual aliases for a page-less pfn.
