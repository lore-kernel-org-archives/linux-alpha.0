From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH v3 6/6] scsi: ipr: Do PCI error checks on own line
Date: Wed, 13 Sep 2023 21:00:11 -0400
Message-ID: <yq1jzstfu2z.fsf@ca-mkp.ca.oracle.com>
References: <20230911125354.25501-1-ilpo.jarvinen@linux.intel.com>
        <20230911125354.25501-7-ilpo.jarvinen@linux.intel.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2023-03-30;
 bh=PhrOtT9oKbjaBUBwJlb3F3CQEiH4a2EsCBteVFN55Rs=;
 b=vD9BqpK83PgndiFOQyBjqmK9UK/XlzkvXgi66ugc8ZGKP3pjvEVOXBpQMN3ysexV27mz
 MeSJ6rm4HecVbRHmJZ1GOnU7mZkDd39ZJ+Y3zoC9VY4aA1qtD/2AFrdOOsr7+Ojn9L/m
 jC1QN5RgPO9hH3hvRlF4VpDKOwz3/yZvy+rDEH6WlnNNxr3MjBt033wcwZTyc9jZG4ot
 m294/WWmlUU5qomOzl66IfVwltENmj4vC+9Q9IQtxCDFPiIaAWmlTs5xho21Gxby68U1
 w/ECNaYvLXr4A5xWHSuryd8n6lhXoQSOeEZS7WB4Juujcr1ClsOZLjIdb7Txt+Y8YzqG EA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhrOtT9oKbjaBUBwJlb3F3CQEiH4a2EsCBteVFN55Rs=;
 b=YkrG0aLjxsUcaROcSub2NguKbr465w+6UNvsAAITQwdnMC3uOOuQ6lw9oSEZwVih6UF/r+T0Pl15f7QNPIqy59962OnRtZShAcMl/xx9XYEAiMCY6ss/fO+SnDqKjD9ejRA2KMskpxdzzSEqx9EDBZ/TCEB03lb/0Tap3wFDSd0=
In-Reply-To: <20230911125354.25501-7-ilpo.jarvinen@linux.intel.com> ("Ilpo
        =?utf-8?Q?J=C3=A4rvinen=22's?= message of "Mon, 11 Sep 2023 15:53:54
 +0300")
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org, Brian King <brking@us.ibm.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 3chas3@gmail.com, dalias@libc.org, glaubitz@physik.fu-berlin.de, ink@jurassic.park.msu.ru, kw@linux.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-atm-general@lists.sourceforge.net, linux-sh@vger.kernel.org, lpieralisi@kernel.org, mattst88@gmail.com, netdev@vger.kernel.org, richard.henderson@linaro.org, toan@os.amperecomputing.com, ysato@users.sourceforge.jp


Ilpo,

> Instead of if conditions with line splits, use the usual error handling
> pattern with a separate variable to improve readability.
>
> No functional changes intended.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering
