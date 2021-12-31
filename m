From: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: Re: [RFC 02/32] Kconfig: introduce HAS_IOPORT option and select it
 as necessary
Date: Fri, 31 Dec 2021 12:28:23 +0100
Message-ID: <072b9080be4a408052bf2c2cc1a9be0089cce5cc.camel@linux.ibm.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
         <20211227164317.4146918-3-schnelle@linux.ibm.com>
         <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
         <d406b93a-0f76-d056-3380-65d459d05ea9@gmail.com>
         <CAK8P3a2j-OFUUp+haHoV4PyL-On4EASZ9+59SDqNqmL8Gv_k7Q@mail.gmail.com>
         <1f90f145-219e-1cad-6162-9959d43a27ad@gmail.com>
         <CAK8P3a3NqU-3nUZ9ve=QyPPB5Uep3eK+_hicjjSiP8VuL4FYfA@mail.gmail.com>
         <0211719b-8402-9865-8e5d-5c0a35715816@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=pzUt4LgyPXDJP5o63yyZnj398P6Tb55t1EAvGioG3k8=;
 b=g160z1MzL7ZaBJP0PCFl8WM+/oaNldyPX5T/b2OeqniIg6zpoJJ47PVZUowg0MtVBM+b
 75D8w5J5YM6d+KsITNJ6SyAPHmjNd4qzLkRKe2Aa5iqaRILDTl8nTunlrD/V/PWQopyi
 ffu+DrDe3G3FsNW8naQ0Vs9Jme2ccq8/xhb9T75Om2b3Ho14lej524nWlJSXlp9TAAz1
 NyTMooQ1KiqpJr+uzRKwIcFVyCGx228US4hJSEC5MwRoddDO03iAEPHtx6Mul7n9ZuAB
 j9Zbs6TrzO/vN/WHJf/odeWes281S8+pAqE18r2f1uyR1y9UGT7YCQUk3l3U7i4EttAT XQ== 
In-Reply-To: <0211719b-8402-9865-8e5d-5c0a35715816@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Schmitz <schmitzmic@gmail.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Bjorn Helgaas <bhelgaas@google.com>, John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Chris Zankel <chris@zankel.net>, Karol Gugala <kgugala@antmicro.com>, Jeff Dike <jdike@addtoit.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Brian Cain <bcain@codeaurora.org>, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <v>

On Thu, 2021-12-30 at 16:44 +1300, Michael Schmitz wrote:
> Hi Arnd,
> 
> Am 30.12.2021 um 14:48 schrieb Arnd Bergmann:
> > On Tue, Dec 28, 2021 at 11:15 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> > > Am 29.12.2021 um 16:41 schrieb Arnd Bergmann:
> > > > On Tue, Dec 28, 2021 at 8:20 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
---8<---
> 
> > What some other architectures do is to rely on inb()/outb() to have a
> > zero-based offset, and use an io_offset in PCI buses to ensure that a
> > low port number on the bus gets translated into a pointer value for the
> > virtual mapping in the kernel, which is then represented as an unsigned
> > int.
> 
> M54xx does just that for Coldfire:
> 
> arch/m68k/include/asm/io_no.h:
> #define PCI_IO_PA	0xf8000000		/* Host physical address */
> 
> (used to set PCI BAR mappings, so matches your definition above).
> 
> All other (MMU) m68k users of inb()/outb() apply an io_offset in the 
> platform specific address translation:
> 
> 
---8<---
> So as long as support for any of the m68k PCI or ISA bridges is selected 
> in the kernel config, the appropriate IO space mapping is applied. If no 
> support for PCI or ISA bridges is selected, we already fall back to zero 
> offset mapping (but as far as I can tell, it shouldn't be possible to 
> build a kernel without bridge support but drivers that require it).
> 
> > As this is indistinguishable from architectures that just don't have
> > a base address for I/O ports (we unfortunately picked 0 as the default
> > PCI_IOBASE value), my suggestion was to start marking architectures
> > that may have this problem as using HAS_IOPORT in order to keep
> > the existing behavior unchanged. If m68k does not suffer from this,
> > making HAS_IOPORT conditional on those config options that actually
> > need it would of course be best.
> 
> Following your description, HAS_IOPORT would be required for neither of 
> PCI, ISA or ATARI_ROM_ISA ??
> 

No, HAS_IOPORT being set just means that inb() etc. exist and are
functional be it as special instructions like on x86 or via an I/O
address offset. As I understand it if you do have PCI, ISA or
ATARI_ROM_ISA they are functional. If none of them are set and your
zero offset mapping means these accessors can't actually be used you
could make the declerations ifdeffed on CONFIG_HAS_IOPORT to detect the
cases where somone managed to build drivers that require them and that
would result in a compile time error instead of silently, or with a
NULL pointer warning, compiling code that won't work.

