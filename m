Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B6737EFF2;
	Tue,  3 Mar 2026 22:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772575626; cv=none; b=BVfKLQwRcWX4p/9Z4MHuo5t4Eeq8MzSEj7+XiTppmlrjQlc0dBUbH98Lfs3Am/Z47wdY7Bf1A4J2GSxQDml74Td8xIgKYecFHJoytDzUuYB6Jhg7qiE4a8S4Kt2gT+ouqYQeRlt5j39mHft5hid+RV/mDNyOV7uvoZQtS5cl5KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772575626; c=relaxed/simple;
	bh=qCzSp2epLYyteuG5sCCNa/E9vbu3LEoYBaZX4os+Gfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=R9SxWrpX7+f2cjy0tkxcRQXxPeuQgr01NBJJRGU0kaUTM99bthAw6XmrHgdD79wOer7DR/LIoTV2D6soLWvO7vhIBxvz6f2YMiMDAW0ZuFrMQmGSIrUgr8rN6ss+FdfWdwS0ab4ib6jnd28rLKkab9ghoXq9fkRDxsn3a5cEtPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fCUmC6Su; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fCUmC6Su"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84FABC116C6;
	Tue,  3 Mar 2026 22:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772575625;
	bh=qCzSp2epLYyteuG5sCCNa/E9vbu3LEoYBaZX4os+Gfk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=fCUmC6Su3/0N/aIRqRPfvDinHpJ3KT6U3WNXXUqJRcSVHPNwZCXg8TXR6QjCuRpaJ
	 4tRWNDAvE/86oJNjW47QIsHSto/7UaifR+UiwB/+nRdCfR0SPzd4Rxx+qwP4+8o7He
	 bTJHsRp2DKgfFDgT6CgjcJR7br3UJ1MqAqicZN+s84hdIw2Da4yXzCoIpLE97pR0js
	 T20jCdfewUox973Xh2JibSmpVp+qO5qlrbyuJsjsCeQpvX6sTaKFkYsRre//fIP4t4
	 erzQkQlSe1gcYSJ1/X1ibb8jFcGrys3oDP4Ad220McsicvPm5+L37YN33PWASWR13s
	 h8S+fRuq1M8Jw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C16EDEBF5;
	Tue,  3 Mar 2026 22:07:05 +0000 (UTC)
From: Maximilian Pezzullo via B4 Relay <devnull+maximilianpezzullo.gmail.com@kernel.org>
Date: Tue, 03 Mar 2026 23:06:17 +0100
Subject: [PATCH] alpha: objstrip: fix partial write() buffer pointer not
 advancing
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-alpha-fix-v1-1-89abede2a585@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNj3cScgoxE3bTMCt3kVNM0c4PUVAsDwxQloPqColSgMNis6NjaWgA
 gLHmgWwAAAA==
X-Change-ID: 20260303-alpha-fix-ce5f70ee801d
To: Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Maximilian Pezzullo <maximilianpezzullo@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772575624; l=1584;
 i=maximilianpezzullo@gmail.com; s=20260303; h=from:subject:message-id;
 bh=z1sLA8h3NypD4m7zDxw+jdCekD1EutaTlomZvuEG0dg=;
 b=TIhTx582nsVwRLtQQmuoneiiCFs/q6M5CdVhFb8BhTlny9UnZ5yZgoIiVVbMF7qEnXPl+7Dc0
 iBqr4hE4EXZBMbUa2eJBhXFPfoNMpfdjCN2u0GIVJWAXPqm8FAK3Z9+
X-Developer-Key: i=maximilianpezzullo@gmail.com; a=ed25519;
 pk=TRTR4c2Vb1IfluQvv5OUDPg7EE+pIzdPBND85UU559w=
X-Endpoint-Received: by B4 Relay for maximilianpezzullo@gmail.com/20260303
 with auth_id=658
X-Original-From: Maximilian Pezzullo <maximilianpezzullo@gmail.com>
Reply-To: maximilianpezzullo@gmail.com

From: Maximilian Pezzullo <maximilianpezzullo@gmail.com>

In the main copy loop, on a partial write() the inner do-while
retried write(ofd, buf, n) always from the start of buf, while
only n was decremented.  This caused already-written data to be
re-written, corrupting the output file on systems where write()
returns less than the requested byte count.

Fix by introducing a pointer 'p' that tracks the current write
position within buf and advances it by nwritten on each iteration.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221159
Signed-off-by: Maximilian Pezzullo <maximilianpezzullo@gmail.com>
---
 arch/alpha/boot/tools/objstrip.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/alpha/boot/tools/objstrip.c b/arch/alpha/boot/tools/objstrip.c
index 7cf92d172dc..8da25c2584f 100644
--- a/arch/alpha/boot/tools/objstrip.c
+++ b/arch/alpha/boot/tools/objstrip.c
@@ -246,14 +246,18 @@ main (int argc, char *argv[])
 	    perror("read");
 	    exit(1);
 	}
-	do {
-	    nwritten = write(ofd, buf, n);
-	    if ((ssize_t) nwritten == -1) {
-		perror("write");
-		exit(1);
-	    }
-	    n -= nwritten;
-	} while (n > 0);
+	{
+	    char *p = buf;
+	    do {
+		nwritten = write(ofd, p, n);
+		if ((ssize_t) nwritten == -1) {
+		    perror("write");
+		    exit(1);
+		}
+		p += nwritten;
+		n -= nwritten;
+	    } while (n > 0);
+	}
     }
 
     if (pad) {

---
base-commit: af4e9ef3d78420feb8fe58cd9a1ab80c501b3c08
change-id: 20260303-alpha-fix-ce5f70ee801d

Best regards,
-- 
Maximilian Pezzullo <maximilianpezzullo@gmail.com>


