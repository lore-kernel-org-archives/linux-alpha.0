From: John Garry <john.garry@huawei.com>
Subject: Re: 5.17.0 boot issue on Miata
Date: Mon, 25 Apr 2022 10:26:46 +0100
Message-ID: <2fe555d8-9bb8-59ca-d0c7-d2ad6249f50a@huawei.com>
References: <Yj0u150JJpsb9nj4@gherkin.frus.com> <20220326222157.GA13650@tower>
 <YkuejknyPDJoQEDC@gherkin.frus.com> <20220405050125.GA25969@tower>
 <YkxKRElYUhMgOOCN@gherkin.frus.com>
 <10d61d8f-edfc-fc39-0936-233692464dbd@gmx.de>
 <Yk4XsdHvjrLqN1LR@gherkin.frus.com> <YlAyZdZ6afL58Ege@gherkin.frus.com>
 <Yl5AXvU+cBH5ex4K@gherkin.frus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <Yl5AXvU+cBH5ex4K@gherkin.frus.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bob Tracy <rct@frus.com>, debian-alpha@lists.debian.org
Cc: Michael Cree <mcree@orcon.net.nz>, linux-alpha@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

On 19/04/2022 05:53, Bob Tracy wrote:
> (Adding linux-scsi and linux-kernel, now that bisection is complete.)
> 
> On Wed, Apr 06, 2022 at 05:44:01PM -0500, Bob Tracy wrote:
>> v5.17-rc2 ok.  v5.17-rc3 I get the disk sector errors and hang that I
>> reported in the first message in this thread.
> This is on an Alpha Miata platform (PWS 433au) with QLogic ISP1020 controller.
> 
> Here's the implicated commit:
> 
> edb854a3680bacc9ef9b91ec0c5ff6105886f6f3 is the first bad commit
> commit edb854a3680bacc9ef9b91ec0c5ff6105886f6f3
> Author: Ming Lei<ming.lei@redhat.com>
> Date:   Thu Jan 27 23:37:33 2022 +0800
> 
>      scsi: core: Reallocate device's budget map on queue depth change
>      

Please try v5.18-rc2 as it should have a fix in commit eaba83b5b850

Thanks,
John
