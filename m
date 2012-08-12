From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [next:akpm 129/309] net/core/sock.c:274:36: error: initializer element is not constant
Date: Sun, 12 Aug 2012 09:00:39 -0400
Message-ID: <BLU0-SMTP83E63329EDAEFD6C2A5C0E97B10@phx.gbl>
References: <1343042420.3027.11.camel@dabdike.int.hansenpartnership.com> <20120723114258.GV9222@suse.de> <20120723122905.GA22476@localhost> <BLU0-SMTP2254F8872DDE5FA6035CDE97DD0@phx.gbl> <20120724074844.GA9519@localhost> <BLU0-SMTP6C7CFCFF734FE10A39B6E97DC0@phx.gbl> <1343193053.3139.6.camel@dabdike> <CA+8MBbJkGN+zGBdD5Hg26wW_6E9L_ufoutn7wj+Y+nhtW7WKWg@mail.gmail.com> <20120802150209.GA26601@localhost> <502707D5.7020602@orcon.net.nz> <20120812021013.GA8442@localhost> <50271811.9090006@orcon.net.nz>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-3--750464302"
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <50271811.9090006@orcon.net.nz>
Sender: linux-parisc-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Michael Cree <mcree@orcon.net.nz>
Cc: Fengguang Wu <fengguang.wu@intel.com>, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Tony Luck <tony.luck@gmail.com>, James Bottomley <James.Bottomley@hansenpartnership.com>, Mel Gorman <mgorman@suse.de>, kernel-janitors@vger.kernel.org, Kyle McMartin <kyle@parisc-linux.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Parisc List <linux-parisc@vger.kernel.org>

--Apple-Mail-3--750464302
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

On 11-Aug-12, at 10:42 PM, Michael Cree wrote:

> On 12/08/12 14:10, Fengguang Wu wrote:
>> On Sun, Aug 12, 2012 at 01:33:09PM +1200, Michael Cree wrote:
>>> On 03/08/12 03:02, Fengguang Wu wrote:
>>>> On Thu, Jul 26, 2012 at 10:06:41AM -0700, Tony Luck wrote:
>>>>> On Tue, Jul 24, 2012 at 10:10 PM, James Bottomley
>>>>> <James.Bottomley@hansenpartnership.com> wrote:
>>>>>>> Here is the line in sock.i:
>>>>>>>
>>>>>>> struct static_key memalloc_socks = ((struct static_key)  
>>>>>>> { .enabled =
>>>>>>> ((atomic_t) { (0) }) });
>>>>>>
>>>>>> The above line contains two compound literals.  It also uses a  
>>>>>> designated
>>>>>> initializer to initialize the field enabled.  A compound  
>>>>>> literal is not a
>>>>>> constant expression.
>>>>>
>>>>> Seeing the same thing on ia64 building next-20120726.  Same fix  
>>>>> works
>>>>> for me ... so I'll steal this whole changelog and attributes.
>>>>
>>>> I got the same error for alpha, the same fix applies.
>>>
>>> Just trying this patch on Alpha against v3.6-rc1 and it leads to new
>>> compilation errors, namely:
>>>
>>> init/init_task.c:12: error: braced-group within expression allowed  
>>> only
>>> inside a function
>>> init/init_task.c:13: error: braced-group within expression allowed  
>>> only
>>> inside a function
>>> init/init_task.c:16: error: braced-group within expression allowed  
>>> only
>>> inside a function
>>> init/init_task.c:16: error: braced-group within expression allowed  
>>> only
>>> inside a function
>>> make[1]: *** [init/init_task.o] Error 1
>>
>> Sorry! This will actually compile:
>>
>> -#define ATOMIC_INIT(i)         ( { (i) } )
>> +#define ATOMIC_INIT(i)         { (i) }
>
> Thanks, it now compiles correctly.  I'm currently collecting Alpha
> patches to send on to Linus so will include this one.


A similar change applied to 3.5.1 stable compiles successfully
on parisc.

Regards,
Dave
--
John David Anglin	dave.anglin@bell.net



--Apple-Mail-3--750464302
Content-Disposition: attachment; filename="atomic.h.d.txt"
Content-Type: text/plain; x-unix-mode=0644; name="atomic.h.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/include/asm/atomic.h b/arch/parisc/include/asm/atomic.h
index 6c6defc..af9cf30 100644
--- a/arch/parisc/include/asm/atomic.h
+++ b/arch/parisc/include/asm/atomic.h
@@ -141,7 +141,7 @@ static __inline__ int __atomic_add_unless(atomic_t *v, int a, int u)
 
 #define atomic_sub_and_test(i,v)	(atomic_sub_return((i),(v)) == 0)
 
-#define ATOMIC_INIT(i)	((atomic_t) { (i) })
+#define ATOMIC_INIT(i)	{ (i) }
 
 #define smp_mb__before_atomic_dec()	smp_mb()
 #define smp_mb__after_atomic_dec()	smp_mb()
@@ -150,7 +150,7 @@ static __inline__ int __atomic_add_unless(atomic_t *v, int a, int u)
 
 #ifdef CONFIG_64BIT
 
-#define ATOMIC64_INIT(i) ((atomic64_t) { (i) })
+#define ATOMIC64_INIT(i) { (i) }
 
 static __inline__ s64
 __atomic64_add_return(s64 i, atomic64_t *v)

--Apple-Mail-3--750464302--
