Received: from minute.unseen.parts (minute.unseen.parts [139.162.151.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D42C1AC891;
	Wed, 29 Jan 2025 09:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.151.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738143812; cv=none; b=goUaVKD/P0VRpQ0mhKsf8GUj08u8SO3HbNddMdCjPbjBWZ3F08c7fM0nflN4jTmO3JIclLhkCAS/Ml+aB/Se2rSt+NPuuVYz2eLXyKK82KMnwSNIh05qstxBlpIsKbC/0MKb1aaK39sgJDDbyx7U2lqZZnwsjGsditWs92zIA5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738143812; c=relaxed/simple;
	bh=qzoLr0ct6q33rAXFtuGQuGtgiHWmFGbzIuZBxankviU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pKl4siNJSQ27pyMNJh6HwX/L58HP5x3n6QqdK7Q1tJ0aM9pVtJwwbnzANDsPo7HUi7rwJVjpu3ciSc2F3yEXDPwAXmBYrix7/mxqhSGU+igXOW5w1xD+U4PEpbdDy1gzvrbmazCiQrw4WfhP1qdYbtdWVPGQKCh9LCUPZMGA14E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unseen.parts; spf=pass smtp.mailfrom=unseen.parts; dkim=pass (2048-bit key) header.d=unseen.parts header.i=@unseen.parts header.b=EvrbzFmd; arc=none smtp.client-ip=139.162.151.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unseen.parts
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unseen.parts
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unseen.parts header.i=@unseen.parts header.b="EvrbzFmd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=unseen.parts; s=sig; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ILyWo4WZKxrebO0o2L7sKDX0az7JI/FHb3DRx785Rgc=; b=EvrbzFmdBxQpMOuyvBBeN0Xfpd
	9BpOavhs1Hg+2pcHevzD77VSklL4HCHFLNs09jc1Om31rRHui8/MBaUecJfpqsP56jVKze1hWrRvj
	r7BGfrE9GMVB81vrFTDN0G+eJKvJZcdfKwrRdqMUPVlY2+c5JmNDKWYqvXQXSgpwEKjX4qAJdNn2u
	DM/sCHHKwqDF8cbYGgxFv/A0QJQnbJirt74Kl1kIy7WCanQyjnIo+7Fr0C07/W5EB2Y5TcQ9WMz0/
	e11utXfTRCdF+vASC2TPCnmI4qMP7xHVtU5yQuZgUqNF6XA8vvrbFLo/cGPh1z9hBnJy/06eeWofi
	MOkRJWVw==;
Received: from ink by minute.unseen.parts with local (Exim 4.96)
	(envelope-from <ink@unseen.parts>)
	id 1td4bI-000783-1C;
	Wed, 29 Jan 2025 10:43:12 +0100
From: Ivan Kokshaysky <ink@unseen.parts>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	"Paul E. McKenney" <paulmck@kernel.org>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Magnus Lindholm <linmag7@gmail.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] alpha: stack fixes
Date: Wed, 29 Jan 2025 10:43:08 +0100
Message-Id: <20250129094312.27399-1-ink@unseen.parts>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes oopses on Alpha/SMP observed since kernel v6.9. [1]
Thanks to Magnus Lindholm for identifying that remarkably longstanding
bug.

The problem is that GCC expects 16-byte alignment of the incoming stack
since early 2004, as Maciej found out [2]:
  Having actually dug speculatively I can see that the psABI was changed in
 GCC 3.5 with commit e5e10fb4a350 ("re PR target/14539 (128-bit long double
 improperly aligned)") back in Mar 2004, when the stack pointer alignment
 was increased from 8 bytes to 16 bytes, and arch/alpha/kernel/entry.S has
 various suspicious stack pointer adjustments, starting with SP_OFF which
 is not a whole multiple of 16.

Also, as Magnus noted, "ALPHA Calling Standard" [3] required the same:
 D.3.1 Stack Alignment
  This standard requires that stacks be octaword aligned at the time a
  new procedure is invoked.

However:
- the "normal" kernel stack is always misaligned by 8 bytes, thanks to
  the odd number of 64-bit words in 'struct pt_regs', which is the very
  first thing pushed onto the kernel thread stack;
- syscall, fault, interrupt etc. handlers may, or may not, receive aligned
  stack depending on numerous factors.

Somehow we got away with it until recently, when we ended up with
a stack corruption in kernel/smp.c:smp_call_function_single() due to
its use of 32-byte aligned local data and the compiler doing clever
things allocating it on the stack.

Patches 1-2 are preparatory; 3 - the main fix; 4 - fixes remaining
special cases.

Ivan.

[1] https://lore.kernel.org/rcu/CA+=Fv5R9NG+1SHU9QV9hjmavycHKpnNyerQ=Ei90G98ukRcRJA@mail.gmail.com/#r
[2] https://lore.kernel.org/rcu/alpine.DEB.2.21.2501130248010.18889@angie.orcam.me.uk/
[3] https://bitsavers.org/pdf/dec/alpha/Alpha_Calling_Standard_Rev_2.0_19900427.pdf
---
Ivan Kokshaysky (4):
  alpha/uapi: do not expose kernel-only stack frame structures
  alpha: replace hardcoded stack offsets with autogenerated ones
  alpha: make stack 16-byte aligned (most cases)
  alpha: align stack for page fault and user unaligned trap handlers

 arch/alpha/include/asm/ptrace.h      | 64 ++++++++++++++++++++++++++-
 arch/alpha/include/uapi/asm/ptrace.h | 66 +---------------------------
 arch/alpha/kernel/asm-offsets.c      |  4 ++
 arch/alpha/kernel/entry.S            | 24 +++++-----
 arch/alpha/kernel/traps.c            |  2 +-
 arch/alpha/mm/fault.c                |  4 +-
 6 files changed, 81 insertions(+), 83 deletions(-)

-- 
2.39.5

