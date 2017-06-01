From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH] tty: add TIOCGPTPEER ioctl
Date: Thu, 1 Jun 2017 13:12:15 -0700
Message-ID: <4e16e83b-8fb7-c9b6-2f06-ee48499a67db@twiddle.net>
References: <20170601173803.8698-1-asarai@suse.de>
 <CAMuHMdXkaWg70OidDi0_xALbzwZ+o0eEVEzT5U_6HdewBs4WwA@mail.gmail.com>
 <a0671efc-4c4e-bbdc-c9d8-a7bdc22b872a@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/G0rPEhB+CCPgI0rXPLmT5Qwkw+LnImMW2feqffCV/U=;
        b=Lsq1f10RCcwOPXbJK7jst9kimnrGd6chEhFyqjWdJREX8KpxbdkyaOPOFD6wN+ppsc
         MA/Vve+Fus9nBmdMtFn1kPhCNtNAF483aHnfnREdBuqx0L1e4DUHaLOP/xlIaMaehB/C
         LhVLj5DWjtmzSA9v5HMiMofPS/a9sVN7CcEyd9Kw4svjmK3bn3ewvEkAM7wNUMhP0cfw
         Nmc7TN84fw22cCBBhigEq4Duqkm7p7geAH9XFenIDZGNnTLmsBJVkS7nyi287Hi5PzEg
         QPyT49ldoSop0xcfQVYIOVM/8Z+SAxZEcWmQAOEFyO2+9qlV/WmmNR5LjLpWt4m50alv
         ELFA==
In-Reply-To: <a0671efc-4c4e-bbdc-c9d8-a7bdc22b872a@suse.de>
Content-Language: en-US
Sender: linux-parisc-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Aleksa Sarai <asarai@suse.de>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Parisc List <linux-parisc@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Linux-sh list <linux-sh@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, Linux-Arch <linux-arch@vger.kernel.org>, Christian Brauner <christian.brauner@ubuntu.com>, Valentin Rothberg <vrothberg@suse.com>

On 06/01/2017 01:00 PM, Aleksa Sarai wrote:
>>> --- a/arch/alpha/include/uapi/asm/ioctls.h
>>> +++ b/arch/alpha/include/uapi/asm/ioctls.h
>>> @@ -94,6 +94,7 @@
>>>   #define TIOCSRS485     _IOWR('T', 0x2F, struct serial_rs485)
>>>   #define TIOCGPTN       _IOR('T',0x30, unsigned int) /* Get Pty Number (of 
>>> pty-mux device) */
>>>   #define TIOCSPTLCK     _IOW('T',0x31, int)  /* Lock/unlock Pty */
>>> +#define TIOCGPTPEER    _IOR('T', 0x41, int) /* Safely open the slave */
>>
>> Shouldn't the list of definitions be kept sorted, by hex number?
>> (everywhere)
> 
> Probably. The reason I put it here is because it logically is very similar to 
> TIOCGPTN and TIOSPTLCK, but I can move it if the hex order is more important 
> for maintainence.
> 

Yes please.


r~
