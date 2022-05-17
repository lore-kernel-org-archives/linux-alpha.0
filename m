From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 14/30] panic: Properly identify the panic event to the
 notifiers' callbacks
Date: Tue, 17 May 2022 12:19:02 -0300
Message-ID: <bc485d09-0958-0ddc-7b2d-cbc806cf6a01@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-15-gpiccoli@igalia.com> <YnqBsXBImU64PAOL@alley>
 <244a412c-4589-28d1-bb77-d3648d4f0b12@igalia.com> <YoOe7ifxfW8CEHdt@alley>
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
	List-Owner; bh=ykqV2SeBOGfU3JFiiZJ1t8dtHchiDwYNO33n7Y0/N8I=; b=h1Thvd7WxhT25f
	MVZQ10x/RDfLhI9lu5Dus3QphXD0oknT1ygVxBzQww+It4SLOcH1dMra2cT9k0GRPKNRHjw8jlPe7
	5ziZbNpYQpYYotWb4wL/Ncsu7UQGWEXDk98rooOolB3DcwLKRgvsvPNJZGxwo/TeddiwrCSs8emP1
	57ymrR52SdfbeTRN8wqH51txDWO+UBZfxhuSOUV+Ahouj2jowo19PZZYLHrOFYuHPZXcF++sg/k/f
	X6aqPrnx5pIzCYTTz+TdxyEWTlY4+2vN27ReCbOdQlSQzds5jHJyPXnfBb+3Dc+mhCgI50JD1G0J4
	1idzkmdzXBw0q6rgBfKg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wF3LghB7qFMkIN+RAhS0nW2784Fxel03VlqG6SoZfk8=; b=giQ6MXmBG17+JbZaHvCpLgBjCU
 FwsDXgX/b02O0QP8I+vkUwgy5+Lo+D5E+EJOGL5/JJvM2lmeYDRT6QF5s/JgDpbjXa08hzTZAOCcp
 H5UDG57PmVcXgDQ83UJ5J0cHOAPIvQgCaZLx9/QPzE06aTWYPlZURlCiNkAkSPoI1FmBlizReQXpJ
 dIElRXTKibRc33b/9HZXXl+Wf0mzN1goXhA+a9ZGenrB/fdH27xO8ledb2joDR0cLh2vGAmqvotM+
 JR0bWUJ+tmRYLx16LGJtXMspUiQTF3daEYzd/24Q2VypEyjqgtCV1aoMRt2LQ9YZpXkratOMOe37t
 53QKNYiQ==;
Content-Language: en-US
In-Reply-To: <YoOe7ifxfW8CEHdt@alley>
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
To: Petr Mladek <pmladek@suse.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com, andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de, corbet@lwn.ne

On 17/05/2022 10:11, Petr Mladek wrote:
> [...]
>> You mentioned 2 cases:
>>
>> (a) Same notifier_list used in different situations;
>>
>> (b) Same *notifier callback* used in different lists;
>>
>> Mine is case (b), right? Can you show me an example of case (a)?
> 
> There are many examples of case (a):
> 
> [... snip ...] 
> These all call the same list/chain in different situations.
> The situation is distinguished by @val.
> 
> 
>> You can see in the following patches (or grep the kernel) that people are using
>> this identification parameter to determine which kind of OOPS trigger
>> the callback to condition the execution of the function to specific
>> cases.
> 
> Could you please show me some existing code for case (b)?
> I am not able to find any except in your patches.
> 

Hi Petr, thanks for the examples - I agree with you. In the end, seems
I'm kind of abusing the API. This id is used to distinguish different
situations in which the callback is called, but in the same
"realm"/notifier list.

In my case I have different list calling the same callback and
(ab-)using the id to make distinction. I can rework the patches using
pointer comparison, it's fine =)

So, I'll drop this patch in V2.

> Anyway, the solution in 16th patch is bad, definitely.
> hv_die_panic_notify_crash() uses "val" to disinguish
> both:
> 
>      + "panic_notifier_list" vs "die_chain"
>      + die_val when callen via "die_chain"
> 
> The API around "die_chain" API is not aware of enum panic_notifier_val
> and the API using "panic_notifier_list" is not aware of enum die_val.
> As I said, it is mixing apples and oranges and it is error prone.
> 

OK, I'll re-work that patch - there's more there to be changed, that one
is complex heheh

Cheers!
