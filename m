From: Nicholas Piggin <npiggin@gmail.com>
Subject: [RFC PATCH 0/6] Implement MMU_LAZY_TLB_SHOOTDOWN for alpha
Date: Thu, 25 May 2023 03:18:16 +1000
Message-ID: <20230524171822.177133-1-npiggin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684948715; x=1687540715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ncto795Pkenn5ADtTHrtUXOk59yhvX99AT0T/piavMI=;
        b=JTONNMSFtHFzYhwb9qJBuZdT7SpQESQepxPn+Q9M6cly+DItAU12yQdflWx+9/ouv+
         mDeFzYIw/YYKtRQMDVV/Yzf/8hSxRvluGyTIOrR0DVoLRUP3xy9TxPBhugP2ktsz40dh
         ngnh0/XzTvxuEEmCJj3ZaWjAv7/0E3D9ojJ7ISKpcb8cQQTWz51X335oSoKTXHZUnfSE
         h7C/dja+JpMsFcfRapPk9D3xmAiL7YiC/UxXuZ0DvGIHeDrBdtmvv5E0O2z4hlOVATLv
         A4KIwCeR+wy39yiyUcS1f4KbAZLrEA9KjRZdkT2FjV5z0kI4u5eMVzadLMn8j7xrdaeJ
         xRMA==
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>

Hi,

I started looking at alpha TLB flushing a while back with the aim of
converting another architecture to this option. powerpc has fairly
complicated MMU and TLB code so I thought it would be good to have a
simpler reference architecture.

alpha had SMP QEMU support, TLB flushing that's fairly simple, and it
doesn't use mm_cpumask in a complicated way, so it fits.

These patches work for me, but only tested on QEMU so that's not saying
too much when it comes to race conditions, so some healthy skepticism
is recommended.

Any thoughts about the series would be interesting to hear.

Thanks,
Nick

Nicholas Piggin (6):
  alpha: remove extern inline from mmu_context
  alpha: implement simple mm_cpumask TLB flush filter
  alpha: remove TLB flushing mm_users special case
  alpha: clean mm_cpumask when flushing TLBs
  alpha: enable MMU_LAZY_TLB_SHOOTDOWN
  alpha: shoot the lazy tlb mm when flushing TLBs

 arch/alpha/Kconfig                   |   1 +
 arch/alpha/include/asm/mmu_context.h |  43 +++++-----
 arch/alpha/include/asm/tlbflush.h    |   3 +
 arch/alpha/kernel/smp.c              | 120 ++++++++++++++-------------
 arch/alpha/mm/init.c                 |   2 +
 5 files changed, 94 insertions(+), 75 deletions(-)

-- 
2.40.1

