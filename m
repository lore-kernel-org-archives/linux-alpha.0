From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 0/7] Minor Alpha updates for 3.11
Date: Wed, 24 Jul 2013 07:55:08 -1000
Message-ID: <51F014FC.70104@twiddle.net>
References: <20130717000347.GB2483@stolen.phys.waikato.ac.nz> <1374546701.3719.33@driftwood> <20130723032511.GA18086@stolen.phys.waikato.ac.nz> <51EE9F36.7050402@twiddle.net> <20130724102544.GA7713@omega>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:message-id:date:from:user-agent:mime-version:to:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=nTAuG/Ez/BSCPYbxwd1NQj8+7AZwr0kopqf1brmQJ7U=;
        b=TVpCbOL2UHGheVbtqJdVffsTf9oQkCJpeNO0FUvftBF2C8HEJgcnW7fRqvCJJ7cz1w
         OAiAqFc19VzYMAFxJsjIV4KzzGzvQBdvXiVpFOW9ICoGBDt/8m4C8QfwYlKO3qLeDmNn
         XqqqpDq4fwQ8dbLlaDZAFPa0MdbCkqyiYS1UrE6ZSsJUQQwbChPsA4XPPDThmYVuMlk4
         bqexY5RWVOwMIfJUbypEgdthVwQfXz3E6fJ1IoGp7PeXFQZGPzlOGNz1bSMM/Oi299qp
         rWIIurLoAiu8pnczjwMcQjCbADDziFboH0R7iWk9ogPZs8a7D6yf/Y0Dl+h8CRuX5hNz
         w5Lw==
In-Reply-To: <20130724102544.GA7713@omega>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Cree <mcree@orcon.net.nz>, Michael Cree <cree@waikato.ac.nz>, Rob Landley <rob@landley.net>, linux-kernel@vger.kernel.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

On 07/24/2013 12:25 AM, Michael Cree wrote:
> Searching for NR_umount finds the following packages that compile on
> Alpha:
> 
> eglibc

Fork of glibc, which I did examine; I'll assume it's the same code.

> dietlibc
> uclibc

Rob reports that uclibc is fixed by the rename.  From what I see in
the dietlibc source, the same is true of Alpha, since the only mention
of "oldumount" is in alpha/syscalls.h.

> qemu

Definitely would be fixed by the rename.

Of course in both dietlibc and qemu, the packages need to be patched
to match the kernel rename, as they don't use the kernel headers.

> radare

Repository has vanished?  There's a radare2 that apparently superceeds
it, but doesn't mention umount in any relevant context.

> linux-tools
> ns3
> skyeye

I can't find source for these to browse.


r~
