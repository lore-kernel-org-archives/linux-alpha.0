From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH 00/16] Remove usage of the deprecated "pci-dma-compat.h"
 API
Date: Mon, 10 Jan 2022 10:35:26 -0500
Message-ID: <yq1ee5ftxic.fsf@ca-mkp.ca.oracle.com>
References: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=g6Er+gI9i/erk3lqnCuNb3gG2mXN1WNzB/Xgz2fumEk=;
 b=gtASKtuH+ZVZBEjz/kSNnfXv+hARVXLucL3c/IT5GVaI0NovHjGWmR6sFWB4cIxchDbV
 c7hkkb1IU87WuxT737TfxoHodtP/Uu/OCadA0zLGmltOYpujhIiP32J5WeStsAFl3sta
 SZGSLJfnyhawByJNtJ4WdIFcgRS+yfWIMla3NUGrfLlHF8rIZUGtQqtNCqPlvqpYEFub
 8hZF+6df7H/5ZYnMBLsdLiwh9LGzjUQfCdhU3eekl2yppGI3SCG3hfQKd1Cemij4pSi4
 l7JnN33h0s0JN+enUZSH019qjY4Ic5eRryUxwJg8BrVsbwKGY+qvfAMcNeG6SOTuIt3C DA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6Er+gI9i/erk3lqnCuNb3gG2mXN1WNzB/Xgz2fumEk=;
 b=JTc5YFbWgZmEkdKtwkTVB5RFh6n2cFyTarFFjx7WTyHWGBw8XcmiuvSKfbulQtmR6M/C2OE/E/i8G7zSfTsqGrt6AQ7BKWJLvNxQcBBceJKT9keb4xTrAfLoTDAMIYQLWahO/YTdwON2caofuOvZgisrkd1Hnr46MbOfNIP9hmU=
In-Reply-To: <cover.1641500561.git.christophe.jaillet@wanadoo.fr> (Christophe
        JAILLET's message of "Thu, 6 Jan 2022 22:45:13 +0100")
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: arnd@arndb.de, hch@infradead.org, akpm@linux-foundation.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, davem@davemloft.net, airlied@linux.ie, vkoul@kernel.org, hao.wu@intel.com, trix@redhat.com, mdf@kernel.org, yilun.xu@intel.com, awalls@md.metrocast.net, mchehab@kernel.org, sathya.prakash@broadcom.com, sreekanth.reddy@broadcom.com, suganath-prabu.subramani@broadcom.com, mporter@kernel.crashing.org, alex.bou9@gmail.com, bhelgaas@google.com, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, dmaengine@vger.kernel.org, linux-fpga@vger.kernel.org, linux-media@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, linux-pci@vger.kernel.org, l


Christophe,

> This serie axes all the remaining usages of the deprecated
> "pci-dma-compat.h" API.

Applied patches 10-15 to 5.17/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
