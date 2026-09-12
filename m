Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B536F38F649
	for <linux-alpha@vger.kernel.org>; Sat, 12 Sep 2026 19:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789242948; cv=none; b=qJxXvEOeOsxA+A/1yWhD0obxpFrHosyixKY5oAzoB152hS8RMDtXtd4CAaHgNM+jZflLZ6On+v9uO2ImBlDfXN/gojXhl7B5aginB+3MHrBCVfUXyJR0HtaSQA5PJLtXwi21Vo8cwKfQlyaccTo7WD1zvDpIlpqEkxOk/yDM0Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789242948; c=relaxed/simple;
	bh=SVClYd+7ea+Qkjn0gT6hYJyaUgyVmTEqLlR7g57fIu4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Cb25NhRqyi4LkGD2shcTK09urVfa92yWDgNH7YgV4j+AeefEHDGB40PjuyEWZZRejyYMnMaO8z+bgoXng8t5A4cmItWty7dHxhg37vXB60aCZ5V3hR2vx8d6MnQ9s44FihF6JeJZ7XLQbl5QBeDZyvqM6y58cb09j60+dy8S2e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVc9gQK3; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVc9gQK3"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d46e4cdcdso6730247b3.2
        for <linux-alpha@vger.kernel.org>; Sat, 12 Sep 2026 12:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789242945; x=1789847745; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IwFDO8UVJp+G6fJLERJAB4ELtanHIQkmCRixCWeWgXo=;
        b=TVc9gQK3szzMzJ2YmKUZBBQspY9pZZyTeTCM3/+9z7W/rJE5d80zash0UQjQ3+R0va
         5Ya/B56siB2aRMHgVGXXQcAUlOziiVa8QO+Mg5DWPKfUs0ZrFsvD1PzjTeWbveIYZriy
         A85Iyah0N5y4qH23urO7Jkj2UGsMy9834dmOq5cuAgxRtenOSgVq6/79H/ui+dEe+JOm
         cOU+Il4yLNYymjgebpFwG0o0dHlSKuIRY3r4hbj8p89Ak1F9UzJuApmvqed1fLjekz6x
         kXgP51bdYNvLrWYOHoe+l/ueywJdWPGpTlMJ+OqIo+VRYzv6U++r7c4MJ6+Q+oMGx0Rj
         DL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789242946; x=1789847746;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IwFDO8UVJp+G6fJLERJAB4ELtanHIQkmCRixCWeWgXo=;
        b=isMt6omd80kQV6bVZXbrHnXLhLVl5slslB3LDGUK4UNss1IC6+RxARk/RoPHpOW3B9
         DMl4Lnhb7r3p4AkAKKGEcWNSKPYnPc6FlEsYsP2RZ9S0m8pR/CKJWFelDswiHEFvJIbD
         saKQmHjCTQ247zRtOgQOevmmWmrIbgcnaBmIq9/2QJYQuIr6CmZg3S5c0v1HWx2r4sBr
         cyPvg5ewyaOuIF5sb1I05OZH+cCUjNFolGKNdMP/PSKDOcr8e0+eaRlzNN4GX9qcHN1J
         HCkdd5dIDOMX57wW6ICvSePu0ibBsN923LO27GrorqnFIscfeYS4PB6TUPlwoKfG/ueK
         MzRg==
X-Forwarded-Encrypted: i=1; AKwUvBwXDlxrEjcYnJMhvurV4X1FDZYh3ShP9SoJ9/KArOgnt590oDJgMwcU5+SMCoIlhXDEqaFpIaGR/I52hw==@vger.kernel.org
X-Gm-Message-State: AFuF++kZEBny9rUNMPCoKKiBX3MStclsF6Q9GAWFCmmn35pFaUvvsGxD
	lD7xqZF6ee9MDeFI3IgxAsbzL7Kfipsm/Y1XX6d+apNb4Ar2HQlX7/8y
X-Gm-Gg: AYBFou1FvXwy5kvNhhSd0OppWRCSll1RiCwDpmzKKk4b+TZmfkCQ5Zs9WKWNqoF4ITc
	+F6MKPJwmt1VTyB4SkanMPGHfofU2uORPciD2Tke73LlhR33jLbGWf7X3v0OgMLc+lDeqtBqItB
	d6yqDsyUtTimLoP67tJUUaG0So0ax5VIkTm2wAeWI1YRyhN57n86dwZtDlFkRlphfjf2qZCH6kN
	zXULJFfTdPmEBcTIOAnCuKNYBWweX2irYeZRK4zVvOZDQl5WsLcT2+I/YHuQqzitLZ+ulXcO6S1
	Mq0/Y8b9xs6USeWSUBSY2wOgl06tPHIEpIF2h73WtQODLXeH8lZvx9Xvnomxh38DegTlO/D01At
	1pvHB3fbiXEvsXDpve/wh8eE6GJGIr0RxKuoYzGPt5QAJ0UG0/N7x22llcOpU2Im2UCnbC9nVTk
	riiEhSZ7eKSPVGBfFYFYX7OgJJvwKYgDR990zGdT6Xw9L5iqQ3u5JaBeLY+EpfxHIaf1IT7Ig=
X-Received: by 2002:a05:690c:d8f:b0:816:b469:ccec with SMTP id 00721157ae682-884b08b6b3cmr45087267b3.15.1789242945467;
        Sat, 12 Sep 2026 12:55:45 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-88488e28d38sm22394187b3.43.2026.09.12.12.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:55:44 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 0/3] alpha: self-extracting compressed kernel images
Date: Sat, 12 Sep 2026 15:55:42 -0400
Message-Id: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MWw5AMBAAryL7bZMq6nEV8VFs2aCkTUQivbvyO
 ZnMPODJMXlokwccXez5sBGyNIFx0XYm5CkySCGVaDKJejsXjSs5SxuOx3468l+EUhS5qYUyQ1V
 CzKMwfP/rrg/hBUamRJ5qAAAA
X-Change-ID: 20260912-alpha-kernel-compression-2043f806fb75
To: Lasse Collin <lasse.collin@tukaani.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Nick Terrell <terrelln@fb.com>, 
 David Sterba <dsterba@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1939; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=SVClYd+7ea+Qkjn0gT6hYJyaUgyVmTEqLlR7g57fIu4=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKWrrOb6SvHxOF89c+qlf/XLPhzXWNlAu+qc7UrFnrYV
 Uu6qR690PGRhUGMi2GmmCJL3HpFllltO5b6nJb+BTOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GQIZOkbxEDk9Bo3M4uLS1CLdtIIih7z8ksSSzPy8Yr38gtS8gvQCvbTMtJKMjPyi4lSgEXp5qSW
 mro5uRoYGJpaOFmZOFo6mJs7OToZObo6Ozq5ORpbmJgbOlo4mrpbmDFycAjDXfHvB8M9+mti7Cm
 1my2Cll0KTLnyWlGlbe3fm85ATsawbCpfZqDcwMiwQ5v8VKfc+O8czs7G+umWWg8hn176Jjnym/
 3gClj/T4wcA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Alpha is the last architecture whose boot loader decompresses the kernel
itself: aboot carries its own inflate code, so vmlinux.gz has always
been plain gzip, and adding a compression format meant writing a
decompressor for aboot as well as for the kernel.

Build a self-extracting image instead, a small ELF stub with the
compressed vmlinux linked in, which aboot loads and enters like any
other kernel. The compression format then becomes an ordinary kernel
Kconfig choice, and all seven formats become available: xz gives the
smallest image, 5547496 bytes against 7677280 for the equivalent gzip
one. The build now emits arch/alpha/boot/vmlinuz, since the image is no
longer gzip data.

The SRM netboot path (bootpz.c) has its own boot protocol and keeps
using gzip.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Matt Turner (3):
      xz: add arch-specific tuning for alpha
      alpha: add self-extracting compressed kernel boot stub
      alpha: support the remaining kernel compression formats

 arch/alpha/Kconfig                       |   7 ++
 arch/alpha/Makefile                      |   6 +-
 arch/alpha/boot/.gitignore               |   2 +
 arch/alpha/boot/Makefile                 |  16 ++-
 arch/alpha/boot/compressed/.gitignore    |   3 +
 arch/alpha/boot/compressed/Makefile      |  63 ++++++++++
 arch/alpha/boot/compressed/head.S        |  36 ++++++
 arch/alpha/boot/compressed/misc.c        | 209 +++++++++++++++++++++++++++++++
 arch/alpha/boot/compressed/trampoline.S  |  46 +++++++
 arch/alpha/boot/compressed/vmlinux.lds.S |  83 ++++++++++++
 arch/alpha/boot/compressed/vmlinux.scr   |  10 ++
 scripts/xz_wrap.sh                       |   5 +
 12 files changed, 478 insertions(+), 8 deletions(-)
---
base-commit: 4407825b2f96b0e48a4bd08ab196b50a30eb3aef
change-id: 20260912-alpha-kernel-compression-2043f806fb75

Best regards,
-- 
Matt Turner <mattst88@gmail.com>

