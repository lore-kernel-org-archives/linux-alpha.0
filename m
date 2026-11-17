Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884352;
	b=y+gm92cJYgIcZAS0kpri2C/IXDN8IPAyUOeCNnv+flwBqLNc6jtVmoU+MwqSqNLygBcv
	 1s84lBPoOOrtrzwcbS4CuuGJa96Jxwd4EJ1tE3Bpmiq3IHPPe7Zp4Hp4N1tR7Va9YRvvc
	 zAQc2Bv9UYSLW2BU7ebnW3r0yFcqCLAyovDqE4UBq+2CF/XdE+tD9lgHBA5ZZ8k5o50B5
	 c4S5UNZIqhtJ6svHYiZmSYwM5LfF5LQGoCTaWJUs4AhJkzYyOhpzSK4giV1kyuVVVJ3t+
	 Gvoa/0/C2XNMX4EdIp++QS/oWusGZr4+kq35YQ+fMemm+Eeb81zwp7ndBz+cZxHfnbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=slhAC7n0qqOkMBcIxUMzZVPcbaUbXiJAGexBTZo7f90=;
	b=f616yQUc2S6GkResmQe8xWNj1j915MBAoxMcpd4gUqk/t16A2ANqOC1jlhIDYXwkwe2s
	 LCcAxv2XGMrSnEgZRo0jY9Sb+cNYVWgCVSe6q70Hu5/kwh0SznXGzo+Rk/8Na8sja34nz
	 TIoTv5IdkUCF+QChWS0N1fuMJP5uWSq7IRSoDOgIZUJLpVaTyt1use/U16RnFub3l4K/w
	 JHP1IQSwYaJ3o65avOpmP0C1/RjB/hM22R1krTacS6DgAKnQvYXcUNNf8xAyr9HyQu6AT
	 bGJS1bOdPmaf/2pL8+/C2w/qcmjNPACFM1DsC7uLfOR62iMLKLYT+93oFlSd2D1LKjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQoZW17j;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C189606A31C
	for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 02:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C189606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQoZW17j
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b4dbdc9592so6613867b3.3
        for <linux-alpha@vger.kernel.org>; Mon, 16 Nov 2026 18:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884351; x=1795489151; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=slhAC7n0qqOkMBcIxUMzZVPcbaUbXiJAGexBTZo7f90=;
        b=dQoZW17jiNebFuE6azQ83jmKtjqcxcl5zox5/c9ay6PslDfs/OuTxMsQK+M93ZKxLu
         CyJYN8ep/zcVgJmJyDSjHdmSyO8In/0hZGEXZXgl188jmnl8t7EW4jrx2miND6RHUCGB
         CgJW+Q/Bf4JgPuTefi0kDMTb7iEg+i8irfbYxbN64//aJaiyIUsEG+siLRDJs0dpCndY
         CdzY5+RJF9PvDX9DgMSx0PK0f9olnMNJc8gppLDlmu23HGwYc2L7nHo2Y5I6ywE0mHNy
         31yP+aUy91KVf6nZ32brydM00jb9uxJAKYSP0ghepC3RbnV2VUvM1l7wM1KjfUWbyzDO
         u3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884351; x=1795489151;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=slhAC7n0qqOkMBcIxUMzZVPcbaUbXiJAGexBTZo7f90=;
        b=yUq9iNABAzmceSAKdgApOZ4mwVnSjTF9V9OzdNe3jYro8/1Qk+Yg5u6n1D+cwzKxRB
         dfCLpBAi8cUElZf8o/Ks+apFjIl5euQIfHrAReOlJr1zGDskKOO5t1+32JNHi36jA3v5
         L9vajOqR/5KgY56uHC5ENzZ8/W1HV6dta1uhtk4CybnQxU9yqqtzDCmYdopsKfmJRqrT
         kU8EIVkifxIiBpaHuEh8O0j3I0zvhqfSlbQskrnJoQRsCXuhIhe/fV/eL1ddHOpfhVrz
         to9qEYSTXFQBVq2hTlRdWRDRniAYbGV751AJTjuWZhjFJGNil9hIBbuCmyJLG1wQjvdw
         I9pQ==
X-Gm-Message-State: APuU4Z8UVAolyaVvJjJJQPKEvvg2msrODM93ZzfvkAZejgtxvw+s9uAP
	i5sMvHzRBYW7ayvVdLKCYpFT6V9SxfVcf2nZEe9PyM2rDtzQPlnTNPsr
X-Gm-Gg: AZFdTZdrcwzvlzO8tFqFEtaAEq866Zch4RWJfsIMgCllLbJhwE+Qgu90Bf5fQ34FGhg
	kjJrAz0u2jkAp/cOWWcxdnr0OCFaEGSKOVY9HNihLb2O5WkRu8CHlTi7Zq/3rvfi0e16aivpmt+
	n2vzEYYgZ1b8IOXvp0P/Xww5TuwCxvv0qXBmQZQ843F1WQ4yxco3+7+FHZ7m9nv5wJzARTMOk4j
	xtIfBWiB8PWqpsOnfwvlERhcJk1vDJyxXdHz3pI7iRXjlY0My+l9GcUYUyhGbG1VXFvogMP2rAZ
	oXZsjyV6Ipqx2hZftFZUDeT4IlXtW/zkSlhKBuiTlx+nBoDmm0QidX3/i5cKLin0qZPaaBRg3ap
	iMLxKdjziMVFl2U5gh3QBInxzWEL9M82XCVGEQ99owzypVPOMwGvVincSJnfzxmN8NZnhrc8BxK
	YJPR5s3K/c2eUnSmYc3lB+qwUoIxg0dj9G3hQxiAsoxoN6uXGHMC0hGYuJqJAVayKLA3H/0zYZU
	rwGTt1xlU4jZKaFWKN6NSH4dVjJGCeg+3ccK3rdb88nlBLEx2DXxYDwbiMTxtCrqbwxB/PYE7qd
	dNV+nwvPSEjEeHmT6tIcdd/QvjtcJVmDgvASyE3kRLXcM0UrEHsoc/adSw6NsrEGaFdy0+2ZHov
	cmotfzTzywSQ2X99S4VWSpddWaI0t5SUSlInrs734oL8B6BEHmxBq0k7VZmNzD6GaUNOdUE+BWP
	C7MbskIxkPNHqPb+c8HA==
X-Received: by 2002:a05:690c:ec5:b0:8ab:4c8f:2844 with SMTP id 00721157ae682-8b4aa2a0f51mr73400777b3.39.1794884351354;
        Mon, 16 Nov 2026 18:59:11 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ec065f84sm14469217b3.29.2026.11.16.18.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:59:10 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH v2 0/7] alpha: marvel: environmental sensors
Date: Mon, 16 Nov 2026 21:59:07 -0500
Message-Id: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NyQ6CMBRFf4W8tTUdkGnlfxgWpTzhGQbTYqMh/
 Xdb3Lo8ybnn7uDQEjposh0senK0LhHkKQMz6mVARn1kkFwWQoiczdp6nBgunvVcVrUpVdFpBXH
 wtHin9xG7tT92r+6BZkuFZIzkttV+jjcvkvc37AXjrKq5khXmXYmX6zBrms5mnaENIXwBKOuc4
 7YAAAA=
X-Change-ID: 20261114-marvel-env-d0289c736ba3
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4421; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=2N/yDN2Wcz2QGAy54x4oEamhIu757IC6EK7THi85BJc=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+H/qzetuVvIoC36zY7Wp/JHPDE9069+2S91qsMs2uz
 mTrw/PbOj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaa5EKG/xmWhp8D69
 iDJVPk5pfFlyZecviS9/LQ9jZLC6aXNpYOBYwMH21/XNZ/Ha52r7HnW2zxNcuUpg9XXkQIMD1QW
 HUm8OpyFgA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The service processors of the Marvel AlphaServers (GS1280, ES80, ES47)
monitor temperatures, fans, voltages and power supplies. Linux can't read
these sensors, and the events the firmware raises when one changes state
are printed only with CONFIG_VERBOSE_MCHECK, and then decoded wrongly.

Patches 1 and 2 fix the event reporting. Patch 3 adds the SRM callback
that refreshes the readings of one config tree node, patch 4 passes the
firmware's events to a notifier chain, and patch 5 registers a platform
device. Patch 6 is the hwmon driver, which polls, and patch 7 makes it
reread the sensors and notify userspace when the firmware reports an
event.

The hwmon patches depend on the alpha ones, so I'd suggest the whole
series go through the alpha tree with an ack from Guenter.

Tested on an ES47, where sensors(1) shows the temperatures, fans,
voltages and power supply status. Disconnecting AC from one of its two
power supplies raised a system event that set the supply's in_fault and
woke poll() and udev, and reconnecting it cleared the fault the same
way. No voltage is out of range, so the voltage alarms were checked by
forcing the warning and failure states in the console's packets.

I used Claude Code to help write this series: working out the packet
layout, drafting the code and changelogs, and checking the firmware
documentation. I reviewed and tested the result.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Changes in v2:
- hwmon: report the firmware's states by their documented meaning: a
  sensor's warning and failure states are its reading reaching the
  warning and failure limits, not a broken sensor (Guenter)
- hwmon: report power supplies as in channels with only a fault
  attribute instead of power alarms (Guenter)
- hwmon: depend on !ALPHA_LEGACY_START_ADDRESS for generic kernels,
  which leave out core_marvel.o (Sashiko)
- hwmon: drop the private mutex, rely on the hwmon core lock and take
  hwmon_lock() in the event work (Sashiko)
- hwmon: notify each alarm attribute whose value changed, and only those
  (Sashiko, Magnus)
- hwmon: report a voltage outside its limits as in_min_alarm and
  in_lcrit_alarm or in_max_alarm and in_crit_alarm, by comparing it with
  the nominal voltage in the console's packet (Guenter, Magnus)
- alpha: define CCB_CFGTREE in asm/console.h instead of the uapi header,
  since it is a Marvel console extension, and say it comes from Tru64
  (Magnus)
- hwmon: return -ENODATA from every alarm of a sensor that became unknown
- alpha: drop the unreachable SRM check from
  marvel_cfgtree_partial_update(), and move the GCT node type and
  subtype the driver uses to asm/gct.h
- Reorder: fix the event layout before printing it unconditionally, and
  put the alpha patches first
- Drop the Assisted-by trailers, describe tool use here instead (Guenter)
- Link to v1: https://patch.msgid.link/20261114-marvel-env-v1-0-890328e4b7e5@gmail.com

---
Matt Turner (7):
      alpha: marvel: fix the environmental subpacket layout
      alpha: marvel: report environmental events without VERBOSE_MCHECK
      alpha: marvel: refresh environmental readings through the console
      alpha: marvel: notify environmental events
      alpha: marvel: register a platform device for the environmental sensors
      hwmon: Add driver for Marvel AlphaServer environmental sensors
      hwmon: (marvel-env) Notify userspace of environmental events

 Documentation/hwmon/index.rst       |   1 +
 Documentation/hwmon/marvel-env.rst  |  76 ++++
 MAINTAINERS                         |   8 +
 arch/alpha/include/asm/console.h    |   5 +
 arch/alpha/include/asm/err_ev7.h    |  16 +-
 arch/alpha/include/asm/gct.h        |   2 +
 arch/alpha/include/asm/marvel_env.h |  17 +
 arch/alpha/kernel/core_marvel.c     |  56 +++
 arch/alpha/kernel/err_marvel.c      |  39 +-
 arch/alpha/kernel/proto.h           |   1 +
 arch/alpha/kernel/srmcons.c         |   3 +-
 arch/alpha/lib/callback_srm.S       |   1 +
 drivers/hwmon/Kconfig               |  12 +
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/marvel-env.c          | 690 ++++++++++++++++++++++++++++++++++++
 15 files changed, 909 insertions(+), 19 deletions(-)
---
base-commit: 0b4cadbe7c39d830dec35c4a2655483de0dae568
change-id: 20261114-marvel-env-d0289c736ba3

Best regards,
--  
Matt Turner <mattst88@gmail.com>

