From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH 7/9] lib/cpumask: add
 num_{possible,present,active}_cpus_{eq,gt,le}
Date: Sun, 28 Nov 2021 05:56:51 +0100
Message-ID: <YaMME60Jfiz5BeJF@qmqm.qmqm.pl>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-8-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638075413; bh=Ir3YT3zeL32xImHXMHm+HUkV1uXH+xu9Pk/FdYqejaw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qfJt/SEuYDHvacc6G0xjNLwg1Fq717EReqm4qKjJKbJ29nVz4pRzLhvuTEs+OdzmQ
 YBtV69D9aVFvnRVlMgScH974MXYPVrPlxykIPQGi6nNOPfU8kRQpmThuzgG3a1CYgY
 78OZwIEmZp1nYVyJFPH7JKcWetX0Tq4RrwhOe1BNAr0LCbznthHDe87CltKf4hscrH
 sWADjOEt9FmXj+haWSNMnvon1BnukXnjVIZdfR+TS1YetB95pCqlXSq9QBZTNBbDdH
 rZ7A1g9OqzSsLIRp6DvBumXPrVPGV6Vae36X2F9VPlEfprs7mm6t+Np5204AGclKvP
 Nz6Jqvfks862Q==
Content-Disposition: inline
In-Reply-To: <20211128035704.270739-8-yury.norov@gmail.com>
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

On Sat, Nov 27, 2021 at 07:57:02PM -0800, Yury Norov wrote:
> Add num_{possible,present,active}_cpus_{eq,gt,le} and replace num_*_cpus()
> with one of new functions where appropriate. This allows num_*_cpus_*()
> to return earlier depending on the condition.
[...]
> @@ -3193,7 +3193,7 @@ int __init pcpu_page_first_chunk(size_t reserved_si=
ze,
> =20
>  	/* allocate pages */
>  	j =3D 0;
> -	for (unit =3D 0; unit < num_possible_cpus(); unit++) {
> +	for (unit =3D 0; num_possible_cpus_gt(unit); unit++) {

This looks dubious. The old version I could hope the compiler would call
num_possible_cpus() only once if it's marked const or pure, but the
alternative is going to count the bits every time making this a guaranteed
O(n^2) even though the bitmap doesn't change.

Best Regards
Micha=B3=A0Miros=B3aw
