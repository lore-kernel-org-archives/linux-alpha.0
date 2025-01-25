Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A922AEF1;
	Sat, 25 Jan 2025 17:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737826254; cv=none; b=qSsEixSYt5kqJAM6ll3ltbeXOuhR85qOu2eOI8r7fKmQeUu7XvmXvIFzGoikazMFPVoC2FmNxyve5sIy7pRAWkblctKZMckv+HmLZoM2ZXYvbUgvoSKKkBnTknX6k1uPpBI+KRhPTf6SGjAsWazs6rF054dpmmfZYPC4oRfcIPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737826254; c=relaxed/simple;
	bh=kKcJs+aC03Lvp0Qr3JeI/p/qpMKSmE4ZCRl8XqGGMYM=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=DBOQH1/JxIsAATzQSW7h1y/kerjKzX3mvrcYG8MD2ml+x9cchkEgRZYAZJIY3pZU+76ejIY4f5uunqfNOrdituYjJAax+/joNkFovI+Lr2EZe78QIy2KOIo/12voh/A7L432sa2faLEk2V0vJVB32IbmAnHRHbVJrt+FW+g7YRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 0FCDB92009C; Sat, 25 Jan 2025 18:30:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 086C692009B;
	Sat, 25 Jan 2025 17:30:50 +0000 (GMT)
Date: Sat, 25 Jan 2025 17:30:49 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Richard Henderson <richard.henderson@linaro.org>, 
    Matt Turner <mattst88@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
    Arnd Bergmann <arnd@arndb.de>, Al Viro <viro@zeniv.linux.org.uk>
cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Alpha: Remove SP obfuscation from register dumps
Message-ID: <alpine.DEB.2.21.2501251719480.27203@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Remove the masking of SP from register dumps, i.e.:

gp = fffffc0000e97278  sp = (____ptrval____)

which brings no security but removes vital information from oopses, 
crashes, etc., which may not be easy to reobtain after a reboot with 
the `no_hash_pointers' option.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 arch/alpha/kernel/traps.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

linux-alpha-show-regs-sp.diff
Index: linux-melmac/arch/alpha/kernel/traps.c
===================================================================
--- linux-melmac.orig/arch/alpha/kernel/traps.c
+++ linux-melmac/arch/alpha/kernel/traps.c
@@ -92,7 +92,7 @@ dik_show_regs(struct pt_regs *regs, unsi
 	       regs->r22, regs->r23, regs->r24);
 	printk("t11= %016lx  pv = %016lx  at = %016lx\n",
 	       regs->r25, regs->r27, regs->r28);
-	printk("gp = %016lx  sp = %p\n", regs->gp, regs+1);
+	printk("gp = %016lx  sp = %px\n", regs->gp, regs+1);
 #if 0
 __halt();
 #endif
