From: Alexander Rauth <Alexander.Rauth@promotion-ie.de>
Subject: [alpha] linux-2.6.10-rc1-bk20 compile error
Date: Thu, 11 Nov 2004 20:49:30 +0100
Message-ID: <1100202570.26565.3.camel@pro30.local.promotion-ie.de>
Reply-To: Alexander.Rauth@promotion-ie.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: linux-alpha <linux-alpha@vger.kernel.org>


error appears with linux-2.6.10-rc1-bk20:

  CC      arch/alpha/kernel/setup.o
arch/alpha/kernel/setup.c: In function `setup_arch':
arch/alpha/kernel/setup.c:597: warning: implicit declaration of function
`__sysrq_get_key_op'
arch/alpha/kernel/setup.c:597: warning: initialization makes pointer
from integer without a cast
make[1]: *** [arch/alpha/kernel/setup.o] Error 1
make: *** [arch/alpha/kernel] Error 2

-- 
Alexander Rauth <Alexander.Rauth@promotion-ie.de>
Pro/Motion Industrie-Elektronik GmbH

