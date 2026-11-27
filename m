Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798633;
	b=dvqRdQYqN/hqiDnC/OGmFV+g6igCvKUa1zW6my9qw7rO0/v0NVNf0wnBARIBEqtBNgAv
	 iyrRt9wWP+PPHbx7xAMU/2COEUTSwP94/4O7bHvEinOVKU8Scl07Z/r6PDxB3fmyLjv9o
	 F91q5mo3hyIGntZWXVGh4yq55jV5N0793itK3V2kXIpl7nKpQEA930oMqtMH+pIxZXjfe
	 ePEl+mq42wuW0tlgKCX74hh7+meI8SVhAa/qPTfo7/aO7o/TbVO+ty6r5REdzLbJbK1Dp
	 3e6VX+gpOjALTzKUWLY3nJoVwWOOL0fDBzav4tfl8Zq3zMIano5ZviaYCtS0Smh352A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QWqsYXBpyz119NEUDtLLwZ6AbhGxnRQniGPx+qgcEmI=;
	b=x5bUNOW+oABjlexcs1oNUKMeAxuoo9knhNpbqh7zV1SnwKcrXx3nfFtxqigHw82LKsiP
	 cBCO25mTGXgdtlUx3mkZ7+tYFaw0ndrw/237NmPj3Sm9ttPvjPa4Het2LmzgA9U/5/yUR
	 fjwxokvpWqIvjdqrCRxVAhjStDU+ZqtMWdT7J6Q8Dxllf1wNcKhTJhq4oTnji+tR0vUCS
	 IupGyeffWrgcUlLROOQHMmJueK8gU/myKq0wdNG8P4NRSbsc55NLm3mqrPEpczMaCjfC5
	 TUgx2p/N2X7j07QguDSPK+SX8y2fkyYVuZ6W96th6GFRFV1yxLD/+BKwoRIRgF30x/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="QI/W9g6P";
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320E1606A321
	for <linux-alpha@vger.kernel.org>; Fri, 27 Nov 2026 16:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 320E1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QI/W9g6P
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c1465bbbdaso7036820e87.3
        for <linux-alpha@vger.kernel.org>; Fri, 27 Nov 2026 08:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795798631; x=1796403431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QWqsYXBpyz119NEUDtLLwZ6AbhGxnRQniGPx+qgcEmI=;
        b=QI/W9g6PjguWumNsp9s0QYCFEI23Sog6oyqQgBpp69luFOXlyrR1dbrXKT4OMtXmkg
         960LJZH8wn/+6080Dhar9oYc9AJQw15bHHtBrlu2zPV34np4CI1QvLb2JrssV5i5/WoM
         NqZwGUjgm1mwj+W3ACM6l7ft8tePKzz1K+El/g7rpVnE3a3oAvyJpLFm42VAbUxbbmsu
         K8j6Kfb5alXIO+IuxdwkPw0Y7I1XL1V5N/RXmG6CD/zjr7QCCJEeguOoloOSctsq5wug
         JEsQyYjCFOrELybveazwHiGm2rsEuECvQa5iJuBda8aKPQ7O+JmLNwCvHPfL0csBRyKZ
         qG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798631; x=1796403431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QWqsYXBpyz119NEUDtLLwZ6AbhGxnRQniGPx+qgcEmI=;
        b=nBnJ8zUtdVRbCbGiGiOcB/NO7W3Mu7XAm14AcEydsuMJurRXwu3xC7UxZv5h8WD9MU
         tLocugjfqjKEpMviQ9yoRbY41BBjLXr9mpSiYKY2qk4vHvdPYM1HZ/BNR5QWSqxJDEfW
         XM+38ZI14hHO22VWcDRedhZ20K3tsWvXZBiJ8oo2zJeEPuBlSeGTOASpgbcd7itxkui0
         J3E7jb149YSDBCvSl3jMO32F+VhkWDJLLEFlJm8LUXmMbIlO+u+pqUHeds5HxcprkfYn
         tgJPEmfF6Rf/ZTFu8A0bVCuFrxJfFvVjW51oy3B0W2lwWa2wrQuSIrNfcB8JszdVQXiS
         izWQ==
X-Forwarded-Encrypted: i=1; AL+hErEu/IlGjqKwSydmHoS3om5YitXizDhIDeUVpISOKHaGCPLamyVwRiaLKpVG9DrlxvOIK1EA3ZgLqCk3Dw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+MOIQ/axqvF2nvg6pg2c/oG5kFJFJVpUbcx/Gw8BBgKb/nFTbH
	VyWgconpAem8jtdplSzvAoFLHtAKzLxRPSeqQXGwhacotmY54BdoQ8wG
X-Gm-Gg: AZFdTZftD9rP/W+zSlATs+YH6ENA7RcD1tI04s6IUxIS8heI7W0Xe9BIN2dx5Rg9tG9
	EWHwf9WIh6+qylm349K0hcEbL1Ud/11A4jA/6DCHPRokXn8PeuxfvqvpI2WpTBFCVg4+20xNH6Z
	N+fYV9lbsX4yStuQSw8h/Zo9/yyKD8DB5UQLOZwxsEQChZorh0VYd8Nwgu+Br+8tXXHqem5YJ01
	IW5eEFWXrjQC2fANhMMaopYjz/I8w/Cm+8e/YXS2krmUrxckTctnyaIDxCgIr1njN9JLoXhWPOo
	c6IR9dktHSBmx/63ZPuuXqtEZjnYir4+zO3G7s/4lEC66mKDYrYxZW3dyOEzCZf1fNwNN885VZF
	9plywdWh4Wciv+FrMOMMAWIc4gJnLOWNa68a4njo+VbWw0nPm3gJNabwRFHaP+GfrU02NU3wfko
	Sm/HoY9nQeIaJf4G8wSckKkcqd3UbOy55WSp2mS0sHwIlUgx1QQ4f4MZRoko2j6l78isArhHSM7
	9KM/+NSllhjS7SzTNy8WlSxA6kpRvbB4cCCnuOYIspe+SN0H08IsrVLFLlBDIDJHY1IzkiSs3r1
	DVyfDzgvjfW24YmOQrIz/35BF3LhnISFVUrbgYK8Wwm4N7542djdNLtXVxlHSgr+u3vDJOA=
X-Received: by 2002:a05:6512:6891:10b0:5bf:d959:6ee9 with SMTP id 2adb3069b0e04-5c1bc874b47mr4871867e87.35.1795798630965;
        Fri, 27 Nov 2026 08:57:10 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd04096asm6045081e87.47.2026.11.27.08.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:57:10 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	m.szyprowski@samsung.com,
	kuba@kernel.org,
	u.kleine-koenig@baylibre.com
Subject: [PATCH v4 0/2] alpha: enable DMA CMA support
Date: Fri, 27 Nov 2026 17:55:48 +0100
Message-ID: <20261127165626.1352471-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables CMA for Alpha coherent DMA allocations and parses
early parameters before reserving the CMA area.

Changes in v4:
- Rebase onto Marek's stable dma_alloc_coherent_node_api tag.
- Pass dev_to_node(dev) as the fourth argument to dma_alloc_contiguous(),
  preserving the previous device-node selection.

Patch 1 is unchanged. Matt Turner's Reviewed-by tags are retained on
both patches.

Built with GCC 14.2.1 and boot-tested on a three-CPU AlphaServer ES40
(DP264 SMP), with CMA, compaction and jump labels enabled. Booting with
cma=64M reserved 64 MiB as requested.

A private coherent-DMA probe passed 39 allocation/free cases across
all three CPUs. Requests included 1 byte, 8 KiB - 1, 8 KiB, 8 KiB + 1,
12 KiB, 16 KiB - 1, 16 KiB, 16 KiB + 1, 20 KiB, 24 KiB and 32 MiB.
Checks covered zeroing, data integrity, page-rounded CMA usage and
restoration of the CMA bitmap after free. GFP_ATOMIC requests of
12 KiB and 20 KiB correctly bypassed CMA on every CPU. No new kernel
errors appeared during the tests; loading the private probe produced
only the expected out-of-tree-module taint. No hardware DMA transfers
were submitted by the probe.

These two commits were tested in the complete Alpha queue at
b4a6d2833fb56d3cf04c4d243f00b7a3f92bd43a. The exported patches also
apply directly to the API tag below. Both pass checkpatch.
Other reservation-size boots and no-IOMMU testing remain outstanding.

Base repository:
https://git.kernel.org/pub/scm/linux/kernel/git/mszyprowski/linux.git
Tag: dma_alloc_coherent_node_api

Previous version:
https://lore.kernel.org/r/20261115103809.1288167-1-linmag7@gmail.com

Magnus Lindholm (2):
  alpha: parse early parameters before reserving contiguous memory
  alpha: enable contiguous memory allocation for coherent DMA

 .../io/dma-contiguous/arch-support.txt        |  2 +-
 arch/alpha/Kconfig                            |  1 +
 arch/alpha/kernel/pci_iommu.c                 | 20 +++++++++++++------
 arch/alpha/kernel/setup.c                     | 20 +++++++++++++++++++
 4 files changed, 36 insertions(+), 7 deletions(-)

base-commit: 31f7e12d621bc5b1dcda0b5e6855e39adc8aaebd
-- 
2.43.0

