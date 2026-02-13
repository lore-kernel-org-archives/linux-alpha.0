Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD732F5321;
	Fri, 13 Feb 2026 07:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770968447; cv=none; b=ZsGrACL9Q6gBSYxG6CwHduId6FKf9oTP6LiiksSfb1Wxiu3zWrwKnIpRg+HA1XC91nUZJzyRHJpseyhfVNB1MdBWir/HdFMLU1UB3G6cJsPVujzwB1VVPg49u6t8tst2JEPPBPW7LsIrfA3kCCrWnHy72aFJmO5A5akEtWGGfnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770968447; c=relaxed/simple;
	bh=eTQRLy2PRDdkkbPWr2AwMFVtHhSarRfuHQDY1zM7UEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mkOZJxfk/9q2TkjKWJnCs7cOzaXO2k29HpRx+xbELB1UEpMnoTzZWGIx24mc6QBI89cvJGh2OH0lx3oqHyTU6ABY/LZAoIHRfyHz9s/YJQ41VToB3tEaMVOYj01lB190k8XRTxryUHM3YBJ8OOVHrlcmsSqHgZGoNHqAouykeIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0+Je6jVB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KRenRjTE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0+Je6jVB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KRenRjTE"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770968128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EwVL72TFmsxB6V8dCX11L0hK/uC1ipOOiuLfL5mhYCc=;
	b=0+Je6jVBqseHytLHJ9iZvc8le1QGrizMlS2s51buY0TpYrqxY4EiW3uNjkhGNEeQQ4nmB1
	QSrjzIk5WayTs/RsX97yChZ5k9QMRRb6S5HZcJEf/7Pi9J8DpXQLIMk3S3PEVzKJ1lQZPh
	cSnFAG/d1c+IWUHegAxPiHizRtVHVUqmV7zmUy5FKgHtziGWA+vOM8SznE9kWjaRUO9lvW
	NpcnrP7Dp5WXMcLIeLf88IAeileiuSc/653yZEkSqHO3CieW/4rP+j3DQLhAX+tnqb+dON
	2McJj8S0f0ewymFjLGp75vW+/lqgWHx9L/0ijB3Uf2GE82z4o9oaQ129AAbE7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770968128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EwVL72TFmsxB6V8dCX11L0hK/uC1ipOOiuLfL5mhYCc=;
	b=KRenRjTEXTMi6ar2NmnK+KGv+KsZxY/gUO7sch7BMOvqwwtHE5vNxqrKf8dkdJ6CsHUqwD
	LYYSazmCGpldz8BA==
Date: Fri, 13 Feb 2026 08:35:14 +0100
Subject: [PATCH] alpha: add missing address argument in call to
 page_table_check_pte_clear()
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260213-alpha-page_table_check_pte_clear-v1-1-e037e3e1e50f@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NzQqDMBAGX0X23IAb8Ye+ipSwTT/N0qAhkVIQ3
 72ht5nLzEkFWVHo3pyU8dGi+1aFbw35INsKo6/qZFs7tJY7IzEFMUlWuEOeEc4H+LdLR6UIyQb
 91C0yDj0zU82kjEW//8X8uK4fCs68C3IAAAA=
X-Change-ID: 20260213-alpha-page_table_check_pte_clear-e583fa765111
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770968123; l=1490;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=eTQRLy2PRDdkkbPWr2AwMFVtHhSarRfuHQDY1zM7UEc=;
 b=Ml9UIRnI2oByffCqo5UNn355Cpt0HTeRQv8hfmXLwu3lheshJndZ622ZdlempazuxOzVnx8L9
 +P37MtNpOBYCNHhPvKJ1Llzq3BvVnPfQwaRWdbftLBmwd+tYTWgm8o8
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

After the merge of the alpha and mm trees, this code does not compile,
as a parameter is missing in a call to page_table_check_pte_clear().

The parameter was re-added in commit d7b4b67eb6b3 ("mm/page_table_check:
reinstate address parameter in [__]page_table_check_pte_clear()").
The alpha-specific code was newly added in commit dd5712f3379c ("alpha:
fix user-space corruption during memory compaction").

Fixes: 4cff5c05e076 ("Merge tag 'mm-stable-2026-02-11-19-22' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm")
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
This should go directly through Linus, in my opinion.
---
 arch/alpha/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index c9508ec37efc..e9368c54be45 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -289,7 +289,7 @@ static inline pte_t ptep_clear_flush(struct vm_area_struct *vma,
 	struct mm_struct *mm = vma->vm_mm;
 	pte_t pte = ptep_get_and_clear(mm, addr, ptep);
 
-	page_table_check_pte_clear(mm, pte);
+	page_table_check_pte_clear(mm, addr, pte);
 	migrate_flush_tlb_page(vma, addr);
 	return pte;
 }

---
base-commit: cee73b1e840c154f64ace682cb477c1ae2e29cc4
change-id: 20260213-alpha-page_table_check_pte_clear-e583fa765111

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

