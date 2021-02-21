From: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 1/2] arch: syscalls: add missing FORCE and fix 'targets'
 to make if_changed work
Date: Mon, 22 Feb 2021 02:14:47 +0900
Message-ID: <CAK7LNATvCAyHSUQNTdSck3JM1MfHNFcanjn0i4835okWE9Km5w@mail.gmail.com>
References: <20210215004823.440102-1-masahiroy@kernel.org>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 11LHFQrZ029418
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1613927727;
 bh=+E+JRgKeitH5eFBx4Z/rh8FyWasix1MSTNAEXqizMQU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bMuBhHK7G0jarpKwNRXWEMYT5MtPlzuF5j6jQhR0vKMbsbDlQYSfL7y4bC3BtKc+c
 +x9fwA0r9GMAlg25UIIjgntPPxvjQKVJXrieXIEBqLwSYbUOMLRJs/BBjg9S5lDoJe
 YFO+UWc6yok8wxWw5YHFcsaU+oWdY9hhIKQUV+1Vo8/hPo5kHU17wmhY2kmMkthXx1
 Aac2tia/pqlRCEWpFaoNZu15eFP3XovGAJdZrNhdopztTSxTvNrTvSYUa/Wc0pUBjc
 49b1LTdcahp1zJ37gWLuAPMixQeM/MK89EqDPRXF7Syn76qh20IGYMFKLKVDrjW2PT
 Ro+SpRajqEwHw==
In-Reply-To: <20210215004823.440102-1-masahiroy@kernel.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>, linux-mips@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, X86 ML <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>, Fenghua Yu <fenghua.yu@intel.com>, "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Richard

On Mon, Feb 15, 2021 at 9:50 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The rules in these Makefiles cannot detect the command line change
> because the prerequisite 'FORCE' is missing.
>
> Adding 'FORCE' will result in the headers being rebuilt every time
> because the 'targets' additions are also wrong; the file paths in
> 'targets' must be relative to the current Makefile.
>
> Fix all of them so the if_changed rules work correctly.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>


Both applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
