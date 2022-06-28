From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH v3 0/3] phase out CONFIG_VIRT_TO_BUS
Date: Mon, 27 Jun 2022 22:59:08 -0400
Message-ID: <yq1bkudh4va.fsf@ca-mkp.ca.oracle.com>
References: <20220624155226.2889613-1-arnd@kernel.org>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=wMamLpDb+BRSMzdaF++yecs649QCHZ3DOgROwQe3Bpc=;
 b=jYq/aY1sqUjt53/It8QrvnGHbksfYg0vkY27bXmC2aouAPvdZPMFYotmYsvQA3HwaTM0
 nOGwnY6e2YmQLwwm1Os56Fyt9OiMzDhqgMyd5CP1TttXBjSva1+SudstztZvZpiRiiWf
 NQeYDvz35LLmRqkpxCvys4KaOBPqMs7CK0UZhD1NUcc4d86VeCxxetSzimF9by7EsK9D
 c4Dmb5bv+xU37YZ700HFacoQ3QKnAgu1EOLTrfsdG7NM8p4nIR/oWAVhf+KuMtQe3nNX
 1RtmiR8urxRP7d74RwhP1KlFeHgS8vpjuyEQ+97mZf4ZGad6T50Nict57F8nqlAG+HIR pQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMamLpDb+BRSMzdaF++yecs649QCHZ3DOgROwQe3Bpc=;
 b=I9XQ0jhF1X4CeHVVFET+PdKQLm9Namx8Svditd958QPAlpc3pKSMK6eaFJqbv2Rfa0xi09qDZRc5v3LPKhphrZdC9/0gqWQ95AaolsH8WHCHU+E8qwEuJ1QHRHh6+2QG2uijrpfgqAnm+zOWuqHIZiEF1GweR0OtnGZVXv1WSlQ=
In-Reply-To: <20220624155226.2889613-1-arnd@kernel.org> (Arnd Bergmann's
        message of "Fri, 24 Jun 2022 17:52:23 +0200")
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-scsi@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org, Khalid Aziz <khalid@gonehiking.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Matt Wang <wwentao@vmware.com>, Miquel van Smoorenburg <mikevs@xs4all.net>, Mark Salyzyn <salyzyn@android.com>, linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org, Denis Efremov <efremov@linux.com>


Hi Arnd!

> If there are no more issues identified with this series, I'll merge it
> through the asm-generic tree. The SCSI patches can also get merged
> separately through the SCSI maintainers' tree if they prefer.

I put patches 1 and 2 in scsi-staging to see if anything breaks...

-- 
Martin K. Petersen	Oracle Linux Engineering
