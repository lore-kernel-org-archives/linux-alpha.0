From: "Luck, Tony" <tony.luck@intel.com>
Subject: Re: [PATCH 21/30] panic: Introduce the panic
 pre-reboot notifier list
Date: Tue, 17 May 2022 17:02:31 +0000
Message-ID: <06d85642fef24bc482642d669242654b@intel.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com> <YoJgcC8c6LaKADZV@alley>
 <63a74b56-89ef-8d1f-d487-cdb986aab798@igalia.com>
 <bed66b9467254a5a8bafc1983dad643a@intel.com>
 <e895ce94-e6b9-caf6-e5d3-06bf0149445c@igalia.com> <YoOs9GJ5Ovq63u5Q@alley>
 <599b72f6-76a4-8e6d-5432-56fb1ffd7e0b@igalia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <openipmi-developer-bounces@lists.sourceforge.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wPndYlW5xEVdpcc0zA72NXu9ypQzfs4FPZzk6VJMkkY=; b=BEZHywsZpzySQ7rO2fKVkJQcq5
 N0zHMJqqiO1Srf4SIg7E7deZxKVPf/SvFLdsPivHu+ZZSDxaLFPEAG1P+vGkOAHCljWt4ea6naaqG
 6Yk+LMZwbp1cUBgUBZ5jG7VYGLSQF0z/bg6TdBxZd7hAxRBlBiHJ2Mp5XoL6x61J6wmo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wPndYlW5xEVdpcc0zA72NXu9ypQzfs4FPZzk6VJMkkY=; b=giNaMtnoqbP7PVY2/Z3G8V9GQf
 loHAYWmCYTmvKjzUYnpfj69SjXiXvjiigr4OZcuaiGNMmcRUmQhOvfg5SV3+M3YY25G6ARiYpQBF1
 X5vBO/8VVuQYx/Y7sKb6yZFnND+x5W+mjdpTOn3h3dTSO/O1QY9K6M0YkzrfAarNgyhQ=;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652806962; x=1684342962;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wPndYlW5xEVdpcc0zA72NXu9ypQzfs4FPZzk6VJMkkY=;
 b=Sc0Rvh1DHGMmvh1PGMBwKdhVRIdzyZ6e9SqZxe+fgpWVX+3fPvmfNgn/
 JLODxa0C/imRRwNsudQceZSRSK/DrE76LCB7DTqc1dTz5WfJDeHb43SEV
 bSB5G2M2wfVBmIx+oKSq92rhG44WGdZNd2xC5SdaBuo7Ns7vABOtmEcNG
 RJHZyA8C3ARkyIBok/q0+FFM14iwja8inm7NevsgdF6TB+ejWalul3jlK
 /wh5GYfph8qagCN01uTLry8hAVscPcnIHJKlYGPVcMBBUw06C2r/WB7zU
 WICrwQr8c9isfGcn5kOb1GeUeAJxHuhuqu8wNWawV7zgE9xpnA3ZraqHB w==;
In-Reply-To: <599b72f6-76a4-8e6d-5432-56fb1ffd7e0b@igalia.com>
Content-Language: en-US
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/openipmi-developer>, 
 <mailto:openipmi-developer-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=openipmi-developer>
List-Post: <mailto:openipmi-developer@lists.sourceforge.net>
List-Help: <mailto:openipmi-developer-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/openipmi-developer>, 
 <mailto:openipmi-developer-request@lists.sourceforge.net?subject=subscribe>
Errors-To: openipmi-developer-bounces@lists.sourceforge.net
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Petr Mladek <pmladek@suse.com>, Dinh Nguyen <dinguyen@kernel.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>, Alexander Gordeev <agordeev@linux.ibm.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "luto@kernel.org" <luto@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, Alex Elder <elder@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>

> Tony / Dinh - can I just *skip* this notifier *if kdump* is set or else
> we run the code as-is? Does that make sense to you?

The "skip" option sounds like it needs some special flag associated with
an entry on the notifier chain. But there are other notifier chains ... so that
sounds messy to me.

Just all the notifiers in priority order. If any want to take different actions
based on kdump status, change the code. That seems more flexible than
an "all or nothing" approach by skipping.

-Tony
