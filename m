From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [Suggestion] arch/*/include/asm/bitops.h: about __set_bit() API.
Date: Tue, 11 Jun 2013 09:32:39 +0200
Message-ID: <CAMuHMdWVx79L=ErRkNMide6xNqQt1RQr0psN8nqoADeV0h768A@mail.gmail.com>
References: <51B30285.6020503@asianux.com>
	<CA+8MBbK_nfOhZGsd5wU-hyiwh3pHS5c42eiBfxLpCjDgBKUqJg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=OuJk1C1eXhsk/wC6iBlwJ0apwDPV61x0dOR5cI+22Vo=;
        b=mmr2FhoANv22pdSgA1gGrFweJujr2SvredNdO+9WAtMSQNRrNFLkEzpQBQ0moMvd24
         pPFRQzD6iki6OdfqhgoeB1TKE1MfGEZJ6PfDPq0wuuzFjoI939/w4m8sRA4EtNop5wu4
         p/S6kx1hWak8lQwtBD9r521WtJZL1SlFCKGZFGNbg+KHDoyD6vbobvivm6pQ5M+MEpz9
         vGbKtpPEI9/pB9Trau9HZ6TbyRLP/Juq+7ELEPXJreEY/vFmLXItgeYEfxhKnH2d18uW
         A/wwwgZP+N0Y/b9j+tWh+XJga6WH9t/4GtqLyy4T7NG5rweMqbk6qnA4jnCnzsW0QC4e
         qG4w==
In-Reply-To: <CA+8MBbK_nfOhZGsd5wU-hyiwh3pHS5c42eiBfxLpCjDgBKUqJg@mail.gmail.com>
Sender: linux-ia64-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony Luck <tony.luck@gmail.com>
Cc: Chen Gang <gang.chen@asianux.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "dhowells@redhat.com" <dhowells@redhat.com>, "Yu, Fenghua" <fenghua.yu@intel.com>, Koichi Yasutake <yasutake.koichi@jp.panasonic.com>, alpha <linux-alpha@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, linux-am33-list@redhat.com, Linux-Arch <linux-arch@vger.kernel.org>

On Tue, Jun 11, 2013 at 12:26 AM, Tony Luck <tony.luck@gmail.com> wrote:
> On Sat, Jun 8, 2013 at 3:08 AM, Chen Gang <gang.chen@asianux.com> wrote:
>> using 'unsigned int *', implicitly:
>>   ./ia64/include/asm/bitops.h:63:__set_bit (int nr, volatile void *addr)
>
> There is some downside on ia64 to your suggestion.  If "addr" is properly
> aligned for an "int", but misaligned for a long ... i.e. addr%8 == 4, then I'll
> take an unaligned reference trap if I work with long* where the current code
> working with int* does not.
>
> Now perhaps all the callers do guarantee long* alignment?  But I don't know.
>
> Apart from uniformity, there doesn't see to be any upside to changing this.

The address pointers have been supposed to be "long *" for a very long time.
Probably alpha (the second official Linux platform) did it
differently, and never
standardized to "long *".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
