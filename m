From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v6 10/30] PCI: Introduce pci_host_bridge_list to manage
 host bridges
Date: Fri, 13 Mar 2015 09:33:29 -0500
Message-ID: <CAErSpo5RgADWDPDvA-sg+MhmayPgTCfQqN1j0hYorAzZ=8_-qg@mail.gmail.com>
References: <1425868467-9667-1-git-send-email-wangyijing@huawei.com>
 <1425868467-9667-11-git-send-email-wangyijing@huawei.com> <20150312025537.GD10949@google.com>
 <55018E90.9030301@huawei.com> <20150312195651.GD7346@google.com> <55025955.3020000@huawei.com>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=Xd9fbuKLYI3ieuUVCK6my7tmPlnhfsXhbOFdOeqRjk0=;
        b=GCB1SIbU9N5nahjoGT1pN/qJdnchSpxq2GWzyQrWV0Gd8YrtLGjKxjseLjq+6X+w73
         I4TBdP8q9kEqlzQjd0UcisjXE+5Ah7BOxQoUX3HgHYBy1UIr/sGlmUBkIaMabPd6SmIN
         zMRc6FxHCJi68gqvW619TkxaUwn8J2BPAv6gqQ3zm3lDvsq+khdMb8vs+XV3YDxBw8VB
         qXsg3JswND3hy4p05sk09R1XE9Pl2ywv+2GzXbG41OwYUhFMo6OFwsqsLsSOifKtZ/Gz
         hGzMDxuBfbVwONinl66uO9tPZ8isZDUXNJ1IBS03TOnDpN1TVF9MF+F9TVNJDCrW7Q+c
         ex7w==
In-Reply-To: <55025955.3020000@huawei.com>
Sender: linux-m68k-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yijing Wang <wangyijing@huawei.com>
Cc: Jiang Liu <jiang.liu@linux.intel.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Yinghai Lu <yinghai@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, linux-arm <linux-arm-kernel@lists.infradead.org>, Russell King <linux@arm.linux.org.uk>, "x86@kernel.org" <x86@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rusty Russell <rusty@rustcorp.com.au>, Tony Luck <tony.luck@intel.com>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Guan Xuetao <gxt@mprc.pku.edu.cn>, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Liviu Dudau <liviu@dudau.co.uk>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>

On Thu, Mar 12, 2015 at 10:28 PM, Yijing Wang <wangyijing@huawei.com> wrote:
>>>> It's a nice idea to move this test into the core.  While you're at it, why
>>>> don't you check for any overlap with the bus ranges of existing host
>>>> bridges?  For example, if we're trying to create a new host bridge to
>>>> [bus 40-7f], it should conflict with existing bridges to [bus 00-7f]
>>>> as well as to [bus 40-ff].  I think your current patch will detect the
>>>> latter conflict but not the former.
>>>
>>> Now pci host bridge may only know its start bus number, like acpi _BBN provided,
>>> but does not limit the end bus number, Eg. two pci roots report _BBN 0x0 and 0x80,
>>> so we have two bus number resource (0, 0xff) and (0x80, 0xff), if we check it strictly,
>>> some pci scan would fail which currently scan success.
>>
>> _BBN is not the correct source for the bridge's bus number range.  There's
>> a comment in acpi_pci_root_add() that explains why:
>>
>>   * We need both the start and end of the downstream bus range
>>   * to interpret _CBA (MMCONFIG base address), so it really is
>>   * supposed to be in _CRS.  If we don't find it there, all we
>>   * can do is assume [_BBN-0xFF] or [0-0xFF].
>>
>> A platform SHOULD know the start and and end bus number.  If it doesn't I
>> think it's the platform's responsibility to carve up the bus number range.
>> Maybe this can be done by trimming the range of the [bus 00-ff] bridge when
>> we discover another bridge that leads to bus 80.
>
> Currently, if platform does not know the end bus number (not provide the bus resource),
> we will update the max bus number returned by pci_scan_child_bus() to the bus resource end,
> and I think this is reasonable. I consider to introduce a flag to identify the bus resource
> which end bus number is undefined, then we could force all pci_scan_root_bus()  etc. callers
> to provide the bus resource, and we could process the bus resource end according the bus resource flag.
> Also then we could reduce the bus argument which is the same as busn_res->start.
> I would try to provide draft patch, then we could discuss it more clearly.

Without having seen a patch, my inclination is to avoid a flag because
flags change the behavior of the code you call, which makes that code
harder to follow.  Maybe we could require these platforms to
explicitly update the ending bus number after scanning the bus.

Bjorn
