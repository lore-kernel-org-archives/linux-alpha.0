From: Matt Turner <mattst88@gmail.com>
Subject: Re: Please test my alpha tree
Date: Mon, 17 Jan 2011 04:36:39 +0000
Message-ID: <AANLkTimL6gJjPOG4+05FWys4DfK2Y0o-KWLAaeijQ8co@mail.gmail.com>
References: <AANLkTinLCqS+E8CXmAfs51sWuPS1JtNguA2VcoKK4g4f@mail.gmail.com> <4D2E18B4.8060805@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=+V31VKUoevsGdrSarMcrtovl2eB0wPRBeF5dpvtzXdg=;
        b=B2hNTAV45a7vIRTd8mNCQ5ti1wMYj54tfhVPdVhnZgDZF3HBYyQaDOvNicQ0x68Ld3
         SJnsEVqfkYBuw7QHrAfBSHmtxxJxeJwaxBxz6BOHIQSGKjVPT3acCOZJtmrs9mFyEPf6
         Tr0+5m6PKVSWwNs0r+x9+J2DLh93TR6hSROZU=
In-Reply-To: <4D2E18B4.8060805@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michael Cree <mcree@orcon.net.nz>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, Kyle McMartin <kyle@redhat.com>

On Wed, Jan 12, 2011 at 9:10 PM, Michael Cree <mcree@orcon.net.nz> wrot=
e:
> On 12/01/11 18:29, Matt Turner wrote:
>>
>> After a few weeks of no work on the kernel, I've vacuumed up the
>> outstanding patches.
>
> Nice to see.
>
>> They include the removal of __do_IRQ, so please give it a test on yo=
ur
>> hardware.
>>
>> On boot-up of my UP1500, I see
>>
>> HWRPB cycle frequency bogus. =A0Estimated 796423805 Hz
>> Trying to install interrupt handler for IRQ8
>> ------------[ cut here ]------------
>> WARNING: at kernel/softirq.c:138 __local_bh_enable+0xa8/0xc0()
>
> I don't think that's related to the __do_IRQ removal. =A0It occurs in=
 the
> 2.6.37 kernel just released. =A0Was discussed on linux-alpha with no
> resolution; see
> http://marc.info/?l=3Dlinux-alpha&m=3D128859282018188&w=3D2 and follo=
wing messages
> in thread.
>
>> Ivan, the last patch in my tree is a breakage fix that you proposed.
>> It seems fine to me; can you please give your sign-off?
>
> The commit message should give more information. =A0How about the fol=
lowing?
>
> Commit df9ee29270 made arch_local_irq_save and arch_local_irq_restore=
 static
> inline which with -Werror trips up on __set_hae() and _set_hae() whic=
h are
> extern inline. =A0The naive solution is to make __set_hae() and set_h=
ae()
> static inline but for reasons described in commit d559d4a24a3fe this =
breaks
> the generic kernel build. =A0Instead, since this is architecture spec=
ific
> code, this patch hard wires in the architecture specific method of di=
sabling
> and enabling interrupts.
>
> You can also add my Tested-by (I tested on generic, miata and dp264 k=
ernel
> builds).
>
> The author information is mucked up on commits 0c9e7396d8d and 3cf232=
3f0b74
> and should be repaired.
>
> The message on commit 3cf2323f0b74 is not very informative. =A0What "=
flag
> variables"? =A0Might be fixed by saying "Makefile flag variables".
>
> Cheers
> Michael.
>

All updated. Thanks for testing and providing a better description. :)

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
