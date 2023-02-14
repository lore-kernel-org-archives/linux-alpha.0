From: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH] dma-mapping: no need to pass a bus_type into get_arch_dma_ops()
Date: Tue, 14 Feb 2023 15:12:29 +0100
Message-ID: <4e57a5aa-fd7a-4cda-90e3-6a02cfeb04c0@app.fastmail.com>
References: <20230214140121.131859-1-gregkh@linuxfoundation.org>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1676383971; x=1676470371; bh=YRxaNRC4BH
        1ycBKeOawmXxp8krGFIkOuJJQE9+IMh0E=; b=dYZdi6z1BBW8qZ+1yTNZYVnlzu
        bd1rdhnWTBQ3winl855ARQim1KYx5d0+eSeo6xbILH8Dd+fYcX21cDZq7K4dym+B
        1lwEKlo3CnmrObFIGtwewAtKRMzsl73+xY6yGXw4ROSf2JNAVLfo0944TMJrOJlZ
        1tvTH+LTtEip7C0IQzn3doc2lo+gA72BqG/HXPologcAGGOGOUax47AkzoTZhd7g
        D2T/sxmJsk0xcjQvaoLyhMQwBm4UEFyETbAidyKWuUA/z8j6SmXY0dXJbmZNjLAq
        uBPdWjFbtnrjaivDuFbECbd8ILEgcMoOGSAuH1xj8fWbQgMPrq+YYQbJzS6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1676383971; x=1676470371; bh=YRxaNRC4BH1ycBKeOawmXxp8krGF
        IkOuJJQE9+IMh0E=; b=plSFOhcc+E+PfxIEOh9EFkWLD7z1ZH8TqV/Yf3HqNFfO
        o0UDk42j6uzH+wqFQb5B5B5SJBG5Vp8XiBifhfV9EuPtwQXBmJ2NHelxCbZ5K3Hz
        RX8guFFpCTdjAgxtVPB3F6jfV+4TOUJeOoNh6wePzGygWyPBYQsHpUX5BP9niFFu
        0xWhf9DXO6X1PnyKoYsbQ8kCvJyRgmqj5i382pEybyGb7+1MO7FGgNmSD3TYvLE6
        InadPT5sQEdLtw3hir2yPkdkpAJYByGvuF9eRMMoXzjnAXyhvE8h5YKeIZ/QarqO
        JeNzq6/MysYlmsjyDmu2UcFPnWC13/9tKTDDjwfQ6Q==
In-Reply-To: <20230214140121.131859-1-gregkh@linuxfoundation.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kern

On Tue, Feb 14, 2023, at 15:01, Greg Kroah-Hartman wrote:
> The get_arch_dma_ops() arch-specific function never does anything with
> the struct bus_type that is passed into it, so remove it entirely as it
> is not needed.
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> Note: Unless someone objects, I would like to take this through the
> driver-core tree, as further bus_type cleanups depend on it, and it's
> stand-alone from everyone else's tree at the moment from what I can
> determine.

Nice find!

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

It looks like the bus was last required in 2020 before commit
255a69a94b8c ("sparc32: use per-device dma_ops").

    Arnd
