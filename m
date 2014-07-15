From: Nick Krause <xerofoify@gmail.com>
Subject: Re: [PATCH 6/6] alpha: Join lines 90 and 91
Date: Tue, 15 Jul 2014 15:19:42 -0400
Message-ID: <CAPDOMVgJN5wC0yUQrRi8p7dyBz711_ZLFS+op78HsUaCj2U8eA@mail.gmail.com>
References: <1405448304-3724-1-git-send-email-xerofoify@gmail.com>
	<1405448304-3724-6-git-send-email-xerofoify@gmail.com>
	<yw1xzjgaa1vg.fsf@unicorn.mansr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=EodY/Bny/nXjwn6heZihe3cVzJzdUyNI6qWewBhssKQ=;
        b=ub/SZn6rsiMUgbkk5NK5NIfLs3y37qNCo44LeKdKLsamK5FLRXBf8KgsBgNEwYcrmE
         SwHdO/LSswsTJ+aO2bHy+czG13DIBLBuK765921WbI9BCy8vIhJdTN2aLjqTqGoQr7cm
         l2GM3n+kLkV+NLXEdLKYJTcETRP9hbKg/GO8QjTw0pCT3LkpfrnQXEBeOrZ6+KikKFES
         htWNLbhZHgmNkiYO1UBHYNCkJvajwE2q/gznYqRA65QvMn5ZaCUSagv0NQQRulFps8Xh
         +HRUyQcM1TfRJO1VyGNX5tW4GRSXWWyf+QxgSKKHiMmVwwgQeS82CzhDHZ39yH6TolAB
         Kbvg==
In-Reply-To: <yw1xzjgaa1vg.fsf@unicorn.mansr.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="euc-kr"
To: =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>
Cc: Richard Henderson <rth@twiddle.net>, ink@jurassic.park.msu.ru, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jul 15, 2014 at 2:54 PM, M=C3=A5ns Rullg=C3=A5rd <mans@mansr.co=
m> wrote:
> Nicholas Krause <xerofoify@gmail.com> writes:
>
>> This fixes the checkpatch error I get in this file relating to a
>> quoted string needed to be joined to the line above it.
>> ---
>>  arch/alpha/boot/bootpz.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/arch/alpha/boot/bootpz.c b/arch/alpha/boot/bootpz.c
>> index 6fc840d..a9e127b 100644
>> --- a/arch/alpha/boot/bootpz.c
>> +++ b/arch/alpha/boot/bootpz.c
>> @@ -87,8 +87,7 @@ check_range(unsigned long vstart, unsigned long ve=
nd,
>>               kaddr =3D (find_pa(vaddr) | PAGE_OFFSET);
>>               if (kaddr >=3D kstart && kaddr <=3D kend) {
>>  #ifdef DEBUG_CHECK_RANGE
>> -                     srm_printk("OVERLAP: vaddr 0x%lx kaddr 0x%lx"
>> -                                " [0x%lx:0x%lx]\n",
>> +                     srm_printk("OVERLAP: vaddr 0x%lx kaddr 0x%lx" =
" [0x%lx:0x%lx]\n",
>>                                  vaddr, kaddr, kstart, kend);
>>  #endif
>
> If you're doing this, you should merge the strings too.
>
> --
> M=C3=A5ns Rullg=C3=A5rd
> mans@mansr.com

Very well,
I will merge the strings for this statement.
Nick
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
