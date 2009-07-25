From: Dave Airlie <airlied@gmail.com>
Subject: Re: Kernel 2.6.30.1 Oops on Alpha Architecture when starting Xserver
Date: Sun, 26 Jul 2009 08:54:27 +1000
Message-ID: <21d7e9970907251554m18e4fca5p69b758e36fddc7d9@mail.gmail.com>
References: <4A5DB243.2000100@orcon.net.nz>
	<21d7e9970907152016u3b213beet9090ee3b34f6d8b1@mail.gmail.com>
	<4A6ACE7C.9090409@orcon.net.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <xorg-bounces@lists.freedesktop.org>
In-Reply-To: <4A6ACE7C.9090409@orcon.net.nz>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/xorg>,
	<mailto:xorg-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/xorg>
List-Post: <mailto:xorg@lists.freedesktop.org>
List-Help: <mailto:xorg-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/xorg>,
	<mailto:xorg-request@lists.freedesktop.org?subject=subscribe>
Sender: xorg-bounces@lists.freedesktop.org
Errors-To: xorg-bounces@lists.freedesktop.org
To: Michael Cree <mcree@orcon.net.nz>
Cc: xorg@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

>>> The kernel oops is:
>>>
>>
>> So its a machine check,
>>
>
> So, does this indicate a software fault (e.g. inconsistencies in kernel d=
ata
> structures) or does it imply a hardware fault?
>
>> Well X is trying to post the graphics card you have installed, and the
>> machine
>> is falling over when it does it.
>>
>
> SRM (the equivalent of a BIOS) cannot post the card on startup. =A0But I =
have
> had the card (radeon rv610) post correctly and working in the past when I
> compiled the complete 1.5.3 Xserver myself. =A0I had it working with both=
 the
> radeon and radeonhd drivers and a 2.6.29.x kernel patched to support
> libpciaccess.

There is no -ati card in that machine, its got some SiS card which is
completely
different, maybe its some onboard card or something.

Dave.
