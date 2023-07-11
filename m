From: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v3 2/5] fs: Add fchmodat4()
Date: Tue, 11 Jul 2023 13:52:01 +0200
Message-ID: <20230711-demolieren-nilpferd-80ffe47563ad@brauner>
References: <87o8pscpny.fsf@oldenburg2.str.redhat.com>
 <cover.1689074739.git.legion@kernel.org>
 <d11b93ad8e3b669afaff942e25c3fca65c6a983c.1689074739.git.legion@kernel.org>
 <83363cbb-2431-4520-81a9-0d71f420cb36@app.fastmail.com>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689076336;
        bh=FEYwsW8eEVWKaDxjSpsLJzH203pRDz88SghdcKEI1Cc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=djo5kRUxcwGp9ZdqEH8AfNMhg0qsCG7bCvPx452SCCqbjaEm9+RUsFZgu/4Zib58z
         5wxZbVUvaLPjWynxuO9RjNWPxwRPiLlpBdpq7u67qP6VP0a5PV7Uq/N8eVnqF7Ktse
         bN/LatBa45dmE7fM0H3vOwVGIv+ESV5MlxzwYjjKXjjGFgQCBBr1R1dqqxW1RDhTHc
         BWhV6dQRSlMUIxiZQOE2JLF8NE1hMXxoZ08a4cE6AuaFymusAbOhm10YCvIc5/7Agj
         whDEvFt+uIB5AOK9f11RR8rXlvAFr5opLcAF5l/puWqcOG6Aj8zCTnMsnaYx+/nGRM
         iFCAZ/+dDnSMg==
Content-Disposition: inline
In-Reply-To: <83363cbb-2431-4520-81a9-0d71f420cb36@app.fastmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexey Gladkov <legion@kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, Palmer Dabbelt <palmer@sifive.com>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jens Axboe <axboe@kernel.dk>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christian Borntraeger <borntraeger@de.ibm.com>, Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, christian@brauner.io, Rich Felker <dalias@libc.org>, "David S . Miller" <davem@davemloft.net>, Deepa Dinamani <deepa.kernel@gmail.com>, Helge Deller <deller@gmx.de>, David

On Tue, Jul 11, 2023 at 01:42:19PM +0200, Arnd Bergmann wrote:
> On Tue, Jul 11, 2023, at 13:25, Alexey Gladkov wrote:
> > From: Palmer Dabbelt <palmer@sifive.com>
> >
> > On the userspace side fchmodat(3) is implemented as a wrapper
> > function which implements the POSIX-specified interface. This
> > interface differs from the underlying kernel system call, which does not
> > have a flags argument. Most implementations require procfs [1][2].
> >
> > There doesn't appear to be a good userspace workaround for this issue
> > but the implementation in the kernel is pretty straight-forward.
> >
> > The new fchmodat4() syscall allows to pass the AT_SYMLINK_NOFOLLOW flag,
> > unlike existing fchmodat.
> >
> > [1] 
> > https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/fchmodat.c;h=17eca54051ee28ba1ec3f9aed170a62630959143;hb=a492b1e5ef7ab50c6fdd4e4e9879ea5569ab0a6c#l35
> > [2] 
> > https://git.musl-libc.org/cgit/musl/tree/src/stat/fchmodat.c?id=718f363bc2067b6487900eddc9180c84e7739f80#n28
> >
> > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> > Signed-off-by: Alexey Gladkov <legion@kernel.org>
> 
> I don't know the history of why we ended up with the different
> interface, or whether this was done intentionally in the kernel
> or if we want this syscall.
> 
> Assuming this is in fact needed, I double-checked that the
> implementation looks correct to me and is portable to all the
> architectures, without the need for a compat wrapper.
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>

The system call itself is useful afaict. But please,

s/fchmodat4/fchmodat2/

With very few exceptions we don't version by argument number but by
revision and we should stick to one scheme:

openat()->openat2()
eventfd()->eventfd2()
clone()/clone2()->clone3()
dup()->dup2()->dup3() // coincides with nr of arguments
pipe()->pipe2() // coincides with nr of arguments
renameat()->renameat2()
