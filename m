From: mikado@4vn.org
Subject: Re: Kernel crash/ oops >= 2.6.5 with gcc 3.4.0 on alpha
Date: Fri, 28 May 2004 07:46:55 -0600
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <1085752015.40b742cfc3dc6@webmail.4vn.org>
References: <40B726C0.5030400@steudten.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <40B726C0.5030400@steudten.com>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Steudten <alpha@steudten.com>
Cc: linux-admin@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

I also have this problem. compiling kernel process failed with gcc-3.4.0. i'm
using gcc-3.3.3. Any idea???

Quoting Thomas Steudten <alpha@steudten.com>:

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
> 
> make modules
> make[1]: `arch/alpha/kernel/asm-offsets.s' is up to date.
>    CC [M]  fs/binfmt_em86.o
> {standard input}: Assembler messages:
> {standard input}:7: Warning: setting incorrect section attributes for .got
>    CC [M]  fs/quota_v2.o
> {standard input}: Assembler messages:
> {standard input}:7: Warning: setting incorrect section attributes for .got
>    CC [M]  fs/autofs/dirhash.o
>    CC [M]  fs/autofs/init.o
> {standard input}: Assembler messages:
> {standard input}:7: Warning: setting incorrect section attributes for .got
>    CC [M]  fs/autofs/inode.o
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
> To unsubscribe from this list: send the line "unsubscribe linux-admin" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 




