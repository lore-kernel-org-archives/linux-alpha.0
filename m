From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 12/30] parisc: Replace regular spinlock with spin_trylock
 on panic path
Date: Fri, 29 Apr 2022 11:34:51 -0300
Message-ID: <4a7d9670-92f8-3e12-a619-aaa64adca093@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-13-gpiccoli@igalia.com>
 <6a7c924a-54a9-c5ea-8a9d-3ea92987b436@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v44ZSdg7YMnBctrhBB6ScTdxL422Tf9ejrh22etJgAs=; b=rP+X3GRRA1hQ5x
	O2L1xdmheT+IpS9rf++ikpZHx6Iefcxk7N/buVQI9riCHbffynedYl+OXStVArIp2Uk0Y3OnKm9XP
	sclfxWgt7M+9EO3xID1kro/s9eCOuYi4p8Ywwa47qw+w5GBNU+0yE2eAwNVf6/Jwd9etiwvqilew1
	EilXt803jZcnX35Gn3tCUYj4usNCfgOoilL3uYiTjZupeIvfulEpIboYDFUFnzfFx2dV+XkCAcRrP
	f8wCB+rnIIuRmnf52huXYPVP6M2y2AnFAAdVEOdtCbVPNDM8wSWSvkhwXcWRi6cZeFDOyrgaCPIga
	Inv8MjdGvQqHrdrWcQOA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZdZBPtTkXvskvklO0DqGHW3vJ6Arb57ZyicMdsmwPPs=; b=Id0YxwZLmWV943xSSctc382COx
 slYd+Mbgd8mluBGRTtubiqJcFH7Jw+KCfrIBUuJ6IBjkEi3jycQJ/GZIWCNzfYdJZGxOzIKlAq9i5
 NGU7dMo+j6aXXuC9zPnllvKUmp4j7d1NBQPsBNjzH1goO9ZNvF9j+05V5SxGqrz8IpFC/ke6Hqou9
 ZUhvlX5vvgSwWpU57PqA3cf0RcC09NkmKHiXH92FbdJDx27V/PJs6cBfrjjyUhrMtQCOhvF+z0Tsu
 zF1ocWG4HwYZ0G6pmdbbbK4PGRnRNWBCGP+4DKIndhzsOY9kfvz7NjpBrTKt1RM1gSIvJ0Gc9QwYA
 dmc3mStA==;
Content-Language: en-US
In-Reply-To: <6a7c924a-54a9-c5ea-8a9d-3ea92987b436@gmx.de>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-um/>
List-Post: <mailto:linux-um@lists.infradead.org>
List-Help: <mailto:linux-um-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=subscribe>
Sender: "linux-um" <linux-um-bounces@lists.infradead.org>
Errors-To: linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org
To: Helge Deller <deller@gmx.de>, akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com, andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de, corbet@lwn.net, d.hatayama@jp.fujitsu.com, dave.hansen@linux.intel.com, dyoung@redh

On 28/04/2022 13:55, Helge Deller wrote:
> [...]
> You may add:
> Acked-by: Helge Deller <deller@gmx.de> # parisc
> 
> Helge

Thanks Helge, added!
Cheers,


Guilherme

> 
> 
>> ---
>>  arch/parisc/include/asm/pdc.h |  1 +
>>  arch/parisc/kernel/firmware.c | 27 +++++++++++++++++++++++----
>>  drivers/parisc/power.c        | 17 ++++++++++-------
>>  3 files changed, 34 insertions(+), 11 deletions(-)
>>
>> diff --git a/arch/parisc/include/asm/pdc.h b/arch/parisc/include/asm/pdc.h
>> index b643092d4b98..7a106008e258 100644
>> --- a/arch/parisc/include/asm/pdc.h
>> +++ b/arch/parisc/include/asm/pdc.h
>> @@ -83,6 +83,7 @@ int pdc_do_firm_test_reset(unsigned long ftc_bitmap);
>>  int pdc_do_reset(void);
>>  int pdc_soft_power_info(unsigned long *power_reg);
>>  int pdc_soft_power_button(int sw_control);
>> +int pdc_soft_power_button_panic(int sw_control);
>>  void pdc_io_reset(void);
>>  void pdc_io_reset_devices(void);
>>  int pdc_iodc_getc(void);
>> diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
>> index 6a7e315bcc2e..0e2f70b592f4 100644
>> --- a/arch/parisc/kernel/firmware.c
>> +++ b/arch/parisc/kernel/firmware.c
>> @@ -1232,15 +1232,18 @@ int __init pdc_soft_power_info(unsigned long *power_reg)
>>  }
>>
>>  /*
>> - * pdc_soft_power_button - Control the soft power button behaviour
>> - * @sw_control: 0 for hardware control, 1 for software control
>> + * pdc_soft_power_button{_panic} - Control the soft power button behaviour
>> + * @sw_control: 0 for hardware control, 1 for software control
>>   *
>>   *
>>   * This PDC function places the soft power button under software or
>>   * hardware control.
>> - * Under software control the OS may control to when to allow to shut
>> - * down the system. Under hardware control pressing the power button
>> + * Under software control the OS may control to when to allow to shut
>> + * down the system. Under hardware control pressing the power button
>>   * powers off the system immediately.
>> + *
>> + * The _panic version relies in spin_trylock to prevent deadlock
>> + * on panic path.
>>   */
>>  int pdc_soft_power_button(int sw_control)
>>  {
>> @@ -1254,6 +1257,22 @@ int pdc_soft_power_button(int sw_control)
>>  	return retval;
>>  }
>>
>> +int pdc_soft_power_button_panic(int sw_control)
>> +{
>> +	int retval;
>> +	unsigned long flags;
>> +
>> +	if (!spin_trylock_irqsave(&pdc_lock, flags)) {
>> +		pr_emerg("Couldn't enable soft power button\n");
>> +		return -EBUSY; /* ignored by the panic notifier */
>> +	}
>> +
>> +	retval = mem_pdc_call(PDC_SOFT_POWER, PDC_SOFT_POWER_ENABLE, __pa(pdc_result), sw_control);
>> +	spin_unlock_irqrestore(&pdc_lock, flags);
>> +
>> +	return retval;
>> +}
>> +
>>  /*
>>   * pdc_io_reset - Hack to avoid overlapping range registers of Bridges devices.
>>   * Primarily a problem on T600 (which parisc-linux doesn't support) but
>> diff --git a/drivers/parisc/power.c b/drivers/parisc/power.c
>> index 456776bd8ee6..8512884de2cf 100644
>> --- a/drivers/parisc/power.c
>> +++ b/drivers/parisc/power.c
>> @@ -37,7 +37,6 @@
>>  #include <linux/module.h>
>>  #include <linux/init.h>
>>  #include <linux/kernel.h>
>> -#include <linux/notifier.h>
>>  #include <linux/panic_notifier.h>
>>  #include <linux/reboot.h>
>>  #include <linux/sched/signal.h>
>> @@ -175,16 +174,21 @@ static void powerfail_interrupt(int code, void *x)
>>
>>
>>
>> -/* parisc_panic_event() is called by the panic handler.
>> - * As soon as a panic occurs, our tasklets above will not be
>> - * executed any longer. This function then re-enables the
>> - * soft-power switch and allows the user to switch off the system
>> +/*
>> + * parisc_panic_event() is called by the panic handler.
>> + *
>> + * As soon as a panic occurs, our tasklets above will not
>> + * be executed any longer. This function then re-enables
>> + * the soft-power switch and allows the user to switch off
>> + * the system. We rely in pdc_soft_power_button_panic()
>> + * since this version spin_trylocks (instead of regular
>> + * spinlock), preventing deadlocks on panic path.
>>   */
>>  static int parisc_panic_event(struct notifier_block *this,
>>  		unsigned long event, void *ptr)
>>  {
>>  	/* re-enable the soft-power switch */
>> -	pdc_soft_power_button(0);
>> +	pdc_soft_power_button_panic(0);
>>  	return NOTIFY_DONE;
>>  }
>>
>> @@ -193,7 +197,6 @@ static struct notifier_block parisc_panic_block = {
>>  	.priority	= INT_MAX,
>>  };
>>
>> -
>>  static int __init power_init(void)
>>  {
>>  	unsigned long ret;
> 
