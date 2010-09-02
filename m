From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: =?UTF-8?q?=5BPATCH=2083/91=5D=20arch/powerpc/include/asm/hydra=2Eh=20Update=20broken=20web=20addresses=20in=20the=20arch=20directory=2E?=
Date: Thu,  2 Sep 2010 14:13:34 -0700
Message-ID: <1283462022-8024-8-git-send-email-justinmattock@gmail.com>
References: <1283462022-8024-1-git-send-email-justinmattock@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references:mime-version
         :content-type:content-transfer-encoding;
        bh=/wJJoiyK5d7lLZXDIykcqswwAkqo8QAfW5VwjspF7uY=;
        b=og4Z0rF+YLuKJZYp+W0D59JHnVs2JS/QdbX83Gov9tgr940U4ozyNQXHpy1xKRQ6+J
         BWU1/r+3KxdklDC4Yum8UP3z2V3Y+3ya3fA6D3siXCI59Ke1JEQ9sASM91PaardKVonH
         8WoYoZNxo3Hiiv7aCcUaYivwlEUqydYRylvo4=
In-Reply-To: <1283462022-8024-1-git-send-email-justinmattock@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: trivial@kernel.org
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, jkosina@suse.cz, "Justin P. Mattock" <justinmattock@gmail.com>

The below patch updates a broken web address that is no longer
working due to company buyout, and/or change of location.
(Please have a look through, and let me know if any of them
need to be changed, and I'll resend an updated patch).

Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>

---
 arch/powerpc/include/asm/hydra.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/powerpc/include/asm/hydra.h b/arch/powerpc/include/as=
m/hydra.h
index 1ad4eed..d529a2c 100644
--- a/arch/powerpc/include/asm/hydra.h
+++ b/arch/powerpc/include/asm/hydra.h
@@ -10,7 +10,7 @@
  *
  *	=C2=A9 Copyright 1995 Apple Computer, Inc. All rights reserved.
  *
- *  It's available online from http://chrp.apple.com/MacTech.pdf.
+ *  It's available online from http://www.cpu.lu/~mlan/ftp/MacTech.pdf=
=2E
  *  You can obtain paper copies of this book from computer bookstores =
or by
  *  writing Morgan Kaufmann Publishers, Inc., 340 Pine Street, Sixth F=
loor, San
  *  Francisco, CA 94104. Reference ISBN 1-55860-393-X.
--=20
1.7.2.1
