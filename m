From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 2/7] rwsem-spinlock: Add killable versions of
 rwsem_down_read_failed()
Date: Thu, 6 Jul 2017 10:04:47 +0200
Message-ID: <20170706080447.a7emouoysilqex4p@hirez.programming.kicks-ass.net>
References: <149789463636.9059.16943955939303454611.stgit@localhost.localdomain>
 <149789534632.9059.2901382369609922565.stgit@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=gX0p4vQuHBw8QOftdpwo+sr6jTpAiSyGgPUIRHR2OE8=; b=Zafbfbt9XbLczvyne/FEAJyLQ
        kiWN9wQxtVXI1PeTSon+u7LIV5FTkLSqfPXwAzwGnC2cmipdaSaSRV/qpxFN1jrebL51I1F8vyN1G
        XM2rLdtfiBON2b2YQOMmd9ZREIumM1jtaJMic8a370gFPli1kL5f71eIonhqN62G35k4lkd6CMaBS
        PHqMghwekQs3rfJ5dsXcC5iP8BovM4QBF0w3RwYkzgdsL5fwYB2gkjgg6nsu8m+DhcOZXvW4e35wB
        dOMH+aNI8s/L51kiI7DhtUHqeNZ6Uy3b2//JzDadTQPJ6Zz14gaCSvxnHqe++XnoqQ4TxbA7eG3wK
    
Content-Disposition: inline
In-Reply-To: <149789534632.9059.2901382369609922565.stgit@localhost.localdomain>
Sender: linux-ia64-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kirill Tkhai <ktkhai@virtuozzo.com>
Cc: linux-ia64@vger.kernel.org, avagin@virtuozzo.com, heiko.carstens@de.ibm.com, hpa@zytor.com, gorcunov@virtuozzo.com, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, mingo@redhat.com, mattst88@gmail.com, fenghua.yu@intel.com, arnd@arndb.de, ink@jurassic.park.msu.ru, tglx@linutronix.de, rth@twiddle.net, tony.luck@intel.com, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, schwidefsky@de.ibm.com, davem@davemloft.net

On Mon, Jun 19, 2017 at 09:02:26PM +0300, Kirill Tkhai wrote:

> Subject: [PATCH 2/7] rwsem-spinlock: Add killable versions of rwsem_down_read_failed()

>  kernel/locking/rwsem-xadd.c |   33 ++++++++++++++++++++++++++++++---

Fixed that subject for your ;-)
