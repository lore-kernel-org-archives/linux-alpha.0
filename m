From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 08/30] powerpc/setup: Refactor/untangle panic notifiers
Date: Thu, 5 May 2022 16:28:55 -0300
Message-ID: <95fd6c2b-8a80-7161-953c-0660c9cc046f@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-9-gpiccoli@igalia.com>
 <3c34d8e2-6f84-933f-a4ed-338cd300d6b0@linux.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=26sf2Bz2SDgQmdCQw3Y4ZTnImgJ2MyGCiyio6ZL3q3Y=; b=OX97Z/D1CJSI6hriVTxC2kAnOw
        1KITEk45cAtwCpY9rkRCDUh3KDg2O2YzMgXcmuPrqXaafenIhWWC1+LyxgtF/580Mzq9ZdOBGqQII
        szuZz7L+gnBGPa0DhyrfUrxKFOKAOdS+/7tX8dF3YT6RRRi5n+Pvq9GzAiarMSPSGIbrEUOikWcQ4
        luIwkR5QmpMMR3ULcRXOtddO+8na/Jrhq18XXAepQbZ7X+3+2omWFwgyxPBez0WA9LEkMMiNJ8gOK
        /vnX5br4i70krbeAId+z+Wo/kxx7sPLDtH+XBAxzqCS0vo9z0RVsXdy6BbySPaaEQO2JnHI7/cIaw
        LlqXpVF 
Content-Language: en-US
In-Reply-To: <3c34d8e2-6f84-933f-a4ed-338cd300d6b0@linux.ibm.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hari Bathini <hbathini@linux.ibm.com>, akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com, andriy.shevchenko@linux.intel.com, arnd@arndb.de

On 05/05/2022 15:55, Hari Bathini wrote:
> [...] 
> 
> The change looks good. I have tested it on an LPAR (ppc64).
> 
> Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>

Thanks a bunch Hari, much appreciated!
