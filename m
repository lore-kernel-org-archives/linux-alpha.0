From: Liam Howlett <liam.howlett@oracle.com>
Subject: [PATCH] alpha/kernel/traps: Use find_vma_intersection() in traps for
 setting si_code
Date: Thu, 1 Apr 2021 19:51:48 +0000
Message-ID: <20210401195138.2895285-1-Liam.Howlett@Oracle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2020-01-29;
 bh=u2CBiOhBGly3kAwQNXmCmHyNix/LtTyhVCxqW+hoE5o=;
 b=iD/72yvMYHt5Cj4Eety16AmJPD3m8qdHZaNr4AX+QtbJ2IGoc9WqVh4/59XFIFPl59SE
 Dwr83DPOGvBTJuUFbeIuWeediGjDvr7f4tt4NA/a24nmyUnjdfxQxc0/07np4AGMRXWu
 akeFU2zrPI6H3K5UZQqg+W3XNq1YEZRMOrHjFuDtEZSHPr2EsmtkMWUoouCR+p9gCe7w
 YRAmQSKPjv0OuVQur93gwLyiFWUWK+mZY667y6tdFy0ZGSPGJtlHRJtJqWB3uMCzYzjb
 Vrz2JeZ8025nPFipn/Sx2vUPJLGCgCllF5Ds7HY7aszr1uOC1nejIOnDPDovnvfKY6x7 bQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2CBiOhBGly3kAwQNXmCmHyNix/LtTyhVCxqW+hoE5o=;
 b=z6TiXC9vjLxq6jt7Mk3M1xD8u1LwcDEWR9Y1uo8d8rI9q6DmQ4Cso9c1XETHNaKqtL3kRhJBta2nRbcluWo+zMCtwIu//AxsrczfPyzfCa3h+LedZS6vAspSEfVYxRhIkYmYbrYzGPPip+LRGT+N3NA0nYfcn/JNURbAqsdhn/I=
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Liam Howlett <liam.howlett@oracle.com>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Dmitry Safonov <0x7f454c46@gmail.com>, Michel Lespinasse <walken@google.com>, "Gustavo A . R . Silva" <gustavoars@kernel.org>

find_vma() will continue to search upwards until the end of the virtual
memory space.  This means the si_code would almost never be set to
SEGV_MAPERR even when the address falls outside of any VMA.

Using find_vma_intersection() allows for what is intended by only
returning a VMA if it falls within the range provided, in this case a
window of 1.

Signed-off-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
---
 arch/alpha/kernel/traps.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
index 921d4b6e4d95..7f51386c06d0 100644
--- a/arch/alpha/kernel/traps.c
+++ b/arch/alpha/kernel/traps.c
@@ -957,8 +957,10 @@ do_entUnaUser(void __user * va, unsigned long opcode,
 		si_code =3D SEGV_ACCERR;
 	else {
 		struct mm_struct *mm =3D current->mm;
+		unsigned long addr =3D (unsigned long)va;
+
 		mmap_read_lock(mm);
-		if (find_vma(mm, (unsigned long)va))
+		if (find_vma_intersection(mm, addr, addr + 1))
 			si_code =3D SEGV_ACCERR;
 		else
 			si_code =3D SEGV_MAPERR;
--=20
2.30.0
