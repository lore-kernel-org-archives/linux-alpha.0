From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 00/24] Remove COMMAND_LINE_SIZE from uapi
Date: Thu, 02 Mar 2023 11:50:45 -0800
Message-ID: <21F95EC4-71EA-4154-A7DC-8A5BA54F174B@zytor.com>
References: <mhng-e8b09772-24e5-4729-a0bf-01a9e4c76636@palmer-ri-x1c9a>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JCnmE6LIEcDQBPz5ULLbVs00hjQBsn/l0EA6UcEh4uw=; b=qUjw3Xf+7m+rvf
	LMH4MKooK9ydqKArkxKDoNvbizjWLC949GZRT++6GMMy+bMo6DJjsXwIK2sdH3uYpIyB5Qwya/JjC
	2OBZ10n9Edtpz3776Sh0ZzcKtSGdRjUlupAJjhgAT0k9suPHJvOHM9V5XafrNBgMWkC8ookDpLaal
	Fz4ctbg+qdmBDuwxjvudnypwzcU3/gD3NQYnVKpAVIqu8hbx5TpN2aDxlIk4BrKs12wh3lLLXEZsz
	SExiyvrzCfyfWZF5LJ3Fbs2F/wPySu9iCvu22bx88I+4suzcnnpTyF2NzO+njpaIz2sgoZxKzzKD6
	+vVRWTjG7rZ3VBU7tt1g==;
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 322JolfB1654568
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2023020601; t=1677786658;
	bh=n/GRsm1pImWCPNm4dPoe5zec7Kp4K3JReb8gPrI8/mc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=EoMqj2NrvtdnnKP1K3ZY31x6mzZLyhmRVv+AfJ7wKdoAJbCxWwA+q2O/5sMmJVAVH
	 CBl1NaM0Y8H4KZuzvQjbNwKYV6dXCiIfmDalzvbDgGVmn+bMayegSv6UvQXFNOV7kH
	 d/WVC69GzUYAENKo48YQjfv0/LuQNbAN20Le/uIDHGiGr9P8B8oHP2fS95eG5xB58F
	 uasUM1VqxwzDuwffGGAapL9uswmgoHxhnTzGnsDohaOFjOu2pxA/e5nnYVugsNl2zn
	 98XlC/4jazJIi0XM8kFrS6seI0EpKbWqSgJdlLGlfl4yBTPVtfQW74gM369HHmiIcn
	 4YRgUzYFXGcXg==
In-Reply-To: <mhng-e8b09772-24e5-4729-a0bf-01a9e4c76636@palmer-ri-x1c9a>
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
To: Palmer Dabbelt <palmer@dabbelt.com>, hca@linux.ibm.com
Cc: geert@linux-m68k.org, alexghiti@rivosinc.com, corbet@lwn.net, Richard Henderson <richard.henderson@linaro.org>, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@kernel.org, linux@armlinux.org.uk, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, chenhuacai@kernel.org, kernel@xen0n.name, monstr@monstr.eu, tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, deller@gmx.de, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, ysato@users.osdn.me, dalias@libc.org, davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org

On March 1, 2023 7:17:18 PM PST, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>On Tue, 14 Feb 2023 01:19:02 PST (-0800), hca@linux.ibm.com wrote:
>> On Tue, Feb 14, 2023 at 09:58:17AM +0100, Geert Uytterhoeven wrote:
>>> Hi Heiko,
>>> 
>>> On Tue, Feb 14, 2023 at 9:39 AM Heiko Carstens <hca@linux.ibm.com> wrote:
>>> > On Tue, Feb 14, 2023 at 08:49:01AM +0100, Alexandre Ghiti wrote:
>>> > > This all came up in the context of increasing COMMAND_LINE_SIZE in the
>>> > > RISC-V port.  In theory that's a UABI break, as COMMAND_LINE_SIZE is the
>>> > > maximum length of /proc/cmdline and userspace could staticly rely on
>>> > > that to be correct.
>>> > >
>>> > > Usually I wouldn't mess around with changing this sort of thing, but
>>> > > PowerPC increased it with a5980d064fe2 ("powerpc: Bump COMMAND_LINE_SIZE
>>> > > to 2048").  There are also a handful of examples of COMMAND_LINE_SIZE
>>> > > increasing, but they're from before the UAPI split so I'm not quite sure
>>> > > what that means: e5a6a1c90948 ("powerpc: derive COMMAND_LINE_SIZE from
>>> > > asm-generic"), 684d2fd48e71 ("[S390] kernel: Append scpdata to kernel
>>> > > boot command line"), 22242681cff5 ("MIPS: Extend COMMAND_LINE_SIZE"),
>>> > > and 2b74b85693c7 ("sh: Derive COMMAND_LINE_SIZE from
>>> > > asm-generic/setup.h.").
>>> > >
>>> > > It seems to me like COMMAND_LINE_SIZE really just shouldn't have been
>>> > > part of the uapi to begin with, and userspace should be able to handle
>>> > > /proc/cmdline of whatever length it turns out to be.  I don't see any
>>> > > references to COMMAND_LINE_SIZE anywhere but Linux via a quick Google
>>> > > search, but that's not really enough to consider it unused on my end.
>>> > >
>>> > > The feedback on the v1 seemed to indicate that COMMAND_LINE_SIZE really
>>> > > shouldn't be part of uapi, so this now touches all the ports.  I've
>>> > > tried to split this all out and leave it bisectable, but I haven't
>>> > > tested it all that aggressively.
>>> >
>>> > Just to confirm this assumption a bit more: that's actually the same
>>> > conclusion that we ended up with when commit 3da0243f906a ("s390: make
>>> > command line configurable") went upstream.
>
>Thanks, I guess I'd missed that one.  At some point I think there was some discussion of making this a Kconfig for everyone, which seems reasonable to me -- our use case for this being extended is syzkaller, but we're sort of just picking a value that's big enough for now and running with it.
>
>Probably best to get it out of uapi first, though, as that way at least it's clear that it's not uABI.
>
>>> Commit 622021cd6c560ce7 ("s390: make command line configurable"),
>>> I assume?
>> 
>> Yes, sorry for that. I got distracted while writing and used the wrong
>> branch to look this up.
>
>Alex: Probably worth adding that to the list in the cover letter as it looks like you were planning on a v4 anyway (which I guess you now have to do, given that I just added the issue to RISC-V).

The only use that is uapi is the *default* length of the command line if the kernel header doesn't include it (in the case of x86, it is in the bzImage header, but that is atchitecture- or even boot format-specific.)
