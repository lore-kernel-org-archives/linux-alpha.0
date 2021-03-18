From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Subject: Re: [PATCH 08/10] MIPS: disable CONFIG_IDE in malta*_defconfig
Date: Thu, 18 Mar 2021 13:12:16 +0300
Message-ID: <5b0f503e-a27c-a241-c705-b2a9ccd6d0a2@gmail.com>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-9-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fj+8CF0xEa6bOzXqxjtIYrEA5HoToR1DJW5/Q9q9jmw=;
 b=h+XOb1GsQ2w8fLoRZPzFbHuKl4PLZbrg1n3NNXlB+1pwKaDpv3IYeBwNMYTnaAe/dv
 53qY2HQRgJloO7YPpYoaazxwB0LyW9cda/3XqephYo6XWuKffw2EvNS/BeW8bu2CjhLn
 YWTP2x1H0eEBDgDtwckTaScppt8aK7lt+V3njf7QJpXzuiT7grarbWs5GRfMMbxHi5hx
 sbbCxsAJNuzngqg7yz9ZWUT+6eIJtzHyMp4aZtClTbLq39j781dflkTtZN7C5T1u2Nwq
 xymOipVtMZt0XepUbRaIZljM2iUOt+cNzBqUcJW9l5gvLHs6joBPpTbT1tLMNxHlVuyX
 KLDA==
In-Reply-To: <20210318045706.200458-9-hch@lst.de>
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

On 3/18/21 7:57 AM, Christoph Hellwig wrote:

> Various malta defconfigs enable CONFIG_IDE for the tc86c001 ide driver,
> hich is a Toshiba plug in card that does not make much sense to use on
  ^ which is for

> bigsur platforms.  For all other ATA cards libata support is already
  ^ Malta.

> enabled.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
[...]

MBR, Sergei
