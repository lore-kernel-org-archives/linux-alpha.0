From: Balint Cristian <rezso@rdsor.ro>
Subject: Re: Kernel crash/ oops >= 2.6.5 with gcc 3.4.0 on alpha
Date: Fri, 28 May 2004 17:19:20 -0400
Sender: linux-admin-owner@vger.kernel.org
Message-ID: <200405281719.20593.rezso@rdsor.ro>
References: <40B726C0.5030400@steudten.com> <20040528123758.GE19544@MAIL.13thfloor.at> <40B74779.40406@steudten.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-admin-owner@vger.kernel.org>
In-Reply-To: <40B74779.40406@steudten.com>
Content-Disposition: inline
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Steudten <alpha@steudten.com>
Cc: Herbert Poetzl <herbert@13thfloor.at>, linux-admin@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On Friday 28 May 2004 10:06, Thomas Steudten wrote:
> I upgrade the binutils from 2.15.90 to 2.15.91, but the same
> message appears:
> 
> gcc -Wp,-MD,fs/cifs/.cifsfs.o.d -nostdinc -iwithprefix include -D__KERNEL__ -Iinclude  -Wall 
> -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -pipe -mno-fp-regs 
> -ffixed-8 -msmall-data -mcpu=pca56 -Wa,-mev6 -O2 -fomit-frame-pointer 
> -Wdeclaration-after-statement   -DMODULE -DKBUILD_BASENAME=cifsfs -DKBUILD_MODNAME=cifs -c -o 
> fs/cifs/.tmp_cifsfs.o fs/cifs/cifsfs.c
> {standard input}: Assembler messages:
> {standard input}:7: Warning: setting incorrect section attributes for .got
>
Hi  !

I got same error with 2.6.7-rc1 !

I tryed 2 days ago with FC2 3.3.3-7 gcc and very latest CVS binutils.
I tryed with older 3 variants of binutils, i suspect gcc rather than binutils or else.
	The ony what i dont tryed is older gcc.

 
> 
> 
> > hmm, did you update the binutils too?
> > (if not, I'd try that)
> > 
> 
