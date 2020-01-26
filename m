From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2 2/9] net: wireless: rtl818x: Constify ioreadX() iomem
 argument (as in generic implementation)
Date: Sun, 26 Jan 2020 15:11:37 +0000 (UTC)
Message-ID: <20200126151137.A4353C433CB@smtp.codeaurora.org>
References: <20200108200528.4614-3-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oEDCRoLOhnSSuLjAG6EHGwj7ygbANxY7zY1RhBFEVhY=; b=ZW1tz64fAq4PXK
	EegDf50KG9wmwKNY8rVHn1ncIkJ6q561lBhsqOQhGBu3rdfOH5umEsXWe8wdzumy87aW6IiZnraEC
	xIQ4MiwJF1wiJ10CN7B1g0oEqlGvMfgHcunaNJ0FNo6OiAVDkMUhNExJpE64Ta6m5vqRhgiTFIaZV
	9ft4mP9+Khyu9qJDkkqoy+fdzjqpxvjPfxa0RhRTJiWCaLAG2BlDhpf/mWwXYAsmr8NhWfyWY8nv1
	nVcgKpeqY9oFkTHME6gJoSvZ/a6CpMS9mT6Zq3M1L/93U5A1m+8EooRNMsYdMW9u4myDm/+kD83n1
	YGQOPXKZQUSvQLNgmW/w==;
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1580051501; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=GgNouC08XBq9czPTNzqE2b2+ochAUWZ+cpydcRWvAGA=;
 b=DwDb0QsYWofYNXn0WFOXujETphTuqtppvP6/0HI5GBwDkcur+hZB1zdLtltS5rgoYUsYa+yj
 LVkJbEaibh8Gt2FgNKcrzSEQLgaFO6TmYiIRV/InVmUM4bpl32a2tayK4JjB29TJuOxyb8ve
 FumREJvDx3wAesKpOmdD8FI1i7A=
In-Reply-To: <20200108200528.4614-3-krzk@kernel.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane-mx.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jason Wang <jasowang@redhat.com>, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linux-arch@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org, Alexey Brodkin <abrodkin@synopsys.com>, Krzysztof Kozlowski <krzk@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>, Matt Turner <mattst88@gmail.com>, l

Krzysztof Kozlowski <krzk@kernel.org> wrote:

> The ioreadX() helpers have inconsistent interface.  On some architectures
> void *__iomem address argument is a pointer to const, on some not.
> 
> Implementations of ioreadX() do not modify the memory under the address
> so they can be converted to a "const" version for const-safety and
> consistency among architectures.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I assume this and patch 9 are going via some other tree so dropping them
from my patchwork queue.

-- 
https://patchwork.kernel.org/patch/11324461/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
