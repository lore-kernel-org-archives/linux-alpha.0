From: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 3/3] alpha, drm: Add Alpha support to Radeon DRM code
Date: Tue, 14 Jun 2011 09:35:30 +1000
Message-ID: <BANLkTinvXFV1bObeaym6A4VEcxv0jN+zXQ@mail.gmail.com>
References: <20110609182021.73726ea3.jay.estabrook_gmail.com@gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=ugCHr44KrrPqDEatZoSammXvpntjmxvhj7yxssYHZQM=;
        b=eLDa2+tapmjclpBAln0wgntnZCA3JGaAS8+MjtjvN/4/rkPxaVwHpB2eN1pIXx7LsV
         l2pPsjQ6ZCxMIbLRQ+4LwTMW140FEC0xDuNCr2Y2w6JCUCDDTPeyKAbYqMT5J6sN9PDt
         4Ch1/06H/RVVtcH/TTNlQ94zgHPw3J3WBnsbs=
In-Reply-To: <20110609182021.73726ea3.jay.estabrook_gmail.com@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jay Estabrook <jay.estabrook@gmail.com>
Cc: linux-alpha <linux-alpha@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Matt Turner <mattst88@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, airlied@linux.ie

On Fri, Jun 10, 2011 at 8:20 AM, Jay Estabrook <jay.estabrook@gmail.com> wrote:
>
> Alpha needs to have the system bus address for the device's local
> memory available, so that it can be returned to user-level, where
> it may be used in an mmap(). So, we make bus.addr hold the ioremap()
> return for kernel use, and then we can modify bus.base appropriately.
>

I don't get this. why is mmap passing in an address? we don't do that anymore.

When you mmap the device node it passes back a hashed offset in the
table, that the
kernel then translates into a proper address and sets up the page tables.

So I really don't get what this patch is doing, either the
explaination of what it is doing is wrong
or it is wrong.

Dave.
