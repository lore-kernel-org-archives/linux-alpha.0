From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 15/30] bus: brcmstb_gisb: Clean-up panic/die notifiers
Date: Mon, 2 May 2022 12:50:35 -0300
Message-ID: <af03a6ef-6b92-31cd-72d4-47b82bc47f87@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-16-gpiccoli@igalia.com>
 <eaf3a893-00dd-8717-202e-911b395670e1@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=vs1TxitJVaqXfZt5+JAgzgpJc3Rl9y+sqSF7sQt0958=; b=CYM+I+cStAj6nsmkdvAL01St6e
        IV8WQNLOxWhy3UHpXhc9ZYxNJzq7ZxpyOwHWort+30gmSz14Tjb7K8kvM2hGR2PPX3dc7GXMEaskm
        g34Tjq/8qIJgML47/2DCuEUnFB03pqMfnk/uwmQB09CDWgBvh7TL/gFDoH0TI9HOJ3bezLUV1DrKv
        MwXxD9LKMhdDIB0wdDr6Kr32RysL68LVvKOkDfa5SERbORMzBS0ZyutauBA2Ekqa3472ChMBhe54V
        1FaXK1lleaqm8beFaaq7IO5wyd2Jb5T5RV+lvaTO/6luDzRXN43duubtlHaOQOQQCOGaRTF8O2nxl
        BUemy2k 
Content-Language: en-US
In-Reply-To: <eaf3a893-00dd-8717-202e-911b395670e1@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Florian Fainelli <f.fainelli@gmail.com>, akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com, andriy.shevchenko@linux.intel.com, arnd@arndb.de

On 02/05/2022 12:38, Florian Fainelli wrote:
> [...] 
> 
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> Not sure if the Fixes tag is warranted however as this is a clean up, 
> and not really fixing a bug.

Perfect, thanks Florian. I'll add your ACK and remove the fixes tag in V2.
Cheers,


Guilherme
