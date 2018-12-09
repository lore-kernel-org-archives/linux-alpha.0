From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 06/12] arm: perf/core: use PERF_PMU_CAP_NO_EXCLUDE for
 exclude incapable PMUs
Date: Sun, 9 Dec 2018 20:43:59 +0800
Message-ID: <20181209124358.GC22960@dragon>
References: <1544114849-47266-1-git-send-email-andrew.murray@arm.com>
 <1544114849-47266-7-git-send-email-andrew.murray@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KSUEv9+Jtn9j3A77GPJCzS2yOVkI0JpcEoAJfBn7kkU=; b=S5MJQSFTO4ko3K
	M4WfssA/dzXoK+cQsCmzSlcXObvSJ9s1HJo/2dENZhxCInmZDDPnzHlIdgsCyaIxsScnmovIbCphv
	pQ+Unnk6ZOaj8RgwbT35R/2t8IsvSGT4SIpfSLUTlK4EzI8lTa9pB8Q2NqnzYgfGv7Wvc2Vh35tOd
	5ygDCUZJuAs4BtVtt3r+mvkHl7kC28oshJrg5xU6nKbExwC6LTdcP8gbvdqNN63d/zaRX3Gx4IcQN
	m5gK5X9grhvImNIWc6DTDuwWvUAd743TTIjOp42c56j92LbPLPMubeMLLFaxwpBnIfSdAaR8Nn3xL
	3D2SJ2Dzd3ylhJuZzf+Q==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1544359491;
 bh=rCWDA+ZDbSpzlhOykRuLW5bERIZWw4iTBbBtykQnc8M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dc/a/Mt8bAxRjwnvrbWPvWwb8Tk687m3uBrjl6pGrw3BwzsdkZYkJv4WXNxT/X+8n
 kbn8M+oz3MSvUH3URmBiT3/cM96OOTrphZd1xeD985bkPe0GerncByVnG092Sl5ZWA
 kF18sDNX+cXRbnMxfXNYnKLNJbzxIsEsU+mqlxLs=
Content-Disposition: inline
In-Reply-To: <1544114849-47266-7-git-send-email-andrew.murray@arm.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Murray <andrew.murray@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Will Deacon <will.deacon@arm.com>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, suzuki.poulose@arm.com, Sascha Hauer <s.hauer@pengutronix.de>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>, robin.murphy@arm.com, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org

On Thu, Dec 06, 2018 at 04:47:23PM +0000, Andrew Murray wrote:
> For drivers that do not support context exclusion let's advertise the
> PERF_PMU_CAP_NO_EXCLUDE capability. This ensures that perf will
> prevent us from handling events where any exclusion flags are set.
> Let's also remove the now unnecessary check for exclusion flags.
> 
> Signed-off-by: Andrew Murray <andrew.murray@arm.com>
> ---
>  arch/arm/mach-imx/mmdc.c     | 9 ++-------

For imx mmdc changes:

Acked-by: Shawn Guo <shawnguo@kernel.org>
