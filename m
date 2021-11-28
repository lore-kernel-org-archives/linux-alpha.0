From: =?iso-8859-2?B?TWljaGGzoE1pcm9zs2F3?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH 3/9] all: replace bitmap_weigth() with
 bitmap_{empty,full,eq,gt,le}
Date: Sun, 28 Nov 2021 05:47:43 +0100
Message-ID: <YaMJ7x8viyKyYk6w@qmqm.qmqm.pl>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-4-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638074864; bh=T0svUg/TJeCaOj3VBZ/3tRgBnlIZMjU65z9Fv+g5zQQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nn7s8QPTQ/loie98xkMYWvJAWdNi0ygFbehqQ63G9aASvWbHHSf28+XNOM2IsqPek
 Id9Qk7aFHuFwrGibBi8TresAAu9XqBcHIi12aTTvDPBLXczkWFqaVeOOJqwU7nzdju
 cV9IwxL2w6Fd22ryYwl1Sh9x2PviA4Kf1ikAu3uR5SMygCLmnTRZxshC+MEAGrH0Kv
 tsp5I9URKJw3bR68w4MVuWQ2xdmfd6DgYPrQCMsS55RcJLwTkVCCw/V2t3AdcHjMnW
 QCHQOrGKek5wpaMAmZUhPLRcHZ38Wx/IlUleKYu8VrTTTyi1x1pbkvgBzAZLAICths
 2w9BfRFMcSpxg==
Content-Disposition: inline
In-Reply-To: <20211128035704.270739-4-yury.norov@gmail.com>
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

On Sat, Nov 27, 2021 at 07:56:58PM -0800, Yury Norov wrote:
> bitmap_weight() counts all set bits in the bitmap unconditionally.
> However in some cases we can traverse a part of bitmap when we
> only need to check if number of set bits is greater, less or equal
> to some number.
>=20
> This patch replaces bitmap_weight() with one of
> bitmap_{empty,full,eq,gt,le), as appropriate.
>=20
> In some places driver code has been optimized further, where it's
> trivial.
[...]

I think this patch needs to be split. bitmap_full/empty() conversions
can be separated (don't need the bitmap_weight_*() functions) and
not all changes are trivial. Besides, gathering and checking all the
acks needed into one patch seems problematic.

Best Regards,
Micha=B3=A0Miros=B3aw
