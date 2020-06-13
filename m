From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: Fix build around srm_sysrq_reboot_op
Date: Fri, 12 Jun 2020 17:29:42 -0700
Message-ID: <CAEdQ38G_uCPiZ5voj5QP5H0sPUZjASWLLRGQ=VYaWgo+8FekPw@mail.gmail.com>
References: <20200611091139.8525-1-joro@8bytes.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HombnuJvbLxDTQ6sqGxdyIkWc6G1lg94qCABceA1Ino=;
        b=VPt/wr9bW7x5xMg3i821agO69xeL0wlCpPbQ465okWfllTGeLkNhlt+/90pxMfhr3d
         myUX3fSJB3N2nWypqya2H9kJF4EKbVOdQeO2ye2hYmot//7HbzbrEwdJLxPBwhY/4bgm
         2CRpCCR44bMqXlPZjvMiaK+P5nNfS+UPfTYnKEU0MhiOiKYWMVwq8TVXIIn1R8IbrPJg
         PNj7CnoGOwV4K5W5FPJ8ilQtQeIM+tXC123TWUTSAQhrzfOwprKdHYSXL5MIrrAWcVk0
         cJhrOWspDDeQ55dgvfFY7Y4fGSWc3TpLCzanOZXzs2/gM+FsP69b9WkPOJ34KJ5P59SP
         Whuw==
In-Reply-To: <20200611091139.8525-1-joro@8bytes.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro@8bytes.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Linus Torvalds <torvalds@linux-foundation.org>, linux-alpha <linux-alpha@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Joerg Roedel <jroedel@suse.de>, Emil Velikov <emil.l.velikov@gmail.com>, Guenter Roeck <linux@roeck-us.net>

On Thu, Jun 11, 2020 at 2:14 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> From: Joerg Roedel <jroedel@suse.de>
>
> The patch introducing the struct was probably never compile tested,
> because it sets a handler with a wrong function signature. Wrap the
> handler into a functions with the correct signature to fix the build.
>
> Fixes: 0f1c9688a194 ("tty/sysrq: alpha: export and use __sysrq_get_key_op()")
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---

Thanks, applied.
