From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] pci:  Add and use PCI_GENERIC_SETUP Kconfig entry
Date: Fri, 23 Jun 2017 15:08:56 -0700
Message-ID: <20170623220857.28774-1-palmer__2835.5618626394$1498255774$gmane$org@dabbelt.com>
References: <20170623220104.GE31455@jhogan-linux.le.imgtec.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJHidJBmW0X149posnr4YuG+bsNR2qXqlyKghRTB3Sw=; b=Ayy8iXax53F8z1
	HJTUwRGErOQzM9CG0tRv+xLjRWMdRnpqRfcV60uUqE2zvdOCj/pUmUWFh1t5PeLLLqhlB0U+nR6om
	F7i9/OcHn0KewLsZFicP5XFkd+eBvsFAWrrvzx9/nbU1zwdEA1kyHSr+EqeUukbUx8OhfVV3pY5wf
	8MnO0sN/Z/elP4ikpg8nJCzqe4/dY9zNgOWvJwvKQjofEvmseaJ1YMzfNQlKL4hkEwuQ8w042Go4L
	EPzRN4seAmpjKUQjOQOYVMoWRoNoaMPZBmjQsXsY9gt/mDPxvnf6grdL+ExHMTC070El+OWjgj4ZR
	p9Qx72l73tMlgQgaSp2g==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:to:to:to:to:to:to:to:to:to:to:to:to:to:to:to:to:to:to:to:to
 :to:to:to:to:to:to:subject:date:message-id:in-reply-to:references;
 bh=BbbXQ9TxIFSlaYQfNVciTNl5Rer90HRKrh8uRVHMC+Q=;
 b=AX0ppT5JiQR2/Mpx9ScIYJZqxzFq5QAJCulcUhouSRavqi8c3f7ycrRiYN4uZv3ZUP
 E20242wvkc+7HDUuycDbG+0k3A1mBT8ddvM0hg50xe2STgV40RPpJvPlSUkjwjGYIqHp
 6fuMJML/uJihaAnIiVWkJY70LYhzkp3D48mAeMzz+XIj0myWorOwqTWofl1jY0UxRSbn
 qytAMDES7MQcInCliYrAFZr/3mc1u2HFzV9b8k3shCcGlV85fSoUGn0ontRYHptiZM8T
 9VO9F76cxFi9IrSKhNAC4mR96vOCAAoDne7U0epuJhL9TiK2ls67CQQDQIl4N63LGuUJ
 ZvJA==
In-Reply-To: <20170623220104.GE31455@jhogan-linux.le.imgtec.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@synopsys.com, linux@armlinux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, geert@linux-m68k.org, ralf@linux-mips.org, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, cmetcalf@mellanox.com, gxt@mprc.pku.edu.cn, bhelgaas@google.com, viro@zeniv.linux.org.uk, akpm@linux-foundation.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@linux-mips.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, hch@infradead.org

On Fri, 23 Jun 2017 15:01:04 PDT (-0700), james.hogan@imgtec.com wrote:
> On Fri, Jun 23, 2017 at 02:45:38PM -0700, Palmer Dabbelt wrote:
>> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>> index 4c1a35f15838..86872246951c 100644
>> --- a/arch/arm/Kconfig
>> +++ b/arch/arm/Kconfig
>> @@ -96,6 +96,7 @@ config ARM
>>      select PERF_USE_VMALLOC
>>      select RTC_LIB
>>      select SYS_SUPPORTS_APM_EMULATION
>> +    select PCI_GENERIC_SETUP
>>      # Above selects are sorted alphabetically; please add new ones
>>      # according to that.  Thanks.
>
> This comment seems to suggest PCI_GENERIC_SETUP should be added a few
> lines up to preserve the alphabetical sorting.
>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index b2024db225a9..6c684d8c8816 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -115,6 +115,7 @@ config ARM64
>>      select SPARSE_IRQ
>>      select SYSCTL_EXCEPTION_TRACE
>>      select THREAD_INFO_IN_TASK
>> +    select PCI_GENERIC_SETUP
>
> Here too.
>
>> diff --git a/arch/tile/Kconfig b/arch/tile/Kconfig
>> index 4583c0320059..6679af85a882 100644
>> --- a/arch/tile/Kconfig
>> +++ b/arch/tile/Kconfig
>> @@ -33,6 +33,7 @@ config TILE
>>      select USER_STACKTRACE_SUPPORT
>>      select USE_PMC if PERF_EVENTS
>>      select VIRT_TO_BUS
>> +    select PCI_GENERIC_SETUP
>
> and here
>
> Otherwise
> Reviewed-by: James Hogan <james.hogan@imgtec.com>

Whoops -- I guess I was just on autopilot after seeing the first one not be
alphabetized.  A fixed patch is in a threaded message.
