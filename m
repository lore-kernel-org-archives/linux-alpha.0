From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: Alpha no longer recognises certain partition tables (v2.6.38)
Date: Wed, 16 Mar 2011 20:40:13 +1300
Message-ID: <4D80695D.8080903@orcon.net.nz>
References: <4D7F2C11.907@orcon.net.nz> <AANLkTimRDH4S1QMN6f4AfKOe6ipPK6jm+g91nuBJYQJa@mail.gmail.com> <AANLkTi=yev46gYosVdSfVvmf7MnB2oVriyvDT+pu1FnC@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=yev46gYosVdSfVvmf7MnB2oVriyvDT+pu1FnC@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, warns@pre-sense.de

On 16/03/11 05:17, Linus Torvalds wrote:
> On Tue, Mar 15, 2011 at 8:10 AM, Linus Torvalds <torvalds@linux-foundation.org>  wrote:
>>
>> Also, it's quite possible that we should raise the value of
>> MAX_OSF_PARTITIONS. If I checked it right, the d_partitions[] array
>> starts at byte offset 148 in the sector, and it's 16 bytes in size, so
>> there _could_ be up to 22 partitions there.
>
> Actually, I think it's byte offset 148 in the structure, but the
> structure is at offset 64 in the partition sector, so I think that
> leaves room for just 18 partitions in one 512-byte sector.
>
> Of course, we do end up reading a whole page, so historically we've
> been able to see even more when the sector is aligned right (and it
> is, it's the first sector). So by mistake we could have accepted many
> more partitions and it just "worked" because we never actually checked
> any limits.

OK, I've fallen for that and created too many partitions on my system 
disk.  When using your patch dmesg reports:

[    7.511714] sd 1:0:0:0: [sdb] 2930277168 512-byte logical blocks: 
(1.50 TB/1.36 TiB)
[    7.551753] sd 1:0:0:0: [sdb] Write Protect is off
[    7.572261] sd 1:0:0:0: [sdb] Mode Sense: 00 3a 00 00
[    7.591792] sd 1:0:0:0: [sdb] Write cache: enabled, read cache: 
enabled, doesn't support DPO or FUA
[    7.633785] OSF: 10 partitions
[    7.654292]  sdb: sdb1 sdb2 sdb3 sdb4 sdb5 sdb6 sdb7 sdb8
[    7.675777] sd 1:0:0:0: [sdb] Attached SCSI disk

I could get it back to eight partitions but it will require copying the 
largest partition to another disk and back again as that partition does 
not meet the conditions for resizing.  Part of the reason for so many 
partitions was a brilliant scheme (or so it seemed at the time) when I 
repartitioned the disk in a manner that enabled me to do an efficient 
"in-place" repartitioning of an already well used disk.

Cheers
Michael.
