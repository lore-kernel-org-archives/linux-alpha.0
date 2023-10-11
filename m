Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14B6CD6E67
	for <linux-alpha@archiver.kernel.org>; Wed, 11 Oct 2023 13:09:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232375AbjJKNJD (ORCPT <rfc822;linux-alpha@archiver.kernel.org>);
        Wed, 11 Oct 2023 09:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234943AbjJKNIw (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 11 Oct 2023 09:08:52 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6836692
        for <linux-alpha@vger.kernel.org>; Wed, 11 Oct 2023 06:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697029727; x=1728565727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S98puWFt/vOKsW2CbftpDaSryKoUyq9ZmJVDQolfOdI=;
  b=YrqepqN0rjS4EfKGVHmdQ2qNpR8/l0aKth2NGnkmpsnzWLeu2jSsvk6N
   3H0N7SBxaHJW4f0VQj76WqYiFkZH5BLBWIGOoXgkwbTvnNqzcQSQ779SB
   5kKqH3usgGRKAUa3hyeZ3gZPXbEtFWNoJXh1DiLoEOuGaCjIMfLwfXr7P
   HQWxUSI3e+vfUQqpGIh/dixCBD9QWZkDOSlnIjioRqcsWEXTFMRdneqzu
   oBQ9fx0aDTGUArwc+ln0xBb1qxXTZhxkcOAb5jD0yOI8BRrKKUTQOJwEO
   xGO5frq7V+e74qTKW2Tj/IStiOmg/YZbrkhUFMv06cwMuJxNzT423HXbn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="383521728"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="383521728"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 06:08:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="747442505"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="747442505"
Received: from opipikin-mobl2.ger.corp.intel.com ([10.252.57.154])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 06:08:45 -0700
Date:   Wed, 11 Oct 2023 16:08:43 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     linux-alpha@vger.kernel.org
cc:     =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Test to see if there's UTF-8 charset mangling
Message-ID: <a8aa6886-984f-8da0-a7c2-aa2087fdf79@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1892530243-1697029726=:1977"
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1892530243-1697029726=:1977
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

Hi,

Please ignore the email. This is a test mail to see if the mangling of 
non-ascii characters repeats, an example of mangling can be seen e.g. in
(other lists such as linux-pci has the correct copy of the email which 
differs from what lore stored for linux-alpha):

https://lore.kernel.org/linux-alpha/20230911125354.25501-7-ilpo.jarvinen@linux.intel.com/

Mangled-by-something: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

My apologies for the extra noise.
--8323329-1892530243-1697029726=:1977--
