From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v4 00/16] genrtc removal
Date: Tue, 31 May 2016 08:56:05 +0200
Message-ID: <CAMuHMdV5mcKZcBz=v7Pn2pbDiuwMpQYs-70e6NmH6CZ88=JNzA@mail.gmail.com>
References: <1464634684-1248135-1-git-send-email-arnd@arndb.de>
	<20160530203207.GY3451@piout.net>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Return-path: <rtc-linux+bncBCQJP74GSUDRBBPLWS5AKGQEEMCYSKI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:x-spam-checked-in-group
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HyMm7pioSBx+mgdF0FWZ6zUSdP7tnD/bdTXpGbnhNhE=;
        b=IzjkNUZbdpxBpwVefcdE3d7uzo9/Zn3SxyxAwwznRTGcnXJDOEJt2WheGKPpbbrUfn
         78b9XGU1PWRlKzw7DlepCfUZ47KAHyyIkBy0narNuDtdbASzzl+axNReufD0M+8BrJ/Y
         J3DVd11I9dQfVOtucY3ijlT9yKkxcEWnpDxEpgI9U6dPYobSElAqn1euOt7FxcOD9ubE
         MO3QtTy5lyDgx/6PaCkp/f0Vnv49+lH50mEkt+Hqy9c6Tf3BvsxIR7sMN6UxisMdLy4z
         aQtMR6n0Molckoxm1kbHi151R1qFnFbMs2NKUVsnyeCj6bMHxp744QJUiAS3mJjrDaxX
         np1Q==
Sender: geert.uytterhoeven-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
In-Reply-To: <20160530203207.GY3451-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>, David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, alpha <linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Parisc List <linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Linux-sh list <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-m68k <linux-m68k-cunTk1MwBs8S/qaLPR03pWD2FQJk+8+b@public.gmane.org>, RTCLINUX <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Linux-Arch <linux-arch-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Allo Alexandre,

On Mon, May 30, 2016 at 10:32 PM, Alexandre Belloni
<alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On 30/05/2016 at 20:57:48 +0200, Arnd Bergmann wrote :
>> This is the promised resend of the removal of the genrtc driver and some
>> related code, now that we are at a good time to merge this for the coming
>> merge window.
>>
>
> Thanks a lot!
>
> I'm applying the series right now so it sits in linux-next for a while
> before the next merge window.
>
> I would still happily take any acks, Reviewed-by or Tested-by tags.

Looks like Arnd forgot to include these when reposting:

Acked-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>

For the m68k bits:
Tested-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
