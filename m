From: Matt Turner <mattst88@gmail.com>
Subject: Re: I'd like to create an alpha-2.6.git tree
Date: Mon, 30 Nov 2009 23:17:36 -0500
Message-ID: <b4198de60911302017r323a5995m806bbe3197d2f37a@mail.gmail.com>
References: <b4198de60911231831u28b887ebo5773f45bcf4d177e@mail.gmail.com>
	 <b4198de60911302006hf385aacm388571303631a6cd@mail.gmail.com>
	 <02FEAADC-D123-431B-97BD-DA4E773A97D8@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=XtEX53rsiH/ypDB+tYYLaB5y17Vyo64RYb4WPO0VSzw=;
        b=Wic8HV5+rBzsxwErWUmTrL27PhAL9WJyNVQzvptVx0ae9AVeXkj5M8Z6F8zgABIlGK
         pxyC/NUE0gklTNbntW612Eti6YktZICe9yqBCf8HL7LFbTJ+b/UqJQoQgaBvxwds5yYm
         hdnUqUQXRmf4Vxep21tCkJwkFQfPR01IkVdbA=
In-Reply-To: <02FEAADC-D123-431B-97BD-DA4E773A97D8@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michael Cree <mcree@orcon.net.nz>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Oliver Falk <oliver@linux-kernel.at>, linux-alpha@vger.kernel.org

On Mon, Nov 30, 2009 at 11:13 PM, Michael Cree <mcree@orcon.net.nz> wro=
te:
> On 1/12/2009, at 5:06 PM, Matt Turner wrote:
>>
>> alpha-2.6.git has been created and is available at
>> http://git.kernel.org/?p=3Dlinux/kernel/git/mattst88/alpha-2.6.git;a=
=3Dsummary
>
> Fan-bloody-tastic!

:D

>> I've added all the patches that I saw and thought were good to go.
>> Please double check that this is the case. :)
>
> Will you pick up my patch to implement minimal software performance e=
vents?
> =A0You will need to modify it to remove the bits applying to tools/pe=
rf as
> they have been picked up by linux-tip.

Sure. I was thinking about this earlier, but wasn't sure of its
status. I'll apply it now.

Thanks Michael!

Matt

> Cheerio
> Michael.
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
