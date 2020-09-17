From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: remove compat_sys_mount
Date: Thu, 17 Sep 2020 10:22:31 +0200
Message-ID: <20200917082236.2518236-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=Dv3rGFm1Kct421bC4ikilNsrxpM6Mgb8/oXPwK5ENVk=; b=j7Y+k4l3TyDcf89UtdqgGjIGxl
        h4jq9Ekj+WZrxuJtFRYsIghVbyktSEIRLzh2f0Y1BHlGLoClXQseIx2oNy+aDX1UV/TZDiz3At2SW
        PNR9/okKDUrOJ3UMLcEAxG0O/muyWsah+9ntiGzgPmlpPAgwXX4jCy4cviYtFkuWpeaSRB53qrKkW
        l5XRzuwt7KiuW2CXZF84PeNeTYHAnNCTIe71RJrgoI+yjzUW1muogLu8OCPOKfZodCHKrGljPG6Ai
        sFBjo1v/PvsaGcnw2XFAKpMNJmtE48kUHfwRYU3HM064RZnaFJuf2V1IDPwaKxR33sp4eN4s/vkSf
        4Q0IE0Tg==;
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Cc: Richard Henderson <rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org>, Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>, Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Trond Myklebust <trond.myklebust-F/q8l9xzQnoyLce1RVWEUA@public.gmane.org>, Anna Schumaker <anna.schumaker-HgOvQuBEEgTQT0dZR+AlfA@public.gmane.org>, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi Al,

this series moves the NFSv4 binary mount data compat handling to fs/nfs/,
and removes the now pointless compat_sys_mount.

Diffstat:
 b/arch/alpha/kernel/osf_sys.c                        |  116 +++--------
 b/arch/arm64/include/asm/unistd32.h                  |    2 
 b/arch/mips/kernel/syscalls/syscall_n32.tbl          |    2 
 b/arch/mips/kernel/syscalls/syscall_o32.tbl          |    2 
 b/arch/parisc/kernel/syscalls/syscall.tbl            |    2 
 b/arch/powerpc/kernel/syscalls/syscall.tbl           |    2 
 b/arch/s390/kernel/syscalls/syscall.tbl              |    2 
 b/arch/sparc/kernel/syscalls/syscall.tbl             |    2 
 b/arch/x86/entry/syscalls/syscall_32.tbl             |    2 
 b/fs/Makefile                                        |    1 
 b/fs/internal.h                                      |    3 
 b/fs/namespace.c                                     |   29 --
 b/fs/nfs/fs_context.c                                |  195 ++++++++++++-------
 b/include/linux/compat.h                             |    6 
 b/include/linux/fs.h                                 |    2 
 b/include/uapi/asm-generic/unistd.h                  |    2 
 b/tools/include/uapi/asm-generic/unistd.h            |    2 
 b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl |    2 
 b/tools/perf/arch/s390/entry/syscalls/syscall.tbl    |    2 
 fs/compat.c                                          |  132 ------------
 20 files changed, 179 insertions(+), 329 deletions(-)
