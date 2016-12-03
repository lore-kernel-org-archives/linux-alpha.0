From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: alpha: Checking for a failed kmalloc() in process_reloc_for_got()?
Date: Sat, 3 Dec 2016 14:15:20 +0100
Message-ID: <f5890058-e6e8-00ca-22c4-e1521cb5bf56@users.sourceforge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-alpha@vger.kernel.org, Jiri Kosina <jkosina@suse.cz>, Josh Poimboeuf <jpoimboe@redhat.com>, Matt Turner <mattst88@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Richard Henderson <rth@twiddle.net>, Rusty Russell <rusty@rustcorp.com.au>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,

Another run of a small script for the semantic patch language (Coccinelle)
pointed the implementation of the function “process_reloc_for_got” out for
further considerations.
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/arch/alpha/kernel/module.c?id=e05f574a0bb1f4502a4b2264fdb0ef6419cf3772#n40

Would it be useful to check the return value from a call of the
function “kmalloc” also there?

Regards,
Markus
