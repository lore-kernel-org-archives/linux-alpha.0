From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Subject: Re: [PATCH 07/10] MIPS: disable CONFIG_IDE in bigsur_defconfig
Date: Thu, 18 Mar 2021 13:08:58 +0300
Message-ID: <53035511-c140-b51a-dd1d-874b1041039a@gmail.com>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-8-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jMxhISu+COlRrHc/EVrqMnT5LVw2161ovhdA7IBtSGw=;
 b=N+Q0LUNoyVaDPJ1eJrZ67FhUa77q/Fz02On4l9bg9QACSIgykCKqUmFdsf53Ojgnbf
 eyumUdx/TwjbtDOLgwCYAB7RDOtR57TMCBeyNSAY//ay7Tl2lccP2Ssym94kRXjxfYRe
 lulL4E/vgpp41CghUdWNrhQunOsNpbRkQh1Z5uA9cr4OPAdKTqKspV2wEkOPVcm1LmJR
 yZKXoXYlgW/Aj82akuKLiTGE5Fox66wxjP6rcBsCJbwoniHR5/N5xRjjkVjAEfQdY1MW
 wabHvQrtRlGBXU/oemiBE0fxxY0J0doyEwDn/K3ybrpVrl7lPm8K8TOwVCHW7Z8VfYJf
 AzpA==
In-Reply-To: <20210318045706.200458-8-hch@lst.de>
Content-Language: en-US
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-doc@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>

Hi!

On 3/18/21 7:57 AM, Christoph Hellwig wrote:

> bigsur_defconfig enables CONFIG_IDE for the tc86c001 ide driver, which
> is a Toshiba plug in card that does not make much sense to use on bigsur
    ^ for

   Else that doesn't make much sense. :-)

> platforms.  For all other ATA cards libata support is already enabled.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
[...]

MBR, Sergei
