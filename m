From: Matt Turner <mattst88@gmail.com>
Subject: Re: [stable] [PATCH 1/3] Fix call to replaced SuperIO functions
Date: Thu, 23 Sep 2010 15:24:46 -0400
Message-ID: <AANLkTimowDKQL_6y2ZxVSJSoye2B8rfgyRbKOMcoyPWp@mail.gmail.com>
References: <1284005311-15698-1-git-send-email-mattst88@gmail.com> <20100923183907.GT23040@kroah.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=Hw875fVKaETet3dPEnqwPhQhtoLHvkguxx+sTtuADbE=;
        b=ZaXx+rFQBBn90lXwhPvu0dDMJ/RnvQEPdOTBQ4PJVvHUUbi+7xze9jxFEwbeec23ed
         WRJjUQ+xMgI1B9mamB5tG/YpNkoW8yILU4p2RI+usMyeRLU/o0BcXKPjUEusgtA+qn3H
         ZQxcZQkFMNXbrofwKbWujwkpBmjtGhsKH02Uw=
In-Reply-To: <20100923183907.GT23040@kroah.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Greg KH <greg@kroah.com>
Cc: stable@kernel.org, "Morten H. Larsen" <m-larsen@post6.tele.dk>, linux-alpha@vger.kernel.org

On Thu, Sep 23, 2010 at 2:39 PM, Greg KH <greg@kroah.com> wrote:
> On Thu, Sep 09, 2010 at 12:08:31AM -0400, Matt Turner wrote:
>> From: Morten H. Larsen <m-larsen@post6.tele.dk>
>>
>> This patch fixes the failure to compile Alpha Generic because of
>> previously overlooked calls to ns87312_enable_ide(). The function ha=
s
>> been replaced by newer SuperIO code.
>>
>> Tested-by: Michael Cree <mcree@orcon.net.nz>
>> Signed-off-by: Morten H. Larsen <m-larsen@post6.tele.dk>
>> Signed-off-by: Matt Turner <mattst88@gmail.com>
>> ---
>> This is a build fix for a regression introduced by 932e0c201d28a728e=
25d3b64.
>> It therefore only applies to 2.6.35-stable.
>
> Why isn't it also relevant to Linus's tree for .36 and beyond?
>
> Or is this the same as 59b25ed91400ace98d6cf0d59b1cb6928ad5cd37 in
> Linus's tree? =A0If so, please let me know that, it's important. =A0I=
've
> gone and applied that commit, if that is incorrect, please let me kno=
w.
>
> thanks,
>
> greg k-h
>

Yes, it's the same as 59b25ed91400ace98d6cf0d59b1cb6 in Linus' tree.

Thanks Greg!
Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
