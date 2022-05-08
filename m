From: Finn Thain <fthain@linux-m68k.org>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
Date: Sun, 8 May 2022 10:15:31 +1000 (AEST)
Message-ID: <e01fac8a-7568-14b6-84-affc4a40c6d@linux-m68k.org>
References: <20220505195342.GA509942@bhelgaas> <22bec167-241f-2cbe-829f-a3f65e40e71@linux-m68k.org> <105ccec439f709846e82b69cb854ac825d7a6a49.camel@linux.ibm.com> <7dfa7578-039-e132-c573-ad89bd3215@linux-m68k.org> <CAK8P3a3tds8O+Gg2nF3MfrVVcmtLbtdQ2TnCJaDYz28cyhhWkg@mail.gmail.com>
 <6f33385-5612-7042-e1b3-aa32895e91e0@linux-m68k.org>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651968936; x=
        1651976136; bh=hBCmJbIqgEytzYwa8CW7BN7wQ9FjoZGR5Pq0KkOSgR4=; b=a
        Fd+8vokQcvbA4GWW9owApfwSeCCmripmwI1V8BhLeK5KaZNhXYioKWO7gI/i4WS2
        7k47a/ZWVbS9L9Tb94YqvYOtS7N7Odf5y1vj4JNgmK7LNQqCWISAKcO+P4rj0UMi
        q+RtVMiTD2S0odWphzabgNOzrXhZiGf5nIMLf0LKorYXqpXkyhAyhpWHbDYXh7SC
        lIsqVRz6rHiSoRmYVbBPXTr50ooseR0KbMmjBLcBybt5kQU3VX6Uv3BlsayvPX8K
        rT/CABNOI5QNmto+53M1TPT98lstPKrnj3wt67ZKWi2d0IKDKzkcno0YDJCen2gb
        pvOvYx7XyUrz2lynIGXHQ==
In-Reply-To: <6f33385-5612-7042-e1b3-aa32895e91e0@linux-m68k.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@kernel.org>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>, Bjorn Helgaas <helgaas@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael


On Sun, 8 May 2022, I wrote:

> 
> That suggests to me that we need a "bool CONFIG_WARINGS_INTO_ERRORS" to 
> control -Werror, which could be disabled for .config files (like make 
> allmodconfig) where it is not helping.
> 

I just noticed that we already have CONFIG_WERROR. So perhaps something 
like this would help.

diff --git a/init/Kconfig b/init/Kconfig
index ddcbefe535e9..765d83fb148e 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -150,6 +150,8 @@ config WERROR
 
 	  However, if you have a new (or very old) compiler with odd and
 	  unusual warnings, or you have some architecture with problems,
+	  or if you are using a compiler that doesn't happen to interpret
+	  the C standards in quite the same way as some other compilers,
 	  you may need to disable this config option in order to
 	  successfully build the kernel.
 
