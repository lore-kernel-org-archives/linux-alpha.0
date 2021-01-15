From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] alpha: remove CONFIG_EXPERIMENTAL from defconfigs
Date: Thu, 14 Jan 2021 16:59:56 -0800
Message-ID: <20210115005956.29408-1-rdunlap@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=hiv/VUVqBceDkSmBJ0nemOuNXqJz0OBQUE7ygf0bBDg=; b=yGbRzVQdVYMEWlkP17R2+VTBp7
        k8jNHRT7HmSiTCKJe4raCzLfgoG4D0fKbby8WEw7xif1s+u5OFYUj81AVITadyoUnPWSBF18bugFQ
        NEmFs517/O1VO3UBVN5IF7vl+dvWqyymdZTMclLFp1P52FjOWeyJ7WlRwuofRIDHC+PaT5Bj7qGNd
        fPw3+Dcyh68TCN6NhIJfVQOjGzdViZKODzvhjELiY33m2wbutAl44RH5DyCYruDMFYanB5mWmHH5q
        7DpKwrrE80hGcpT9yfu6tLl3pZLe8STKjdLHKWA2K8/n4T3iuXRwDYnn3EURwVgQUC0iPtP3RjAGU
        HR5VPm0w==;
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Kees Cook <keescook@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Since CONFIG_EXPERIMENTAL was removed in 2013, go ahead and drop it
from any defconfig files.

Fixes: 3d374d09f16f ("final removal of CONFIG_EXPERIMENTAL")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 arch/alpha/configs/defconfig |    1 -
 1 file changed, 1 deletion(-)

--- linux-next-20210114.orig/arch/alpha/configs/defconfig
+++ linux-next-20210114/arch/alpha/configs/defconfig
@@ -1,4 +1,3 @@
-CONFIG_EXPERIMENTAL=y
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_LOG_BUF_SHIFT=14
