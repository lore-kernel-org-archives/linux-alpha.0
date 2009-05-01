From: "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/6] Add new macros for page-aligned data and bss sections.
Date: Fri, 01 May 2009 10:18:20 -0700
Message-ID: <49FB2EDC.9050300@zytor.com>
References: <1241121253-32341-1-git-send-email-tabbott@mit.edu> <1241121253-32341-2-git-send-email-tabbott@mit.edu> <20090501091848.GB18326@uranus.ravnborg.org> <alpine.DEB.1.10.0905010951100.3955@vinegar-pot.mit.edu> <49FB2449.1010301@zytor.com> <20090501171717.GA26401@uranus.ravnborg.org>
Reply-To: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <owner-microblaze-uclinux-FR6EJeJVuqfA6Z3fQjNZrN9u6TNh0Fb7@public.gmane.org>
In-Reply-To: <20090501171717.GA26401-QabhHTsIXMSnlFQ6Q1D1Y0B+6BGkLq7r@public.gmane.org>
Sender: owner-microblaze-uclinux-FR6EJeJVuqfA6Z3fQjNZrN9u6TNh0Fb7@public.gmane.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Cc: Tim Abbott <tabbott-DPNOqEs/LNQ@public.gmane.org>, Linux kernel mailing list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Anders Kaseorg <andersk-DPNOqEs/LNQ@public.gmane.org>, Waseem Daher <wdaher-DPNOqEs/LNQ@public.gmane.org>, Denys Vlasenko <vda.linux-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Jeff Arnold <jbarnold-DPNOqEs/LNQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Bryan Wu <cooloney-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chris Zankel <chris-YvXeqwSYzG2sTnJN9+BGXg@public.gmane.org>, Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, dev-etrax-VrBV9hrLPhE@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Greg Ungerer <gerg-JBU5SbJe1FlAfugRpC6u6w@public.gmane.org>, Haavard Skinnemoen <hskinnemoen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>, Hirokazu Takata <takata-TMSiXQfHlQjsTix1lMzHGQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jeff Dike <jdike-OPE4K8JWMJJBDgjK7y7TUQ@public.gmane.org>

Sam Ravnborg wrote:
> On Fri, May 01, 2009 at 09:33:13AM -0700, H. Peter Anvin wrote:
>> Tim Abbott wrote:
>>> On Fri, 1 May 2009, Sam Ravnborg wrote:
>>>
>>>> On Thu, Apr 30, 2009 at 03:54:08PM -0400, Tim Abbott wrote:
>>>>> +#define __PAGE_ALIGNED_DATA	.section ".data.page_aligned", "aw", @progbits
>>>>> +#define __PAGE_ALIGNED_BSS	.section ".bss.page_aligned", "aw", @nobits
>>>> It is my understanding that the linker will automatically
>>>> assume nobits for section names starting with .bss and likewise
>>>> progbits for section names starting with .data - so we can leave them out?
>>> I believe that is correct.
>>>
>> ... but that doesn't mean it's the right thing to do.
>>
>> It's better to be fully explicit when macroizing this kind of stuff.
>> This is part of why macroizing it is good: it means we end up with *one*
>> place that determines this stuff, not some magic heuristics in the linker.
> 
> Do you know if we can use % in place of @?
> I could see that gas supports both - at least in trunk in cvs.
> 

I think it might depend on the architecture(!)... but it would
definitely have to be an issue with testing a bunch of different versions.

What's wrong with @?

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
