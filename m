From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 01/11] tty/sysrq: alpha: export and use
 __sysrq_get_key_op()
Date: Mon, 8 Jun 2020 07:38:54 -0700
Message-ID: <20200608143854.GA140781@roeck-us.net>
References: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LHVYkeIA74fsa82ThfKsW3dCbekWTk6QgoIVYqEvnVM=;
        b=rR/NFJmDXm26CdXkCHmyqaovvj3YmyuK0TZIZX2y8lBhWId9hpWyfXiPIGaev1NnOp
         0/OMshzfj6wI5lAFEgTWH/Jo3x6w6yiXWi1M41vux7OklTuiMz+Db/dM92egpXTWyvhi
         gpUxQ6TGCuKTiIJ4Nr/9+TdtaVqu25FX4vU3JX1aEURxvWP7gKtEjV/tDro0Vog41RTd
         UOeA3gccNDwS6Rr3EBPjKbQEsXiGgZ3aow7DFH2DMvyGDjSlTDURRk91+oxBKBhbdkA7
         CNPDl6R9/IcvSXM/OVXKlxwZM0WO1UrkMV/REcYe4o3/yWj5F13XYlqlLamZr0V6W704
         KTfQ==
Content-Disposition: inline
In-Reply-To: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
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

This patch results in:

Building alpha:defconfig ... failed
--------------
Error log:
<stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
arch/alpha/kernel/setup.c:435:13: error: initialization of 'void (*)(int)' from incompatible pointer type 'void (*)(void)'

... which does make me wonder if it was even build tested.

Guenter

---
# bad: [af7b4801030c07637840191c69eb666917e4135d] Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
# good: [3b69e8b4571125bec1f77f886174fe6cab6b9d75] Merge tag 'sh-for-5.8' of git://git.libc.org/linux-sh
git bisect start 'HEAD' '3b69e8b45711'
# good: [77f55d1305c11fb729b88f2c3f7881ba0831fa6f] staging: rtl8723bs: Use common packet header constants
git bisect good 77f55d1305c11fb729b88f2c3f7881ba0831fa6f
# bad: [f558b8364e19f9222e7976c64e9367f66bab02cc] Merge tag 'driver-core-5.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core
git bisect bad f558b8364e19f9222e7976c64e9367f66bab02cc
# good: [ca681aa49200422a4144ee376a2079a9f717bf11] Merge tag 'usb-for-v5.8' of git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb into usb-next
git bisect good ca681aa49200422a4144ee376a2079a9f717bf11
# bad: [a1b44ea340b21c99b34c93acad233da727cb88ba] tty: serial: qcom_geni_serial: Add 51.2MHz frequency support
git bisect bad a1b44ea340b21c99b34c93acad233da727cb88ba
# good: [e0a851fe6b9b619527bd928aa93caaddd003f70c] serial: 8250: Avoid error message on reprobe
git bisect good e0a851fe6b9b619527bd928aa93caaddd003f70c
# bad: [57626ff1c9135211b92dfbea1923333c7b6dd12c] tty: n_gsm: Remove unnecessary test in gsm_print_packet()
git bisect bad 57626ff1c9135211b92dfbea1923333c7b6dd12c
# bad: [675cacf11462f112ab13d57e1163082161ef8708] MIPS: constify sysrq_key_op
git bisect bad 675cacf11462f112ab13d57e1163082161ef8708
# bad: [0f1c9688a194d22bb81953bd85bd18b0115fd17f] tty/sysrq: alpha: export and use __sysrq_get_key_op()
git bisect bad 0f1c9688a194d22bb81953bd85bd18b0115fd17f
# good: [7b668c064ec33f3d687c3a413d05e355172e6c92] serial: 8250: Fix max baud limit in generic 8250 port
git bisect good 7b668c064ec33f3d687c3a413d05e355172e6c92
# good: [beca62c4212ade1516a526784adf7f7d99c7f3d9] tty: mxser: make mxser_change_speed() return void
git bisect good beca62c4212ade1516a526784adf7f7d99c7f3d9
# first bad commit: [0f1c9688a194d22bb81953bd85bd18b0115fd17f] tty/sysrq: alpha: export and use __sysrq_get_key_op()
