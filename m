From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 08/30] powerpc/setup: Refactor/untangle panic notifiers
Date: Tue, 10 May 2022 11:10:40 -0300
Message-ID: <58837e3d-0e2a-42ac-f198-9fe7be7aa823@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-9-gpiccoli@igalia.com>
 <3c34d8e2-6f84-933f-a4ed-338cd300d6b0@linux.ibm.com>
 <f9c3de3c-1709-a1aa-2ece-c9fbfd5e6d6a@igalia.com>
 <87fslh8pe3.fsf@mpe.ellerman.id.au>
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
	List-Owner; bh=HPPCSDW/v90s9qTfrmUGlaHWiy+lxeaIh4UHDaTCmBQ=; b=Djq8c2c9uQr9ZS
	u31sNU6MAeA0SWUxWq8C7RclovaPZ+mCFIi6CvKBxuSj3gHuFEFvoOrrdwLX3a1igw6fRZXV+dGdo
	zbj+S4z2HOxNH5NxQnrWMPy/cT5A3yBwb59JXffQQ1X/g7sxlvAVXs7Mx0KcKOpAy/6PZXp+z8USo
	9CTQCdvva4/FsXNRBYrwLDUKcDzlBpwSyET6zqVzezwi7NiW2Oz4Np8f35rG5ueUId7NrMpywivJI
	fRxEhXfV5V810B6E+KGafp4GX1EZokTGSgjUg2JbhVZdparWMJBvjFfrimqnMujzY9GGcBvcgbDJ2
	c13m6jqlRCxF9GjP1QRg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vlPcmXA97Qhtkz3pBw6LdXf1X8P0UYvVzj4VthO5jgc=; b=e9qBavzt7iSXqotIL+kEfOWSDC
 iVRppT3Hb/vZk3YrAi/b/1Sks4coJ4CDDP+7PsBf/3PYaPFt1gdo8rsOdKqYQ7smquEWj28eStWqL
 CRF+oqCbuJG6ZM1a8GSMIH+b891MTAxbko/s3bV28TSILNPx0vJS6lKq9Hi1OrpvIOMJ2yAsDH+AE
 5UZLLIZnAX0XkUOFElR9JGQkkK04aCtF/juYrAyo+JJs0W0WZech05pCgMVZEF/gDbG3lXHdR+nlg
 gc7p3pNqQj2cprKtyF3OhhaP7dxC5PNGfWWqohU3giKekM5UQ60wlcwHLGqdoJfnT4tcYUBBcGgto
 etn8qzNQ==;
Content-Language: en-US
In-Reply-To: <87fslh8pe3.fsf@mpe.ellerman.id.au>
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
To: Michael Ellerman <mpe@ellerman.id.au>, Hari Bathini <hbathini@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, pmladek@suse.com, kexec@lists.infradead.org, bhe@redhat.com, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com, andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de, corbet@lwn.net, d.hatay

On 10/05/2022 10:53, Michael Ellerman wrote:
> "Guilherme G. Piccoli" <gpiccoli@igalia.com> writes:
>> On 05/05/2022 15:55, Hari Bathini wrote:
>>> [...] 
>>> The change looks good. I have tested it on an LPAR (ppc64).
>>>
>>> Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>
>>>
>>
>> Hi Michael. do you think it's possible to add this one to powerpc/next
>> (or something like that), or do you prefer a V2 with his tag?
> 
> Ah sorry, I assumed it was going in as part of the whole series. I guess
> I misread the cover letter.
> 
> So you want me to take this patch on its own via the powerpc tree?
> 
> cheers

Hi Michael, thanks for the prompt response!

You didn't misread, that was the plan heh
But some maintainers start to take patches and merge in their trees, and
in the end, it seems to make sense - almost half of this series are
fixes or clean-ups, that are not really necessary to get merged altogether.

So, if you can take this one, I'd appreciate - it'll make V2 a bit
smaller =)

Cheers,


Guilherme
