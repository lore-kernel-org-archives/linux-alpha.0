From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 02/29] alpha: Avoid comma separated statements
Date: Tue, 16 Feb 2021 07:10:22 -0800
Message-ID: <bff39ad847650483ba2a14ccc1c0d8032bdfa3df.camel@perches.com>
References: <cover.1598331148.git.joe@perches.com>
 <4facd57f80c70437f085ba3a1bcf13ae0b63c3bc.1598331148.git.joe@perches.com>
 <52f038d9ff547deee4e5b5628507e61ec8d056b7.camel@perches.com>
 <YCvZGuKvtPi6ktNV@rric.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <oprofile-list-bounces@lists.sourceforge.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UKA6Or7YS7Uljvog60XrITJifIC/hfcPN4xXobdj3c4=; b=Jlxb09r56WeLY5ouj53dAbpU0l
 GxvSt7RNPF/ztxsMzL7w1gw8KpqqE2H67zOSd3yEp8ksrFFkT5z1ZO/Gk3lJxD0tDFfPYWMHAyCXf
 vPABJqJrK0tDsfo6UbdtT8G+PMyE9zSNu+EDILr6cJD8CDC9Qh4x6s4RjtL6utXaS73w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UKA6Or7YS7Uljvog60XrITJifIC/hfcPN4xXobdj3c4=; b=ixEwkVlFfnWsAPUYa4NanqQTee
 XezE65VIH0wj4o7rR4FZ1qQcWBCY6ngV7OPQH/Ei5rTGB3muxUP42EIFk7A29oe5k7wSGoMeXnVgc
 hRU72CqBcVNNL/jtmYUpVX92TOXKZXQWAhBQRNnpf92mDX83nZ7UgwVYH1Z39MlQzhdE=;
In-Reply-To: <YCvZGuKvtPi6ktNV@rric.localdomain>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/oprofile-list>, 
 <mailto:oprofile-list-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=oprofile-list>
List-Post: <mailto:oprofile-list@lists.sourceforge.net>
List-Help: <mailto:oprofile-list-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/oprofile-list>, 
 <mailto:oprofile-list-request@lists.sourceforge.net?subject=subscribe>
Errors-To: oprofile-list-bounces@lists.sourceforge.net
To: Robert Richter <rric@kernel.org>
Cc: Jiri Kosina <trivial@kernel.org>, linux-kernel@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, oprofile-list@lists.sf.net, Matt Turner <mattst88@gmail.com>, Richard Henderson <rth@twiddle.net>

On Tue, 2021-02-16 at 15:39 +0100, Robert Richter wrote:
> On 30.01.21 10:54:42, Joe Perches wrote:
> > On Mon, 2020-08-24 at 21:55 -0700, Joe Perches wrote:
> > > Use semicolons and braces.
> > =

> > ping?
> > =

> > > =

> > > Signed-off-by: Joe Perches <joe@perches.com>
> > > ---
> > > =A0arch/alpha/kernel/pci_iommu.c      |  8 +++++---
> > > =A0arch/alpha/oprofile/op_model_ev4.c | 22 ++++++++++++++--------
> > > =A0arch/alpha/oprofile/op_model_ev5.c |  8 +++++---
> =

> This patch should be rebased as oprofile is going to be removed in
> 5.12. A branch is in linux-next.

git am --include=3Darch/alpha/kernel/pci_iommu.c
