From: Matt Turner <mattst88@gmail.com>
Subject: Re: [BUG] 2.6.37-rc8 build failure on Alpha
Date: Tue, 4 Jan 2011 14:34:00 -0500
Message-ID: <AANLkTi=9xXBk6fgucRCLUdxUaY2PmqANyn8-rw5_Rv7A@mail.gmail.com>
References: <20110103205705.GA24522@gherkin.frus.com> <60180.121.72.232.114.1294094426.squirrel@mail.orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=6qSfuPyR16CNSrFNC7yFO5vP8oa8joH2CFOVMWWakKE=;
        b=ikLQG3ArlHQGUeF8wTSwSXWjT0MmH7ghz3ur3uMUhTPz/DGA3xl77ojarCX80xZMDX
         4LXNWpJKRptx8XPWJmrDcDba+uIE8RhEx3BBCCTpK2RMkA5ewNyCWDp9BfRRK+a9anl/
         eBgr1b/jgXcxomoxm9eK+IV7iBqqn1K/zET6M=
In-Reply-To: <60180.121.72.232.114.1294094426.squirrel@mail.orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michael Cree <mcree@orcon.net.nz>
Cc: Bob Tracy <rct@gherkin.frus.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

On Mon, Jan 3, 2011 at 5:40 PM, Michael Cree <mcree@orcon.net.nz> wrote=
:
> On Tue, January 4, 2011 9:57 am, Bob Tracy wrote:
>> This probably happened before -rc8, but was not an issue for 2.6.36.
>>
>> The 2.6.37-rc8 kernel build on alpha fails as follows:
>>
>> (...)
>> =A0 LD =A0 =A0 =A0usr/built-in.o
>> =A0 AS =A0 =A0 =A0arch/alpha/kernel/entry.o
>> =A0 CC =A0 =A0 =A0arch/alpha/kernel/traps.o
>> cc1: warnings being treated as errors
>> In file included from
>> /usr/src/linux-2.6/arch/alpha/include/asm/mmu_context.h:22,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0from arch/alpha/kernel/traps.c:26=
:
>> /usr/src/linux-2.6/arch/alpha/include/asm/io.h: In function '__set_h=
ae':
>> /usr/src/linux-2.6/arch/alpha/include/asm/io.h:41: error:
>> 'arch_local_irq_save' is static but used in inline function '__set_h=
ae'
>> which is not static
>> /usr/src/linux-2.6/arch/alpha/include/asm/io.h:49: error:
>> 'arch_local_irq_restore' is static but used in inline function '__se=
t_hae'
>> which is not static
>
> A patch that fixes this was posted to linux-alpha some time ago (see
> http://www.spinics.net/linux/lists/linux-alpha/msg00710.html). =A0I a=
m not
> sure why it hasn't made it through to Linus as yet.
>
> Cheers
> Michael.

I haven't had much time for alpha things, so I haven't been keeping up
with patches lately. I'll send everything in my patch queue to Linus
for the .38 merge window.

Please send Ivan's patch to Linus directly, and CC Ivan so he can give
his Signed-off-by tag.

Thanks Michael and Bob.

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
