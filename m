From: Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [PATCH v3 00/24] Remove COMMAND_LINE_SIZE from uapi
Date: Tue, 14 Feb 2023 09:38:47 +0100
Message-ID: <Y+tIl07KOOrGZ2Et@osiris>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N9Dr6deziRiYIJA5gCEMcSyyPwD9fDBGorSmYJxpwHQ=; b=SketelRUP0tC08
	LaCJJ0vPkkN9aPmdTcxD1/NtH9TOLgFHEumAikpKXKxTN4OHmkiBFokjjLEre9Qu4HlugTLqJOZHU
	BO0PVcHBW0gL/JVBa8YgI8q82liHhQDktn3RzLV0FBpYuIWwHEHhJLOPFSbrENq+UK2iA+huBKXf+
	cuZ5/o5gch7tYlQSWUpS1QAZlYx7wekDhObakEzJQAjnIaTq6rXgRUU3+r5rnikqdvObKEpDvHIH/
	j9imb0J51DYJR+QtdZZy86qU/4yoQYchfmjS6MRWYwMG8QQdz4FaQV6akXBMjX58fR0OaXzi5SbZT
	jWuK7o5KCthAe9YrcOlQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=XmTTRTqN8QHhuqqaK0B4wcZMFk6wbx4+9SlCVYUudEg=;
 b=q0CFhD00GHRgiAn5Lc7+9XPoIXhbH37jo9LPP5gO0FR/vTvQM2oqGpmnUzQ/izmDF9v0
 KdAdBX+lzRH997zibc6I+ZDhX9NkR3s4PeteSiWnk3qMLqykhF7VHts/j4ounccd62iV
 6zcE2d9N3AcFvu42RVPJGqHk19n5kfAfYcELyf5vZX21pLHO9cWuVpRgVcF4ehkFPB9o
 K9L59Nu09a5yT/SgLgfiy57OTzuJRb0tm23G7nl+ZAEOvsDYZRkFKkNDE7G+veUt0tTq
 kDWPNL6pCGB2ooJtc34IbfhYfLJPh8EqpCM4gyBz9pzkOASeQq1W919Hg2daScb2Sld3 rg== 
Content-Disposition: inline
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
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
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, Pa

On Tue, Feb 14, 2023 at 08:49:01AM +0100, Alexandre Ghiti wrote:
> This all came up in the context of increasing COMMAND_LINE_SIZE in the
> RISC-V port.  In theory that's a UABI break, as COMMAND_LINE_SIZE is the
> maximum length of /proc/cmdline and userspace could staticly rely on
> that to be correct.
> 
> Usually I wouldn't mess around with changing this sort of thing, but
> PowerPC increased it with a5980d064fe2 ("powerpc: Bump COMMAND_LINE_SIZE
> to 2048").  There are also a handful of examples of COMMAND_LINE_SIZE
> increasing, but they're from before the UAPI split so I'm not quite sure
> what that means: e5a6a1c90948 ("powerpc: derive COMMAND_LINE_SIZE from
> asm-generic"), 684d2fd48e71 ("[S390] kernel: Append scpdata to kernel
> boot command line"), 22242681cff5 ("MIPS: Extend COMMAND_LINE_SIZE"),
> and 2b74b85693c7 ("sh: Derive COMMAND_LINE_SIZE from
> asm-generic/setup.h.").
> 
> It seems to me like COMMAND_LINE_SIZE really just shouldn't have been
> part of the uapi to begin with, and userspace should be able to handle
> /proc/cmdline of whatever length it turns out to be.  I don't see any
> references to COMMAND_LINE_SIZE anywhere but Linux via a quick Google
> search, but that's not really enough to consider it unused on my end.
> 
> The feedback on the v1 seemed to indicate that COMMAND_LINE_SIZE really
> shouldn't be part of uapi, so this now touches all the ports.  I've
> tried to split this all out and leave it bisectable, but I haven't
> tested it all that aggressively.

Just to confirm this assumption a bit more: that's actually the same
conclusion that we ended up with when commit 3da0243f906a ("s390: make
command line configurable") went upstream.
