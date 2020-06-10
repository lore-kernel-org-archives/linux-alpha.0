From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 01/11] tty/sysrq: alpha: export and use
 __sysrq_get_key_op()
Date: Wed, 10 Jun 2020 13:51:54 -0700
Message-ID: <20200610205154.GA14854@roeck-us.net>
References: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BBQ0kH7eFUEzdi1aOvEKWX8Td5hf8bU8NRtY72Z+54M=;
        b=D+gOK5e5N4uDHgaJEiVzXMr6VuyH27uOIfpnVLZCy5Svn8efbO2h827R3C7PSG9a6K
         nSxI9rCKBM4+edb+ob89dSUUXQZZWJrsEl8UC/4RkIct10qQ6WfwWd8slAvfV1/HlK/4
         ykKf76IVM/KVIwnVtOcQc5SFY3uoVQV1mOixWR7kBTjfcGeM6FFil+FjQMvZX2lH6/fD
         gHslJ0At6A3/MekYWNpXmXm3Vi+6i8d7T3bOXM0tia17DDU08MIcYxt4wKKuf7x2IHoS
         KvHq6vwU+GQ2TNficbOEiCmyrVYunxWWsavQXQOZAWvXa7y+sW3BAUPx/QOpU3y9HdG4
         aA2Q==
Content-Disposition: inline
In-Reply-To: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

On Wed, May 13, 2020 at 10:43:41PM +0100, Emil Velikov wrote:
> Export a pointer to the sysrq_get_key_op(). This way we can cleanly
> unregister it, instead of the current solutions of modifuing it inplace.
> 
> Since __sysrq_get_key_op() is no longer used externally, let's make it
> a static function.
> 
> This patch will allow us to limit access to each and every sysrq op and
> constify the sysrq handling.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jslaby@suse.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: linux-alpha@vger.kernel.org
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---
> Please keep me in the CC list, as I'm not subscribed to the list.
> 
> IMHO it would be better if this gets merged this via the tty tree.

Still observed:

Building alpha:defconfig ... failed
--------------
Error log:
<stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
arch/alpha/kernel/setup.c:434:13: error: initialization of 'void (*)(int)' from incompatible pointer type 'void (*)(void)' [-Werror=incompatible-pointer-types]
  434 |  .handler = machine_halt,
      |             ^~~~~~~~~~~~
arch/alpha/kernel/setup.c:434:13: note: (near initialization for 'srm_sysrq_reboot_op.handler')

I did not see a reply to the initial report. Is this being addressed ?

Guenter
