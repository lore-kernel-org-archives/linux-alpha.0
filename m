From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v3 03/24] arm: Remove COMMAND_LINE_SIZE from uapi
Date: Thu, 23 Feb 2023 14:11:55 +0100
Message-ID: <CAHVXubidtBHNi8iFrFAWqRtkxiUBbmzzXFn+=R1DjEd5X0SpQw@mail.gmail.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-4-alexghiti@rivosinc.com> <Y+zXIgwO5wteLQZ5@shell.armlinux.org.uk>
 <f3e1585c-0d9d-4709-9b21-74a63d8cc9ac@app.fastmail.com> <CAHVXubgsvjxGbgM6AcxfsHDsHT0iL2pAemGMr5t8KVLKiqC3RA@mail.gmail.com>
 <874b8076-b0d1-4aaa-bcd8-05d523060152@app.fastmail.com>
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
	List-Owner; bh=6Q1S5Aj4MA+T3czSChAYb1xGgt7vbOfKrAx2PNzN0d4=; b=Ab3EIaTPJ1a3+B
	gwa5C0RLfZSZwH6pNR3VZkdKvDBnPn/0g1MCjNMIlIzaWITLTY7663ltrNdLRdsQx6l8+9iQqj5o8
	1x4ozdT8Etw7dRhX4aSL05xBq6Zhujss8M8Q78G2bIyZsrXuqZ3rUGoyI1TKMjXXoNRMIke1K8uSj
	J267MIhhslKb83dJBVsSH2QW8Q0Tz0uduYsq3iJ5DP2HdBd8hPLcyS88Ewk2sZo/1K96i062FK7eh
	c05KwjfLWvjb//+at9nnPqLRME/ox9pgt3F7GRQiuXWKJ2Ldm6b8b9waSSHWkiBkmrbtuOj6Ynk8u
	PhsFoRKhPp1Wd77OVDTQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tb59OZw0P/9NeiLo7j0/pIIcP5QkKD4A9oJDDcL4MAg=;
        b=hrlRDOKwOAsNkn63EV7n3EEAQ4B9IaQtA8AIfHsOiB4TORHkWY2kK38L935i7RoAkO
         olQa3vClBYmwI8KwEFJB6OPacgNRv5x0BN4vdHf3XCEpriaGT+omA4tS0gMZiZxKcc3F
         KYWPSwsUHx/frhqkq7A+J1wZizAG8ePYV7KvjhBPsnTPCUograCrVBFqcg6srDhRwA+g
         U3yCkqCB9uB9VtPc5hwrVaCL1hVrTXMesQpZ4o6rR2fhIdFruEUpbstEzITPCLTBBZC5
         KBWMT1Y873RFeL8aM322RZ3QoSZitsWNIn2ZjY4a1FDfQORGN+A8UZHYx1nVnn/nmc6t
         CSGg==
In-Reply-To: <874b8076-b0d1-4aaa-bcd8-05d523060152@app.fastmail.com>
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

On Thu, Feb 23, 2023 at 2:09 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Feb 23, 2023, at 10:54, Alexandre Ghiti wrote:
> > On Wed, Feb 15, 2023 at 2:05 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >>
> >> On Wed, Feb 15, 2023, at 13:59, Russell King (Oracle) wrote:
> >> > On Tue, Feb 14, 2023 at 08:49:04AM +0100, Alexandre Ghiti wrote:
> >> >> From: Palmer Dabbelt <palmer@rivosinc.com>
> >> >>
> >> >> As far as I can tell this is not used by userspace and thus should not
> >> >> be part of the user-visible API.
> >> >>
> >> >> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> >> >
> >> > Looks good to me. What's the merge plan for this?
> >>
> >> The easiest way is probably if I merge it through the whole
> >> series through the asm-generic tree. The timing is a bit
> >> unfortunate as we're just ahead of the merge window, so unless
> >> we really need this in 6.3, I'd suggest that Alexandre resend
> >> the series to me in two weeks with the Acks added in and I'll
> >> pick it up for 6.4.
> >
> > Sorry for the response delay, I was waiting to see if Palmer would
> > merge my KASAN patchset in 6.3 (which he does): I have to admit that
> > fixing the command line size + the KASAN patchset would allow 6.3 to
> > run on syzkaller, which would be nice.
> >
> > If I don't see this merged in 6.3, I'll send another round as you
> > suggested in 1 week now :)
>
> Hi Alexandre,
>
> I have no plans to still pick up the series for 6.3. The patches
> all look fine to me, but it's clearly too late now. What is the
> actual dependency for KASAN, do you just need a longer command
> line or something else? If it's just the command line size,
> I would suggest that Palmer can still pick up a oneline change
> to increase it and refer to this thread in the changelog as a
> reference for why it is not an actual UAPI break.

Indeed, we only need a longer command line size. I'll ask Palmer to do
that then, thanks!

Alex

>
>      Arnd
