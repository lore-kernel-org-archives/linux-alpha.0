From: Pekka Enberg <penberg@kernel.org>
Subject: Re: [BUG] implicit declaration of kfree/kzalloc in i2c-i801.c on Alpha
Date: Tue, 4 Jan 2011 09:15:49 +0200
Message-ID: <AANLkTimMmOugdHFnsO6qvd8U_USmcgz7GDXMQED1GEOE@mail.gmail.com>
References: <20110104061821.GA25886@gherkin.frus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:sender:received
         :in-reply-to:references:date:x-google-sender-auth:message-id:subject
         :from:to:cc:content-type:content-transfer-encoding;
        bh=ZOZWUR0B8gteHgcxpnjUxNG3m8rMyLHbwUjbqlck2y8=;
        b=R7qXR3b73jYOdXWL1pAeRFPOTgTB3+ZthmcBnhXI2wltlNrv36hvLENWeMhoVsonFb
         eTq0YcuqyVHUCoVBmdH2KvZpUgDw1GoAnkZ/sXcBxfUsa3P3sjF8iQrfk9bUuDDFRNpC
         vhWd9y+yVYkW9moj7sHesBsIct+goCg9O7mMg=
In-Reply-To: <20110104061821.GA25886@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bob Tracy <rct@gherkin.frus.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, mcree@orcon.net.nz

On Tue, Jan 4, 2011 at 8:18 AM, Bob Tracy <rct@gherkin.frus.com> wrote:
> Another 2.6.37-rc8 build failure on alpha:
>
> (...)
> =A0CC [M] =A0drivers/i2c/busses/i2c-i801.o
> drivers/i2c/busses/i2c-i801.c: In function 'i801_probe':
> drivers/i2c/busses/i2c-i801.c:737: error: implicit declaration of fun=
ction 'kzalloc'
> drivers/i2c/busses/i2c-i801.c:737: warning: assignment makes pointer =
from integer without a cast
> drivers/i2c/busses/i2c-i801.c:855: error: implicit declaration of fun=
ction 'kfree'
> make[3]: *** [drivers/i2c/busses/i2c-i801.o] Error 1
> make[2]: *** [drivers/i2c/busses] Error 2
> make[1]: *** [drivers/i2c] Error 2
> make: *** [drivers] Error 2

Adding a

  #include <linux/slab.h>

in drivers/i2c/busses/i2c-i801.c should help. Care to send a tested
patch to do that?
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
