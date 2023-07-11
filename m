From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v3 2/5] fs: Add fchmodat4()
Date: Tue, 11 Jul 2023 13:28:04 +0100
Message-ID: <ZK1K1BOf43JOJWMx@casper.infradead.org>
References: <87o8pscpny.fsf@oldenburg2.str.redhat.com>
 <cover.1689074739.git.legion@kernel.org>
 <d11b93ad8e3b669afaff942e25c3fca65c6a983c.1689074739.git.legion@kernel.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Hu/F5cIunoMaT6a9kqfbZcMI7NNurFOLxchc3V/T840=; b=Gyep6a1gLgAdGC/Vi+oGeCj6t2
        IKyL5/1RD8Tt4FNIzAW4j/atfGUaAPjhcTyA3GXH97IiwjxIU7Y/8B0fe9w8Muqivjaw/yL4bo5D4
        5ZB6Z3jktax9ZhaYYlnpZ/6Oq2ASsc4zeolrABZ2MM6Kdwl61InYH3P9Iq/clR9bEshpkcTPgt83a
        HcgfknEVHsZHsbDQUQVwhK7+voDCXknT2H10c2k4CU3PIKN/myEz2CoJrRiGA1cFSqntUv8vLlRLZ
        MsgcNgtIOxR6kAkYIn3W2vzZiImwsqNNg3I5cIwMsUw6LmokGgjjMBQXCL8w1O5cla/0aNYRbdjkx
        RH8+Ud9g==;
Content-Disposition: inline
In-Reply-To: <d11b93ad8e3b669afaff942e25c3fca65c6a983c.1689074739.git.legion@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Gladkov <legion@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, Palmer Dabbelt <palmer@sifive.com>, James.Bottomley@hansenpartnership.com, acme@kernel.org, alexander.shishkin@linux.intel.com, axboe@kernel.dk, benh@kernel.crashing.org, borntraeger@de.ibm.com, bp@alien8.de, catalin.marinas@arm.com, christian@brauner.io, dalias@libc.org, davem@davemloft.net, deepa.kernel@gmail.com, deller@gmx.de, dhowells@redhat.com, fenghua.yu@intel.com, firoz.khan@linaro.org, fweimer@redhat.com, geert@linux-m68k.org, glebfm@altlinux.org, gor@linux.ibm.com, hare@suse.com, heiko.carstens@de.ibm.com, hpa@zytor.com, ink@jurassic.park.msu.ru, jhogan@kernel.org, kim.phillips@arm.com, ldv@altlinux.org, linux-alpha@vger.k

On Tue, Jul 11, 2023 at 01:25:43PM +0200, Alexey Gladkov wrote:
> -static int do_fchmodat(int dfd, const char __user *filename, umode_t mode)
> +static int do_fchmodat4(int dfd, const char __user *filename, umode_t mode, int lookup_flags)

This function can still be called do_fchmodat(); we don't need to
version internal functions.

