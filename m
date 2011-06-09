From: Jay Estabrook <jay.estabrook@gmail.com>
Subject: [PATCH 0/3] alpha, drm: Update Alpha DRM support
Date: Thu, 9 Jun 2011 18:06:04 -0400
Message-ID: <20110609180604.7cac8b5a.jay.estabrook_gmail.com@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:cc:subject:message-id:x-mailer
         :mime-version:content-type:content-transfer-encoding;
        bh=gfqnm59ZaDkoFxvbAA4aMRcz6zUAWOybFmbO3IF7rIY=;
        b=TSn8xKwrbNWWZuIV1stS2lTOg08TvbXI3zuhWBr3+ExXQArlBPveYXX0PUzh006g19
         GJkHI1ivJN9ODswaEhNFGNaAZMNddXKlSoHSegaSsE+bZoX687XBe/mdzxh9RFRz3x+B
         m373ac9bml0qOwUizSv1unWJiuI71609/tUgk=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha <linux-alpha@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
Cc: Matt Turner <mattst88@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jay Estabrook <jay.estabrook@gmail.com>, airlied@linux.ie


This patch set fixes Alpha-specific support in the DRM code,
allowing Radeon KMS and the MGA driver to work properly on
Alpha-based machines.

Jay

Jay Estabrook (3):
  alpha, drm: Update Alpha DRM support
  alpha, drm: Cleanup Alpha support in DRM generic code
  alpha, drm: Remove obsolete Alpha support in MGA DRM code
  alpha, drm: Add Alpha support to Radeon DRM code

 drivers/gpu/drm/drm_bufs.c          |    3 ---
 drivers/gpu/drm/drm_vm.c            |    2 +-
 drivers/gpu/drm/mga/mga_drv.h       |   19 -------------------
 drivers/gpu/drm/radeon/radeon_ttm.c |   23 +++++++++++++++++++++++
 4 files changed, 24 insertions(+), 23 deletions(-)

---

