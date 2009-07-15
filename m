From: Richard Henderson <rth7680@gmail.com>
Subject: Re: Help on memchr() EGLIBC assembly code
Date: Wed, 15 Jul 2009 12:48:02 -0700
Message-ID: <4A5E3272.4040904@gmail.com>
References: <20090713173104.GA13883@hall.aurel32.net>	 <119aab440907131124r3fd333d3n967cdde2cf3c2e1b@mail.gmail.com>	 <20090713211723.GE10110@hall.aurel32.net> <b4198de60907131516t384446e6na6cf15e7ebb1fc83@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=NTG2cBI3F3xuo7czYyyQYfn+lYlMX56w7mMDBJzj+L8=;
        b=laeiXTsRQ2PoBT4Qca5iDFPs7ltJzbZsMzjkGD4l0WcjJUCjb/kwTR/U3t2yWCvb4q
         cDr3lQKylNCn5nQ5Nq2xtJA1uJbyQiqz5isirvpSqSS1BiUM3TYRWfK3ywG9CGqhYyPF
         oURqxN0jW3Jq5G8s3+AEkPZoKQIk7ofnqiy/Y=
In-Reply-To: <b4198de60907131516t384446e6na6cf15e7ebb1fc83@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matt Turner <mattst88@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>, Carlos O'Donell <carlos@systemhalted.org>, debian-alpha@lists.debian.org, debian-glibc@lists.debian.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org

On 07/13/2009 03:16 PM, Matt Turner forwarded:
>>>> The problem is that the memchr() function on alpha uses prefetch, which
>>>> can cause a page boundary to be crossed, while the standards (POSIX and
>>>> C99) says it should stop when a match is found.

That's not supposed to matter -- faults from prefetch are supposed to be 
ignored; see do_page_fault:

         /* As of EV6, a load into $31/$f31 is a prefetch, and never faults
            (or is suppressed by the PALcode).  Support that for older CPUs
            by ignoring such an instruction.  */
         if (cause == 0) {
                 unsigned int insn;
                 __get_user(insn, (unsigned int __user *)regs->pc);
                 if ((insn >> 21 & 0x1f) == 0x1f &&
                     /* ldq ldl ldt lds ldg ldf ldwu ldbu */
                     (1ul << (insn >> 26) & 0x30f00001400ul)) {
                         regs->pc += 4;
                         return;
                 }
         }

Can you figure out why that kernel code isn't working?  I no longer have 
working alpha hw...


r~
