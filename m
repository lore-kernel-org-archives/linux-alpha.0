From: Stefan Wanner <stefan.wanner@postmail.ch>
Subject: Re: SCSI generic support: Badness in kobject_get
Date: Sat, 3 Apr 2004 22:15:23 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <A38D0556-85AB-11D8-8FED-000393C43976@postmail.ch>
References: <7CA30FDE-84F1-11D8-8FED-000393C43976@postmail.ch> <20040402223550.GA12467@kroah.com> <406E88F7.9090601@steudten.com>
Mime-Version: 1.0 (Apple Message framework v613)
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <406E88F7.9090601@steudten.com>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Greg KH <greg@kroah.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Actualy the same applies to me, when using 2.6.4. And I also get many 
of those warnings when compiling kernel modules (like Jay Maynard 
wrote):

{standard input}: Assembler messages:
{standard input}:4: Warning: setting incorrect section type for .got
{standard input}:4: Warning: setting incorrect section attributes for 
.got

So I tried 2.6.5-rc2 with the corrected version of 
"arch/alpha/kernel/alpha_ksyms.c" from rc3. The assembler messages are 
still here... the kernel compiles.... and the message "Badness in 
kobect_get" is gone when loading the sg module.

But what about those assembler messages??

Regards,
Stefan


On 03.04.2004, at 11:50, Thomas Steudten wrote:

> Not on my alpha 2.6.4, as I post this message a few weeks ago.
>
> Greg KH wrote:
>
>> On Sat, Apr 03, 2004 at 12:02:52AM +0200, Stefan Wanner wrote:
>>> Hi
>>>
>>> I have an Alpha AS400 with Debian Linux 3.0 and Kernel 2.6.3
>> Please use a newer kernel, this bug has been fixed in 2.6.4.
>> thanks,
>> greg k-h
>> -
>> To unsubscribe from this list: send the line "unsubscribe 
>> linux-alpha" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> -- 
> Tom
>
> LINUX user since kernel 0.99.x 1994.
> RPM Alpha packages at http://alpha.steudten.com/packages
> Want to know what S.u.S.E 1995 cdrom-set contains?
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-alpha" 
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

