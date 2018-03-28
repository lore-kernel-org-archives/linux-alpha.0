From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 01/16] initrd: Add generic code path for common initrd
 unloading logic.
Date: Wed, 28 Mar 2018 14:23:47 +0200
Message-ID: <CAMuHMdXwEL-gLxiVJwuxwRtkyhR=vEm3GP4dzJMpc1nS8AKxKQ@mail.gmail.com>
References: <20180324174458.26423-1-shea@shealevy.com> <20180324174458.26423-2-shea@shealevy.com>
 <20180328120440.GB1838@infradead.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=9RoS2A4VPsD624bAXH71eygUNzAQ2PXT9/E5Gc0ueqs=;
        b=U2wbnIElXcq8Y2XhTsBPRovgTxzsmrAtyMWP87/33ezXtjx2yWSsBnWaxYTtS0i+F4
         KCwK44sah3nYofnLaQH6vpZ85pSBTnyhhEqddKoI5YYFxIv0RotYO0mpdmmymMpBMdA/
         ifEOOJZJ1EdZQt/ERXeugf5C3LXAoVd5E2aVZUN7mMGltzYDKN+/JFL+Sh4fFUPRKCVv
         5mftfoX+qbsMzhlipdeiQc/ewazKizuBwPph649agSA34W596wrhtBsA+zJy4l2rcuon
         4ZA00CwEMD1C/ij/gYJSID5sugD6C/CkdJ9gz4QQqCzUqR8CDYZOY37v9JRHK7RI8Y7S
         ISrA==
In-Reply-To: <20180328120440.GB1838@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@infradead.org>
Cc: Shea Levy <shea@shealevy.com>, alpha <linux-alpha@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, arcml <linux-snps-arc@lists.infradead.org>, linux-c6x-dev@linux-c6x.org, "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, linux-m68k <linux-m68k@lists.linux-m68k.org>, nios2-dev@lists.rocketboards.org, Openrisc <openrisc@lists.librecores.org>, Parisc List <linux-parisc@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, Linux-sh list <linux-sh@vger.kernel.org>, uml-devel <user-mode-linux-devel@lists.sourceforge.net>

On Wed, Mar 28, 2018 at 2:04 PM, Christoph Hellwig <hch@infradead.org> wrote:
>> +#ifdef CONFIG_INITRAMFS_GENERIC_UNLOAD
>> +void free_initrd_mem(unsigned long start, unsigned long end)
>> +{
>> +       free_reserved_area((void *)start, (void *)end, -1, "initrd");
>> +}
>> +#endif
>
> Given how trivial this is and how many architectures can use it I'd
> reverse the polarity and add a CONFIG_HAVE_ARCH_FREE_INITRD_MEM
> instead.

And while adding "special" functionality to the generic version, more and more
users of CONFIG_HAVE_ARCH_FREE_INITRD_MEM will be removed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
