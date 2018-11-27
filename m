From: Hendrik Brueckner <brueckner@linux.ibm.com>
Subject: Re: [PATCH v2 15/20] s390: perf/events: advertise PMU exclusion
 capability
Date: Tue, 27 Nov 2018 09:19:45 +0100
Message-ID: <20181127081945.GA4817@linux.ibm.com>
References: <1543230756-15319-1-git-send-email-andrew.murray@arm.com>
 <1543230756-15319-16-git-send-email-andrew.murray@arm.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1543230756-15319-16-git-send-email-andrew.murray@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Murray <andrew.murray@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, "David S . Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, linux-s390@vger.kernel.org, linux-mips@linux-mips.org

On Mon, Nov 26, 2018 at 11:12:31AM +0000, Andrew Murray wrote:
> The s390 cpum_cf and cpum_sf PMUs have the capability to exclude
> events based on context. Let's advertise that we support the
> PERF_PMU_CAP_EXCLUDE capability to ensure that perf doesn't
> prevent us from handling events where any exclusion flags are set.
> 
> Signed-off-by: Andrew Murray <andrew.murray@arm.com>
> ---
>  arch/s390/kernel/perf_cpum_cf.c | 1 +
>  arch/s390/kernel/perf_cpum_sf.c | 2 ++
>  2 files changed, 3 insertions(+)

Reviewed-by: Hendrik Brueckner <brueckner@linux.ibm.com>

