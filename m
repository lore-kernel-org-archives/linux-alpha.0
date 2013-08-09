From: Raghavendra K T <raghavendra.kt@linux.vnet.ibm.com>
Subject: Re: [tip:x86/spinlocks 9/14] include/linux/jump_label.h:181:19: error:
 expected identifier or '(' before 'volatile'
Date: Fri, 09 Aug 2013 13:49:11 +0530
Message-ID: <5204A5FF.6030806@linux.vnet.ibm.com>
References: <52042ceb.J60QORBBBGMLgMj/%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <52042ceb.J60QORBBBGMLgMj/%fengguang.wu@intel.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Andrew Jones <drjones@redhat.com>, "H. Peter Anvin" <hpa@linux.intel.com>, kbuild-all@01.org, linux-alpha@vger.kernel.org

CCed linux-alpha

On 08/09/2013 05:12 AM, kbuild test robot wrote:
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/spinlocks
> head:   b5eaeb3303fc3086f1d04deea48b5dfcfc4344c0
> commit: f66fa98e9d5889b13d957da8f8176f2e3c966df5 [9/14] jump_label: Split out rate limiting from jump_label.h
> config: make ARCH=alpha allyesconfig
>
> All error/warnings:
>
>     In file included from include/linux/static_key.h:1:0,
>                      from include/linux/tracepoint.h:20,
>                      from include/linux/module.h:18,
>                      from sound/pci/korg1212/korg1212.c:28:

This problem is because, alpha has atomic_read macro. I shall send
a patch to convert all the atomic set and read to inline.

Peter, let me know if this sounds good.
(I 'll also check if other archs have macro too for atomic read)

[ problem background: while splitting jump_label does forward
declaration of atomic read which is macro in alpha].





