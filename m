From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v2] asm-generic: Fix unistd_32.h generation format
Date: Wed, 12 Feb 2020 10:26:22 +0100
Message-ID: <dacfbf2c-74b3-3d52-1fdd-d757b4a19c73@xilinx.com>
References: <dcdd615f77dacf8a98e18950b66fb5a675277f38.1581498987.git.michal.simek@xilinx.com>
 <CAMo8BfLYM-_SbqmMUCVjwqL7MpA2W7toTg_F6HTY4Sg5QxGzfw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFq0cIhqlRG11IxDsBtPmM/DTu2KkVgWYDa51/2Zg8I=;
 b=XuIoxiL32Zmq9fGBIdT6mYReZouL1jLXEYqXySYRVS8GaoUDBbe+t9FgSzred/DypCH1oduLoK2JSkwAAoIjf6W8S2KmoDYdKesUtjxvdAn2mGc9rYVGSqbwKPr22mjfAqjAxdBhLBh8GcSs0fy+hflRxYxDskie/DGfeilQUjc=
In-Reply-To: <CAMo8BfLYM-_SbqmMUCVjwqL7MpA2W7toTg_F6HTY4Sg5QxGzfw@mail.gmail.com>
Content-Language: en-US
Sender: linux-parisc-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Max Filippov <jcmvbkbc@gmail.com>, Michal Simek <michal.simek@xilinx.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Michal Simek <monstr@monstr.eu>, git@xilinx.com, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, Stefan Asserhall <stefan.asserhall@xilinx.com>, Chris Zankel <chris@zankel.net>, "David S. Miller" <davem@davemloft.net>, Fenghua Yu <fenghua.yu@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Helge Deller <deller@gmx.de>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Matt Turner <mattst88@gmail.com>, Rich Felker <dalias@libc.org>, Richard Henderson <rth@twiddle.net>, Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>, open list:IA64 (Ita

On 12. 02. 20 10:23, Max Filippov wrote:
> On Wed, Feb 12, 2020 at 1:16 AM Michal Simek <michal.simek@xilinx.com> wrote:
>>
>> Generated files are also checked by sparse that's why add newline
>> to remove sparse (C=1) warning.
>>
>> The issue was found on Microblaze and reported like this:
>> ./arch/microblaze/include/generated/uapi/asm/unistd_32.h:438:45:
>> warning: no newline at end of file
>>
>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>> Reviewed-by: Stefan Asserhall <stefan.asserhall@xilinx.com>
>> ---
>>
>> Changes in v2:
>> - Update also others archs not just microblaze - Arnd
>> - Align subject and description to match multiarch chagne
>>
>>  arch/alpha/kernel/syscalls/syscallhdr.sh      | 1 +
>>  arch/ia64/kernel/syscalls/syscallhdr.sh       | 1 +
>>  arch/m68k/kernel/syscalls/syscallhdr.sh       | 1 +
>>  arch/microblaze/kernel/syscalls/syscallhdr.sh | 1 +
>>  arch/parisc/kernel/syscalls/syscallhdr.sh     | 1 +
>>  arch/sh/kernel/syscalls/syscallhdr.sh         | 1 +
>>  arch/sparc/kernel/syscalls/syscallhdr.sh      | 1 +
>>  arch/xtensa/kernel/syscalls/syscallhdr.sh     | 1 +
>>  8 files changed, 8 insertions(+)
> 
> For xtensa:
> Acked-by: Max Filippov <jcmvbkbc@gmail.com>
> 
> ...
> 
>> diff --git a/arch/m68k/kernel/syscalls/syscallhdr.sh b/arch/m68k/kernel/syscalls/syscallhdr.sh
>> index 6f357d68ef44..8ac15be01ac2 100644
>> --- a/arch/m68k/kernel/syscalls/syscallhdr.sh
>> +++ b/arch/m68k/kernel/syscalls/syscallhdr.sh
>> @@ -33,4 +33,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
>>         printf "#endif\n"
>>         printf "\n"
>>         printf "#endif /* %s */\n" "${fileguard}"
> 
> Here there's already \n at the end, so no need for another one?

No it is not needed. But I think that make sense to have the same
solution in all these scripts. Above printf is adding newline that's why
I have used the same style.

M

