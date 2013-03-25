From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: makefile: don't enforce small data model for
 kernel builds
Date: Mon, 25 Mar 2013 13:55:28 -0700
Message-ID: <CAEdQ38Hx0fbFW615XhhNwv0Spg4pyeqo7BhiOTV-9CrPenPwNQ@mail.gmail.com>
References: <1363556926-21097-1-git-send-email-will.deacon@arm.com>
 <BFB01C0A-95E5-4C2B-8AF2-A06BE1FF74E0@orcon.net.nz> <20130325133710.GD14280@mudshark.cambridge.arm.com>
 <20130325150958.GA13894@skade.schwarzvogel.de> <D7731577-A2C0-4FC5-A7E3-62F251A18798@orcon.net.nz>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:mime-version:in-reply-to:references:from:date:message-id
         :subject:to:cc:content-type;
        bh=SgCmr18aGUSLnRpjM2KyiHGfAC6jcpb7g18+JmsjwTU=;
        b=jfw4PmJbSlWx5JYjmcMxwFEnQ3FIkR/AcIFZX4qmlUvrl0RBAZ4eZ9syuQPFIVobN7
         Xb48w/G6ViWh0JK2mSXPEGY4Qpdz94MA8AWCaOKNTce6oO/TUpC3tQnvftzY4IBBphju
         WEnC/v12GCINIHB9vBQtOm6DjO2aI84lSR5aLlFOhUJkCnRQL40VdKMMSKKqrhr98nrw
         mpnElZE1uyXINn2hv9TDe0fQiia4WQApEyMUP+OwufKDwHq9LMZOpmXfwBNkkEd/WVtP
         1/4TEyPQlZw2fAiH+zlNt8gx19Yhlh3Q92jNTR9zZRPgR09GT4Qmdm6giJX2IWgLQx8e
         BERA==
In-Reply-To: <D7731577-A2C0-4FC5-A7E3-62F251A18798@orcon.net.nz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: Tobias Klausmann <klausman@schwarzvogel.de>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Mar 25, 2013 at 1:06 PM, Michael Cree <mcree@orcon.net.nz> wrote:
> On 26/03/2013, at 4:09 AM, Tobias Klausmann wrote:
>>
>> On Mon, 25 Mar 2013, Will Deacon wrote:
>>>
>>> Any news on these? I've included an updated version of the first patch,
>>> with
>>> the Tested-by-tag and a tweaked commit message below.
>>
>>
>> As a data point, I tried vanilla 3.8.4 on the weekend. With my
>> usual config on a UP1500, it will fail at build time with
>> relocation errors. If I remove -msmall-data (or replace it with
>> ~big~), the machine hangs hard immediatly after aboot telling me
>> it's starting it.
>
>
> You probably want the "alpha: Add irongate_io to to PCI bus resources" patch
> posted by Matt Turner in the linux-alpha forum.  Looks like it has not been
> sent to Linus.
>
> If Matt does not respond in the next day or two I'll collect patches and
> send them on to Linus.

Yes, please do. I haven't powered on an alpha in a few months.

Matt
