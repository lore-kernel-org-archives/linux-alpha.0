From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 22/30] panic: Introduce the panic post-reboot notifier
 list
Date: Wed, 11 May 2022 16:58:43 -0300
Message-ID: <1c7dfe73-6691-1ca5-7555-27e81dff4dcd@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-23-gpiccoli@igalia.com>
 <7017c234-7c73-524a-11b6-fefdd5646f59@igalia.com> <YnvoPe2cTS31qbjb@osiris>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=gDHQr/46Ll+YF5RXidB7bzodWcAOTgjTzZrI+em3L64=; b=g39PxeAmrsyeqF7oG7t83UmsmK
        q+jHGkHAbmWvohxv26/jw0X2fC5ZQGAB+1t+RR3Dc/QcY0t/UuqqV0Rw0e0vNKpR3Ghg3EjPFEyRu
        xmyuTU8VIa0JckQ1LnJMbsmPzyPVIePtyYzY2GC02et+W2URhxptR9GwDO/JS6MpbzrCHGb/n2EjF
        MPTZc218MFC/xIv1c3Q0VBsXMBQNsxYCCeLWiYkZzdC6cvR08qY5ppLv8+FOFZTVkTAZbUvYrBQWZ
        fyGL7frjV8v7tGHHjzO9nQTkj7crGcqaoQ0KxvgjDlDQp5VOe0vE/nPeGF7YvXLizE8zXvpcRYVIg
        fCPXiI+ 
Content-Language: en-US
In-Reply-To: <YnvoPe2cTS31qbjb@osiris>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Sven Schnelle <svens@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, pmladek@suse.com, bhe@redhat.com, akpm@linux-foundation.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, kexec@lists.infradead.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openi

On 11/05/2022 13:45, Heiko Carstens wrote:
> [...]
>>
>> Hey S390/SPARC folks, sorry for the ping!
>>
>> Any reviews on this V1 would be greatly appreciated, I'm working on V2
>> and seeking feedback in the non-reviewed patches.
> 
> Sorry, missed that this is quite s390 specific. So, yes, this looks
> good to me and nice to see that one of the remaining CONFIG_S390 in
> common code will be removed!
> 
> For the s390 bits:
> Acked-by: Heiko Carstens <hca@linux.ibm.com>

No need for apologies, I really appreciate your review!
Will add your Ack for V2 =)

Cheers,


Guilherme
