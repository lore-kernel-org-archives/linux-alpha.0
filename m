From: Thomas Steudten <alpha@steudten.com>
Subject: Re: Kernel crash/ oops >= 2.6.5 with gcc 3.4.0 on alpha
Date: Fri, 28 May 2004 16:06:49 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <40B74779.40406@steudten.com>
References: <40B726C0.5030400@steudten.com> <20040528123758.GE19544@MAIL.13thfloor.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20040528123758.GE19544@MAIL.13thfloor.at>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Herbert Poetzl <herbert@13thfloor.at>
Cc: linux-admin@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

I upgrade the binutils from 2.15.90 to 2.15.91, but the same
message appears:

gcc -Wp,-MD,fs/cifs/.cifsfs.o.d -nostdinc -iwithprefix include -D__KERNEL__ -Iinclude  -Wall 
-Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -pipe -mno-fp-regs 
-ffixed-8 -msmall-data -mcpu=pca56 -Wa,-mev6 -O2 -fomit-frame-pointer 
-Wdeclaration-after-statement   -DMODULE -DKBUILD_BASENAME=cifsfs -DKBUILD_MODNAME=cifs -c -o 
fs/cifs/.tmp_cifsfs.o fs/cifs/cifsfs.c
{standard input}: Assembler messages:
{standard input}:7: Warning: setting incorrect section attributes for .got



> hmm, did you update the binutils too?
> (if not, I'd try that)
> 

-- 
Tom

LINUX user since kernel 0.99.x 1994.
RPM Alpha packages at http://alpha.steudten.com/packages
Want to know what S.u.S.E 1995 cdrom-set contains?


