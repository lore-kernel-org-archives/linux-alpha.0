From: Tony Luck <tony.luck@gmail.com>
Subject: Re: [Suggestion] arch/*/include/asm/bitops.h: about __set_bit() API.
Date: Mon, 10 Jun 2013 15:26:26 -0700
Message-ID: <CA+8MBbK_nfOhZGsd5wU-hyiwh3pHS5c42eiBfxLpCjDgBKUqJg@mail.gmail.com>
References: <51B30285.6020503@asianux.com>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=hfjSFLVs4Y8XNO/ewhqIV7QiB/W2EzPnVFpgwho22do=;
        b=na/DKb8UurLBmaMBf3VdRFgjbAM/lRWfDNY5czorMOT4Cj2BzvVS5OBn8HSFSAuH/3
         2xjyPLrZ2ifovx7dIzEVVlo1mwGCls6oatw+cIcs9oGpafgqnUfJ7RMq9YW4BKF2Utt9
         VMiCxEwJvMR5DDNbHkdXAEDcYkF7jPi05cQnYjGInZHWwOQ8Vkt9A0tb5L2y7oBTGR9H
         8J0vhQsRp391c2pDoJ/btjjDtuN6vFHgUklL+1pyPBxVT2Vw7V7ww4WI9W0kTMGLHmr9
         tS1jhyKcjd+wE3THLUO/fbjJuId0vjrHbtWNwMbJhRQkEyrrN45we0QDnJ5UwjVB0aK/
         j5JA==
In-Reply-To: <51B30285.6020503@asianux.com>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chen Gang <gang.chen@asianux.com>
Cc: Richard Henderson <rth@twiddle.net>, ink@jurassic.park.msu.ru, Matt Turner <mattst88@gmail.com>, "dhowells@redhat.com" <dhowells@redhat.com>, "Yu, Fenghua" <fenghua.yu@intel.com>, yasutake.koichi@jp.panasonic.com, linux-alpha@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, linux-am33-list@redhat.com, Linux-Arch <linux-arch@vger.kernel.org>

On Sat, Jun 8, 2013 at 3:08 AM, Chen Gang <gang.chen@asianux.com> wrote:
> using 'unsigned int *', implicitly:
>   ./ia64/include/asm/bitops.h:63:__set_bit (int nr, volatile void *addr)

There is some downside on ia64 to your suggestion.  If "addr" is properly
aligned for an "int", but misaligned for a long ... i.e. addr%8 == 4, then I'll
take an unaligned reference trap if I work with long* where the current code
working with int* does not.

Now perhaps all the callers do guarantee long* alignment?  But I don't know.

Apart from uniformity, there doesn't see to be any upside to changing this.

-Tony Luck
