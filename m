From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Alpha no longer recognises certain partition tables (v2.6.38)
Date: Tue, 15 Mar 2011 09:17:59 -0700
Message-ID: <AANLkTi=yev46gYosVdSfVvmf7MnB2oVriyvDT+pu1FnC@mail.gmail.com>
References: <4D7F2C11.907@orcon.net.nz> <AANLkTimRDH4S1QMN6f4AfKOe6ipPK6jm+g91nuBJYQJa@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <AANLkTimRDH4S1QMN6f4AfKOe6ipPK6jm+g91nuBJYQJa@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, warns@pre-sense.de

On Tue, Mar 15, 2011 at 8:10 AM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Also, it's quite possible that we should raise the value of
> MAX_OSF_PARTITIONS. If I checked it right, the d_partitions[] array
> starts at byte offset 148 in the sector, and it's 16 bytes in size, so
> there _could_ be up to 22 partitions there.

Actually, I think it's byte offset 148 in the structure, but the
structure is at offset 64 in the partition sector, so I think that
leaves room for just 18 partitions in one 512-byte sector.

Of course, we do end up reading a whole page, so historically we've
been able to see even more when the sector is aligned right (and it
is, it's the first sector). So by mistake we could have accepted many
more partitions and it just "worked" because we never actually checked
any limits.

                        Linus
