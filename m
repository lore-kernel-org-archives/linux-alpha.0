From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] alpha: Add support for BOTHER
Date: Mon, 15 Jun 2015 07:34:58 -0700
Message-ID: <557EE292.4000404@roeck-us.net>
References: <1434378483-12727-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=roeck-us.net; s=default;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:Message-ID; bh=vTOgRl1+0US39wDnFl+72ZTkmVMHZn6Zr44zm5Ig6Zs=;
	b=nepAC/Ew3UpEEmkuoLV5A3iBWWaOlyYJkNR2c05GBy8IshJeHr48TVv4dhr3uqcGa9sc8rfldNEDDLXd4qcut1qCGD2d7lDelhXjXh0Sa4t1po7JqdBcn2Mgla0CU802NcIIFC9Glymzo0qZ8vvT2kZDiEf3yNCUvJlUzqlmRbY=;
In-Reply-To: <1434378483-12727-1-git-send-email-linux@roeck-us.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Richard Henderson <rth@twiddle.net>
Cc: Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>

On 06/15/2015 07:28 AM, Guenter Roeck wrote:
> In -next, alpha:allmodconfig fails to build with
>
> drivers/bluetooth/hci_ldisc.c: In function 'hci_uart_set_baudrate':
> drivers/bluetooth/hci_ldisc.c:276:22: error: 'BOTHER' undeclared
>
> This could be fixed on the user side, but it makes more sense
> to just define BOTHER.
>
> Cc: Marcel Holtmann <marcel@holtmann.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   arch/alpha/include/uapi/asm/termbits.h | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/alpha/include/uapi/asm/termbits.h b/arch/alpha/include/uapi/asm/termbits.h
> index 879dd3589921..0d53d9e2633f 100644
> --- a/arch/alpha/include/uapi/asm/termbits.h
> +++ b/arch/alpha/include/uapi/asm/termbits.h
> @@ -147,6 +147,7 @@ struct ktermios {
>   #define B3000000  00034
>   #define B3500000  00035
>   #define B4000000  00036
> +#define   BOTHER  00037
>
>   #define CSIZE	00001400
>   #define   CS5	00000000
>

Forget about this one, I also need to define IBSHIFT.

Guenter

