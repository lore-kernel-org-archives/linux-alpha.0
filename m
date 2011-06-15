From: Jay Estabrook <jay.estabrook@gmail.com>
Subject: Re: [PATCH 3/3] alpha, drm: Add Alpha support to Radeon DRM code
Date: Tue, 14 Jun 2011 22:38:10 -0400
Message-ID: <4DF81B12.2040800@gmail.com>
References: <20110609182021.73726ea3.jay.estabrook_gmail.com@gmail.com> <BANLkTinvXFV1bObeaym6A4VEcxv0jN+zXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=G6jnsdWCsBppd70TXsA2CeOYfmyKsxXA6fdo+EwhoS0=;
        b=QMtR+5Ifsbw4zy4sHPgHQHx/NuBrMfmIHg+KaEFDupQLe3lsUL8ACh/Rc4gYgcyKl9
         ywssKXmWFdqUqFPAbUsgcg3PmfDUOIhlWLQ10q1GypaBUjNXfWGmnE4pV6hJ8773LfzD
         ZFpr/m9b6XsdLQNGvt8EQPbR/mPvyrzezHeKQ=
In-Reply-To: <BANLkTinvXFV1bObeaym6A4VEcxv0jN+zXQ@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dave Airlie <airlied@gmail.com>
Cc: linux-alpha <linux-alpha@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Matt Turner <mattst88@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, airlied@linux.ie

Hi, Dave,

It is the explanation that is inaccurate; I was still thinking about mmap when
the new paradigm is to do the mapping when the VM faults.

I believe the code that requires this patch is: ttm/ttm_bo_vm.c: ttm_bo_vm_fault(),
specifically:

    for (i = 0; i < TTM_BO_VM_NUM_PREFAULT; ++i) {
        if (bo->mem.bus.is_iomem)
            pfn = ((bo->mem.bus.base + bo->mem.bus.offset) >> PAGE_SHIFT) + page_offset;
        else {

The "pfn" needs to reflect the correct system bus address to get to the VRAM
on the graphics card.

I will rework the commentary and resend.

Thanks for the feedback.

Jay


On 06/13/2011 07:35 PM, Dave Airlie wrote:
> On Fri, Jun 10, 2011 at 8:20 AM, Jay Estabrook <jay.estabrook@gmail.com> wrote:
>> Alpha needs to have the system bus address for the device's local
>> memory available, so that it can be returned to user-level, where
>> it may be used in an mmap(). So, we make bus.addr hold the ioremap()
>> return for kernel use, and then we can modify bus.base appropriately.
>>
> 
> I don't get this. why is mmap passing in an address? we don't do that anymore.
> 
> When you mmap the device node it passes back a hashed offset in the
> table, that the
> kernel then translates into a proper address and sets up the page tables.
> 
> So I really don't get what this patch is doing, either the
> explaination of what it is doing is wrong
> or it is wrong.
> 
> Dave.
