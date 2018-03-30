From: Ilya Smith <blackzert@gmail.com>
Subject: Re: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
Date: Fri, 30 Mar 2018 12:07:58 +0300
Message-ID: <95EECC28-7349-4FB4-88BF-26E4CF087A0B@gmail.com>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180330075508.GA21798@amd>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=ZTjxoqKaoobJFUevSLgPJQU741b1iW8H0MvOHx0z9s8=;
        b=RouoAPahIBeHWmIgnH+8/cn6AMZFJbZqrK40ZUVYzW79JDPzZE8r5ASWUNWmrwduLD
         8f3shx1rqIvJjr0jRdyDRmGnKNyvMEC0a5YCVSM/NCLq5b0xvwFWnNt1pRQUr5hsByYi
         xFtAKpsQZ1g1tu0/giU7BNmHi4ujjdm/+NVAbpbkcN9w2p8xRMD9DyxZynXNAC92a5pM
         N864y0bNKHpK5NT3AJ2ToR0BksDVFur6bU7r6BRX0jkeT08EVsrQVtnfbBkcgmVziYks
         aN45ncRS6DPb0rwCzGp5TJWCA0WgpNitY6WmXPnb6XKnwFIencXwlyj+9q35Cb55NJIC
         d3Og==
In-Reply-To: <20180330075508.GA21798@amd>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Pavel Machek <pavel@ucw.cz>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@synopsys.com, linux@armlinux.org.uk, tony.luck@intel.com, fenghua.yu@intel.com, jhogan@kernel.org, ralf@linux-mips.org, jejb@parisc-linux.org, Helge Deller <deller@gmx.de>, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, nyc@holomorphy.com, viro@zeniv.linux.org.uk, arnd@arndb.de, gregkh@linuxfoundation.org, deepa.kernel@gmail.com, Michal Hocko <mhocko@suse.com>, hughd@google.com, kstewart@linuxfoundation.org, pombredanne@nexb.com, akpm@linux-foundation.org, steve.capper@arm.com, punit.agrawal@arm.com, paul.burton@m

Hi

> On 30 Mar 2018, at 10:55, Pavel Machek <pavel@ucw.cz> wrote:
>=20
> Hi!
>=20
>> Current implementation doesn't randomize address returned by mmap.
>> All the entropy ends with choosing mmap_base_addr at the process
>> creation. After that mmap build very predictable layout of address
>> space. It allows to bypass ASLR in many cases. This patch make
>> randomization of address on any mmap call.
>=20
> How will this interact with people debugging their application, and
> getting different behaviours based on memory layout?
>=20
> strace, strace again, get different results?
>=20

Honestly I=E2=80=99m confused about your question. If the only one way =
for debugging=20
application is to use predictable mmap behaviour, then something went =
wrong in=20
this live and we should stop using computers at all.

Thanks,
Ilya
