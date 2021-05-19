From: Richard Guy Briggs <rgb@redhat.com>
Subject: [PATCH v4 0/3] audit: add support for openat2
Date: Wed, 19 May 2021 16:00:19 -0400
Message-ID: <cover.1621363275.git.rgb@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <sparclinux-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621454514;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=oqR82qYZ5cHPW+jMmb6LKw1zBxDgfEa0K+Sm55MnPRw=;
        b=EPf+1bHeNhuGn0Rrr6sUg9QfQAd3pj66II1RbGEWOtigcjPVeLdlvnzLgdbZ4Y3Ml5/UY+
        JV4+aRg24ZyBhNCJp+s2XFZ1vidOVJ/5Fg0FSke4zSpY4N3zWQdfhJSfd69xWB+3HO+5KU
        EsCQ+Uui8eWob2LecfwVc6NOTIvYi0s=
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-Audit Mailing List <linux-audit@redhat.com>, LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@parisplace.org>, Steve Grubb <sgrubb@redhat.com>, Richard Guy Briggs <rgb@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Eric Paris <eparis@redhat.com>, x86@kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, Aleksa Sarai <cyphar@cyphar.com>, Arnd Bergmann <arnd@kernel.org>

The openat2(2) syscall was added in v5.6.  Add support for openat2 to the
audit syscall classifier and for recording openat2 parameters that cannot
be captured in the syscall parameters of the SYSCALL record.

Supporting userspace code can be found in
https://github.com/rgbriggs/audit-userspace/tree/ghau-openat2

Supporting test case can be found in
https://github.com/linux-audit/audit-testsuite/pull/103

Changelog:
v4:
- change filename include/linux/auditscm.h to auditsc_classmacros.h to avoid socket association

v3:
- re-add commit descriptions that somehow got dropped
- add new file to MAINTAINERS

v2:
- add include/linux/auditscm.h for audit syscall class macros due to syscall redefinition warnings:
        arch/x86/ia32/audit.c:3:
        ./include/linux/audit.h:12,
        ./include/linux/sched.h:22,
        ./include/linux/seccomp.h:21,
        ./arch/x86/include/asm/seccomp.h:5,
        ./arch/x86/include/asm/unistd.h:20,
        ./arch/x86/include/generated/uapi/asm/unistd_64.h:4: warning: "__NR_read" redefined #define __NR_read 0
	...
        ./arch/x86/include/generated/uapi/asm/unistd_64.h:338: warning: "__NR_rseq" redefined #define __NR_rseq 334
    previous:
        arch/x86/ia32/audit.c:2:
        ./arch/x86/include/generated/uapi/asm/unistd_32.h:7: note: this is the location of the previous definition #define __NR_read 3                                                                                                      
	...
        ./arch/x86/include/generated/uapi/asm/unistd_32.h:386: note: this is the location of the previous definition #define __NR_rseq 386

Richard Guy Briggs (3):
  audit: replace magic audit syscall class numbers with macros
  audit: add support for the openat2 syscall
  audit: add OPENAT2 record to list how

 MAINTAINERS                         |  1 +
 arch/alpha/kernel/audit.c           | 10 ++++++----
 arch/ia64/kernel/audit.c            | 10 ++++++----
 arch/parisc/kernel/audit.c          | 10 ++++++----
 arch/parisc/kernel/compat_audit.c   | 11 ++++++----
 arch/powerpc/kernel/audit.c         | 12 ++++++-----
 arch/powerpc/kernel/compat_audit.c  | 13 +++++++-----
 arch/s390/kernel/audit.c            | 12 ++++++-----
 arch/s390/kernel/compat_audit.c     | 13 +++++++-----
 arch/sparc/kernel/audit.c           | 12 ++++++-----
 arch/sparc/kernel/compat_audit.c    | 13 +++++++-----
 arch/x86/ia32/audit.c               | 13 +++++++-----
 arch/x86/kernel/audit_64.c          | 10 ++++++----
 fs/open.c                           |  2 ++
 include/linux/audit.h               | 11 ++++++++++
 include/linux/auditsc_classmacros.h | 24 ++++++++++++++++++++++
 include/uapi/linux/audit.h          |  1 +
 kernel/audit.h                      |  2 ++
 kernel/auditsc.c                    | 31 +++++++++++++++++++++++------
 lib/audit.c                         | 14 ++++++++-----
 lib/compat_audit.c                  | 15 +++++++++-----
 21 files changed, 169 insertions(+), 71 deletions(-)
 create mode 100644 include/linux/auditsc_classmacros.h

-- 
2.27.0

