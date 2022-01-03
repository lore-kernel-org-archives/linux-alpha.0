From: Lukas Wunner <lukas@wunner.de>
Subject: Re: Booting newer kernels on the Jensen...update
Date: Mon, 3 Jan 2022 04:38:33 +0100
Message-ID: <20220103033833.GA8637@wunner.de>
References: <202201021948.202JmC7h015740@valdese.nms.ulrich-teichert.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
        by bmailout3.hostsharing.net (Postfix) with ESMTPS id 046B1100AF851;
        Mon,  3 Jan 2022 04:38:34 +0100 (CET)
Content-Disposition: inline
In-Reply-To: <202201021948.202JmC7h015740@valdese.nms.ulrich-teichert.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ulrich Teichert <krypton@ulrich-teichert.org>
Cc: Linux Alpha <linux-alpha@vger.kernel.org>, John Paul Adrian Glaubitz <glaubitz@debian.org>

On Sun, Jan 02, 2022 at 08:48:12PM +0100, Ulrich Teichert wrote:
> but I simply fail to understand why it tries to unzip a gzipped kernel.

The compressed kernel needs to start with 0x1f8b or 0x1f9e,
else you'll get the "unknown compression method" error:

https://github.com/wgwoods/aboot/blob/master/zip/misc.c#L131

Use "hexdump -C" on the compressed kernel image to double check
that it starts with the proper magic bytes.


> I hope I'm not too annoying,

Not at all.  But I've never owned an Alpha, so am totally
unfamiliar with its boot process.

Thanks,

Lukas
