From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH 7/9] lib/cpumask: add
 num_{possible,present,active}_cpus_{eq,gt,le}
Date: Sun, 28 Nov 2021 06:09:53 +0100
Message-ID: <YaMPIXUYuP1Q5FrQ@qmqm.qmqm.pl>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-8-yury.norov@gmail.com>
 <YaMME60Jfiz5BeJF@qmqm.qmqm.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638076195; bh=oUZYFQUmcrcLe+khMfxoyii9jHAFHFy8/qX4bg6ScHU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JnSDJhb2/wFE1+K5BEKj3l92hAUJYMSiQfvzp+ZlCATcD11ALuloHBV8agVwt/D5m
 6xO5KVkS6ds9BhnvUIzgpE+GOAlwIHTeHWZUDQLRlCqXrEtKOnOW/XLCrUHjRtkpA+
 s0Zgh/IC7vC3LAsHBRaM+HBKV7zFjzE+7UOTFGbokGiHbpHQX7rXsKsJST3S+JBeda
 2sNRV1hDCglR6IzM+jk8O4GqGLON53RjQjMI9dzQcjIf9OmuQDCgevPa74eYKb6N8i
 DO41zxtTZnaEDqhBVPy9rAwcuQc/n0JQGJK3acFZNX84ZqpVMLYjA4M2TxieYk4Vj5
 b6s4KzCtg6yrQ==
Content-Disposition: inline
In-Reply-To: <YaMME60Jfiz5BeJF@qmqm.qmqm.pl>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, bcm-kernel-feedback-list@broadcom.com, linux-crypto@vger.kernel.org, linux-alpha@vger.kernel.org, linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org

On Sun, Nov 28, 2021 at 05:56:51AM +0100, Micha=B3 Miros=B3aw wrote:
> On Sat, Nov 27, 2021 at 07:57:02PM -0800, Yury Norov wrote:
> > Add num_{possible,present,active}_cpus_{eq,gt,le} and replace num_*_cpu=
s()
> > with one of new functions where appropriate. This allows num_*_cpus_*()
> > to return earlier depending on the condition.
> [...]
> > @@ -3193,7 +3193,7 @@ int __init pcpu_page_first_chunk(size_t reserved_=
size,
> > =20
> >  	/* allocate pages */
> >  	j =3D 0;
> > -	for (unit =3D 0; unit < num_possible_cpus(); unit++) {
> > +	for (unit =3D 0; num_possible_cpus_gt(unit); unit++) {
>=20
> This looks dubious. The old version I could hope the compiler would call
> num_possible_cpus() only once if it's marked const or pure, but the
> alternative is going to count the bits every time making this a guaranteed
> O(n^2) even though the bitmap doesn't change.

Hmm. This code already unnecessarily calls num_possible_cpus() multiple
times. Since it doesn't change after early init I would suggest just
calling it once here.

Best Regards
Micha=B3=A0Miros=B3aw
