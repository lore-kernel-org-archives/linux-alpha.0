From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: Kernel crash/ oops >= 2.6.5 with gcc 3.4.0 on alpha
Date: Fri, 28 May 2004 14:37:58 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20040528123758.GE19544@MAIL.13thfloor.at>
References: <40B726C0.5030400@steudten.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <40B726C0.5030400@steudten.com>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Steudten <alpha@steudten.com>
Cc: linux-admin@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On Fri, May 28, 2004 at 01:47:12PM +0200, Thomas Steudten wrote:
> Hi
> 
> Sorry, maybe I miss some message before.
> 
> I build the 2.6.6 kernel with gcc-3.4.0 and it crashs after
> start some init scripts (got no log at this time).
> So I tried to rebuild my last build 2.6.5, and this
> crashs to. The build with gcc-3.3.3 works without problems.
> modutils-2.4.27
> 
> http://www.uwsg.iu.edu/hypermail/linux/kernel/0405.1/1532.html
> 
> No other application seems to fail with gcc-3.4.0 so I think
> this problem is in context to the relocation, modules and gcc-3.4.0.

hmm, did you update the binutils too?
(if not, I'd try that)

best,
Herbert

> make modules
> make[1]: `arch/alpha/kernel/asm-offsets.s' is up to date.
>   CC [M]  fs/binfmt_em86.o
> {standard input}: Assembler messages:
> {standard input}:7: Warning: setting incorrect section attributes for .got
>   CC [M]  fs/quota_v2.o
> {standard input}: Assembler messages:
> {standard input}:7: Warning: setting incorrect section attributes for .got
>   CC [M]  fs/autofs/dirhash.o
>   CC [M]  fs/autofs/init.o
> {standard input}: Assembler messages:
> {standard input}:7: Warning: setting incorrect section attributes for .got
>   CC [M]  fs/autofs/inode.o
> 
> 
> On x86 everything works without problems.
> 
> Please CC me.
> -- 
> Tom
> 
> LINUX user since kernel 0.99.x 1994.
> RPM Alpha packages at http://alpha.steudten.com/packages
> Want to know what S.u.S.E 1995 cdrom-set contains?
> 
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
