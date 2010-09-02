From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: Re: [PATCH 82/91] arch/mips/Kconfig Update broken web addresses in
 the arch directory.
Date: Thu, 02 Sep 2010 15:10:10 -0700
Message-ID: <4C8020C2.2080204@gmail.com>
References: <1283462022-8024-1-git-send-email-justinmattock@gmail.com> <1283462022-8024-7-git-send-email-justinmattock@gmail.com> <alpine.LFD.2.00.1009022247190.410@eddie.linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=324n1Angj0jpgrcM6DlocQ8mSSRG3Xm1hsV961C/hIc=;
        b=wfXH3jmyZQKFOJuqGB30JO4IwP/gPjCs+JcektNctGDnuLVV1D6Zhhmh7PZ6shGglu
         zh3r++A3Hx16oosDPD1o7XxOeCMBbYnSbRyHCB47hZ+U06kBxNmFpfhtSngie7ndFmlu
         RWwIbR4CA8ZhhLdz05Bc/86hTR++h7oTJzoPk=
In-Reply-To: <alpine.LFD.2.00.1009022247190.410@eddie.linux-mips.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: trivial@kernel.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, jkosina@suse.cz

On 09/02/2010 02:53 PM, Maciej W. Rozycki wrote:
> On Thu, 2 Sep 2010, Justin P. Mattock wrote:
>
>> The below patch updates a broken web address that is no longer
>> working due to company buyout, and/or change of location.
>> (Please have a look through, and let me know if any of them
>> need to be changed, and I'll resend an updated patch).
>>
>> Signed-off-by: Justin P. Mattock<justinmattock@gmail.com>
>>
>> ---
>>   arch/mips/Kconfig |    3 ++-
>>   1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>> index 3ad59dd..984b14e 100644
>> --- a/arch/mips/Kconfig
>> +++ b/arch/mips/Kconfig
>> @@ -2178,7 +2178,8 @@ config TC
>>   	  TurboChannel is a DEC (now Compaq (now HP)) bus for Alpha and MIPS
>>   	  processors.  Documentation on writing device drivers for TurboChannel
>>   	  is available at:
>> -	<http://www.cs.arizona.edu/computer.help/policy/DIGITAL_unix/AA-PS3HD-TET1_html/TITLE.html>.
>> +	<http://web.archive.org/web/*/http://www.cs.arizona.edu/computer.help/
>> +	  policy/DIGITAL_unix/AA-PS3HD-TET1_html/TITLE.html>.
>>
>>   #config ACCESSBUS
>>   #	bool "Access.Bus support"
>
>   This is more<linux-mips@linux-mips.org>; we don't have TURBOchannel
> support for the Alpha (yet?).
>
>   Anyway, a better source should be available; let me see.  Also the
> original document could not have been the most appropriate one -- it looks
> more like a Digital Unix reference, while a set of hardware- and
> firmware-level documents used to be available for TURBOchannel devices
> (and HP probably still publishes them by inertia ;) ).
>
>   Either way, thanks for tracking down these broken links.
>
>    Maciej
>


I'm not sure about the turbo'ness :-)
the webarchive had it there so I just used it.(some sites actually are 
not even archived to my amazement) in any case I'll use what you posted
and resend and the proper time.

Justin P. Mattock
