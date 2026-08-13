Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839BE4963BA
	for <linux-alpha@vger.kernel.org>; Thu, 13 Aug 2026 17:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786640632; cv=none; b=BADt/2zDTA0vjz9fgz6bRa8c/JxlL75c514ReqkdkSZ5UH2EGlAIU5ptX1s6vB15KtzCvSCM+nUGuuwgu9KdmdcN7dJCezY3IYqbELtjsKWhW630KnbzHT1Wsfw0Jdx8JfKMf83uukJl5dZeiUiXOQnQm8DOSxhy4jQjHwMugBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786640632; c=relaxed/simple;
	bh=Zr8IxGjQEdNZwO/mw1hkjoIxGZXeTN3xUTUKhHhEOyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lQsrvxxDIlsEr9r61/aO1WwsnMloXLeeu5xEPDYjW86L6Piw5qVpWVa7o6aTSpZ+jr812Aw41u4wykSy25cGzCv+naMiOBAhWrU2BlIsHvZRoLZ5YadYPdFwenUY5kY6b5NsrnVX5bV655QwpqCcmDnf206bb73K1mUJo95L/Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YnkRT+SE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YnkRT+SE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786640629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=o+r4ruNkApE26fuyn6KtkFW0QuXubfwA1Uwqu5ezEYw=;
	b=YnkRT+SEm1pCJsz90Hji/NnB/beDQnElAFpH5WoPf8TIZTY1wJ35iLjka2e4WHXBqStTEa
	rdEwOjqC7lqkdLBZ/nA3a2YV6ru+8wsdSzq9a37+EiQL8A9kqE4b7yXPPO7Gy0RgChM35k
	aSmnjw0D/frEqCl9RBnnPiuDdsWQKqQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-551-3v5IuKYOPO-SU8jOK2nwmw-1; Thu,
 13 Aug 2026 13:03:46 -0400
X-MC-Unique: 3v5IuKYOPO-SU8jOK2nwmw-1
X-Mimecast-MFC-AGG-ID: 3v5IuKYOPO-SU8jOK2nwmw_1786640620
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 63C311800650;
	Thu, 13 Aug 2026 17:03:36 +0000 (UTC)
Received: from wsxc.redhat.com (unknown [10.96.134.24])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6F76A195608A;
	Thu, 13 Aug 2026 17:03:19 +0000 (UTC)
From: Ricardo Robaina <rrobaina@redhat.com>
To: audit@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	bpf@vger.kernel.org
Cc: paul@paul-moore.com,
	eparis@redhat.com,
	sgrubb@redhat.com,
	oleg@redhat.com,
	richard.henderson@linaro.org,
	mattst88@gmail.com,
	linmag7@gmail.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	guoren@kernel.org,
	monstr@monstr.eu,
	tsbogend@alpha.franken.de,
	jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com,
	James.Bottomley@HansenPartnership.com,
	deller@gmx.de,
	ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	davem@davemloft.net,
	andreas@gaisler.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	tglx@kernel.org,
	peterz@infradead.org,
	luto@kernel.org,
	Ricardo Robaina <rrobaina@redhat.com>
Subject: [PATCH 00/13] audit: log all six syscall arguments in the SYSCALL record
Date: Thu, 13 Aug 2026 14:02:50 -0300
Message-ID: <cover.1786626275.git.rrobaina@redhat.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

The SYSCALL record currently logs only four of the six syscall
arguments (a0-a3), silently discarding the remaining two. This
leads to the need for auxiliary records when audit-relevant
data lands in the 5th or 6th argument of a syscall.

This series extends the SYSCALL record to log all six arguments,
by adding arguments a4 and a5 inline within the existing record.

The audit testsuite runs successfully:

 # make test
 make -C tests test
 chmod +x */test
 Running as   user    root
        with context unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
        on   system  Fedora

 amcast_joinpart/test ................. ok   
 backlog_wait_time_actual_reset/test .. ok   
 bpf/test ............................. ok   
 coredump/test ........................ ok   
 exec_execve/test ..................... ok   
 exec_name/test ....................... ok     
 fanotify/test ........................ ok   
 field_compare/test ................... ok     
 file_create/test ..................... ok   
 file_delete/test ..................... ok   
 file_permission/test ................. ok   
 file_rename/test ..................... ok   
 filter_device/test ................... ok     
 filter_exclude/test .................. ok     
 filter_exit/test ..................... ok   
 filter_inode/test .................... ok   
 filter_saddr_fam/test ................ ok   
 filter_sessionid/test ................ ok   
 io_uring/test ........................ ok   
 login_tty/test ....................... ok   
 lost_reset/test ...................... ok   
 netfilter_pkt/test ................... ok     
 signal/test .......................... ok   
 syscalls_file/test ................... ok   
 syscall_module/test .................. ok   
 syscall_socketcall/test .............. ok   
 time_change/test ..................... ok     
 user_msg/test ........................ ok   
 All tests successful.
 Result: PASS

Ricardo Robaina (13):
  audit: log all six syscall arguments in the SYSCALL record
  alpha: pass all six syscall args to audit_syscall_entry()
  arm: pass all six syscall args to audit_syscall_entry()
  arm64: pass all six syscall args to audit_syscall_entry()
  csky: pass all six syscall args to audit_syscall_entry()
  microblaze: pass all six syscall args to audit_syscall_entry()
  mips: pass all six syscall args to audit_syscall_entry()
  openrisc: pass all six syscall args to audit_syscall_entry()
  parisc: pass all six syscall args to audit_syscall_entry()
  sh: pass all six syscall args to audit_syscall_entry()
  sparc64: pass all six syscall args to audit_syscall_entry()
  um: pass all six syscall args to audit_syscall_entry()
  xtensa: pass all six syscall args to audit_syscall_entry()

 arch/alpha/kernel/ptrace.c      |  3 ++-
 arch/arm/kernel/ptrace.c        |  2 +-
 arch/arm64/kernel/ptrace.c      |  3 ++-
 arch/csky/kernel/ptrace.c       |  3 ++-
 arch/microblaze/kernel/ptrace.c |  3 ++-
 arch/mips/kernel/ptrace.c       | 11 ++++++++---
 arch/openrisc/kernel/ptrace.c   |  3 ++-
 arch/parisc/kernel/ptrace.c     |  7 +++++--
 arch/sh/kernel/ptrace_32.c      |  3 ++-
 arch/sparc/kernel/ptrace_64.c   |  3 ++-
 arch/um/kernel/ptrace.c         |  4 +++-
 arch/xtensa/kernel/ptrace.c     |  3 ++-
 include/linux/audit.h           | 11 +++++++----
 include/linux/entry-common.h    |  3 ++-
 include/uapi/linux/audit.h      |  2 ++
 kernel/audit.h                  |  2 +-
 kernel/auditfilter.c            |  2 ++
 kernel/auditsc.c                | 31 ++++++++++++++++++++-----------
 18 files changed, 67 insertions(+), 32 deletions(-)

-- 
2.55.0

