From: Jiri Kosina <jikos@kernel.org>
Subject: Re: alpha: Checking for a failed kmalloc() in
 process_reloc_for_got()?
Date: Sun, 4 Dec 2016 01:10:26 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1612040108350.29400@cbobk.fhfr.pm>
References: <f5890058-e6e8-00ca-22c4-e1521cb5bf56@users.sourceforge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <f5890058-e6e8-00ca-22c4-e1521cb5bf56@users.sourceforge.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-alpha@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, Matt Turner <mattst88@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Richard Henderson <rth@twiddle.net>, Rusty Russell <rusty@rustcorp.com.au>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 3 Dec 2016, SF Markus Elfring wrote:

> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/arch/alpha/kernel/module.c?id=e05f574a0bb1f4502a4b2264fdb0ef6419cf3772#n40
> 
> Would it be useful to check the return value from a call of the
> function “kmalloc” also there?

*drumroll* it'd actually be a proper bugfix.

-- 
Jiri Kosina
SUSE Labs

