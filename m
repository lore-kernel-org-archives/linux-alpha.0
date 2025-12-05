Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0097C316905;
	Fri,  5 Dec 2025 08:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764922562; cv=none; b=CmUZVtW2GvaMcJMeZFHSEjcGvV7lmxlCv26qeXM7nMdZdqXx0j4YTtp/9PNvKPd79R61Bk8HxchmmKEdkumcFUr/Xq1OelZQGXsHXftGA179uQBDDaQRq9yuqCD4R7XCExyyyHYrzJYDiUHFhcVQtIHAq8pwjCS2EjUAkn1jrms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764922562; c=relaxed/simple;
	bh=8RjOm5Rup5qT0ci4Ode9r0jqW6CXZUz+RDt4cK4H2l8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=twsLWCbOkoXj4IHd8MYwhHxCJaclnIGCFbpPFlGLz4mFn6KbgE41Kh8snPSLF60ZXtk6orvuQksBcB6jbJr+o7FMK+Ufe6EtfHXG9FVlONUFzsBCr6M/rVRU/+QSjJpkRNfk8je112WyK2a8stQ5gZ7d7/cdYfeo/FFWte5FjJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (2.8.3.0.0.0.0.0.0.0.0.0.0.0.0.0.a.5.c.d.c.d.9.1.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:19dc:dc5a::382])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam@gentoo.org)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 43DD9341006;
	Fri, 05 Dec 2025 08:15:48 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>
Cc: Sam James <sam@gentoo.org>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] alpha: don't reference obsolete termio struct for TC* constants
Date: Fri,  5 Dec 2025 08:14:57 +0000
Message-ID: <6ebd3451908785cad53b50ca6bc46cfe9d6bc03c.1764922497.git.sam@gentoo.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similar in nature to ab107276607af90b13a5994997e19b7b9731e251. glibc-2.42
drops the legacy termio struct, but the ioctls.h header still defines some
TC* constants in terms of termio (via sizeof). Hardcode the values instead.

This fixes building Python for example, which falls over like:
  ./Modules/termios.c:1119:16: error: invalid application of 'sizeof' to incomplete type 'struct termio'

Link: https://bugs.gentoo.org/961769
Link: https://bugs.gentoo.org/962600
Signed-off-by: Sam James <sam@gentoo.org>
---
v4: Fix trailers and actually send the right constants again (rebased wrong branch, sorry).

 arch/alpha/include/uapi/asm/ioctls.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/include/uapi/asm/ioctls.h b/arch/alpha/include/uapi/asm/ioctls.h
index 971311605288f..a09d04b49cc65 100644
--- a/arch/alpha/include/uapi/asm/ioctls.h
+++ b/arch/alpha/include/uapi/asm/ioctls.h
@@ -23,10 +23,10 @@
 #define TCSETSW		_IOW('t', 21, struct termios)
 #define TCSETSF		_IOW('t', 22, struct termios)
 
-#define TCGETA		_IOR('t', 23, struct termio)
-#define TCSETA		_IOW('t', 24, struct termio)
-#define TCSETAW		_IOW('t', 25, struct termio)
-#define TCSETAF		_IOW('t', 28, struct termio)
+#define TCGETA          0x40127417
+#define TCSETA          0x80127418
+#define TCSETAW         0x80127419
+#define TCSETAF         0x8012741c
 
 #define TCSBRK		_IO('t', 29)
 #define TCXONC		_IO('t', 30)
-- 
2.52.0

