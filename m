From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 4/4] alpha: Use absolute_pointer for strcmp on fixed
 memory location
Date: Sun, 12 Sep 2021 13:37:26 -0700
Message-ID: <0f36c218-d79c-145f-3368-7456dd39a3f2@roeck-us.net>
References: <20210912160149.2227137-1-linux@roeck-us.net>
 <20210912160149.2227137-5-linux@roeck-us.net>
 <CAHk-=wi1=8shingNuo1CtfJ7eDByDsmwsz750Nbxq=7q0Gs+zg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sGO52QCbtTKYdjcgj2GabgzNcLXhaoNx+6K218Q6YKM=;
        b=BoFoBk6YCh+SHOSsUgl2enC7/u2I2Bj4b7E3MP/cJEMdjyirzvoalq82dA+5XeNWwl
         /4MX3K/6+Xlj40bcX+GF4RP8Np3PeD5WLjyuCNRAh/yUxFLrsFfGqZHVTX+4voCDXThQ
         NtCPmvzn6p+zmvtMjAf39/fOY68oVD2yl1mYDt0TXnPjWiPfwLnBaXyNVrTevhQVK5pD
         aw64A7C41B/zB54y/F7R6iae8wdcyUP5mhh/68BIQ4hchpPoT6t+dOxtutYlJ8dqp3XS
         yjBSGiq5nQNB+jK0YfSdbGNqMPP3srkCCqL2YC3AJg3enTDIsnt4wkcbYUuMIGJkyi31
         IwEQ==
Sender: Guenter Roeck <groeck7@gmail.com>
In-Reply-To: <CAHk-=wi1=8shingNuo1CtfJ7eDByDsmwsz750Nbxq=7q0Gs+zg@mail.gmail.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org, Netdev <netdev@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>

On 9/12/21 12:13 PM, Linus Torvalds wrote:
> On Sun, Sep 12, 2021 at 9:02 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> -       if (strcmp(COMMAND_LINE, "INSTALL") == 0) {
>> +       if (strcmp(absolute_pointer(COMMAND_LINE), "INSTALL") == 0) {
> 
> Again, this feels very much like treating the symptoms, not actually
> fixing the real issue.
> 
> It's COMMAND_LINE itself that should have been fixed up, not that one use of it.
> 
> Because the only reason you didn't get a warning from later uses is
> that 'strcmp()' is doing compiler-specific magic. You're just delaying
> the inevitable warnings about the other uses of that thing.
> 

COMMAND_LINE is, for whatever reason, defined in
arch/alpha/include/uapi/asm/setup.h, ie in the uapi.

Can I even touch that ?

Guenter
