From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/9] lib/bitmap: optimize bitmap_weight() usage
Date: Sun, 28 Nov 2021 21:08:41 +1000
Message-ID: <1638096766.3elxdzb8ly.astroid__35243.6327886366$1638097857$gmane$org@bobo.none>
References: <20211128035704.270739-1-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:subject:to:references:in-reply-to:mime-version:message-id
         :content-transfer-encoding;
        bh=RLGVormZNrRFWCDJ7jdRt19siDEPnOtSgoMRMWSMPpw=;
        b=JS75cm1kNmau6QTu2rqjTEH1lacCTylUddbQig/MfaOv87fU1R4ixeZwUTvWkojCLe
         FVsH5wJQluo9fnDCJtLxlNsFRugI2zkbabpCQ9VhDSP+vCMkQ9XcDyPUZsKoAN0XUVPp
         aHUTDQx+GNGjfhDN5ufjzO429xe7p71bZ6QrT/eU2apwdj3VV4bcd4Oz9OEiXGFLWmkO
         KTg66HtHflRGYT80QQO1K0h4MxrasFS2dEY2Sip94P5OybBl2LvseRqW7ZJqQswnXYN6
         Cntrs/UrWT/QrCgRauE5NdDXQthF0aHKCC9fzaz2Cb2jdPmYhTY0PX3z2F7VkaSzQTfW
         T9/w==
In-Reply-To: <20211128035704.270739-1-yury.norov@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Andy Gross <agross@kernel.org>, David Airlie <airlied@linux.ie>, Alexey Klimov <aklimov@redhat.com>, Andi Kleen <ak@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@fb.com>, bcm-kernel-feedback-list@broadcom.com, Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Lameter <cl@linux.com>, Daniel Vetter <daniel@ffwll.ch>, Dave Hansen <dave.hansen@linux.intel.com>, David

Excerpts from Yury Norov's message of November 28, 2021 1:56 pm:
> In many cases people use bitmap_weight()-based functions like this:
>=20
> 	if (num_present_cpus() > 1)
> 		do_something();
>=20
> This may take considerable amount of time on many-cpus machines because
> num_present_cpus() will traverse every word of underlying cpumask
> unconditionally.
>=20
> We can significantly improve on it for many real cases if stop traversing
> the mask as soon as we count present cpus to any number greater than 1:
>=20
> 	if (num_present_cpus_gt(1))
> 		do_something();
>=20
> To implement this idea, the series adds bitmap_weight_{eq,gt,le}
> functions together with corresponding wrappers in cpumask and nodemask.

There would be no change to callers if you maintain counters like what
is done for num_online_cpus() today. Maybe some fixes to arch code that
does not use set_cpu_possible() etc APIs required, but AFAIKS it would
be better to fix such cases anyway.

Thanks,
Nick
