From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 09/30] coresight: cpu-debug: Replace mutex with
 mutex_trylock on panic notifier
Date: Fri, 29 Apr 2022 11:01:59 -0300
Message-ID: <79472351-c6ce-a060-ef24-f64b6dce1637@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-10-gpiccoli@igalia.com>
 <3cafe4fd-8a0b-2633-44a3-2995abd6c38c@arm.com>
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
	List-Owner; bh=2B5M6eV15bdUDV0z9FR4cS84SDq2DMgGKEcDOxFHmZI=; b=lXcS7brEBHuTrN
	lHQn7/NKJKRNjE2Voq4BzQWc2f1gx4RgOaodpbpRMoqPIMkRX1T/R1JSL/3WKQSIbg/c+qmhwGiK0
	BaQs7y0mkIi/83v6OLfgUAuSn0UhSkXjeaZvlBVAdT0//INk/nlEcMc0VEbm047eL0uUZfG+CBqfB
	nYiNTbh+ovbvKM/AsrZ/oTgh1lD2jMGcrWTfW3MYwH9a6xBNMKDC5fpvoY10a4kaKse9GRBMYG2tt
	GXLPNmrA8si/R3Yzdf/GI7+zr6pO8Ta9wfs1KRm4HxejRhAhVnZYYmJyogPdGD5Ses430ody7HW0U
	9kjlDi6szJ0W5MmlHDtQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kwZz8z1ErGu8KMfXFyk29Ho8CQRFEY51B59OF6or4Ek=; b=PV6iGrw6a2PVwUqtN4K8zn62B4
 AVOvfuxpf+YqiDNw4wPls4rd7BZZRLk+DlIthCPmmpYzWeS6x1CxEGIJ+6ftYWBgJvBFfwGJOqCh5
 xlyk58zJVRPZef1SLet0zp5ibM7QDVVnOlmapmbP9P5ItPWzgMAPliAvmIbKMRpx1ZzLU5PWVzzn/
 sHvml72t32exF/AwwtKJVJzJexH4h9oxDHF0YV+DR3EbrkMYfXiYu6ewm7xFOm0g961CiqJr+h+xh
 qH6hC6fDAmncBkbOEiIY7tl+ZJgFaXJC+Qr6IL6xzP0mvIw9YmD61TykJP9krK0bs+lwyGwpmSvki
 syiNIcrw==;
Content-Language: en-US
In-Reply-To: <3cafe4fd-8a0b-2633-44a3-2995abd6c38c@arm.com>
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
To: Suzuki K Poulose <suzuki.poulose@arm.com>, akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com, andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de, corbet@lwn.net, d

On 28/04/2022 05:11, Suzuki K Poulose wrote:
> Hi Guilherme,
> [...] 
> How would you like to proceed with queuing this ? I am happy
> either way. In case you plan to push this as part of this
> series (I don't see any potential conflicts) :
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Thanks for your review Suzuki, much appreciated!

About your question, I'm not sure yet - in case the core changes would
take a while (like if community find them polemic, require many changes,
etc) I might split this series in 2 parts, the fixes part vs the
improvements per se. Either way, a V2 is going to happen for sure, and
in that moment, I'll let you know what I think it's best.

But either way, any choice you prefer is fine by me as well (like if you
want to merge it now or postpone to get merged in the future), this is
not an urgent fix I think =)
Cheers,


Guilherme
