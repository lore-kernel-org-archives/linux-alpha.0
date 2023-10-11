Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9EEDCD6E64
	for <linux-alpha@archiver.kernel.org>; Wed, 11 Oct 2023 13:18:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231524AbjJKNSp (ORCPT <rfc822;linux-alpha@archiver.kernel.org>);
        Wed, 11 Oct 2023 09:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbjJKNSp (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 11 Oct 2023 09:18:45 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7EB69E
        for <linux-alpha@vger.kernel.org>; Wed, 11 Oct 2023 06:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697030322; x=1728566322;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fpzv316zTXCZ4nkDKYwzC2tv938RLrOd63Z56waS/Ng=;
  b=dLN6WPmMsNMKmpFRob1GM8FBFrF80fP535dnppTs0dag4rkmCgA3sBoH
   6Awbi4uQn02Dk2IP6RJPuSGCxSFl/6fksPnyY77hyokBwEfcgQD0Cj6kQ
   mGlqoTU6al5ri+PEc83FR7cGT9yGcgQRbYNrGAo18QmWRvu+h3Zn6dcCh
   n4Y0YQKYmvFow8jdDuKGmo5CipBEGlAfgjngKUiJvKaIUoubNLxIKc4uq
   1T5lqgRDfjn2epA6Oha2HPVdrCLTfacSitsQ+7+rvyyR52CY3jisZJ1fy
   wHufLCUP5LalvtfcTU9QuQoctG9y62AP8jLQi0m4BIRtN2LsEwoGl7bF4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="375002422"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="375002422"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 06:18:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="1085222810"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="1085222810"
Received: from zkis-mobl5.ger.corp.intel.com (HELO localhost) ([10.249.36.165])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 06:18:19 -0700
From:   =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     linux-alpha@vger.kernel.org
Cc:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: mangling test with a patch, DO NOT APPLY
Date:   Wed, 11 Oct 2023 16:18:08 +0300
Message-Id: <20231011131808.8486-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Testing if the non-ascii letters get mangled by something related to
linux-alpha list.

My apologies about the extra noise on the list.

Mangled-by-something: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7608b714653f..6636dfafa66f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20808,7 +20808,7 @@ F:	Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt
 F:	drivers/gpio/gpio-creg-snps.c
 
 SYNOPSYS DESIGNWARE 8250 UART DRIVER
-M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
+M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com> BOGUS CHANGE, DO NOT APPLY
 R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 S:	Supported
 F:	drivers/tty/serial/8250/8250_dw.c
-- 
2.30.2

