From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: Re: [PATCH 02/91] arch/alpha/Kconfig Update broken web addresses
 in the arch directory.
Date: Thu, 02 Sep 2010 14:46:57 -0700
Message-ID: <4C801B51.9000008@gmail.com>
References: <1283461606-7803-1-git-send-email-justinmattock@gmail.com> <1283461606-7803-3-git-send-email-justinmattock@gmail.com> <20100902141012.9769b977.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=PF6VJcPqE515/e0isRaiQZ16tqH/9BleksPHtqREqhs=;
        b=Qc1YMso5xY2BwgYtJTK1pplEEa5hMg+OG48oU5qnIhR6/UuMLIBavsGh6tcLUJmb1W
         qBkuUI2yZ/doOTjQBvWG++BkFfjomsuh/3ZjD3Nb26w4E7TOFbGAvh4j+bSYqJ9f8rie
         Fp/XMes31DnUHA4jaRecbVGT+9OEfJVZ2HIuc=
In-Reply-To: <20100902141012.9769b977.rdunlap@xenotime.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: trivial@kernel.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, jkosina@suse.cz

On 09/02/2010 02:10 PM, Randy Dunlap wrote:
> On Thu,  2 Sep 2010 14:06:33 -0700 Justin P. Mattock wrote:
>
>> The below patch updates a broken web address that is no longer
>> working due to company buyout, and/or change of location.
>> (Please have a look through, and let me know if any of them
>> need to be changed, and I'll resend an updated patch).
>>
>> Signed-off-by: Justin P. Mattock<justinmattock@gmail.com>
>>
>> ---
>>   arch/alpha/Kconfig |    6 ++++--
>>   1 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
>> index b9647bb..16ae162 100644
>> --- a/arch/alpha/Kconfig
>> +++ b/arch/alpha/Kconfig
>> @@ -219,7 +219,8 @@ config ALPHA_LX164
>>   	bool "LX164"
>>   	help
>>   	  A technical overview of this board is available at
>> -	<http://www.unix-ag.org/Linux-Alpha/Architectures/LX164.html>.
>> +	<http://web.archive.org/web/*/http://www.unix-ag.org/
>> +	  Linux-Alpha/Architectures/LX164.html>.
>>
>>   config ALPHA_LYNX
>>   	bool "Lynx"
>> @@ -483,7 +484,8 @@ config ALPHA_AVANTI
>>   	help
>>   	  Avanti AS 200, AS 205, AS 250, AS 255, AS 300, and AS 400-based
>>   	  Alphas. Info at
>> -	<http://www.unix-ag.org/Linux-Alpha/Architectures/Avanti.html>.
>> +	<http://web.archive.org/web/*/http://www.unix-ag.org/Linux-Alpha/
>> +	  Architectures/Avanti.html>.
>>
>>   config ALPHA_BROKEN_IRQ_MASK
>>   	bool
>> --
>
> I wouldn't split long URLs, regardless of any column limit _guidelines_.
>
> ---
> ~Randy
> *** Remember to use Documentation/SubmitChecklist when testing your code ***
>

yeah that's what I was going by..(theres a few in here that do this)I'll 
go through and fix those up.

Justin P. Mattock
