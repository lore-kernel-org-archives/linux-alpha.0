From: Bjorn Helgaas <helgaas@kernel.org>
Subject: add linux-alpha archives to lore.kernel.org?
Date: Tue, 6 Jul 2021 11:12:34 -0500
Message-ID: <20210706161234.GA797557@bjorn-Precision-5520>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625587956;
        bh=vqX308HXSFL6SvZNuKllPzmcgOiyq5y2v4+kemo2cmw=;
        h=Date:From:To:Cc:Subject:From;
        b=DlapoBKuYP27hgszgQdorJQzDX57q+pmaiQylMb5YlTPOGxVZ7T2wC5R8ZmEMo3ev
         azjD/NCXX+bvs7XX7NFcqURP4kqc4WJU28u/uIMxrDtT4cqHzJDPwb2DNlUeffMF0W
         5dUy4g1o3GgEEefq86qXFNEEwsOGj2RuNk88iwSaP77Pbgy4iCrUM886JZvOFAZnWm
         mDPeKTdcwpm13tu50e0yj9TX4aMHFZ98cBYS+66MeEYQ9jwb35qqrX75a3KdcMSdKc
         7ZwfPhdFwkiGi65TUE4jZp8CoMtxUtKzQr6zoKcTlyFf2eMQKXeR7t3Vz2GxGeLsHw
         48VQCyK2wgJtw==
Content-Disposition: inline
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Eric Biederman <ebiederm@xmission.com>, linux-kernel@vger.kernel.org

Is there any interest in adding linux-alpha archives to
lore.kernel.org?  See https://korg.docs.kernel.org/lore.html for
details.

I don't know whether alpha is still viable.  Krzysztof has been
struggling to get a working alpha qemu and userspace working to do
boot testing of some PCI-related changes, and it's pretty hard.  But
maybe it's at least of historical interest, since alpha was one of the
first non-x86 ports?

Cc'd you, Eric, since you've done recent alpha fixes and apparently
have a bootable qemu-system-alpha:
https://www.spinics.net/lists/linux-alpha/msg07206.html

I don't have any of the old archives myself, but
http://marc.info/?l=linux-alpha and
http://www.spinics.net/lists/linux-alpha/ both seem to work.

Bjorn
