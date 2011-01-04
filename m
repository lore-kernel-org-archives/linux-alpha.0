From: Matt Turner <mattst88@gmail.com>
Subject: Re: [BUG] implicit declaration of kfree/kzalloc in i2c-i801.c on Alpha
Date: Tue, 4 Jan 2011 14:37:00 -0500
Message-ID: <AANLkTikOsULOVq01CEiPuoK4-sFTk+KWJiLY0wnzUZ17@mail.gmail.com>
References: <20110104061821.GA25886@gherkin.frus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=TJHusPGASNdtUubqnASW/4MIfGYjf+OmJn6bH5OkJsU=;
        b=rsZyrXBwslsp9cNpDjdJ28pwBcPQuc8eZvZHBVLHXIPZiWulalJtFJN9VTX9cJ5Wew
         81TxtTbZFSvukbU44AkK/sLRa18YEwGe/aNy0xACNtohfuM4ijPpATBvRSe/eeyQEPIf
         alLoL8CTj9equvLm8GKzCPDudMKLVrjClyvyw=
In-Reply-To: <20110104061821.GA25886@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bob Tracy <rct@gherkin.frus.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, mcree@orcon.net.nz

On Tue, Jan 4, 2011 at 1:18 AM, Bob Tracy <rct@gherkin.frus.com> wrote:
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
>
> --Bob

Is this specific to alpha? I wonder why we don't see this on other plat=
forms?

Thanks Bob,
Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
