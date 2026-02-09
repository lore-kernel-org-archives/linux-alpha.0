Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4575C222597
	for <linux-alpha@vger.kernel.org>; Mon,  9 Feb 2026 14:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770645746; cv=none; b=iy18HO5ZGDeDttVbysdCi008JvkKCexiiKm3W9C9YKz+OczQLM9c9d7DwsV7g8iC03tFyOYLAy9j81T2jEqjeJL2KgDGvbSGbJ3qR4LCzP10zBoCjwwUo9r93XkUp+hEO7EGixUUFJvroioEcuNPrzrNlA/2uW3PCq+/uBECxxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770645746; c=relaxed/simple;
	bh=G430IkZw76DZKnPSnJGxC3lEeG+90T/4vzlS8/A0D2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OR0EgL1QPeFbQWHBZgN29tY2/Rs3bZIgnWuk49exlRAFFxHr3qvq+IoDe9gOc9Z93irD5M+4TchlQHsCGEuvD6NfaTHtdvSpjs29rb6nhrH/96ZcTbrToJTbglW7M0dHqHaHZTJ2jxdrKqZADamEwBQ6hKqZNJbCG75ACETu+4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcXE/Qcu; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcXE/Qcu"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59e499a40easo2419204e87.2
        for <linux-alpha@vger.kernel.org>; Mon, 09 Feb 2026 06:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770645744; x=1771250544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8qupOWOv2GnKv7SNdB71Z0nabotyWYHEU6X4/uhOhg=;
        b=hcXE/QcurJ1fy+VuXGgrNsNYPA+F4MhS3eoeyoXW186nVS3U29m97xbsto+D7hnXYY
         bTi5VEivTejG/97UREpLZRJqXucD8YP60mwCFtd/UQ1t/hJN6DFndtei2TNkyslQI8xQ
         Yr5xj4+OkOYz62sgr6a4ktYjXUeEL42+3F6IfZewHyHQmhkuT5oYgkEgABqfkcKS3i2N
         zK2AFzQsnD6r3yRONn3oGrhzSnQGOCTzVcgScgpQ++G4JnPXwnv4wKwbxFBFAl5xVNxL
         fTsNMUzxQBLlboh2+dp1AJ+LiFlDZ1GDWT6SiMc2fHzty3MPun6jr4n1jW38r5IXFd+9
         vBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770645744; x=1771250544;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y8qupOWOv2GnKv7SNdB71Z0nabotyWYHEU6X4/uhOhg=;
        b=ZSVgC67vEk3hX1C7l2QbexJz1PUcS2mCPtuGWBRkehyt0s3AWbimL6FdywDtDgdrKO
         QOVYuSjFfyjb8x5T6zqiR0e/JtrvCCreGTHvEeeAHXSccxmygZtFbA8/TzvQsq9A/5Mw
         6ZlPLQrjz2NR6t90rWx2rKrjxp/jAPUketIy1uDV/hJqfxGH0W30kVf85Q3sNBraiP15
         jVa2VZ9CWDrkn1hZJR30VPYDHH9kt+rz0SgqTYCXg0pw6TxBY8XceZrK/avvrrFZqOmt
         IxEDAbqwQrb+NNajSf7PQzMiE6XdI2V8xJFkMSXsoP74Q33TZ2IpeThzJ5pDcAFvpHD7
         9yiw==
X-Forwarded-Encrypted: i=1; AJvYcCXZe/QFMvvCNMZ1ZcJoDlc7GvVegvYpkvpdkyESTImj0OVEGn0Yvy1weOEZwtRWcJiFd5uJxDKWGE0iOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjLQpMcdLK6ONJ/uvGRaZUdhJToTPs7woUYjUTcNuPAt7rGi7E
	MZG2AZ3PXh7Ey1MYMKBkgT1tooZZBGhXTdrC71bbEgS5vqxKVyG7+GX8
X-Gm-Gg: AZuq6aJzrJ8rWp4DFcVijTFIVpYAKtV/Ab1tZzEPe0AUECI8W8suNHQXGLCEUguqBQN
	79NnNOfkBZRQw/X9yaq2GtAhDYEZp93jUUNu4wr2ggGSzsc40BKmTI4CUG3RGuvoIOIbtVflMHh
	aG17DppurqeEgxgJp8OYuuUh5eJ50Dg025X0A9HNxqT5Y9sOgculy2nz/j1C0rfph24/FekVAok
	m9fI0lAPE1i2o2Lrv4sjROaQPR1kENDzmKE1JObnUonmAfPzJ/tEndZcFqrtw/58kvJsbOaAR9o
	8GXnSoTREmogtLY5YE7JLLbe734Lvmvy8WwzJOiHSSW0kZNOUysuahyhIXCw5/okvfqhl76Mg5o
	QG+4w9jEVRf4eOMlNTfLnwuzVD+nk2a+8rY2URXk1AhXrzPbozEuvvI6gh8xHwreVRvoUtkZeSL
	qo6jsOrcD5+FU8qoJ3twV2tajJ1t+vsziwoxSbF/vcVfndjUWwSVOJ1A6TjjYhKIUlPxGgCYVm9
	GRf9xmhRbho0Z+8
X-Received: by 2002:a05:6512:10c9:b0:59e:465c:3b1e with SMTP id 2adb3069b0e04-59e465c42aemr3563774e87.41.1770645744036;
        Mon, 09 Feb 2026 06:02:24 -0800 (PST)
Received: from z440.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6f46sm2598475e87.10.2026.02.09.06.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 06:02:23 -0800 (PST)
Date: Mon, 9 Feb 2026 15:02:21 +0100
From: Magnus Lindholm <linmag7@gmail.com>
To: torvalds@linux-foundation.org, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: richard.henderson@linaro.org, mattst88@gmail.com, lindholm@kernel.org,
	glaubitz@physik.fu-berlin.de
Subject: [GIT PULL] alpha updates for v7.0
Message-ID: <aYno7V_aAa27Oxdt@z440.darklands.se>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Linus,

This pull request includes a single fix for the long‑standing
user‑space crashes on Alpha systems triggered by memory compaction.

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git tags/alpha-for-v7.0-tag

for you to fetch changes up to dd5712f3379cfe760267cdd28ff957d9ab4e51c7:

  alpha: fix user-space corruption during memory compaction (2026-01-24 10:35:52 +0100)

Thanks!

Magnus

----------------------------------------------------------------
alpha updates for v7.0

- alpha: fix user-space corruption during memory compaction

----------------------------------------------------------------
Magnus Lindholm (1):
      alpha: fix user-space corruption during memory compaction

 arch/alpha/include/asm/pgtable.h  |  33 ++++++++++-
 arch/alpha/include/asm/tlbflush.h |   4 +-
 arch/alpha/mm/Makefile            |   2 +-
 arch/alpha/mm/tlbflush.c          | 112 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 148 insertions(+), 3 deletions(-)
 create mode 100644 arch/alpha/mm/tlbflush.c
