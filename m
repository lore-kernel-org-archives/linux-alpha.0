From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH 2/9] lib/bitmap: implement bitmap_{empty,full} with
 bitmap_weight_eq()
Date: Sun, 28 Nov 2021 19:10:20 +0100
Message-ID: <YaPGDOvBzhiRFcOP@qmqm.qmqm.pl>
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
	List-Owner; bh=MY290ELxfRsEzLQRrPF7NorVh69GXFjL3M7WKMoAzVg=; b=J6KCHcn4UNU4wm
	L40C6+D6YVn0mQq0fZ0VPqJ30BvwRU+vptfYFrrEAfwnVAdjU4lfweneZf3sOEihZOOdx+M8EkdZA
	QT8YtzF9TQNk4mXtOqSmvkXm0qRGnOrf7ThRVAizmzOvmVPYje5mvNxsQakmxZXF9Vwdl+fFPDBAF
	YdXSC5VMMqLfDlQtzIwyI/oaEBkr62GrHP+mZ4d1UGkvbj9u9OoiJ6Qc0AIOee/+qFDYrqFL5B2NQ
	X0J1CK80czWG+6elNqQ9VJCS85OVAi0F6Hf7ph2DxatCxkxWDitM+Skq7rwYQ36+wsbcKvT3TbXj4
	FfknyW770gbyFfGzBM2w==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638123024; bh=JZhqOAoOJwkFLsUnNQo8o++CiFK7HEGKhePgc/FSOF4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BSqkw57UlW2pW1NXQ5wZ96M5n0daMnNFg3ZZGk4QpT65f28st6tvSbAjCuaDYp0Y0
 CmyX5dp3fxa/1bsCgFSoiXvYl/Ivrvk/XW5Lhr31jLklN0/6fnKbeszxM4AJMOo6b9
 hs1WVqqJVnnkAxwtLxudxAhzHN+6r0DPz2i1TcI1//mgPfBMhwBro3m3CGjmkmEKO0
 zFXYptfKQJ6Xhp//QSGLBmM8xlFJVmHJ9/rNfVpoRczyIK6/HJ5953QI6d4A5Zxyqw
 UnYVoDxFeKZcNpL0K/UJMA5pXP8gOMjtVWWYJxoXBIppSPMAs/Uq2+pv87S9vD8wOI
 LfWcTnK2w+pRg==
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
> =

> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> ---
>  include/linux/bitmap.h | 26 ++++++++++----------------
>  1 file changed, 10 insertions(+), 16 deletions(-)
> =

> diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> index 996041f771c8..2d951e4dc814 100644
> --- a/include/linux/bitmap.h
> +++ b/include/linux/bitmap.h
> @@ -386,22 +386,6 @@ static inline int bitmap_subset(const unsigned long =
*src1,
>  		return __bitmap_subset(src1, src2, nbits);
>  }
>  =

> -static inline bool bitmap_empty(const unsigned long *src, unsigned nbits)
> -{
> -	if (small_const_nbits(nbits))
> -		return ! (*src & BITMAP_LAST_WORD_MASK(nbits));
> -
> -	return find_first_bit(src, nbits) =3D=3D nbits;
> -}

Since this is supposed to be an optimization, I would go all the way and
replace this with the trivial implementation instead:

bool bitmap_empty(long *bits, size_t nbits)
{
	for (; nbits >=3D BITS_PER_LONG; ++bits, nbits -=3D BITS_PER_LONG)
		if (*bits)
			return false;

	if (nbits && *bits & BITMAP_LAST_WORD_MASK(nbits))
		return false;

	return true;
}
 =

Best Regards
Micha=B3 Miros=B3aw
