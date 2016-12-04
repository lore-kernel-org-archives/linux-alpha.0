From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: alpha: Checking for a failed kmalloc() in
 process_reloc_for_got()?
Date: Sun, 4 Dec 2016 11:20:27 +0100
Message-ID: <782323c8-7e33-39e5-ae04-a94cf454a346@users.sourceforge.net>
References: <f5890058-e6e8-00ca-22c4-e1521cb5bf56@users.sourceforge.net>
 <alpine.LNX.2.00.1612040108350.29400@cbobk.fhfr.pm>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1612040108350.29400@cbobk.fhfr.pm>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-alpha@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, Matt Turner <mattst88@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Richard Henderson <rth@twiddle.net>, Rusty Russell <rusty@rustcorp.com.au>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/arch/alpha/kernel/module.c?id=e05f574a0bb1f4502a4b2264fdb0ef6419cf3772#n40
>>
>> Would it be useful to check the return value from a call of the
>> function “kmalloc” also there?
> 
> *drumroll* it'd actually be a proper bugfix.

Which kind of exception handling can be added here when the function
“process_reloc_for_got” has got the return type “void” so far?

Will it be needed to handle such a software failure at more source code places
by a special error code?

Regards,
Markus
