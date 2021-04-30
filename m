From: Richard Guy Briggs <rgb@redhat.com>
Subject: [PATCH v2 0/3] audit: add support for openat2
Date: Fri, 30 Apr 2021 13:29:34 -0400
Message-ID: <cover.1619729297.git.rgb@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-audit-bounces@redhat.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619804109;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mZudyoq7OfjOA+NhlBHPgJTMxtp/IjAf2SwzlJM/ozw=;
	b=b2iDEhKSJl/AcOuyq4lqckOiNqgFKulcELIbTL0gI5/ZzqbMYJHp0i/gjJk+p1mJ+uaodl
	/vf5wX+eWAhw/g47BLja2HU+S2mOBIQLc3+LT+qXvjchsO0+3zJFciuCKKkJzRWd2TRHDn
	aPdxKZc2yV4dsKWFFYvQkGcbebnjPAs=
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
To: Linux-Audit Mailing List <linux-audit@redhat.com>, LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org
Cc: linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, Richard Guy Briggs <rgb@redhat.com>, x86@kernel.org, Eric Paris <eparis@redhat.com>, Aleksa Sarai <cyphar@cyphar.com>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, Eric Paris <eparis@parisplace.org>, linuxppc-dev@lists.ozlabs.org

The openat2(2) syscall was added in v5.6.  Add support for openat2 to the
audit syscall classifier and for recording openat2 parameters that cannot
be captured in the syscall parameters of the SYSCALL record.

Supporting userspace code can be found in
https://github.com/rgbriggs/audit-userspace/tree/ghau-openat2

Supporting test case can be found in
https://github.com/linux-audit/audit-testsuite/pull/103

Richard Guy Briggs (3):
  audit: replace magic audit syscall class numbers with macros
  audit: add support for the openat2 syscall
  audit: add OPENAT2 record to list how

 arch/alpha/kernel/audit.c          | 10 ++++++----
 arch/ia64/kernel/audit.c           | 10 ++++++----
 arch/parisc/kernel/audit.c         | 10 ++++++----
 arch/parisc/kernel/compat_audit.c  | 11 +++++++----
 arch/powerpc/kernel/audit.c        | 12 +++++++-----
 arch/powerpc/kernel/compat_audit.c | 13 ++++++++-----
 arch/s390/kernel/audit.c           | 12 +++++++-----
 arch/s390/kernel/compat_audit.c    | 13 ++++++++-----
 arch/sparc/kernel/audit.c          | 12 +++++++-----
 arch/sparc/kernel/compat_audit.c   | 13 ++++++++-----
 arch/x86/ia32/audit.c              | 13 ++++++++-----
 arch/x86/kernel/audit_64.c         | 10 ++++++----
 fs/open.c                          |  2 ++
 include/linux/audit.h              | 11 +++++++++++
 include/linux/auditscm.h           | 24 +++++++++++++++++++++++
 include/uapi/linux/audit.h         |  1 +
 kernel/audit.h                     |  2 ++
 kernel/auditsc.c                   | 31 ++++++++++++++++++++++++------
 lib/audit.c                        | 14 +++++++++-----
 lib/compat_audit.c                 | 15 ++++++++++-----
 20 files changed, 168 insertions(+), 71 deletions(-)
 create mode 100644 include/linux/auditscm.h

-- 
2.27.0
