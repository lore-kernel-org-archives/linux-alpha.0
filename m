From: Helge Deller <deller@gmx.de>
Subject: Re: 5.17.0 boot issue on Miata
Date: Tue, 5 Apr 2022 20:22:48 +0200
Message-ID: <10d61d8f-edfc-fc39-0936-233692464dbd@gmx.de>
References: <Yj0u150JJpsb9nj4@gherkin.frus.com> <20220326222157.GA13650@tower>
 <YkuejknyPDJoQEDC@gherkin.frus.com> <20220405050125.GA25969@tower>
 <YkxKRElYUhMgOOCN@gherkin.frus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane-mx.org@lists.debian.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1649182972;
	bh=LKPlKBDuDZXddfhNt05rnAYMj4SXtMRzmFkmSV/6fPU=;
	h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
	b=Z4NSAWTszi/AZwfIFSIz9gZ3V8gKsN7gPBqTqzeFCcGDhEhNEMlMTEPIk+PJl6+vA
	 mG5KrRV1M1MmJg0C1NqZlYw0Q9LDvWYBzyIZ6tj7F0ZO976mRWqjbpej/Mc+T1gNN8
	 TaN5sqVWtPufveOsTdL0ZCGX/6kX+ID2I+oYQZH4=
Content-Language: en-US
In-Reply-To: <YkxKRElYUhMgOOCN@gherkin.frus.com>
Resent-Message-ID: <mKH16Uvc4w.A.-gD.VkITiB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/10d61d8f-edfc-fc39-0936-233692464dbd@gmx.de
Content-Type: text/plain; charset="us-ascii"
To: Bob Tracy <rct@frus.com>, Michael Cree <mcree@orcon.net.nz>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

On 4/5/22 15:55, Bob Tracy wrote:
> On Tue, Apr 05, 2022 at 05:01:25PM +1200, Michael Cree wrote:
>> On Mon, Apr 04, 2022 at 08:42:38PM -0500, Bob Tracy wrote:
>>> On Sun, Mar 27, 2022 at 11:21:57AM +1300, Michael Cree wrote:
>>>> On Thu, Mar 24, 2022 at 09:54:15PM -0500, Bob Tracy wrote:
>>>>> When I attempt to boot a 5.17.0 kernel built from the kernel.org
>>>>> sources, I see disk sector errors on my "sda" device, and the boot
>>>>> process hangs at the point where "systemd-udevd.service" starts.
>>>>>
>>>>> Rebooting on 5.16.0 works with no disk I/O errors of any kind.
>>>>
>>>> Oh, you can run a 5.16.y kernel on Alpha?  I have had problems
>>>> with everything since 5.9.y with rare, random, corruptions in
>>>> memory in user space (exhibiting as glibc detected memory
>>>> corruptions or segfaults).
>>>
>>> Did we have this painted into the "SMP vs. not-SMP" corner at one poin=
t?
>>
>> No, this affects both ES45 (with 3 cpus) and XP1000 (one cpu).
>>
>> The problem is rare. I often have to run tests for 12 hours on
>> the XP1000 before I see a problem.  On miata it might occur even
>> less often.
>>
>> I hope I am getting close to the bad commit, but it is taking
>> time when I run testing for a whole day before I feel confident
>> enough to mark the kernel as good.  And I have been wrong on
>> that one a couple of times now, having to repeat part of the
>> bisection.
>
> Stupid question, but possibly related to what I'm seeing in v5.17-final.
> Beginning with "-rc3" there's a new FRAMEBUFFER_CONSOLE_LEGACY_ACCELERAT=
ION
> configuration option.  Do I need this enabled on Miata if I normally
> boot in a video mode that displays a logo?  I'll try "no" for the "-rc3"
> build if/when "-rc2" boots properly.

You don't need to enable it, but for alpha it's probably beneficial to ena=
ble it.
When enabled, you will see a big speed improvement when logging in to a gr=
aphics text
console and printing info.  E.g. try "time dmesg" with and without that op=
tion...
The "dmesg" will scroll the screen, and that's what it accelerates (only i=
f the driver
has such hardware bitblt-support).

Helge

