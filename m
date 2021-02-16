From: Robert Richter <rric@kernel.org>
Subject: Re: [PATCH 02/29] alpha: Avoid comma separated statements
Date: Tue, 16 Feb 2021 15:39:22 +0100
Message-ID: <YCvZGuKvtPi6ktNV@rric.localdomain>
References: <cover.1598331148.git.joe@perches.com>
 <4facd57f80c70437f085ba3a1bcf13ae0b63c3bc.1598331148.git.joe@perches.com>
 <52f038d9ff547deee4e5b5628507e61ec8d056b7.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <oprofile-list-bounces@lists.sourceforge.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gLJfImd607eIEKRDjMEKO3db5Qx0sx2AhyN6wd7r070=; b=lIyqnMOWN8gE1zqoKBQrjsJm29
 GMzyDHh3RPAjo37yQAgQZuYTxacBQ+HG6WI4dHQ1Uu3Xe+1LG3B55yv0TYiBILbkXlJdDe7ZQRNQt
 ZYsYd/PIaJkw89f+IXyc4uDrZQHGu/VWCRav7vb1gzR37Ci7qbMPkNBBfLo8fsGUTA90=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gLJfImd607eIEKRDjMEKO3db5Qx0sx2AhyN6wd7r070=; b=exHF4gVUMXVTYcv9RebkAYemoX
 /N1yH3Hi7+Gz4Uxjk5QIe2e2RsF3WKPKKTFFeqDBnMNkCzspmCFHNKztLo7kAdj568a2K3P4EkFFv
 YqZoJ5XYZDR15L+EUkVOciSB4S28b3nitBGlNXWNeYAbwghfqaQbmJ+KGNAD886b8NZE=;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613486367;
 bh=UNowcMW0SCs9nkZpIMU1XGVDBOUfCP5cIFjY9xFBtkw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bnvg5U1s9dgRqFeGSd8Z+1uzt5GISNX+ggmHL43B7wAFuRrdMgDDNUUH06BSwQl+D
 NvLeq7gtGG4ooNe7FPohcL4QQJwNV3EaQJN5/Opi/kgI2IdiJKw9w/73+Q5dsS+Xdu
 6ns259AlSo7mcyDIEyt8a2u4hEZVRfV3/mLd5SYOlMg3HzUnlVgH47S6djl2G33ygX
 I1h48S1YK+EgTXBS+veJ6JvCqXsN7r/3r2758MEjO3hd/WlcdrBWElGBl3oFGtU6p0
 RtLxKPS9Bh6SgLauEWeOBgrshGmx2tWNqYnHu/MHe8QdTbQLo3e6Km8t44H6G0GA0X
 R7BVQIxBZcPkA==
Content-Disposition: inline
In-Reply-To: <52f038d9ff547deee4e5b5628507e61ec8d056b7.camel@perches.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/oprofile-list>, 
 <mailto:oprofile-list-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=oprofile-list>
List-Post: <mailto:oprofile-list@lists.sourceforge.net>
List-Help: <mailto:oprofile-list-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/oprofile-list>, 
 <mailto:oprofile-list-request@lists.sourceforge.net?subject=subscribe>
Errors-To: oprofile-list-bounces@lists.sourceforge.net
To: Joe Perches <joe@perches.com>
Cc: Jiri Kosina <trivial@kernel.org>, linux-kernel@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, oprofile-list@lists.sf.net, Matt Turner <mattst88@gmail.com>, Richard Henderson <rth@twiddle.net>

On 30.01.21 10:54:42, Joe Perches wrote:
> On Mon, 2020-08-24 at 21:55 -0700, Joe Perches wrote:
> > Use semicolons and braces.
> =

> ping?
> =

> > =

> > Signed-off-by: Joe Perches <joe@perches.com>
> > ---
> > =A0arch/alpha/kernel/pci_iommu.c      |  8 +++++---
> > =A0arch/alpha/oprofile/op_model_ev4.c | 22 ++++++++++++++--------
> > =A0arch/alpha/oprofile/op_model_ev5.c |  8 +++++---

This patch should be rebased as oprofile is going to be removed in
5.12. A branch is in linux-next.

-Robert

> > =A03 files changed, 24 insertions(+), 14 deletions(-)
