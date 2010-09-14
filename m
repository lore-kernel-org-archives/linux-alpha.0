From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH 05/18] alpha: kill big kernel lock
Date: Tue, 14 Sep 2010 16:12:20 -0400
Message-ID: <AANLkTikAfnT8kdcaB8-FSb95UX7hbD3KY81D42-f9w2p@mail.gmail.com>
References: <1284492909-7147-1-git-send-email-arnd@arndb.de>
 <1284492909-7147-6-git-send-email-arnd@arndb.de> <AANLkTi=XfNe8=u3c4BiOOSzKw0f7Kh7tcS7njrwFDD3B@mail.gmail.com>
 <201009142207.47272.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=W3I1fnLBiZ4ydwrLdVmRE1P2gd8lZJQgjPtNhk75vzk=;
        b=AligWttILeT41LE0vXg2o9A6eyp0TZ6TOBI/C4A6fJd6VwyLhuJWO1i/W9Ey9mlHCw
         w8KrQbck9gffFqPn6qgIa9VVjzRl4AiVkaX1S1K7nIGEgqFcgujnUWD+TbBnMosBTfxA
         kwRCdWXmXIjtl1ZgbfnGvr1+Q/XGfr1q1K5ZQ=
In-Reply-To: <201009142207.47272.arnd@arndb.de>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org

On Tue, Sep 14, 2010 at 4:07 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tuesday 14 September 2010 21:41:01 Matt Turner wrote:
>> I can apply this without any other patches in the series, since the
>> usage is bogus, right?
>
> Yes, definitely.
>
> =A0 =A0 =A0 =A0Arnd

Will do so then. Thanks for the patch!
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
