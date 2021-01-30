From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 02/29] alpha: Avoid comma separated statements
Date: Sat, 30 Jan 2021 10:54:42 -0800
Message-ID: <52f038d9ff547deee4e5b5628507e61ec8d056b7.camel@perches.com>
References: <cover.1598331148.git.joe@perches.com>
         <4facd57f80c70437f085ba3a1bcf13ae0b63c3bc.1598331148.git.joe@perches.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4facd57f80c70437f085ba3a1bcf13ae0b63c3bc.1598331148.git.joe@perches.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jiri Kosina <trivial@kernel.org>, Robert Richter <rric@kernel.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, oprofile-list@lists.sf.net

On Mon, 2020-08-24 at 21:55 -0700, Joe Perches wrote:
> Use semicolons and braces.

ping?

>=20
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
> =A0arch/alpha/kernel/pci_iommu.c      |  8 +++++---
> =A0arch/alpha/oprofile/op_model_ev4.c | 22 ++++++++++++++--------
> =A0arch/alpha/oprofile/op_model_ev5.c |  8 +++++---
> =A03 files changed, 24 insertions(+), 14 deletions(-)
>=20
> diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
> index 81037907268d..b8af7ad6c607 100644
> --- a/arch/alpha/kernel/pci_iommu.c
> +++ b/arch/alpha/kernel/pci_iommu.c
> @@ -161,10 +161,12 @@ iommu_arena_find_pages(struct device *dev, struct p=
ci_iommu_arena *arena,
> =A0			goto again;
> =A0		}
> =A0
>=20
> -		if (ptes[p+i])
> -			p =3D ALIGN(p + i + 1, mask + 1), i =3D 0;
> -		else
> +		if (ptes[p+i]) {
> +			p =3D ALIGN(p + i + 1, mask + 1);
> +			i =3D 0;
> +		} else {
> =A0			i =3D i + 1;
> +		}
> =A0	}
> =A0
>=20
> =A0	if (i < n) {
> diff --git a/arch/alpha/oprofile/op_model_ev4.c b/arch/alpha/oprofile/op_=
model_ev4.c
> index 086a0d5445c5..004f80a4291f 100644
> --- a/arch/alpha/oprofile/op_model_ev4.c
> +++ b/arch/alpha/oprofile/op_model_ev4.c
> @@ -46,18 +46,24 @@ ev4_reg_setup(struct op_register_config *reg,
> =A0	   map it onto one of the possible values, and write it back.  */
> =A0
>=20
> =A0	count =3D ctr[0].count;
> -	if (count <=3D 4096)
> -		count =3D 4096, hilo =3D 1;
> -	else
> -		count =3D 65536, hilo =3D 0;
> +	if (count <=3D 4096) {
> +		count =3D 4096;
> +		hilo =3D 1;
> +	} else {
> +		count =3D 65536;
> +		hilo =3D 0;
> +	}
> =A0	ctr[0].count =3D count;
> =A0	ctl |=3D (ctr[0].enabled && hilo) << 3;
> =A0
>=20
> =A0	count =3D ctr[1].count;
> -	if (count <=3D 256)
> -		count =3D 256, hilo =3D 1;
> -	else
> -		count =3D 4096, hilo =3D 0;
> +	if (count <=3D 256) {
> +		count =3D 256;
> +		hilo =3D 1;
> +	} else {
> +		count =3D 4096;
> +		hilo =3D 0;
> +	}
> =A0	ctr[1].count =3D count;
> =A0	ctl |=3D (ctr[1].enabled && hilo);
> =A0
>=20
> diff --git a/arch/alpha/oprofile/op_model_ev5.c b/arch/alpha/oprofile/op_=
model_ev5.c
> index c300f5ef3482..6f52244e1181 100644
> --- a/arch/alpha/oprofile/op_model_ev5.c
> +++ b/arch/alpha/oprofile/op_model_ev5.c
> @@ -92,9 +92,11 @@ common_reg_setup(struct op_register_config *reg,
> =A0		if (!ctr[i].enabled)
> =A0			continue;
> =A0
>=20
> -		if (count <=3D 256)
> -			count =3D 256, hilo =3D 3, max =3D 256;
> -		else {
> +		if (count <=3D 256) {
> +			max =3D 256;
> +			hilo =3D 3;
> +			count =3D 256;
> +		} else {
> =A0			max =3D (i =3D=3D 2 ? 16384 : 65536);
> =A0			hilo =3D 2;
> =A0			if (count > max)


