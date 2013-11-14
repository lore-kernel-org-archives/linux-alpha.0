From: Chen Gang <gang.chen@asianux.com>
Subject: Re: [PATCH] arch: alpha: uapi: be sure of "_UAPI" prefix for all
 guard macros
Date: Thu, 14 Nov 2013 11:05:11 +0800
Message-ID: <52843DE7.8020705@asianux.com>
References: <527B111C.7030303@asianux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <527B111C.7030303@asianux.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "dhowells@redhat.com" <dhowells@redhat.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Paul McKenney <paulmck@linux.vnet.ibm.com>, mcree@orcon.net.nz, Dave Jones <davej@redhat.com>, sandeen@redhat.com, Al Viro <viro@zeniv.linux.org.uk>, ak@linux.intel.com
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, alpha <linux-alpha@vger.kernel.org>

On 11/07/2013 12:03 PM, Chen Gang wrote:
> For all uapi headers, need use "_UAPI" prefix for its guard macro
> (which will be stripped by "scripts/headers_installler.sh").
> 
> Also delete the redundant files (ipcbuf.h, kvm_para.h, and poll.h)
> which are already in Kbuild.
> 

Oh, sorry, need use 'generic-y' instead of 'header-y' in Kbuild, I will
send patch v2 for it.

Thanks.
-- 
Chen Gang
