From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH] alpha: makefile: don't enforce small data model for kernel builds
Date: Tue, 26 Mar 2013 09:06:44 +1300
Message-ID: <D7731577-A2C0-4FC5-A7E3-62F251A18798@orcon.net.nz>
References: <1363556926-21097-1-git-send-email-will.deacon@arm.com> <BFB01C0A-95E5-4C2B-8AF2-A06BE1FF74E0@orcon.net.nz> <20130325133710.GD14280@mudshark.cambridge.arm.com> <20130325150958.GA13894@skade.schwarzvogel.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20130325150958.GA13894@skade.schwarzvogel.de>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Tobias Klausmann <klausman@schwarzvogel.de>
Cc: "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 26/03/2013, at 4:09 AM, Tobias Klausmann wrote:
> On Mon, 25 Mar 2013, Will Deacon wrote:
>> Any news on these? I've included an updated version of the first  
>> patch, with
>> the Tested-by-tag and a tweaked commit message below.
>
> As a data point, I tried vanilla 3.8.4 on the weekend. With my
> usual config on a UP1500, it will fail at build time with
> relocation errors. If I remove -msmall-data (or replace it with
> ~big~), the machine hangs hard immediatly after aboot telling me
> it's starting it.

You probably want the "alpha: Add irongate_io to to PCI bus resources"  
patch posted by Matt Turner in the linux-alpha forum.  Looks like it  
has not been sent to Linus.

If Matt does not respond in the next day or two I'll collect patches  
and send them on to Linus.

Cheers
Michael.



