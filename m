From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 08/30] powerpc/setup: Refactor/untangle panic notifiers
Date: Mon, 9 May 2022 09:50:05 -0300
Message-ID: <f9c3de3c-1709-a1aa-2ece-c9fbfd5e6d6a@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-9-gpiccoli@igalia.com>
 <3c34d8e2-6f84-933f-a4ed-338cd300d6b0@linux.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=vNWZxas8t1kFoCf13D7/vaEHrhXkMcvheesCeQUODMg=; b=LiRqvKrtw9XJxMP26bz+wzbn1n
        fBHqZS6c/XR8QMIkcDbMMcoNGulyS43Rfp83nqthIjvwxcC0/rE6EUbNIf51/kQdvFB0MZLjpT1Zt
        jPlWUhML/RrgwA/8AbWtoLwz1yzaOdGTpwde1q8bM8ZApOffPjJ50hQj+UprMTPvFMZ+3kTukzvDC
        T+M3aUntgoIptglMOe9noJu8WxIIHyHpxsCC1uL0UNNnEkCrtSTA6MLc7ESoFMKljoD3/1VBzhboF
        ZG7o2pwmSFhOEypVckR6q5+g5/pOsvXV3qshYFBj5WEOrVLcV95X7vQdrWZ9lJh80TjIodpEGtnLe
        +KvSh8A 
Content-Language: en-US
In-Reply-To: <3c34d8e2-6f84-933f-a4ed-338cd300d6b0@linux.ibm.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hari Bathini <hbathini@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, pmladek@suse.com, kexec@lists.infradead.org, bhe@redhat.com, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, 

On 05/05/2022 15:55, Hari Bathini wrote:
> [...] 
> The change looks good. I have tested it on an LPAR (ppc64).
> 
> Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>
> 

Hi Michael. do you think it's possible to add this one to powerpc/next
(or something like that), or do you prefer a V2 with his tag?
Thanks,


Guilherme
