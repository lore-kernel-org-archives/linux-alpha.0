From: Mathieu Chouquet-Stringer <mchouque@online.fr>
Subject: Compiling latest 2.6 bk snapshot on Alpha
Date: Wed, 3 Sep 2003 10:31:57 -0400
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <20030903143157.GA17699@localhost>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

	  Hi all,

I've been hitting the same error every time I try to compile bk current on
alpha, namely the linker can't do its job on .tmp_vmlinux1.
My compiler is "gcc version 3.2.3 (Debian)" (but I also tried with 3.3 and
2.95), same problem.

Here is the output:
  LD      .tmp_vmlinux1
init/built-in.o(.text+0x12a8): In function `inflate_codes':
: relocation truncated to fit: BRADDR .init.text
init/built-in.o(.text+0x137c): In function `inflate_codes':
: relocation truncated to fit: BRADDR .init.text
init/built-in.o(.text+0x15bc): In function `inflate_stored':
: relocation truncated to fit: BRADDR .init.text
init/built-in.o(.text+0x2158): In function `inflate':
: relocation truncated to fit: BRADDR .init.text
init/built-in.o(.text+0x2170): In function `inflate':
: relocation truncated to fit: BRADDR .init.text
init/built-in.o(.text+0x21b4): In function `inflate':
: relocation truncated to fit: BRADDR .init.text
init/built-in.o(.text+0x21d4): In function `inflate':
: relocation truncated to fit: BRADDR .init.text
make: *** [.tmp_vmlinux1] Error 1

Am I missing something? Is there a bk tree for Alpha (Jeff Garzik, in his
bk doc talks about one but it seems to be dead)?

-- 
Mathieu Chouquet-Stringer              E-Mail : mchouque@online.fr
       Never attribute to malice that which can be adequately
                    explained by stupidity.
                     -- Hanlon's Razor --
