From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH 0/7] arch/*: config: Remove ReiserFS from defconfig
Date: Mon, 18 Sep 2023 18:41:08 -0500
Message-ID: <20230918234108.GN19790@gate.crashing.org>
References: <20230918175529.19011-1-peter@n8pjl.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Mime-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JcXkFkHDm7w8HsQlEPZofgf9MPAWSAk8lC/S+zCJM/g=; b=dguzzKthARSCoD
	dEgSRAkewc3aMe79nAspOsXzQs3TjbXeJdxEBdkJl8rkhzpFYjX1Qr3pgd4CEEdd0BFqeX4pVI5V6
	wX4XvIh1yS4QlpphD6TiADWQn47ytHYbm8Abg+EUi/DyMrhHT4AU6FOYqM6xo5gJjU4wStSBt6APR
	6SmpHKdYCxuryXkaTGPOzM3h7uQiAEFPG6Kj47v4yYLoleIkJcRiqHkY2a+puKAc0Gn+Cd6jCZTFY
	4UTxViQtDqNlu4C/GCD7oGGD2Gs6TBBT9jf/LxC5Yw3/xrTZNaUE6iH8+sZvgNtHgIignrPxiFX47
	Ppsru61WkhWf9vqwJ3Cw==;
Content-Disposition: inline
In-Reply-To: <20230918175529.19011-1-peter@n8pjl.ca>
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
To: Peter Lafreniere <peter@n8pjl.ca>
Cc: reiserfs-devel@vger.kernel.org, tsbogend@alpha.franken.de, jack@suse.cz, linux-sh@vger.kernel.org, ink@jurassic.park.msu.ru, richard@nod.at, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-m68k@vger.kernel.org, geert@linux-m68k.org, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, johannes@sipsolutions.net, richard.henderson@linaro.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, anton.ivanov@cambridgegreys.com

On Mon, Sep 18, 2023 at 05:56:09PM +0000, Peter Lafreniere wrote:
> ReiserFS has been considered deprecated for 19 months since commit
> eb103a51640e ("reiserfs: Deprecate reiserfs"). However, there are
> several architectures that still build it into their defconfig kernels.
> 
> As ReiserFS will be removed in 2025, delete all ReiserFS-related options
> from defconfig files before the filesystem's removal.

This is essentially equivalent to deleting the filesystem now.  Why do
this?  Is there such a hurry?


Segher
