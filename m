Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742208;
	b=gmUJ5WtKYNV/zEbAKAtJ4XBnTWYOb2IZD9BEzyDFtR+dQnGFYlPaVb+S2SXjACR0BNPD
	 H7cPMLFZIhea2jLTOJfSqn8otEOc2z3WpT+dJSIeArlA22+h4lvENGHZ0zebib0yTyVR3
	 3zNFVocsqWWB0sp37d0i0GZCOgMCbtWiuffzl3Wfc2tLl1uId+dQUjq1sDIvxT1obw3FS
	 flkpuVW4yPOa+dVSwkHuJcXFS93fb9FmSuiolNhtiDG6DqrRApB+VyCLb6Ar8VBm6kZvt
	 9sYgcIJzAJ3MtsbuXPOJbBtQ+NvQm5BZCvAzvF/Iu5qwxjLgI4vswggfG2wjNrZenqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C9mkZI7UPnFUcdrNwGMweO7b1qOA1u4Bsg8DNlvkpTc=;
	b=EPFlcuV0qoFc4TZRxmQXWKRzsdv1XE99bfV1s37rtZgkq+yJF5uN2I89WVRHFSbv2DSu
	 CCzBT8V78Acmqm81e4cHwO4kNbMow3BmY+B3Y4u5vQrbEKur1u/DjTgB+ftG5P2s7ltRp
	 8QtzGF0CuV454MTjQU65Ur5WhKdAU3hJ7vjS5AivXtJYlmYn/sG9H//QX7rczxmeT5Ng2
	 wWu0OVk4+oGvBsvbPApCBWKGJarCkN5gqo2ZOhUvqvsGlTNIIxUVgD3r4hRCGUcHeGyZo
	 MHj2Glu3M3sq5VBP7QV4Y2Nj8bkj2zfDPzgu3rPii/wzYUhsbpZV14biPx/P9u6aiJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S8HHgAqG;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280C86082BE0
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 21:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 280C86082BE0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S8HHgAqG
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1ab2ad719so6777186a12.3
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 13:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742206; x=1794347006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9mkZI7UPnFUcdrNwGMweO7b1qOA1u4Bsg8DNlvkpTc=;
        b=S8HHgAqGYZ6dlH5v1zjdH6Cf8l977nm3fXP26IoSm6c39LE1EYQk4jEpmHmy8bVoF+
         4VyWrdpKf+25yQ97Jk167umkbqjmbzQlLH/8qAIVqfpBWNt9ffSZTycV/0/mCnnmnE/z
         xvFm3sGeMFGFh4CcY3pwTF/C2QAnHJN7jRHo41CqVTP+kiWI/b2LtD3TekNDKAyYZKh6
         fRqzr9PelGdXZvOlYt01AgIQmUIZFVXRSoO1O9LxctstHDfPI5KahwTRI8buSAMLS8Ov
         7rWrkUpt6UDhHXX5yGKEJUGFcYwKP1UeEEpahenRqpG/RcIZt7cPHh21VftGLQnsmYkJ
         kE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742206; x=1794347006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C9mkZI7UPnFUcdrNwGMweO7b1qOA1u4Bsg8DNlvkpTc=;
        b=lmqDQ2jW4F9jl0PedBC/l1jHGSaUU8LmE0Gyq9zr/Xi8eKIM7vQPcLdnFH1eTWOaSf
         +ZlQZFPpAOMObAZ+kUXcNw3ClsuV9DZY0LFe1PYZC21SRpLK09ABNdHsLEOwX3JOVX2/
         e+lyt+sOIC6y+3WwIpZKkSYVUYuX1nNddU41evs+XUDDBrYrC64C/PBmtded2kU8NFQW
         jspfzwFKsbTR/j8MYDUfR19LQwZWDA2IXPEv+95HU7I0cvVPBTNRvD7iNLavv+pzFs90
         5BRQwvmTDC2Bx+ffqCn9hVOtBqxgH2lAJHLJaaBeuyC+uutI2ui4SmECr9SrwF9QcKH7
         0q1A==
X-Forwarded-Encrypted: i=1; AKwUvBxlO2UVt8EtExbS9LQY1JPRR6qU9GZ2YObq5XBn5ZUWP7zy9vGr+fRqBlSfFEfKov8NIXq15EkiPxXGcQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+C7cTO5U0zFE4dU3j319qrjDcck7WIEzWf0+/iSBZRbETabpvd
	IA2Di5yWUIA5lktXY7tiljE8YBuYXJbnY6vqjV0Um+fbYPHEnAtViUck
X-Gm-Gg: AYBFou12wZRD0wBgV7xflq+6whX2tlm/fCn9hV+wNeGSNVCtcdLNCTadyapkXoNuAU6
	S1tXDAUg1H96abcPr+hMey3tefyULvubV11XZR7ikEj3sevCIk0YyAdJd/eEXUHeipmioGri2KC
	QlVVeVE5a5O96ImLO3/RWk64U493TVNuTIdDrUDMFu1eTBkuCfZNLp73/BAbTgvGNoPvVdfbF2t
	E6ZARPjq5RqC2X+jgdFJ2AF3/y6SXTWLACycbkiZPT+RUBSi/T2RVGZbIKldaFeNuWdcekEQe9K
	mzTLwsK0jmdlO/srMlNtnceBukbHrI521xTn7IqvZ0s8W/34vRmdRqguQRnInQ8lwD/Ho8fOKLN
	3vQNrgU/7BB5Fbm4Obj58oSIem2dKcUGfpSZaUiMaFqWc3UqCvpPbq41pXtXLHy8RhcGtPc1g4t
	qw42b3JtxDE8PkJwrygsA+WEUCWFkkhbug099zFsr0eHkE/LqybB5w1FI+Tfz1bEIlDXtdPSwjZ
	yfdur2+8fX02mxjRLtg382XKPZMzh4fGh7i9S/qZ4wlQRtyH7HI56MzKuOUfhSfwSj5cKIl8DDa
	ojdBedluVhumO9e5f+yXG0RNjWCpo0edL/j/JyCEI5dtRfOUFNxdbICnNqUWAOUKlB8hc3s=
X-Received: by 2002:a05:6402:27d4:b0:6b4:7f3:a9cb with SMTP id 4fb4d7f45d1cf-6b4d64b21c9mr11493103a12.42.1793742206485;
        Tue, 03 Nov 2026 13:43:26 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5a2a6sm40550a12.16.2026.11.03.13.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:43:26 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 13/14] alpha: use generic getrusage for OSF resource accounting
Date: Tue,  3 Nov 2026 22:35:19 +0100
Message-ID: <20261103214120.1099893-14-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103214120.1099893-1-linmag7@gmail.com>
References: <20261103214120.1099893-1-linmag7@gmail.com>
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use getrusage() for OSF resource accounting. This intentionally aligns
osf_getrusage() accounting with getrusage(2): RUSAGE_SELF covers the whole
thread group rather than only the calling thread, and ru_maxrss, block
I/O and context-switch counts are populated instead of remaining zero.
CPU times use the generic microsecond conversion instead of the previous
jiffy rounding.

Keep the OSF structure layout and the existing RUSAGE_SELF/RUSAGE_CHILDREN
selector restriction. Share result conversion with osf_wait4() and remove
the jiffy-based time conversion.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/osf_sys.c | 56 ++++++++++++++-------------------------------
 1 file changed, 17 insertions(+), 39 deletions(-)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 61d8061762133f5e128d8538cf104dfede57ea6d..c08796f627332e4562a30557dee700052d03c0e7 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -15,7 +15,7 @@
 #include <linux/sched/signal.h>
 #include <linux/sched/mm.h>
 #include <linux/sched/task_stack.h>
-#include <linux/sched/cputime.h>
+#include <linux/resource.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/smp.h>
@@ -960,13 +960,6 @@ put_tv_to_tv32(struct timeval32 __user *o, struct __kernel_old_timeval *i)
 			    sizeof(struct timeval32));
 }
 
-static inline void
-jiffies_to_timeval32(unsigned long jiffies, struct timeval32 *value)
-{
-	value->tv_usec = (jiffies % HZ) * (1000000L / HZ);
-	value->tv_sec = jiffies / HZ;
-}
-
 SYSCALL_DEFINE2(osf_gettimeofday, struct timeval32 __user *, tv,
 		struct timezone __user *, tz)
 {
@@ -1062,37 +1055,27 @@ struct rusage32 {
 	long	ru_nivcsw;		/* involuntary " */
 };
 
+static int put_rusage32(struct rusage32 __user *ru, struct rusage *r)
+{
+	if (put_tv_to_tv32(&ru->ru_utime, &r->ru_utime))
+		return -EFAULT;
+	if (put_tv_to_tv32(&ru->ru_stime, &r->ru_stime))
+		return -EFAULT;
+	if (copy_to_user(&ru->ru_maxrss, &r->ru_maxrss,
+			 sizeof(*ru) - offsetof(struct rusage32, ru_maxrss)))
+		return -EFAULT;
+	return 0;
+}
+
 SYSCALL_DEFINE2(osf_getrusage, int, who, struct rusage32 __user *, ru)
 {
-	struct rusage32 r;
-	u64 utime, stime;
-	unsigned long utime_jiffies, stime_jiffies;
+	struct rusage r;
 
 	if (who != RUSAGE_SELF && who != RUSAGE_CHILDREN)
 		return -EINVAL;
 
-	memset(&r, 0, sizeof(r));
-	switch (who) {
-	case RUSAGE_SELF:
-		task_cputime(current, &utime, &stime);
-		utime_jiffies = nsecs_to_jiffies(utime);
-		stime_jiffies = nsecs_to_jiffies(stime);
-		jiffies_to_timeval32(utime_jiffies, &r.ru_utime);
-		jiffies_to_timeval32(stime_jiffies, &r.ru_stime);
-		r.ru_minflt = current->min_flt;
-		r.ru_majflt = current->maj_flt;
-		break;
-	case RUSAGE_CHILDREN:
-		utime_jiffies = nsecs_to_jiffies(current->signal->cutime);
-		stime_jiffies = nsecs_to_jiffies(current->signal->cstime);
-		jiffies_to_timeval32(utime_jiffies, &r.ru_utime);
-		jiffies_to_timeval32(stime_jiffies, &r.ru_stime);
-		r.ru_minflt = current->signal->cmin_flt;
-		r.ru_majflt = current->signal->cmaj_flt;
-		break;
-	}
-
-	return copy_to_user(ru, &r, sizeof(r)) ? -EFAULT : 0;
+	getrusage(current, who, &r);
+	return put_rusage32(ru, &r);
 }
 
 SYSCALL_DEFINE4(osf_wait4, pid_t, pid, int __user *, ustatus, int, options,
@@ -1104,12 +1087,7 @@ SYSCALL_DEFINE4(osf_wait4, pid_t, pid, int __user *, ustatus, int, options,
 		return err;
 	if (!ur)
 		return err;
-	if (put_tv_to_tv32(&ur->ru_utime, &r.ru_utime))
-		return -EFAULT;
-	if (put_tv_to_tv32(&ur->ru_stime, &r.ru_stime))
-		return -EFAULT;
-	if (copy_to_user(&ur->ru_maxrss, &r.ru_maxrss,
-	      sizeof(struct rusage32) - offsetof(struct rusage32, ru_maxrss)))
+	if (put_rusage32(ur, &r))
 		return -EFAULT;
 	return err;
 }
-- 
2.43.0

