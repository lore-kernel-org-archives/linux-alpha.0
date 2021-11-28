From: mirq-test@rere.qmqm.pl
Subject: Re: [PATCH 0/9] lib/bitmap: optimize bitmap_weight() usage
Date: Sun, 28 Nov 2021 19:03:41 +0100
Message-ID: <YaPEfZ0t9UFGwpml@qmqm.qmqm.pl>
References: <20211128035704.270739-1-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bsoPaqbNvuKC+9godDS88lzZozdKbWBz0ysMJ4WhZk4=; b=paYfvzue6DkWr7
	BxSE+NXStmqEonZxG8YCRQiA4mcenaRR6JhCFvz2h3oWc5Glsl+r3QfHzAW8vQ4UFRlssa8BzHVVV
	F+EPAHJlO0Hyvis4G0NYFBkyfd82uwv1LHI3cBh1IaIrvU+SRY8e1NwVxeMX7Ub2h/C26ylwP32cs
	A6c+XQGzDqNjNv395w349NuuZ6oMAXSwmcxdqe3qvODqqZ9e3GDonN2oMqOP4NsNiP1nXmOKLwgF5
	V/eFwslEVI4w17pHp35N+VpNz9Vva3PyqMf1AoRX+ML8KqDisM4R2lpM/VqEMycekS5dBarVvtOnT
	b57nSo2X1uBXHxlzoDKg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638122634; bh=sEqOa0ZEPEWEUlBRSLFAiVwd6iLDymwK+DV3juGIkQI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c8BMIb6Ys1MM9jtnUFS+OzCZESND169gxM1+qoGuDHQxJkjYTnLg1dYXL65SLSeBD
 OptKwwF3f6jjeAWkz8hKGEIpBsOyA7AZLbEyI0Ul8i9xig/dKvGR9NZ6kh+Ny2ulTW
 NSMm5sqIVijexkgrukA2T59koDDkGancK18mcZt702hpU7mgoZQDDZbSDYgNkFc9BO
 VIw8ONHFtRVbVnzFi4YPF5fViRQnoyL8aNWKj0ctBrm3IfLQEgZY5IGVCfNRdmPFM4
 VnIE/zolNmZ9Tr6q4VJbIye3TlVbgURGaBOqFwsRQiEoMGrVw4g28fuRp3xh+IiOQd
 dpDJSAp182XbQ==
Content-Disposition: inline
In-Reply-To: <20211128035704.270739-1-yury.norov@gmail.com>
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

On Sat, Nov 27, 2021 at 07:56:55PM -0800, Yury Norov wrote:
> In many cases people use bitmap_weight()-based functions like this:
> =

> 	if (num_present_cpus() > 1)
> 		do_something();
> =

> This may take considerable amount of time on many-cpus machines because
> num_present_cpus() will traverse every word of underlying cpumask
> unconditionally.
> =

> We can significantly improve on it for many real cases if stop traversing
> the mask as soon as we count present cpus to any number greater than 1:
> =

> 	if (num_present_cpus_gt(1))
> 		do_something();
> =

> To implement this idea, the series adds bitmap_weight_{eq,gt,le}
> functions together with corresponding wrappers in cpumask and nodemask.

Having slept on it I have more structured thoughts:

First, I like substituting bitmap_empty/full where possible - I think
the change stands on its own, so could be split and sent as is.

I don't like the proposed API very much. One problem is that it hides
the comparison operator and makes call sites less readable:

	bitmap_weight(...) > N

becomes:

	bitmap_weight_gt(..., N)

and:
	bitmap_weight(...) <=3D N

becomes:

	bitmap_weight_lt(..., N+1)
or:
	!bitmap_weight_gt(..., N)

I'd rather see something resembling memcmp() API that's known enough
to be easier to grasp. For above examples:

	bitmap_weight_cmp(..., N) > 0
	bitmap_weight_cmp(..., N) <=3D 0
	...

This would also make the implementation easier in not having to
copy and paste the code three times. Could also use a simple
optimization reducing code size:

#include <linux/overflow.h>

int bitmap_weight_cmp(long *bits, size_t nbits, size_t cmp)
{
	for (size_t i =3D 0; i < nbits / BITS_PER_LONG; ++i, ++bits)
		if (check_sub_overflow(cmp, popcount(*bits), &cmp))
			return 1;

	nbits %=3D BITS_PER_LONG;
	if (nbits && check_sub_overflow(cmp,
			popcount(*bits & GENMASK(nbits)), &cmp))
		return 1;

	return cmp ? -1 : 0;
}

Best Regards
Micha=B3 Miros=B3aw
