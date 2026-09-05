Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26393BBFD6
	for <linux-alpha@vger.kernel.org>; Sat,  5 Sep 2026 19:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636612; cv=none; b=BEv1YgoqWE8U2bo01fO0tphfmfgxYWtItOF/VmwgYgNtf9X4KVOo4kAx7E/WRIC/zNL0A6VFtRT/BzlcaDYK60Tj4iP6SEhHrDUTVYD3z64+pCdnu+8b5ULfcSUndNz49GmN2Oaas0DUZ8pbo+rBDPfut0Eismw9pIegPI2Wz3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636612; c=relaxed/simple;
	bh=JPhW0tJqXaIn8Oiipq0xwNjIp3QnpGEFXpZHEWqLlVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gTbvRphrJl7xfTORSMoz2gvT7QGIDqtmn35GNfN3XXvtFjLV+W1IUtlxsjI5QT5Cdnghpz4ccavRH/w4OFd49s9Sa+ggJk8i7CJdqc/YzGC80jFpeMaltNEvmM5nRxVhCiBobWrn+edhr+pIueqlivW7IbF37RXmlLrAZi88NHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ENJa8j04; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ENJa8j04"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-871c8a36fe3so20393957b3.1
        for <linux-alpha@vger.kernel.org>; Sat, 05 Sep 2026 12:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636610; x=1789241410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HR+LhYK6Oy70AMhIlonjkFs7HP8Yt8BezTGlAJPcneQ=;
        b=ENJa8j04hN7geklOBo0Q3UWejP7zqZ/L1I9sfqHzgE2MqbM6Fel9FuyJ9Euq6Rwu0D
         4qaWcsZgkCBiopu8TMknH8ktVA5AxwzOnMkV0k2L3WxtSKCEetXCk7PlIb4gPTiVIxmz
         Ievhv2bf8ccYaP1uLkDABcFn+9RZyMg3JEOy02eQjXVX5uiHYQ+5o1RwNEVHElDpIUNy
         6Vs/B1f0SwyGZW6/6PuvJ/aYr/qexjj677woZD3LGL06X8OSnx1znjItOTSO0toDFqvx
         f/p5IbPGiMqReOJO0MpC+1+uX7aqn3yiCyhre4hC75B2m2f5lQVJ/AyPcaUJUHnqwZ8f
         gvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636610; x=1789241410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HR+LhYK6Oy70AMhIlonjkFs7HP8Yt8BezTGlAJPcneQ=;
        b=aLvb+B3DE+77jpvlrsf2HMKXFjUHGwZdstqKZRNAmrwwLAHofXpp+PN0jvIBQxom+P
         H0dXKrCZQJJB6G8gWKqKeM0C4y0wrN33FiAnTfaTOp8feNulmBjdluq9tnBagci8Bu19
         VrM2x0q5HX2/2QJ8RNLYXxvaOt0ZvXIQNytevMyqTtQmzS6bMhTjaycksbczflI72us3
         fGQ5xNk2KzSimkcsVUW3dKsY7bfaFholB62dlfy+vDdVpGJzjcrr83lxDdEXwEwhrvEx
         UvskeYwvifQ/7SAdNMdwjf3lsZrjQa9gWpvqTzG9QQumfhcYCWlugI7X0FuVjo2NvMsN
         nDpw==
X-Gm-Message-State: AFuF++mrmRUICeEgueYWFdTIzXbbcyIRbESJPK8hFEASLQKB3Babt0Jt
	PvJ6uid6xy7kFVC59FDSeyWWUZ50QiX0AdrQUZR8nTLr5odBpPNnJld2
X-Gm-Gg: AYBFou26HWllEcFzVdQIEUCBk2iGASf8xoQmuNwRT7tvrJGSh/szK36yTe7coc30BV4
	skBs/zFQ+f/k1egxYsZvwC6d6KiUXewmh880cyvExK+jjl6ZgVNWIIPCwFqYZ3jxvEN3psds4L0
	qyuRYLttSNk5VGGTVnw4rMl+lH8BKwaxey5pjUgHOQmr3wnURMPVNbqr82cwvQRUTueM6IXhwWN
	iNURCtC1BaoCp18MvLu4xkJd+0Kvmvw3KWiK+KdL+HTEVobHGfJbhw6e+nksaqXyGyYqVDSspdz
	Q2PisUSmg1gwVK8C08pb++DwX0d56LpWhDOMbNG8RgrJrqBmsxRAyPbRMOGXyG/uO4SNbcz1RB2
	JnTp/ZWpffq0jYWQR2SDClpA/RzbvLFsOI85Ixe09nq2TTog7zmD4RdlVlRFmawxXdF9g21LwW1
	szcIXsrShxEvepPnE03gLu1x0nS6tOiL2OcuOUmm3VMBeTypafFSIaFn1jgclbhk/8QiVzYXk=
X-Received: by 2002:a05:690e:241a:b0:66f:ae72:ddb2 with SMTP id 956f58d0204a3-66fb595067fmr3474531d50.16.1788636609633;
        Sat, 05 Sep 2026 12:30:09 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb48f1646sm5048420d50.9.2026.09.05.12.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:30:08 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:41 -0400
Subject: [PATCH v2 20/22] alpha: select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-20-83e8245761a2@gmail.com>
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Kees Cook <kees@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
 linux-doc@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=978; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=JPhW0tJqXaIn8Oiipq0xwNjIp3QnpGEFXpZHEWqLlVM=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E7ZFlC5udjK8G2+QNjblXbq+8wCGNa9X8Aisdcjd
 lKGzmeGjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLnmUxkjw8Y7bG+ji6
 30DMQV2kxNXgs9dNDgmlBboxzn5FQe0F5Ux/C/XsHX9Ad36NL+hrZzSm83227X+yEntV9rnaGak
 HO3Py8bAA==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

activate_mm() on Alpha calls __load_new_mm_context() which assigns a
new ASID and invokes PALcode swpctx. On SMP, an interrupt arriving
between the ASID update and the page table switch could see
inconsistent state. Ensure activate_mm() is called with interrupts
disabled during exec.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 33b51bef5139..e5611766b6d6 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -39,6 +39,7 @@ config ALPHA
 	select GENERIC_PCI_IOMAP
 	select AUTO_IRQ_AFFINITY if SMP
 	select GENERIC_IRQ_SHOW
+	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG

-- 
2.54.0

