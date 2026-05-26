Received: from mail-108-mta49.mxroute.com (mail-108-mta49.mxroute.com [136.175.108.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDBE352C52
	for <linux-alpha@vger.kernel.org>; Tue, 26 May 2026 23:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779836748; cv=none; b=XenkYY/r+4FF3z8JNj6Ik7tehjgOhIoWAjU6ni6qJ2Pg6LabjrHryoHk7bHuvZ6zLV6O8p9x5DEu+I3xKbqimCuERtY0vgpLkDsYnAkQaFIbJPXiT5/E1bNoxtLkLUEDkS5onZUjtcpoHi3ag/9ETxgJ//prdru1xLTEoFqiaNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779836748; c=relaxed/simple;
	bh=Pm7HuNGQdW+lOEGYq5uToiLv8v9rXd8lGXQI1DClfAs=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To; b=g4bwMe62ALVmvl2uTrdYJE59rsR0DWrPil8GhEBgaTJgF2uHodfyibi5mZOq0NXt1YiJrhEfRe5rbaoID/AfoZSCQPQPDQ/sX0lbDCMuqLOmGwnbm6rEIW3oD/+FVIo6CvNSQz5yuZhEUPx9PcbRMAstQdASY4YRiv5/JI8Pge0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flyingpenguins.org; spf=pass smtp.mailfrom=flyingpenguins.org; dkim=pass (2048-bit key) header.d=flyingpenguins.org header.i=@flyingpenguins.org header.b=oeoyFqwx; arc=none smtp.client-ip=136.175.108.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flyingpenguins.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flyingpenguins.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flyingpenguins.org header.i=@flyingpenguins.org header.b="oeoyFqwx"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta49.mxroute.com (ZoneMTA) with ESMTPSA id 19e6684c29a00067f7.001
 for <linux-alpha@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 26 May 2026 23:00:37 +0000
X-Zone-Loop: 15aab44a7c4198183ed501422f1cb4bacc45022a1d68
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=flyingpenguins.org; s=x; h=To:Date:Message-Id:Subject:Mime-Version:
	Content-Transfer-Encoding:Content-Type:From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ji8Ks+ZHzN7TqpTHiduyi92wTWMWweV7nUtfHmnGKyA=; b=oeoyFqwxZwH7cUOjXx5RTuY6Wg
	TzD7FNNE8jIwpfzpEYYN0AP2NQ0KU7vf0iPrJNAju/3phqdAeIeZ1qQDb2lg9Cusp767rc0kcqKz/
	GkUo22fewpWJGy6d3sdFQRa7sNCdq8g6tyhoYOabpCeCjJFEpBMe8vIrF4dVeCV3iptp/gD1Iie8c
	qvjmXrVwkRyqv2X5Y7RdRC3UAO1VYDkVLBiQqYY+naOwt091L6I1M1WhczxN5KBe+FUps8J5XQY9I
	KDJWOz5g69mWBGm4lv2+t/X9uJir+JKkmIuLnrRTnChV+ORcmFqVy0J4q7TZgeMltSOEW1vt7O4CW
	BX2vyMHQ==;
From: Mike Hlavac <mike@flyingpenguins.org>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.10\))
Subject: [PATCH] fix typo in alpha/lib Makefile comment
Message-Id: <077B8D13-7C98-467C-A6AF-56A8F372B547@flyingpenguins.org>
Date: Tue, 26 May 2026 19:00:34 -0400
To: linux-alpha@vger.kernel.org
X-Authenticated-Id: mike@flyingpenguins.org

Fix a typo in a comment in arch/alpha/lib/Makefile.  =E2=80=9CIff=E2=80=9D=
 -> =E2=80=9Cif"

Signed-off-by:   Mike Hlavac (Mike@flyingpenguins.org)

--- /home/griffin/kernel-hacking/alpha-lib-typo/Makefile-orig	=
2026-05-26 14:49:18.246555089 -0400
+++ arch/alpha/lib/Makefile	2026-05-26 14:50:32.805555377 -0400
@@ -6,7 +6,7 @@
 asflags-y :=3D $(KBUILD_CFLAGS)

 # Many of these routines have implementations tuned for ev6.
-# Choose them iff we're targeting ev6 specifically.
+# Choose them if we're targeting ev6 specifically.
 ev6-$(CONFIG_ALPHA_EV6) :=3D ev6-

 # Several make use of the cttz instruction introduced in ev67.=
