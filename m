From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] asm/uapi: Add definition of TIOC[SG]RS485
Date: Thu, 18 Sep 2014 21:59:58 -0700
Message-ID: <541BB84E.5030705@roeck-us.net>
References: <1411022745-6198-1-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-serial-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=roeck-us.net; s=default;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Subject:To:MIME-Version:From:Date:Message-ID; bh=C5KQy05kPVuhKJxgw82drXMLJcPHylICJkjBeoLi/lw=;
	b=JGV8DrF/p/mNGQNWpzNTwCxWYkhmWMzPD4bdDgdxmoNwwp8bDqGI7F2jM6GENpchN2rt6e9XXCew9Wfy1TCBThpcntsfgtFQXe2nPCVsgaWiDIIb1/DTrz/CYGJHIFv4QYsgOMjLkTX9U3vAoDUkQp2W5o95LcqdOj5z3e8ccjQ=;
In-Reply-To: <1411022745-6198-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-serial-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Greg KH <greg@kroah.com>, linux-serial@vger.kernel.org

On 09/17/2014 11:45 PM, Ricardo Ribalda Delgado wrote:
> Commit: e676253b19b2d269cccf67fdb1592120a0cd0676 (serial/8250: Add
> support for RS485 IOCTLs), adds support for RS485 ioctls for 825_core on
> all the archs. Unfortunaltely the definition of TIOCSRS485 and

s/Unfortunaltely/Unfortunately/

> TIOCGRS485 was missing on the ioctls.h file
>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Otherwise

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   arch/alpha/include/uapi/asm/ioctls.h | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/alpha/include/uapi/asm/ioctls.h b/arch/alpha/include/uapi/asm/ioctls.h
> index 92c557b..f30c94a 100644
> --- a/arch/alpha/include/uapi/asm/ioctls.h
> +++ b/arch/alpha/include/uapi/asm/ioctls.h
> @@ -90,6 +90,8 @@
>   #define TIOCSBRK	0x5427  /* BSD compatibility */
>   #define TIOCCBRK	0x5428  /* BSD compatibility */
>   #define TIOCGSID	0x5429  /* Return the session ID of FD */
> +#define TIOCGRS485	_IOR('T', 0x2E, struct serial_rs485)
> +#define TIOCSRS485	_IOWR('T', 0x2F, struct serial_rs485)
>   #define TIOCGPTN	_IOR('T',0x30, unsigned int) /* Get Pty Number (of pty-mux device) */
>   #define TIOCSPTLCK	_IOW('T',0x31, int)  /* Lock/unlock Pty */
>   #define TIOCGDEV	_IOR('T',0x32, unsigned int) /* Get primary device node of /dev/console */
>

