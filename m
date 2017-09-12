From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: [BUG] 4.13.0 kernel build error on Alpha
Date: Mon, 11 Sep 2017 23:06:36 -0500
Message-ID: <20170912040636.GA31670@gherkin.frus.com>
References: <20170910223418.GA22820@gherkin.frus.com>
 <CAEdQ38HPnhBF9HBmgibrgoFxQheuHr7Mn+FYd=keTyQNeL_AOA@mail.gmail.com>
 <20170911031641.GA26870@gherkin.frus.com>
 <20170911032340.GA26971@gherkin.frus.com>
 <20170911060230.mrkdgsw4gs3zf76z@tower>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170911060230.mrkdgsw4gs3zf76z@tower>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>, Matt Turner <mattst88@gmail.com>, Debian Alpha Mailing List <debian-alpha@lists.debian.org>, linux-alpha <linux-alpha@vger.kernel.org>, Helge Deller <deller@gmx.de>, "Maciej W. Rozycki" <macro@linux-mips.org>

Yesterday, I thought what I wanted to do was the ".c" file equivalent of
the '.section .alphalib,"ax"' substitution we made to the ".S" files.
I'm getting a good kernel build with the following patch:


====--CUT HERE--====
--- linux/arch/alpha/lib/memcpy.c.orig	2016-10-20 01:11:37.000000000 -0500
+++ linux/arch/alpha/lib/memcpy.c	2017-09-11 22:38:41.634495379 -0500
@@ -149,7 +149,7 @@
 	DO_REST_ALIGNED_DN(d,s,n);
 }
 
-void * memcpy(void * dest, const void *src, size_t n)
+__attribute__((section(".alphalib"))) void * memcpy(void * dest, const void *src, size_t n)
 {
 	if (!(((unsigned long) dest ^ (unsigned long) src) & 7)) {
 		__memcpy_aligned_up ((unsigned long) dest, (unsigned long) src,
====--TUC EREH--====

The GNU C documentation concerning the "section" attribute as applied to
functions implies I should have been able to specify
	__attribute__((section(".alphalib,\"ax\"")))
but the compiler didn't like the comma and argument following the
section name.

I'm guessing I'll probably end up having to do this same fixup for the
rest of the ".c" files in the "arch/alpha/lib" directory at some point,
but I'll cross that bridge when I come to it.

--Bob
