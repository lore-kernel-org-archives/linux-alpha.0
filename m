Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677992;
	b=kZju2oT19v3bW1d++x6CwVb8haSCVdYoDxCoe1WML+c0yR6UXZqeJxQe6NBs+JCZ6Icb
	 FbFU05gzym8Thoxqy56d05/OZLHrwc9YBYhp1WXgxH9Y1p3cd41zv65VIRg7Ql6Fi//5R
	 kcUz/sZ59dfcPUPxBRVHl5zYyfCFrgstJX+0QaotNgNbN6sjlrCP9dKlkC+Psjli+ENyw
	 IP1+z6F8VUns1ouA2U7MnaA96XP5cGJtKVxnimcZ27Eip/BEMnxxhlKVjDsu6Z8W1fT+m
	 qsnVsFV0paKop5P6inGc3BeOTJVVp/9evL0maQB8UMsGA1MegVRfpqap80oiQhCotig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=XZ4jEuzVPhQxDlu9ccpWTmq5Uzqra9S6JEfPfNphmHc=;
	b=q/wnUKHoAv/PYwd5ezBi3TZNMy1ehr/5jtnREA3ksfsjmvyYnyLUpFDzvb0OORD9Wnrg
	 v6OtVZWKINt3TcbYdNf9V1MHylouL9h0k1lMc7NSORrjnwnyEjSh2wg97VMRG4pSJ0tw2
	 o0T11Qd7JDcrMwRXV+zuweCQeXO4R4OXkiaxlnVTGl81GyvWhn84UI+73wvDIbjzhN0ly
	 QV4HCk64nrpWItO3PSFKIoAZT+AVzn2mxVVlpEIXtF5oR/ep6L2FT0cixd3aLHWhMyw1/
	 /HhjCPqkJBgw1XZvsPcDuShu7QWf+SwDUdtVpMUx0mI12xuikzhgEvFGyusEYFATI4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lTQSU8uV;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD857606A32D
	for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 17:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD857606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lTQSU8uV
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b4a15c84c5so17837917b3.1
        for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 09:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794677991; x=1795282791; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XZ4jEuzVPhQxDlu9ccpWTmq5Uzqra9S6JEfPfNphmHc=;
        b=lTQSU8uVsfdWtv5lFWi8oI96fpZ7chFSLTW1MkdhL2aJM/YWp0P8h8pJQH3FsIMGuL
         9tqgmuPMG1HHCbeNdpj+ZsyiAA03hdYCisY04HbNyU9h8VomIWFukyO/rcQUSDYJPc4X
         v6Vu4vfIFHSXQpg3rzDf9M62DuDOPXw/99EQRXowFGIASxR278XNQg2O4d7JiXJjZ1j3
         UMapZXz6AavCH5LjAoySZTpN62kZ6eWeVaKyAfr7afZItxTqpHS31C0dC3tALYAASwmW
         OPgqMPsnyop+TOt1J35ozAw8FytaUL0YPubxz3YhO7TpLBTQWd0mkrjUJWmysRDDrpV+
         qi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794677991; x=1795282791;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XZ4jEuzVPhQxDlu9ccpWTmq5Uzqra9S6JEfPfNphmHc=;
        b=goyZMhUNUisUOxDCth9T1hEp1PYqTGVQrQGv9WhMiq71M7QcsKf9p0oa4sNwPvclWg
         F8aaKxhH/QK3Jx9o5IPTVuO0JS/nkGWfTlQn+sw3bpuWUmwWuYKx4Ni9CJTuCmxJvvnr
         bFGBM9Rg1cUQDU4+Q1QN35ep2VczFixrzlQ6165dTVW+CCE6BS9phwq+XRSUS7XcOuOQ
         pNJEv0vQmSTpU8vNbtOqqc7nUWJ0ujqT0JaUkZOX5X3bMXxWliPSjGzlcprfwmyWQKtN
         bWgW6IUREuOWN5fAEyn1uT6IaIxUAJp5ns6c/0VEdp9DKMkxs0rta2UzWNmhvXfINI24
         KKag==
X-Gm-Message-State: APuU4Z/dYrSxeD5vgZXn9g23q6BIcyzqB2uNyJaZTC5FfLopnw8aGG88
	oCXfFEZGYinMsfaIP6oN7b+QdQjzOJzap4KBr1azg6Mb38eFdFEjSMKh
X-Gm-Gg: AYBFou3uEn2JmMvDyqgUzgb3WG1Peag2AJdySgUiTT4zFFijtz/fcchWfXzv2s0+7PO
	iYSFZ2YIJSvDwnr0BInjNy8VmEcgLcAqQjCfqOWw2JbTltUfWzhoEvCbm997T3nDwcgKnHznrSa
	c2k1pkNA1RTC5rvcLQVWP5wYFxtOaKy2S6CXo9rzqHuLsQxwfvQZcSrASh4VxhNJ+hZrf7Ggvbc
	ynjAKiqh8vdpCwc6bCYrrqImGnIIxU1NWvlpqYMbZ3F9O6hUyttIy22MPb59RDnd5EqhFv7MD1C
	76L/vjYoeL7FG4hlpvq8qJLrTpXvCjuSw07vhB+wrk1XevlEe82HAXYYkbzg1u5La9yYAwC10I3
	i4uvHxqeyCnWmmfEC0rcYrq7hjAYtc17JaGolON3ELSupcOLEhmeW3+E/Tb3gItIMqCgLoiRKGc
	s7Uw7EUVLHhT/N5+FzlCAJDJwtEJwhqHPFFIoXPFX/wCAbHYdCnQf6KpkuKXo+4jcD6btFYdOsP
	SapQHYyUtaGBuWgefvgSqK9I5d3i+J7D5LBooAyvh/HQX8HXjVDAlIqvmmrGaDURKiswLrudfvc
	zvWoR0LY70kdSfZRO+LkgnvhDiImLwvbkb+aDb8xrEBWlcvEYL/3SZVEgtb2tM7USWN8Bg7BBIF
	K9WIu1vxOOWeblW3KDI31jMOAB9w7/X4FZ2LSWwNBhP5Dq+kMNENKULxu/Fmd3ps=
X-Received: by 2002:a05:690c:f03:b0:88f:ccf7:25d9 with SMTP id 00721157ae682-8b4aa2f4a19mr36899437b3.60.1794677990741;
        Sat, 14 Nov 2026 09:39:50 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aaa1361fsm47674277b3.43.2026.11.14.09.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:39:49 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 0/7] alpha: marvel: environmental sensors
Date: Sat, 14 Nov 2026 12:39:46 -0500
Message-Id: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDXRVvxdRSyqBiOUtDQScXfF8
 lu8d4FDS+igii6w6MnRagJ4HIEelRmQURcMIhEZ5zxli7IeZ4bGsy4RRalzmbVKQgg2iz2d36x
 ufrujnVDv7wHu+wHOhOJ0bgAAAA==
X-Change-ID: 20261114-marvel-env-d0289c736ba3
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2461; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=RmT7r+x1GuIUeyBqSvzPUTJFmGQwU2dkow/VD15WaTo=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+zHnMtu/Z2ta8jT+qZZPfi+980fYr1zhu/aEyEaenk
 udant9+3PGRhUGMi2GmmCJL3HpFllltO5b6nJb+BTOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GQIZOkbxEDk9Bo3M4uLS1CLdtIIih7z8ksSSzPy8Yr38gtS8gvQCvbTMtJKMjPyi4lSgEXp5qSW
 mro5uRoYGJpaOFmZOFo6mJs7OToZObo6Ozq5ORpbmJgbOlo4mrpbmDFycAjDXpNQy/Hc4faLU+0
 xn/RY7N77NCzWu13abzV9y/MfbQwFJ5+TXu/Iz/I+3P5U3SVjrr9gnsYdmfMKKK9qqRQqXf7q4K
 md92c1X2/kA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The service processors of the Marvel AlphaServers (GS1280, ES80, ES47)
monitor temperatures, fans, voltages and power supplies. Linux can't read
these sensors, and the events the firmware raises when one changes state
are printed only with CONFIG_VERBOSE_MCHECK, and then decoded wrongly.

Patches 1 and 2 fix the event reporting. Patch 3 adds the SRM callback
that refreshes the readings of one config tree node, and patch 4
registers a platform device. Patch 5 is the hwmon driver, which polls.
Patches 6 and 7 make it reread the sensors and notify userspace when the
firmware reports an event.

The hwmon patches depend on the alpha ones, so I'd suggest the whole
series go through the alpha tree with an ack from Guenter.

Tested on an ES47, where sensors(1) shows the temperatures, fans,
voltages and power supply alarms. No environmental event fired during
testing, so patches 6 and 7 are only build tested.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Matt Turner (7):
      alpha: marvel: report environmental events without VERBOSE_MCHECK
      alpha: marvel: fix the environmental subpacket layout
      alpha: marvel: refresh environmental readings through the console
      alpha: marvel: register a platform device for the environmental sensors
      hwmon: Add driver for Marvel AlphaServer environmental sensors
      alpha: marvel: notify environmental events
      hwmon: (marvel-env) Notify userspace of environmental events

 Documentation/hwmon/index.rst         |   1 +
 Documentation/hwmon/marvel-env.rst    |  64 ++++
 MAINTAINERS                           |   8 +
 arch/alpha/include/asm/console.h      |   2 +
 arch/alpha/include/asm/err_ev7.h      |  16 +-
 arch/alpha/include/asm/marvel_env.h   |  17 +
 arch/alpha/include/uapi/asm/console.h |   2 +
 arch/alpha/kernel/core_marvel.c       |  59 ++++
 arch/alpha/kernel/err_marvel.c        |  39 ++-
 arch/alpha/kernel/proto.h             |   1 +
 arch/alpha/kernel/srmcons.c           |   3 +-
 arch/alpha/lib/callback_srm.S         |   1 +
 drivers/hwmon/Kconfig                 |  12 +
 drivers/hwmon/Makefile                |   1 +
 drivers/hwmon/marvel-env.c            | 633 ++++++++++++++++++++++++++++++++++
 15 files changed, 840 insertions(+), 19 deletions(-)
---
base-commit: 0b4cadbe7c39d830dec35c4a2655483de0dae568
change-id: 20261114-marvel-env-d0289c736ba3

Best regards,
--  
Matt Turner <mattst88@gmail.com>

