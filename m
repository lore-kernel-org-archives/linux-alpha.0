From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 24/30] panic: Refactor the panic path
Date: Wed, 27 Apr 2022 17:28:11 -0700
Message-ID: <4fe85e9c-4e96-e9d5-9fd8-f062bafcda4f@infradead.org>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-25-gpiccoli@igalia.com>
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
	List-Owner; bh=pXZSksQDSNQsvPY5+ETgUxDXYXj5m3qeRLgP7/k4pd4=; b=qklSz1F5eJo1dL
	7RLyEtGyl4kEsV9UOzkZhJTIeBwR66qECS71zMMWeop9TJoevHFuxyPZPt3vRDk/CBtblLtj4WJuV
	KLkp/Vnru+55rmJ9kkd0qycqLQWsWsGdXg1sX+UfzOAlc+1rSdntG4a80DAtTDomsOqXYMXNIfQB8
	k0jTnhsVBC4wNugGk+sIS36kPjf04/WHD76uZAUSw/IJ4EECu+BV76R7VEwuiwy1PIqRurjHrvxTZ
	rIH5swDCkizFSzLMYqRL9ifbxvNlH9Z8AE6bfrsF5newoHoDkhjt3AZJnlBeA6bHfiU8vkYJCIsR/
	Z9mb1yrbhTGRGlZslOog==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=oTHdXx/bNqvs0tUKZg1jX0QKDhKts3seYpf9QVBefoo=; b=GN1/nse5iki/WFV8HZE7gnZx8M
 eJUoKq0F73m9M9r3NgIBqsY0+vw93A0bLY3hZk7W2z6ntNRxf9y3czUAh8lb6xtyiL6iRkCGoMbr3
 13t311Tat608CEGCcNXVW95sxa2A683FvRnnoYsLI49dqQLiYKn/y05pL/vMxI0Bf3XOAu94o11W+
 nn9qk8zdTyrvuFjTnWtZ6o7af2OgOBH9Lb3syZMjRdfGkSipXa4zeUfKnDbho+LORacM3SyNN4LMV
 DjLIUchKFzC9+E73n2pj1o853yXO/ZfWMQcrLme864qTb5ygY07AwvTErV57FcFGuv7kOYC61ZuBl
 QQvKsP1Q==;
Content-Language: en-US
In-Reply-To: <20220427224924.592546-25-gpiccoli@igalia.com>
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
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com, andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de, corbet@lwn.net, d



On 4/27/22 15:49, Guilherme G. Piccoli wrote:
> +	crash_kexec_post_notifiers
> +			This was DEPRECATED - users should always prefer the

			This is DEPRECATED - users should always prefer the

> +			parameter "panic_notifiers_level" - check its entry
> +			in this documentation for details on how it works.
> +			Setting this parameter is exactly the same as setting
> +			"panic_notifiers_level=4".

-- 
~Randy
