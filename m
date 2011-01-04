From: Pekka Enberg <penberg@kernel.org>
Subject: Re: [BUG] implicit declaration of kfree/kzalloc in i2c-i801.c on Alpha
Date: Tue, 4 Jan 2011 22:56:18 +0200
Message-ID: <AANLkTikyX3F+NjHVTGVV6rKyJhZQCcb3150-91La0rHs@mail.gmail.com>
References: <20110104061821.GA25886@gherkin.frus.com>
	<AANLkTikOsULOVq01CEiPuoK4-sFTk+KWJiLY0wnzUZ17@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:sender:received
         :in-reply-to:references:date:x-google-sender-auth:message-id:subject
         :from:to:cc:content-type:content-transfer-encoding;
        bh=SR4WFodnTY/4cHwhFn7P5oPTsAQzYHCQG0lZaKd8cUw=;
        b=e0CfichRg4PpKzyn0wkV9RI/s1KDE44xNOBG4bDryxMf2Joxu5b3uxcqjxNoK85yzw
         FnKQ9a+0X5k0qhdTrSl4O6dNTNKbpTgMX5yX3rl4cq96UzJO5VlJmbKkNctbcTetyEFt
         Bp7f1KLu27mozhJ4i9bF/qsW/gISnTZs31ijo=
In-Reply-To: <AANLkTikOsULOVq01CEiPuoK4-sFTk+KWJiLY0wnzUZ17@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Matt Turner <mattst88@gmail.com>
Cc: Bob Tracy <rct@gherkin.frus.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, mcree@orcon.net.nz, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Tue, Jan 4, 2011 at 9:37 PM, Matt Turner <mattst88@gmail.com> wrote:
> On Tue, Jan 4, 2011 at 1:18 AM, Bob Tracy <rct@gherkin.frus.com> wrot=
e:
>> Another 2.6.37-rc8 build failure on alpha:
>>
>> (...)
>> =A0CC [M] =A0drivers/i2c/busses/i2c-i801.o
>> drivers/i2c/busses/i2c-i801.c: In function 'i801_probe':
>> drivers/i2c/busses/i2c-i801.c:737: error: implicit declaration of fu=
nction 'kzalloc'
>> drivers/i2c/busses/i2c-i801.c:737: warning: assignment makes pointer=
 from integer without a cast
>> drivers/i2c/busses/i2c-i801.c:855: error: implicit declaration of fu=
nction 'kfree'
>> make[3]: *** [drivers/i2c/busses/i2c-i801.o] Error 1
>> make[2]: *** [drivers/i2c/busses] Error 2
>> make[1]: *** [drivers/i2c] Error 2
>> make: *** [drivers] Error 2
>>
>> --Bob
>
> Is this specific to alpha? I wonder why we don't see this on other pl=
atforms?

The x86 version of <asm/pci.h> includes <linux/slab.h> which hides the
problem on x86 at least. There was a big cleanup of implicit
<linux/slab.h> inclusions few months ago which has exposed the
problem.

It's a bug in the driver, just add the include there.

                        Pekka
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
