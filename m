From: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Subject: Re: 2.6.7-rc3 from bkcvs doesn't build on Alpha
Date: Mon, 14 Jun 2004 16:13:07 +0400
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20040614161307.A24340@den.park.msu.ru>
References: <cagdss$ab4$1@terminus.zytor.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cagdss$ab4$1@terminus.zytor.com>; from hpa@zytor.com on Sun, Jun 13, 2004 at 02:24:28AM +0000
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-alpha@vger.kernel.org

On Sun, Jun 13, 2004 at 02:24:28AM +0000, H. Peter Anvin wrote:
> First of all, -Werror causes build in arch/alpha/mm to fail, and

Actually, there is a bug in numa.c when CONFIG_BLK_DEV_INITRD is set.
Thanks for pointing that out.

> local symbol 0: discarded in section `.exit.text' from drivers/built-in.o
> make: *** [.tmp_vmlinux1] Error 1

This one is due to the bug in the serial PnP driver: it must use
__devexit_p() wrapper to reference __devexit "remove" function.

Ivan.

--- 2.6/drivers/serial/8250_pnp.c	Mon May 10 06:31:59 2004
+++ linux/drivers/serial/8250_pnp.c	Mon May 10 22:47:45 2004
@@ -437,7 +437,7 @@ static struct pnp_driver serial_pnp_driv
 	.name		= "serial",
 	.id_table	= pnp_dev_table,
 	.probe		= serial_pnp_probe,
-	.remove		= serial_pnp_remove,
+	.remove		= __devexit_p(serial_pnp_remove),
 };
 
 static int __init serial8250_pnp_init(void)
