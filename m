From: Kaz Kojima <kkojima@rr.iij4u.or.jp>
Subject: Re: [PATCH RFC] Update kernel math-emu code from current glibc
 soft-fp
Date: Fri, 20 Feb 2015 11:52:57 +0900 (JST)
Message-ID: <20150220.115257.256613837.kkojima@rr.iij4u.or.jp>
References: <alpine.DEB.2.10.1502061719210.27832@digraph.polyomino.org.uk>
	<20150219.132122.204795202277130266.davem@davemloft.net>
	<alpine.DEB.2.10.1502191835490.22905@digraph.polyomino.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=rr.iij4u.or.jp;h=Date:
	Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:
	Content-Type:Content-Transfer-Encoding;i=kkojima@rr.iij4u.or.jp;s=
	20140530.iij4u;t=1424400781;x=1425610381;bh=6TSt27/Ee+NJZCjoK11AHJjgA08mpGz3i
	cVkVS9uSFc=;b=d5P/UTHkXebi7uvG3cZIH23zyZT4+ySoq1XjextvxWorTskjLd2HO32tRjEpGBD
	EJ85Um8actiNBPHynslsfUOJUYRmUh38oMYysDZxhu+PS85Kbj3all/nqs5pVaLGdwgwoVj5ACTl/
	bSvGQXTyHsIQ9X5ZfA65ZVkbZg5aIHVc9lCCHEiipcfwvDypeZMZWkU/bIqoArC6VXhhDxySi63ja
	wN6vU4NpMTkMuk+5d8DgASxNbO+//cfypf7FzS/pbsi7iieRxpKGOPJRBXHv/OdvuNwjBxHLVF370
	Gnf2Sz30ewmllwmF36DVx59E/RMy3l2h43K68bF53L3uhVbA==;
In-Reply-To: <alpine.DEB.2.10.1502191835490.22905@digraph.polyomino.org.uk>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: joseph@codesourcery.com
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org

Joseph Myers <joseph@codesourcery.com> wrote:
> Please try this patch on top of the previous one.  The way abort is 
> redefined in the kernel code doesn't work for one place using it in an 
> expression; this patch changes a comma expression to a statement 
> expression.  This didn't appear in my powerpc testing because the powerpc 
> emulation never uses FP_FROM_INT; I'm not sure how Kaz's sh testing 
> avoided the problem appearing there.

My bad.  It turned out that I've configured the kernel wrongly and
CONFIG_SH_FPU_EMU isn't enabled.  With the proper configuration,
the build got the similar error with sparc64 during compiling
arch/sh/math.c and your patch for op-common.h fixes it.

Regards,
	kaz
