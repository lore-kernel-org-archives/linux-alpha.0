From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 7/8] genirq: Return a const cpumask from irq_data_get_affinity_mask
Date: Sun, 3 Jul 2022 17:04:58 +0200
Message-ID: <CAHp75VccKxO+Gtw46GvxSiPo4ShfpaZPOBehAp6gCoq3gT_9Cw@mail.gmail.com>
References: <20220701200056.46555-1-samuel@sholland.org> <20220701200056.46555-8-samuel@sholland.org>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4QgHhJo99e7BP4qELBN4r2lriKbWdLtk6/DKUxmzOGg=;
        b=Vh7pwmFrp/ki5XJ76jyI5hNuUV1PKQWxt+H19V/GLJ3etny3Ed4qf9e0QV9OMyCnks
         +V7tZtdw1VniQ6BdZSdBWajNOZDP/9WVdUA9+J37kLhzlbC4xMvQ7twWstXyRhygrgEk
         OySwdBIMfbZujBrURcg8GdeODfqyyz4SIitS0W7F6ysxNT0VLPBddMx3/a/GvGvQdxvo
         iMowCy/4ZchQtcTLw19pWaXjlYPd52toUo7sie8xXqMfjy5oNYUEW0ViDYOw6PUrk0C5
         G34+Zs4D16S3OjNGlDvG+54xupVbs4o/Tt1NVLksn8dVuCTj0pxBkrj4yh/fdGcgDAoR
         8k/A==
In-Reply-To: <20220701200056.46555-8-samuel@sholland.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Holland <samuel@sholland.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chris Zankel <chris@zankel.net>, Colin Ian King <colin.king@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, Dexuan Cui <decui@microsoft.com>, Florian Fainelli <f.fainelli@gmail.com>, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Haiyang Zhang <haiyangz@microsoft.com>, Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>

On Fri, Jul 1, 2022 at 10:01 PM Samuel Holland <samuel@sholland.org> wrote:
>
> Now that the irq_data_update_affinity helper exists, enforce its use
> by returning a a const cpumask from irq_data_get_affinity_mask.
>
> Since the previous commit already updated places that needed to call
> irq_data_update_affinity, this commit updates the remaining code that
> either did not modify the cpumask or immediately passed the modified
> mask to irq_set_affinity.

When we refer to functions, we use parentheses, e.g. func().

-- 
With Best Regards,
Andy Shevchenko
