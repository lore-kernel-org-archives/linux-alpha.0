From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 7/9] lib/cpumask: add
 num_{possible,present,active}_cpus_{eq,gt,le}
Date: Sun, 28 Nov 2021 09:07:52 -0800
Message-ID: <8f389151c39a8a5b6b31d5238cb680305225d9f2.camel__24306.5924894594$1638119453$gmane$org@perches.com>
References: <20211128035704.270739-1-yury.norov@gmail.com>
         <20211128035704.270739-8-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20211128035704.270739-8-yury.norov@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>

On Sat, 2021-11-27 at 19:57 -0800, Yury Norov wrote:
> Add num_{possible,present,active}_cpus_{eq,gt,le} and replace num_*_cpus()
> with one of new functions where appropriate. This allows num_*_cpus_*()
> to return earlier depending on the condition.
[]
> diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
[]
> @@ -103,7 +103,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>  	 * if platform didn't set the present map already, do it now
>  	 * boot cpu is set to present already by init/main.c
>  	 */
> -	if (num_present_cpus() <= 1)
> +	if (num_present_cpus_le(2))
>  		init_cpu_present(cpu_possible_mask);

?  is this supposed to be 2 or 1

> diff --git a/drivers/cpufreq/pcc-cpufreq.c b/drivers/cpufreq/pcc-cpufreq.c
[]
> @@ -593,7 +593,7 @@ static int __init pcc_cpufreq_init(void)
>  		return ret;
>  	}
>  
> -	if (num_present_cpus() > 4) {
> +	if (num_present_cpus_gt(4)) {
>  		pcc_cpufreq_driver.flags |= CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING;
>  		pr_err("%s: Too many CPUs, dynamic performance scaling disabled\n",
>  		       __func__);

It looks as if the present variants should be using the same values
so the _le test above with 1 changed to 2 looks odd.


