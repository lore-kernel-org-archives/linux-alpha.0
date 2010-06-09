From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PULL] alpha-2.6.git
Date: Tue, 8 Jun 2010 21:14:03 -0400
Message-ID: <AANLkTikyHiAhzjGvjb0n6GpGPch76XQL1BLj-_IpV3Xm@mail.gmail.com>
References: <AANLkTik_oUwEAANf1BDDCnN7BzF1MoI-xr4cEBwwsbBE@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=AoIjq7bz4LpejPj07iDbLAH8j3JFaVgb27pvGL+2QSA=;
        b=t+k/wQQiC4jevqd7IqNs8oGU81McZLiRVfUWvLpGClKAW1qkftMSfrME8l1b8gAMEo
         adaNiblcib2+Twq4OiI7SEoImeEnc2OEl8AYYa7yFyc1+o+NxH5sefHu4Dj6dS1qL+3m
         JsuIns5hE9KXAf3Pl+NByZZcj2bEUXLDECXko=
In-Reply-To: <AANLkTik_oUwEAANf1BDDCnN7BzF1MoI-xr4cEBwwsbBE@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org

On Sun, Jun 6, 2010 at 9:18 PM, Matt Turner <mattst88@gmail.com> wrote:
> Hi Linus,
> Please pull the for-linus branch of my tree. It contains a patch
> that's been on the mailing list since February that I've overlooked a=
t
> least twice, including this merge window. Sorry about that. It's
> pretty simple, so it shouldn't cause any problems.
>
> The other two changes are fixes for very obvious screw-ups, whose
> breaking commits were clearly not even compile-tested, nor were they
> mailed to linux-alpha@ or any of the Alpha maintainers.
>
> Thanks!
> Matt
>
> The following changes since commit e44a21b7268a022c7749f521c06214145b=
d161e4:
> =A0Linus Torvalds (1):
> =A0 =A0 =A0 =A0Linux 2.6.35-rc2
>
> are available in the git repository at:
>
> =A0git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha-2.6.g=
it for-linus
>
> Matt Turner (2):
> =A0 =A0 =A0alpha: fix __arch_hweight32 typo
> =A0 =A0 =A0alpha: fix pci_mmap_resource API breakage
>
> Morten Holst Larsen (1):
> =A0 =A0 =A0alpha: Detect Super IO chip, no IDE on Avanti, enable EPP1=
9
>
> =A0arch/alpha/include/asm/bitops.h | =A0 =A02 +-
> =A0arch/alpha/kernel/Makefile =A0 =A0 =A0| =A0 20 ++++----
> =A0arch/alpha/kernel/ns87312.c =A0 =A0 | =A0 38 -----------------
> =A0arch/alpha/kernel/pc873xx.c =A0 =A0 | =A0 88 +++++++++++++++++++++=
++++++++++++++++++
> =A0arch/alpha/kernel/pc873xx.h =A0 =A0 | =A0 35 +++++++++++++++
> =A0arch/alpha/kernel/pci-sysfs.c =A0 | =A0 =A04 +-
> =A0arch/alpha/kernel/sys_sio.c =A0 =A0 | =A0 23 ++++++++++-
> =A07 files changed, 158 insertions(+), 52 deletions(-)
> =A0delete mode 100644 arch/alpha/kernel/ns87312.c
> =A0create mode 100644 arch/alpha/kernel/pc873xx.c
> =A0create mode 100644 arch/alpha/kernel/pc873xx.h
>

Don't pull this. There's a better fix for the PCI breakage.

I assume you didn't pull this because of the Super IO patch? Assuming
it is, I understand, but it's for AlphaStation 255s. Getting that
patch into -rc1 isn't going to get us any more testers for such
hardware.

It's my fault that it didn't make it in this merge window pull request
or even the last. I totally forgot about it. Please let me know if
it's alright to resent the pull request with the same contents but a
better fix for the PCI.

Thanks,
Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
