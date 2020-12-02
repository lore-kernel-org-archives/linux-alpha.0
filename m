From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 00/13] arch, mm: deprecate DISCONTIGMEM
Date: Wed, 2 Dec 2020 08:46:42 +0000
Message-ID: <20201202084642.GA28110@infradead.org>
References: <a7d01146-77f9-d363-af99-af3aee3789b4@physik.fu-berlin.de>
 <20201201102901.GF557259@kernel.org>
 <e3d5d791-8e4f-afcc-944c-24f66f329bd7@physik.fu-berlin.de>
 <20201201121033.GG557259@kernel.org>
 <49a2022c-f106-55ec-9390-41307a056517@physik.fu-berlin.de>
 <20201201135623.GA751215@kernel.org>
 <59351dbb-96cc-93b2-f2ec-b8968e935845@kernel.dk>
 <CAMuHMdWRc8W7U0LKyH9u1hdMuN515PCZiTEJ12FrDaCx-eTdaQ@mail.gmail.com>
 <20201202084326.GA26573@infradead.org>
 <efc13ee8-ec6c-a807-d866-99f72a94e3f5@physik.fu-berlin.de>
Mime-Version: 1.0
Return-path: <linux-doc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=EgWbwhZanvcG3KDeapbwhWc86PAn7HkZxY3ELBxHx7c=; b=jFFK4+AenZ8fG43jB6uYB1OVZc
        U2ORttouuxGAcrpVnQ/4DgFb7rK/0XjR9MXteR2VE5qgh5UOuTWpmiF+Dt3Ie93nc64B1/PzU5U6m
        rxry57k0/IZnU8nQmFKzgLH4GfXQEXYWEXXMWqEjf0RZz3MX0cdkV1F+EI3Plew988r7LOYtU/hb3
        67fEvzDLswKqZ4dMNM6vQICEpWo7AqyiDFrzxq61UPOyZjx9A+HC5IY9XNJk3HVus//9sPZW+nCFi
        8BzyDcO4IchhjQ6h5DQTd3a3NtY48VtlxXAa/Oyq+zpXcFp07vAQK4e+S8sfjGaBNEN4SBgFh6YBm
        5JU3U6sw==;
Content-Disposition: inline
In-Reply-To: <efc13ee8-ec6c-a807-d866-99f72a94e3f5@physik.fu-berlin.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Christoph Hellwig <hch@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Linux MM <linux-mm@kvack.org>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, Jonathan Corbet <corbet@lwn.net>, Meelis Roos <mroos@linux.ee>, Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>, Alexey Dobriyan <adobriyan@gmail.com>, Michael Schmitz <schmitzmic@gmail.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Jens Axboe <axboe@kernel.dk>, Tony

On Wed, Dec 02, 2020 at 09:45:24AM +0100, John Paul Adrian Glaubitz wrote:
> > I've never got results.  Which is annoying, as debian doesn't ship an
> > ia64 cross toolchain either, and I can't find any pre-built one that
> > works for me.
> 
> The ia64 toolchain available from kernel.org works for me for cross-building
> a kernel that boots on my RX2600.
> 
> It's just not a fully-fledged toolchain due to the limitations with libunwind.

Actually, you are right, I did manage to finally get that working a
while ago.  I think openrisc is the one where I failed to get anything
to work at all now that I think of it.
