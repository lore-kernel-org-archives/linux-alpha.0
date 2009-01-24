From: Cheng Renquan <crquan@gmail.com>
Subject: [PATCH] add the missing linux alpha port mailling list
Date: Sat, 24 Jan 2009 12:43:51 +0800
Message-ID: <1232772231-6523-2-git-send-email-crquan@gmail.com>
References: <1232772231-6523-1-git-send-email-crquan@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=Gh5gCOvEg3uVfS16OzyNwjqtgZHXz1QbbVBT9dHx8UA=;
        b=BMjcFZJKOvf6XKW+0om5UZ/5AY5Mgiy/MMnf8LTbv4WwSXLkW64cxEOsAAmv4cCBaM
         FjpW4Jx1Bz7i0L27YObHzAcB+BGPXQnLdcwr0RndflfWvQJVvPelp1pPev3v7s1sSji5
         8N54a+TmLHKleqzivxCFPiaUVRTw/RdfpySio=
In-Reply-To: <1232772231-6523-1-git-send-email-crquan@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Al Viro <viro@zeniv.linux.org.uk>, cr_quan@163.com, linux-kernel@vger.kernel.org

Signed-off-by: Cheng Renquan <crquan@gmail.com>
---
 MAINTAINERS |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3fe4dc2..38e8d09 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -357,6 +357,7 @@ S:	Odd Fixes for 2.4; Maintained for 2.6.
 P:	Ivan Kokshaysky
 M:	ink@jurassic.park.msu.ru
 S:	Maintained for 2.4; PCI support for 2.6.
+L:	linux-alpha@vger.kernel.org
 
 AMD GEODE CS5536 USB DEVICE CONTROLLER DRIVER
 P:	Thomas Dahlmann
-- 
1.6.0.6

