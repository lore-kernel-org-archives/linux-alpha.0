From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v3 03/24] arm: Remove COMMAND_LINE_SIZE from uapi
Date: Thu, 23 Feb 2023 10:54:26 +0100
Message-ID: <CAHVXubgsvjxGbgM6AcxfsHDsHT0iL2pAemGMr5t8KVLKiqC3RA@mail.gmail.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-4-alexghiti@rivosinc.com> <Y+zXIgwO5wteLQZ5@shell.armlinux.org.uk>
 <f3e1585c-0d9d-4709-9b21-74a63d8cc9ac@app.fastmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IF2/hNB/wngiiK5bgc73OKj3lQ88LH+GtO8TQr8wKjI=; b=Gvt6AcRUysmYoH
	e0KlldznOjKwwG+E42/h3pJC8bD3/UfBnJnyMb1dHIf71O3cxj5kew72VVQOkWVbX4ZpG7Fm0DvUb
	ZUFdyvKRos6AAeanpZCdeZ4+p9vktRwfcFGzwzZ9vS8HLIoocxssJV/Qs/wfgQ2LYOHnqw7SKCaLz
	AAQZia3UEvn0EHriCICMd3HVlXC16Thv0sQzidoUvzSnIaVqQWkHbSYaGpfxT0k/p/mplWiPlipM3
	D32RvxJMyukdr/n5hfAzdQSnxGR4NoEohUAo9d+fg/xtGND+abSvpcA5MQUGQi6S7MF1eT2IoxRw2
	L7MWE1nmwd/St4XM4QOw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mAI7GZiBb7iDC4DRNXr8MXcTGzYlBwIWTXO3a37K9fA=;
        b=6rqEsmJobKimBOx+ObGs4Y9oYCoGGA+7PUJSCUc+XzhAJr7k8trhGNeL9l///zHG9h
         zKi4GFdApLZMJxwwGKyAK5T4vZVP0aQ3XXyt/OWPp5oueU3BzBJzSR5QoLC+/Xx2iJgz
         5hm79+32XzmlSgEMuCRgCF6jE20gfyjKVSWE2hFVc6aKlMZQREWTRqXyzaVmSBj/MhzH
         AXlVDuu21E6Hjr/kwbOkk278Lu43ZitZTQ7OHZU1h8q5OpD5tJY9ufRMnPPJf2Rq79nz
         v4bZ2eQSQps7BpX5yAyoX5mS+40xRdAoLwhab6GQ6F1yPaND58wp3xipYKvUJEcT++Q8
         E7ow==
In-Reply-To: <f3e1585c-0d9d-4709-9b21-74a63d8cc9ac@app.fastmail.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>

Hi Arnd,

On Wed, Feb 15, 2023 at 2:05 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Feb 15, 2023, at 13:59, Russell King (Oracle) wrote:
> > On Tue, Feb 14, 2023 at 08:49:04AM +0100, Alexandre Ghiti wrote:
> >> From: Palmer Dabbelt <palmer@rivosinc.com>
> >>
> >> As far as I can tell this is not used by userspace and thus should not
> >> be part of the user-visible API.
> >>
> >> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> >
> > Looks good to me. What's the merge plan for this?
>
> The easiest way is probably if I merge it through the whole
> series through the asm-generic tree. The timing is a bit
> unfortunate as we're just ahead of the merge window, so unless
> we really need this in 6.3, I'd suggest that Alexandre resend
> the series to me in two weeks with the Acks added in and I'll
> pick it up for 6.4.

Sorry for the response delay, I was waiting to see if Palmer would
merge my KASAN patchset in 6.3 (which he does): I have to admit that
fixing the command line size + the KASAN patchset would allow 6.3 to
run on syzkaller, which would be nice.

If I don't see this merged in 6.3, I'll send another round as you
suggested in 1 week now :)

Thanks!

Alex

>
>      Arnd
