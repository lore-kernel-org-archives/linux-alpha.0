From: Nick Krause <xerofoify@gmail.com>
Subject: Re: FIX ME message in osf_sys.c
Date: Thu, 3 Jul 2014 14:17:15 -0400
Message-ID: <CAPDOMVh_AjUwGt5woz7sipFw=fVusbzkoAn1h+eRavN1PbFwFg@mail.gmail.com>
References: <CAPDOMVj3sJSfgA7hBv9Tx0oz5ZX73robsTZygVJfU_QZ9A65dg@mail.gmail.com>
	<53B59DC2.20809@twiddle.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=5qhrCmogUazO6zVN+Nv7XAzHPDDAGQnVhYOI4izm37I=;
        b=aXftOoSgsdrYBARtLzuyWI1yE1YHK0ZJWhMYFQptf+uvcyaFDs35Yt/0YW8DizXXgX
         7MsoraNzAPMyWhRPgI7j0pNgECMKKLZaR8y86t/y+TOLpRatnhcyQmNow3imzr49E3XI
         f25D5vstG8t4OIeP3/lE2OIs4it5dK8D41Rrj0fQLZsicw9FhbbsC0ELlZMoN+1+5XVP
         C+2q2wwM9YImf/ZyDyOJcJAr6SFzpk6Bcz+JugL8ngLnWqE6KrPY4OyxFizLyzn60o4W
         49FvHcaiysBm+j/P7T8aLVvRbo7ArkuFzRYyBsMiYL9f755hdSzqdrv3NZJDrpbGbb6E
         awmQ==
In-Reply-To: <53B59DC2.20809@twiddle.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: ink@jurassic.park.msu.ru, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

In that case I will sent a patch removing this FIXME line.
Cheers Nick

On Thu, Jul 3, 2014 at 2:15 PM, Richard Henderson <rth@twiddle.net> wrote:
> On 07/03/2014 10:21 AM, Nick Krause wrote:
>> There seems to be a Fix Me message on line 892 due to info.si_addr = NULL.
>> I am wondering what value I should declare this variable to instead of Null.
>> Cheers Nick
>>
>
> The closest thing to compatibility with SIGFPE raised through normal arithmetic
> would be the address of the instruction after the callsys that lead to this
> system call.  Except that's not available without complicating the call to
> osf_setsysinfo, and it doesn't seem worth it.
>
>
> r~
