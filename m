From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 00/16] Remove usage of the deprecated "pci-dma-compat.h"
 API
Date: Thu, 24 Feb 2022 19:15:38 +0100
Message-ID: <b3e6a19b-caa0-f58a-1039-02b60b17ed21@wanadoo.fr>
References: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
 <YhXmQwvjMFPQFPUr@infradead.org>
 <ddf6010e-417d-8da7-8e11-1b4a55f92fff@wanadoo.fr>
 <YhckzJp5/x9zW4uQ@infradead.org>
 <CAK8P3a23Pjm1Btc=mXX=vU4hkNiPqz3+o4=j0FuYKHB7KuMtPg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <CAK8P3a23Pjm1Btc=mXX=vU4hkNiPqz3+o4=j0FuYKHB7KuMtPg@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, David Miller <davem@davemloft.net>, David Airlie <airlied@linux.ie>, Vinod Koul <vkoul@kernel.org>, hao.wu@intel.com, Tom Rix <trix@redhat.com>, Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, awalls@md.metrocast.net, Mauro Carvalho Chehab <mchehab@kernel.org>, Sathya Prakash <sathya.prakash@broadcom.com>, sreekanth.reddy@broadcom.com, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, Matt Porter <mporter@kernel.crashing.org>, Alex Bounine <alex.bou9@gmail.com>, Bjorn


Le 24/02/2022 à 08:07, Arnd Bergmann a écrit :
> On Thu, Feb 24, 2022 at 7:25 AM Christoph Hellwig <hch@infradead.org> wrote:
>> On Wed, Feb 23, 2022 at 09:26:56PM +0100, Christophe JAILLET wrote:
>>> Patch 01, 04, 05, 06, 08, 09 have not reached -next yet.
>>> They all still apply cleanly.
>>>
>>> 04 has been picked it up for inclusion in the media subsystem for 5.18.
>>> The other ones all have 1 or more Reviewed-by:/Acked-by: tags.
>>>
>>> Patch 16 must be resubmitted to add "#include <linux/dma-mapping.h>" in
>>> order not to break builds.
>> So how about this:  I'll pick up 1, 5,6,8 and 9 for the dma-mapping
>> tree.  After -rc1 when presumably all other patches have reached
>> mainline your resubmit one with the added include and we finish this
>> off?
> Sounds good to me as well.
>
>         Arnd

This is fine for me.
When all patches have reached -next, I'll re-submit the fixed 16th patch.


Thanks for your assistance for ending this long story :)

CJ

