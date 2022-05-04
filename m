From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 1/1] termbits: Convert octal defines to hex
Date: Wed, 4 May 2022 11:33:32 +0300 (EEST)
Message-ID: <ca39c741-8d15-33c0-7bd6-635778cc436@linux.intel.com>
References: <2c8c96f-a12f-aadc-18ac-34c1d371929c@linux.intel.com> <CAK8P3a0hy8Ras7pwF9rJADtCAfeV49K7GWkftJnzqeGiQ6j-zA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-777826785-1651653220=:1623"
Return-path: <linux-api-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651653221; x=1683189221;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=HLCH8nB4SW/lMh2Z2lGHu7Z1XbytxGyCLhDOE+GPI7E=;
  b=emsEx7nXjWgI+sa0P1QVs7Cjx3dnfgYT5Isrm0a2W6KrTuT/91ueQOiv
   4uB3VpFCEkBruYonIOytLWgmlwgIavX+NFyscTALPRYLWzGvlacqlDY0/
   MkiSorlZGLZx1wzIuKKFlaQhddz992UR04eqztnCmhYjmWrX+NDtLuBkN
   tKijcSL5hWgoacMt7LtWQSSNhBFAscYB0BzxPW5ZhA3vWCj+nGk6b1xPe
   g3nbnAT/lTG+jNAjUqiTCeJS3nNctUWx85/igYcfl+kSckzgpONk/jaxX
   +F0p7OkkZA0YCYQOvShAXwLjMDz786P2qtu2D7kGcMDu8GJ1PRPcST5of
   w==;
In-Reply-To: <CAK8P3a0hy8Ras7pwF9rJADtCAfeV49K7GWkftJnzqeGiQ6j-zA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-serial <linux-serial-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jiri Slaby <jirislaby-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux API <linux-api-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>, Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alpha <linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Bogendoerfer <tsbogend-I1c7kopa9pxLokYuJOExCg@public.gmane.org>, "open list:BROADCOM NVRAM DRIVER" <linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "James E.J. Bottomley" <James.Bottomley-JuX6DAaQMKPCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>, Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>, Parisc List <linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-arch <linux-arch-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel@vger.k>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-777826785-1651653220=:1623
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 4 May 2022, Arnd Bergmann wrote:

> On Wed, May 4, 2022 at 9:20 AM Ilpo Järvinen
> <ilpo.jarvinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> >
> > Many archs have termbits.h as octal numbers. It makes hard for humans
> > to parse the magnitude of large numbers correctly and to compare with
> > hex ones of the same define.
> >
> > Convert octal values to hex.
> >
> > First step is an automated conversion with:
> >
> > for i in $(git ls-files | grep 'termbits\.h'); do
> >         awk --non-decimal-data '/^#define\s+[A-Z][A-Z0-9]*\s+0[0-9]/ {
> >                 l=int(((length($3) - 1) * 3 + 3) / 4);
> >                 repl = sprintf("0x%0" l "x", $3);
> >                 print gensub(/[^[:blank:]]+/, repl, 3);
> >                 next} {print}' $i > $i~;
> >         mv $i~ $i;
> > done
> >
> > On top of that, some manual processing on alignment and number of zeros.
> > In addition, small tweaks to formatting of a few comments on the same
> > lines.
> >
> > Signed-off-by: Ilpo Järvinen <ilpo.jarvinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> 
> Good idea!
> 
> I assume you already checked if additional file contents can be shared across
> architectures? I think I've tried in the past but didn't really get
> anywhere with
> that.
> 
> After applying the patch locally, I still see a bunch of whitespace
> differences in the
> changed lines if I run
> 
> vimdiff arch/*/include/uapi/asm/termbits.h include/uapi/asm-generic/termbits.h
> 
> I think this mostly because you left the sparc version alone (it already
> uses hex constants), but it may be nice to edit this a little more to
> make the actual differences stick out more.

I took a look on further harmonizing, however, it turned out to be not 
that simple. This is basically the pipeline I use to further cleanup the 
differences and remove comments if you want to play yourself, just remove 
stages from the tail to get the intermediate datas (gawk is required for 
--non-decimal-data):

$ git ls-files | grep 'termbits\.h' | xargs grep -h -e '#define' | awk --non-decimal-data '{if (NF < 3) {next}; printf("#define %s\t0x%08x\n", $2, $3)}' | sort | uniq -c | sort | awk '{print $1}' | uniq -c
     82 1
     74 2
     14 3
     58 4
     11 5
     54 6

So only 54 are the same for all archs (non-numeric defines such as EXT[AB] 
will appear as 0x0 but at least those two seem the same across archs 
anyway):
      6 #define B0      0x00000000
      6 #define B110    0x00000003
      6 #define B1200   0x00000009
      6 #define B134    0x00000004
      6 #define B150    0x00000005
      6 #define B1800   0x0000000a
      6 #define B19200  0x0000000e
      6 #define B200    0x00000006
      6 #define B2400   0x0000000b
      6 #define B300    0x00000007
      6 #define B38400  0x0000000f
      6 #define B4800   0x0000000c
      6 #define B50     0x00000001
      6 #define B600    0x00000008
      6 #define B75     0x00000002
      6 #define B9600   0x0000000d
      6 #define BRKINT  0x00000002
      6 #define BS0     0x00000000
      6 #define CMSPAR  0x40000000
      6 #define CR0     0x00000000
      6 #define CRTSCTS 0x80000000
      6 #define CS5     0x00000000
      6 #define ECHO    0x00000008
      6 #define EXTA    0x00000000
      6 #define EXTB    0x00000000
      6 #define FF0     0x00000000
      6 #define IBSHIFT 0x00000010
      6 #define ICRNL   0x00000100
      6 #define IGNBRK  0x00000001
      6 #define IGNCR   0x00000080
      6 #define IGNPAR  0x00000004
      6 #define INLCR   0x00000040
      6 #define INPCK   0x00000010
      6 #define ISTRIP  0x00000020
      6 #define IXANY   0x00000800
      6 #define NL0     0x00000000
      6 #define NL1     0x00000100
      6 #define OCRNL   0x00000008
      6 #define OFDEL   0x00000080
      6 #define OFILL   0x00000040
      6 #define ONLRET  0x00000020
      6 #define ONOCR   0x00000010
      6 #define OPOST   0x00000001
      6 #define PARMRK  0x00000008
      6 #define TAB0    0x00000000
      6 #define TCIFLUSH        0x00000000
      6 #define TCIOFF  0x00000002
      6 #define TCIOFLUSH       0x00000002
      6 #define TCION   0x00000003
      6 #define TCOFLUSH        0x00000001
      6 #define TCOOFF  0x00000000
      6 #define TCOON   0x00000001
      6 #define TCSANOW 0x00000000
      6 #define VT0     0x00000000

Sadly for the others, it just tends to be that one or two are different 
from the rest.



-- 
 i.

--8323329-777826785-1651653220=:1623--
