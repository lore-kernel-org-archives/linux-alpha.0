From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: add myself to maintainer's list
Date: Wed, 13 Jan 2010 10:24:53 -0500
Message-ID: <b4198de61001130724x24e20901sea667f5a00b59b2f@mail.gmail.com>
References: <1263333020-9050-1-git-send-email-mattst88@gmail.com>
	 <20100113121116.GA16918@jurassic.park.msu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=DlvBGtvIgUimrv1e9QCUovyZqfj14Uy/NPGWAzQNyK4=;
        b=rZZzeVlFvLHtuJ7oEGvxvEWwY5I3zKPb2CNEYQSD51UPhmPiNcLy/puAjwfkBC9XAs
         CUjOWTfo1vAgg6fFxiGKLOQjn+ttFF4GgAPsIJENcgjeX+KDsLyM/+02urH9LskqeeL+
         xK6huLpip5Se4KxyTEez/MIuUHeWy0vx3sWPs=
In-Reply-To: <20100113121116.GA16918@jurassic.park.msu.ru>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>

On Wed, Jan 13, 2010 at 7:11 AM, Ivan Kokshaysky
<ink@jurassic.park.msu.ru> wrote:
> On Tue, Jan 12, 2010 at 04:50:20PM -0500, Matt Turner wrote:
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index c824b4d..69dc9fa 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -406,6 +406,8 @@ M: =A0 =A0 =A0 =A0Richard Henderson <rth@twiddle=
=2Enet>
>> =A0S: =A0 Odd Fixes for 2.4; Maintained for 2.6.
>> =A0M: =A0 Ivan Kokshaysky <ink@jurassic.park.msu.ru>
>> =A0S: =A0 Maintained for 2.4; PCI support for 2.6.
>> +M: =A0 Matt Turner <mattst88@gmail.com>
>> +S: =A0 Patch collector for 2.6.3x+.
>> =A0L: =A0 linux-alpha@vger.kernel.org
>> =A0F: =A0 arch/alpha/
>
> You're welcome.
>
> But while we are here, I'd like to drop these odd mentions of 2.4 whi=
ch
> are just misleading these days...
>
> What about
>
> ALPHA PORT
> M: =A0 =A0 =A0Richard Henderson <rth@twiddle.net>
> M: =A0 =A0 =A0Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> M: =A0 =A0 =A0Matt Turner <mattst88@gmail.com>
> L: =A0 =A0 =A0linux-alpha@vger.kernel.org
> S: =A0 =A0 =A0Maintained
> F: =A0 =A0 =A0arch/alpha/
>
> Ivan.

Sure, I'll make that change when I commit it.

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
