From: Maciej Rutecki <maciej.rutecki@gmail.com>
Subject: Re: [BUG] implicit declaration of kfree/kzalloc in i2c-i801.c on Alpha
Date: Tue, 4 Jan 2011 22:10:29 +0100
Message-ID: <201101042210.30076.maciej.rutecki@gmail.com>
References: <20110104061821.GA25886@gherkin.frus.com>
Reply-To: maciej.rutecki@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:reply-to:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=Fi5OEjrx3knga7zxV4pYG0gp1Kl73w2gjVpndCxksBk=;
        b=i0WFtPkjVRMcpHTGE0zEQY8kc2n+hIBAWoUPqfpPHsCkMw0R+0nwtz16/RSqsyUCmW
         qoa08H6ouIqh2kZKtvoBg+bHVMMt2goAD8QiD68rGXXpZVkRVf1L2nWFwYchG3qAu+oL
         HZxtW/1DXYxhNpHTdviyNb6NDm+OcPHbm36iE=
In-Reply-To: <20110104061821.GA25886@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Bob Tracy <rct@gherkin.frus.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, mcree@orcon.net.nz

I created a Bugzilla entry at 
https://bugzilla.kernel.org/show_bug.cgi?id=26132
for your bug report, please add your address to the CC list in there, thanks!

On wtorek, 4 stycznia 2011 o 07:18:21 Bob Tracy wrote:
> Another 2.6.37-rc8 build failure on alpha:
> 
> (...)
>   CC [M]  drivers/i2c/busses/i2c-i801.o
> drivers/i2c/busses/i2c-i801.c: In function 'i801_probe':
> drivers/i2c/busses/i2c-i801.c:737: error: implicit declaration of function
> 'kzalloc' drivers/i2c/busses/i2c-i801.c:737: warning: assignment makes
> pointer from integer without a cast drivers/i2c/busses/i2c-i801.c:855:
> error: implicit declaration of function 'kfree' make[3]: ***
> [drivers/i2c/busses/i2c-i801.o] Error 1
> make[2]: *** [drivers/i2c/busses] Error 2
> make[1]: *** [drivers/i2c] Error 2
> make: *** [drivers] Error 2
> 
> --Bob
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

-- 
Maciej Rutecki
http://www.maciek.unixy.pl
