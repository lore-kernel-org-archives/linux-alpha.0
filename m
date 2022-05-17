From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
Date: Tue, 17 May 2022 15:12:25 -0300
Message-ID: <62a63fc2-346f-f375-043a-fa21385279df@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com> <YoJgcC8c6LaKADZV@alley>
 <63a74b56-89ef-8d1f-d487-cdb986aab798@igalia.com>
 <bed66b9467254a5a8bafc1983dad643a@intel.com>
 <e895ce94-e6b9-caf6-e5d3-06bf0149445c@igalia.com> <YoOs9GJ5Ovq63u5Q@alley>
 <599b72f6-76a4-8e6d-5432-56fb1ffd7e0b@igalia.com>
 <06d85642fef24bc482642d669242654b@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RkcNvrzFzF9FtcobFoiblw/OIAiv7NXlH/of41nBjZg=; b=1nbZmVL9gt1iBS
	rydNgNWiMBGNdNhtfb6iCNlHKXH/BDshOCdUZKj/xLhEk38xXmGqDJgCWoPN+f9UB6H8x8+a1h0sj
	M787EgY/X7rd9mxONDoscOMQ9bQQIfaWRD1wuHAsUmwTRvzrb1NYm4IQpgPs5yRGE1Rz32UCcQYb9
	Km+AtXOEMODIcsPWKTBvzKmopO1fdZAqisUCYNybIxlgM8x1clkf9kLLBFlBoYQu45J3bIjrrWYHV
	RVxH6xPGybsNHA4DslJFV1g9LWykuYbn10BqkPRUZ9DFDt3bU6dAAwMMs0UtEcJlZOA+3iubyrOzs
	mLBGuq527unGbTaMmUjw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6MSK1Z4Nv/e1GFKFinCP8P3dIYao0CoLyUe3quXpDhY=; b=cRMrVSVTR+3cn6FVG65SC4Au0y
 UkLE3SVfqGk36g/jG1E9IomGRvED5Awi+eOSCTntuGE0jPXl5+kfHlbKsvhvVjaCNf8y4mBWXGPlT
 8r/o/CMKhbUaIdrKhLkt446cgXa07HTSiorku/w0xJvIn3aE4uqi2qj8QGi7eb4Kmsg0/Wh5BR8Vi
 YCGb8f9djqv6fWXVwjRpFQtg+9b6W6H4TQisr9ZwQKSIB4SsmfEWL196/jrcNQFL2lm66S4LfYE8s
 uZ+fz2jSIIuBy2Np//l8BP/gbXHu+JyZVeJsb8IAXoZSlvi3RYMR9sSIMXj8sSzR7kYxeP4KKKokk
 nGGtp5Zg==;
Content-Language: en-US
In-Reply-To: <06d85642fef24bc482642d669242654b@intel.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-um/>
List-Post: <mailto:linux-um@lists.infradead.org>
List-Help: <mailto:linux-um-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=subscribe>
Sender: "linux-um" <linux-um-bounces@lists.infradead.org>
Errors-To: linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org
To: "Luck, Tony" <tony.luck@intel.com>, Petr Mladek <pmladek@suse.com>, Dinh Nguyen <dinguyen@kernel.org>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "bhe@redhat.com" <bhe@redhat.com>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-s390@vger.kernel.org" <lin>

On 17/05/2022 14:02, Luck, Tony wrote:
>> Tony / Dinh - can I just *skip* this notifier *if kdump* is set or else
>> we run the code as-is? Does that make sense to you?
> 
> The "skip" option sounds like it needs some special flag associated with
> an entry on the notifier chain. But there are other notifier chains ... so that
> sounds messy to me.
> 
> Just all the notifiers in priority order. If any want to take different actions
> based on kdump status, change the code. That seems more flexible than
> an "all or nothing" approach by skipping.
> 
> -Tony

I guess I've expressed myself in a poor way - sorry!

What I'm planning to do in the altera_edac notifier is:

if (kdump_is_set)
 return;

/* regular code */

In other words: if the kdump is set, this notifier will be effectively a
nop (although it's gonna be called).

Lemme know your thoughts Tony, if that makes sense.
Thanks,


Guilherme
