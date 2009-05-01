From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH v2 1/6] Add new macros for page-aligned data and bss sections.
Date: Sat, 02 May 2009 01:02:12 +0200
Message-ID: <m2tz44o2a3.fsf@igel.home>
References: <1241121253-32341-1-git-send-email-tabbott@mit.edu>
	<1241121253-32341-2-git-send-email-tabbott@mit.edu>
	<20090501091848.GB18326@uranus.ravnborg.org>
	<alpine.DEB.1.10.0905010951100.3955@vinegar-pot.mit.edu>
	<49FB2449.1010301@zytor.com>
	<20090501171717.GA26401@uranus.ravnborg.org>
	<49FB2EDC.9050300@zytor.com>
	<20090501174457.GA26559@uranus.ravnborg.org>
	<49FB35C4.6060107@zytor.com>
Mime-Version: 1.0
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <49FB35C4.6060107@zytor.com> (H. Peter Anvin's message of "Fri,
	01 May 2009 10:47:48 -0700")
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-mips@linux-mips.org, linux-m68k@vger.kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Denys Vlasenko <vda.linux@googlemail.com>, Tim Abbott <tabbott@MIT.EDU>, Heiko Carstens <heiko.carstens@de.ibm.com>, linuxppc-dev@ozlabs.org, Paul Mackerras <paulus@samba.org>, Greg Ungerer <gerg@uclinux.org>, sparclinux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org, Jesper Nilsson <jesper.nilsson@axis.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Russell King <rmk+kernel@arm.linux.org.uk>, user-mode-linux-devel@lists.sourceforge.net, microblaze-uclinux@itee.uq.edu.au, Jeff Dike <jdike@addtoit.com>, Jeff Arnold <jbarnold@MIT.EDU>, dev-etrax@axis.com, Mikael Starvik <starvik@axis.com>

"H. Peter Anvin" <hpa@zytor.com> writes:

> Sam Ravnborg wrote:
>>>
>>> What's wrong with @?
>> arm does not support it :-(
>> I recall it denote a comment in arm assembler.
>> 
>> I could do some magic to detect the ARM case but I'm reluctant to do so.
>> I could also ignore the arm issue for now as it is not used by arm,
>> but that strikes me as the wrong approach.
>> 
>
> If we really have to use different tokens, I would say:
>
> #ifdef __ARM__
> # define _PROGBITS %progbits	/* or whatever */
> # define _NOBITS   %nobits
> #else
> # define _PROGBITS @progbits
> # define _NOBITS   @nobits
> #endif

GAS has always supported both '@' and '%', so '%' can be used
everywhere.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."

