From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH v2 2/6] alpha/extable: use generic search and sort
 routines
Date: Fri, 8 Jan 2016 07:42:49 -0800
Message-ID: <568FD8F9.4050602@twiddle.net>
References: <1452007180-27411-1-git-send-email-ard.biesheuvel@linaro.org>
 <1452007180-27411-3-git-send-email-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=QY+O2JYrJeTYeRAHpkQEldi4nWZyuDfJEoKthnwuDGM=;
        b=g31ZCAwFRrlseT1pZa/XFYEOky9Ynmjgu+igBqlORLZzeEv8vPjW0xnp1tTYIDVic8
         UZZm/6Hhi31yvPsSTryoMJKpDIJB/tImQDbeapDIS2Cb9p0/Qy4NzwEexjWUc/2jz35h
         WuqSU18Z8SZ8IFtExwhMIgJvkb/oblTelrxjzwpH7tj9wdWYUo+TLhLOj1N2yN1bS+cG
         QKPcC9gqp/VF5B/eCrneoHKEDUeiQsCXlXDuYoZokRl4F30sA5ZDTW72gjs17azgGIjZ
         gFlZG086EMYDv2ndDiJ31RjD4ktDWBAgcEXvpZ3n7YAO1eRsZQKlvp7ir4tfAAePig8q
         HdMQ==
In-Reply-To: <1452007180-27411-3-git-send-email-ard.biesheuvel@linaro.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>, akpm@linux-foundation.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, hpa@zytor.com, mingo@redhat.com, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, mattst88@gmail.com, ink@jurassic.park.msu.ru, tony.luck@intel.com, fenghua.yu@intel.com, catalin.marinas@arm.com, will.deacon@arm.com, arnd@arndb.de
Cc: deller@gmx.de, mark.rutland@arm.com

On 01/05/2016 07:19 AM, Ard Biesheuvel wrote:
> Replace the arch specific versions of search_extable() and sort_extable()
> with calls to the generic ones, which now support relative exception
> tables as well.
> 
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> ---
>  arch/alpha/include/asm/uaccess.h | 10 ++-
>  arch/alpha/mm/Makefile           |  2 +-
>  arch/alpha/mm/extable.c          | 92 --------------------
>  3 files changed, 9 insertions(+), 95 deletions(-)

Acked-by: Richard Henderson <rth@twiddle.net>


r~
