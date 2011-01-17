From: Matt Turner <mattst88@gmail.com>
Subject: Re: Please test my alpha tree
Date: Mon, 17 Jan 2011 04:37:13 +0000
Message-ID: <AANLkTimFtj0icHZyMs2G8-GO5RVRj+bm0EfxMWXvSkUP@mail.gmail.com>
References: <AANLkTinLCqS+E8CXmAfs51sWuPS1JtNguA2VcoKK4g4f@mail.gmail.com>
 <4D2E18B4.8060805@orcon.net.nz> <20110112215416.GA18643@jurassic.park.msu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=BsjRtW4TKqXnFwCtlcjZ1MqT1fwPW6hWkSBFHLJocDk=;
        b=GHBZ3ZERtXoKd7bfCOUrS1XshtM6zw0y15y0y6HbyUaye7aIddQg6E4xMeYsMmy+CC
         MEWVVE3wMXChpyRr27ARHi9hWMYWMDLSywQ5lXiR5FKX9WF/OX9Xx6mezDvbAplvtUZ+
         kzJKRlpD3piiOXHzHHM51wImUU3RwTeaSU0hE=
In-Reply-To: <20110112215416.GA18643@jurassic.park.msu.ru>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Michael Cree <mcree@orcon.net.nz>, linux-alpha@vger.kernel.org, Kyle McMartin <kyle@redhat.com>

On Wed, Jan 12, 2011 at 9:54 PM, Ivan Kokshaysky
<ink@jurassic.park.msu.ru> wrote:
> On Thu, Jan 13, 2011 at 10:10:12AM +1300, Michael Cree wrote:
>> On 12/01/11 18:29, Matt Turner wrote:
>>> On boot-up of my UP1500, I see
>>>
>>> HWRPB cycle frequency bogus. =A0Estimated 796423805 Hz
>>> Trying to install interrupt handler for IRQ8
>>> ------------[ cut here ]------------
>>> WARNING: at kernel/softirq.c:138 __local_bh_enable+0xa8/0xc0()
>>
>> I don't think that's related to the __do_IRQ removal. =A0It occurs i=
n the
>> 2.6.37 kernel just released. =A0Was discussed on linux-alpha with no
>> resolution; see
>> http://marc.info/?l=3Dlinux-alpha&m=3D128859282018188&w=3D2 and foll=
owing
>> messages in thread.
>
> Fixed, the patch will follow shortly.
>
>>> Ivan, the last patch in my tree is a breakage fix that you proposed=
=2E
>>> It seems fine to me; can you please give your sign-off?
>>
>> The commit message should give more information. =A0How about the fo=
llowing?
>>
>> Commit df9ee29270 made arch_local_irq_save and arch_local_irq_restor=
e
>> static inline which with -Werror trips up on __set_hae() and _set_ha=
e()
>> which are extern inline. =A0The naive solution is to make __set_hae(=
) and
>> set_hae() static inline but for reasons described in commit d559d4a2=
4a3fe
>> this breaks the generic kernel build. =A0Instead, since this is arch=
itecture
>> specific code, this patch hard wires in the architecture specific me=
thod of
>> disabling and enabling interrupts.
>
> Agreed, that would be nice description.
>
>> You can also add my Tested-by (I tested on generic, miata and dp264 =
kernel
>> builds).
>
> Matt, feel free to add
> =A0Signed-off-by: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
>
> Ivan.

Thanks Ivan! I've updated this patch with your tag.

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
