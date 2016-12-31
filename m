From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: [BUG] 4.9.0 build error on Alpha
Date: Sat, 31 Dec 2016 01:20:32 -0600
Message-ID: <20161231072032.GA3544@gherkin.frus.com>
References: <20161230030846.GA25929@gherkin.frus.com>
 <CAEdQ38EX1rmir0bbY+S-QMfepyBsUJ1uEUjP3A76z8NF5dyrhA@mail.gmail.com>
 <20161230033747.GB26007@gherkin.frus.com>
 <alpine.LFD.2.20.1612301554130.1811@eddie.linux-mips.org>
 <3a3389e5-e6f5-5ec3-ca26-762162d2a4ac@gmx.de>
 <20161231064337.GA3209@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161231064337.GA3209@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Helge Deller <deller@gmx.de>
Cc: "Maciej W. Rozycki" <macro@linux-mips.org>, Matt Turner <mattst88@gmail.com>, linux-alpha <linux-alpha@vger.kernel.org>, Debian Alpha Mailing List <debian-alpha@lists.debian.org>, Michael Cree <mcree@orcon.net.nz>, Richard Henderson <rth@twiddle.net>

On Sat, Dec 31, 2016 at 12:43:37AM -0600, Bob Tracy wrote:
> On Fri, Dec 30, 2016 at 10:07:06PM +0100, Helge Deller wrote:
> > (...)
> > Another possibility could be to put all the lib functions into 
> > a "alphalib" section into the final vmlinux.
> > For that add at the top of each of the .S files in lib/ 
> > 	.section .alphalib,"ax"
> > and apply the attached patch for arch/alpha/kernel/vmlinux.lds.S
> > Patch and suggestion is completely untested.
> 
> Worth a try.  I'll get going on this and report back with the results in
> a few hours.

Apologies in advance if the formatting isn't properly preserved :-(.
Syntax error on line 294 of the generated "vmlinux.lds" file, which is
right where the added ".alphalib:" stanza begins:

(...)
OUTPUT_FORMAT("elf64-alpha")
OUTPUT_ARCH(alpha)
ENTRY(__start)
PHDRS { kernel PT_LOAD; note PT_NOTE; }
jiffies = jiffies_64;
SECTIONS
{
 . = 0xfffffc0000310000;
 _text = .; /* Text and read-only data */
 .text : {
  *(.head.text)
  .alphalib: {
   *(.alphalib)
  } :kernel
  . = ALIGN(8); *(.text.hot .text .text.fixup .text.unlikely) *(.ref.text)
  . = ALIGN(8); __sched_text_start = .; *(.sched.text) __sched_text_end = .;
  . = ALIGN(8); __cpuidle_text_start = .; *(.cpuidle.text) __cpuidle_text_end = .;
  . = ALIGN(8); __lock_text_start = .; *(.spinlock.text) __lock_text_end = .;
  *(.fixup)
  *(.gnu.warning)
 } :kernel
 swapper_pg_dir = (0xfffffc0000000000 +0x300000);
 _etext = .; /* End of text section */
 .notes : AT(ADDR(.notes) - 0) { __start_notes = .; *(.note.*) __stop_notes = .; } :kernel
 :note
 .dummy : {
  *(.dummy)
 } :kernel
(...)

--Bob
