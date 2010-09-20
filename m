From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: Re: [PATCH 02/91] arch/alpha/Kconfig Update broken web addresses
 in the arch directory.
Date: Mon, 20 Sep 2010 12:30:26 -0700
Message-ID: <4C97B652.50707@gmail.com>
References: <1283461606-7803-1-git-send-email-justinmattock@gmail.com> <1283461606-7803-3-git-send-email-justinmattock@gmail.com> <AANLkTikDUUoWSWZhtgGyi3QH6uHJz1Op-inH6_V+e21K@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=2+xWXJLhwyb7b/f1RL94iHQifIcKwhp8pI+Cj8woeRw=;
        b=HhWD1Z3hC3gZiJHsPLIfYuHpwAHe/PSmuvyLs4Bi6pgCqyBgCtIiuh72nTAm9P280V
         VXGu1zNMuguEkqCs7/2wqm5BzdtzUMn77R++XJq4zk1bnwUjYsnItn0d/1iaRVeMndrT
         DabM3/krpPTGI1wqr3zTgMBgByVmnck1UfKe0=
In-Reply-To: <AANLkTikDUUoWSWZhtgGyi3QH6uHJz1Op-inH6_V+e21K@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matt Turner <mattst88@gmail.com>
Cc: trivial@kernel.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On 09/02/2010 02:49 PM, Matt Turner wrote:
> On Thu, Sep 2, 2010 at 5:06 PM, Justin P. Mattock
> <justinmattock@gmail.com>  wrote:
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
>>         bool "LX164"
>>         help
>>           A technical overview of this board is available at
>> -<http://www.unix-ag.org/Linux-Alpha/Architectures/LX164.html>.
>> +<http://web.archive.org/web/*/http://www.unix-ag.org/
>> +         Linux-Alpha/Architectures/LX164.html>.
>>
>>   config ALPHA_LYNX
>>         bool "Lynx"
>> @@ -483,7 +484,8 @@ config ALPHA_AVANTI
>>         help
>>           Avanti AS 200, AS 205, AS 250, AS 255, AS 300, and AS 400-based
>>           Alphas. Info at
>> -<http://www.unix-ag.org/Linux-Alpha/Architectures/Avanti.html>.
>> +<http://web.archive.org/web/*/http://www.unix-ag.org/Linux-Alpha/
>> +         Architectures/Avanti.html>.
>>
>>   config ALPHA_BROKEN_IRQ_MASK
>>         bool
>> --
>> 1.7.2.1
>
> Hi Justin,
> These two links are pretty useless. I think we'd do better to remove
> them until we write proper articles for the AlphaLinux.Org Wiki.
>
> Matt
>


with these two urls, instead of removing the whole thing should I just 
use: http://www.alphalinux.org/
this way theirs at-least something there

Justin P. Mattock
