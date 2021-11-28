From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH 2/9] lib/bitmap: implement bitmap_{empty,full} with
 bitmap_weight_eq()
Date: Sun, 28 Nov 2021 05:37:19 +0100
Message-ID: <YaMHfzZ5PBn0714Z@qmqm.qmqm.pl>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-3-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vS+DEJPMtjXrkw4iaAK3HoQz86vX7DzMWn+U0PajfuQ=; b=Axtk9Dri/xbonU
	6YL1u1TSTr8870uWCxFpqWnHclrTketHfSvwBN2aWpnxiUwdp/lv4VXAWM0qBrvha9rykAVN6TKUw
	JcutBrM0+p9CIwAwYCGTCDalxRaCMd9J11vuWr6DAX2o8CjbhahZzTRXeUQo+tPDt5M6Bkb93TYRF
	rEL3kVVdT2Rs5KI2tp72fKqzIVJ3BIFUAXQLJNGiBzdoUBH0wOVzv/iqVB+lsm/69e+cDzq5KbzsI
	fG2/JD+YLV/MbquQGa1OJzdtW/mAHL5FnI7C2YRKKwkV5NrsIyoN5ndUheu/Q1sFxZoQdwKtDIQ73
	rTFYe09J9Fc/3/WimwpQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638074255; bh=uajZDEljkirNO3ao4IaC3YZzDaNVesAsHfSDP3UJUEU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cAFSOXWhsPPI16MSTfp3Hy6QyL2UbQErrqZs7JVjTlBz7TZEj0Ht3ETUjDSgxiu8a
 P8pzJNtSA2eZFpOxfxrClSuOwuf7i6vXUDuCijqF0t0kxXsxR+qR6YDDvZHFLcjsUT
 huX/rYxqtF1OgGo0ILu6SRoYwVApiLcRYWdI9d6BBO6Fc+GJMQs6pTeO5YaOkBA2lc
 CA56h83Mp0zr98dW+FyUbN9V4W/HR68JJcUUZVdO3ep9VsF+0ZsofDaqZWOZxeAHOE
 3IvHUY0kLwMaW91VANeQoPu+PoRK6NnQSNlevC1j1vqNLGFfJ0wq32PwIdz24lxL/e
 saxp3NBViH9TQ==
Content-Disposition: inline
In-Reply-To: <20211128035704.270739-3-yury.norov@gmail.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, Christoph Lameter <cl@linux.com>, Daniel Vetter <daniel@ffwll.ch>, Dave

On Sat, Nov 27, 2021 at 07:56:57PM -0800, Yury Norov wrote:
> Now as we have bitmap_weight_eq(), switch bitmap_full() and
> bitmap_empty() to using it.
[...]
> -static inline bool bitmap_empty(const unsigned long *src, unsigned nbits)
> -{
> -	if (small_const_nbits(nbits))
> -		return ! (*src & BITMAP_LAST_WORD_MASK(nbits));
> -
> -	return find_first_bit(src, nbits) =3D=3D nbits;
> -}
[...]
> +static __always_inline bool bitmap_empty(const unsigned long *src, unsig=
ned int nbits)
> +{
> +	return bitmap_weight_eq(src, nbits, 0);
> +}
[..]

What's the speed difference? Have you benchmarked this?

Best Regards
Micha=B3 Miros=B3aw
