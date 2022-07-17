From: Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH v2 1/2] asm-generic: Remove pci.h copying remaining code
 to x86
Date: Sun, 17 Jul 2022 18:42:32 +0900
Message-ID: <CAAfxs76K2fxTevDN8MrJAG74+wCthLd4sNNEPyU6x7hBaY7nFw@mail.gmail.com>
References: <20220717033453.2896843-1-shorne@gmail.com> <20220717033453.2896843-2-shorne@gmail.com>
 <CAMuHMdUT6nEft8v30sq0WP49RW2qUn+1sunk+ow2_EEyVEieEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="000000000000a59cf905e3fd129d"
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jP9irTWDrAJ3uK+gZP/3yO1ZauIstFAwM+AwsXaPL1Y=;
        b=g+RS9rMNBnNN6FT6Kn7ke5GSmoF6hlDsdH4YV90BiJHyO0tAUK4GOLMKfAdnS8Bh1O
         7hFOSYr0Mv7JNWTVv5QI3da9bF+MNLUURbVfhhuuHGvkeq/X4Nv+/MSVnK6dWcoLNj9A
         PqzLj5AXFy20LIKW+AtnjlvRIBOKD5m5p7vbQ1RQFgfFvcM92d0EE6BHA9AuVr8xS30E
         6GV3ziaGw+4FR4X26vNoHsO/i9y7DVPCMVJGsjqnU7fSM6bCx+EJXfl2JcUe+IKPe0fs
         dZB3pxVqMsJxmDF3Yzo6XWsdlxMO+pPlOixU/G6/qpklTX6ZSi2ncsDnCQZRHbsHCW8Z
         B41w==
In-Reply-To: <CAMuHMdUT6nEft8v30sq0WP49RW2qUn+1sunk+ow2_EEyVEieEQ@mail.gmail.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "open list:IA64 (Itanium) PL..." <linux-ia64@vger.kernel.org>, Matthew Rosato <mjrosato@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-riscv <linux-riscv@lists.infradead.org>, Linux-Arch <linux-arch@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, the arch/x86 maintainers <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, linux-pci <linux-pci@vger.kernel.org>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, "open list:TENSILICA XTENSA PORT (xtensa)" <linux- xtensa@linux-xtensa.org>, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, Va

--000000000000a59cf905e3fd129d
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 17, 2022, 6:23 PM Geert Uytterhoeven <geert@linux-m68k.org>
wrote:

> Hi Stafford,
>
> On Sun, Jul 17, 2022 at 5:35 AM Stafford Horne <shorne@gmail.com> wrote:
> > The generic pci.h header now only provides a definition of
> > pci_get_legacy_ide_irq which is used by architectures that support PNP.
> > Of the architectures that use asm-generic/pci.h this is only x86.
> >
> > This patch removes the old pci.h in order to make room for a new
> > pci.h to be used by arm64, riscv, openrisc, etc.
> >
> > The existing code in pci.h is moved out to x86.  On other architectures
> > we clean up any outstanding references.
> >
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Link:
> https://lore.kernel.org/lkml/CAK8P3a0JmPeczfmMBE__vn=Jbvf=nkbpVaZCycyv40pZNCJJXQ@mail.gmail.com/
> > Signed-off-by: Stafford Horne <shorne@gmail.com>
>
> Thanks for your patch!
>
> > --- a/arch/m68k/include/asm/pci.h
> > +++ b/arch/m68k/include/asm/pci.h
> > @@ -2,11 +2,14 @@
> >  #ifndef _ASM_M68K_PCI_H
> >  #define _ASM_M68K_PCI_H
> >
> > -#include <asm-generic/pci.h>
> > -
> >  #define        pcibios_assign_all_busses()     1
> >
> >  #define        PCIBIOS_MIN_IO          0x00000100
> >  #define        PCIBIOS_MIN_MEM         0x02000000
> >
> > +static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int
> channel)
> > +{
> > +       return channel ? 15 : 14;
> > +}
> > +
>
> I thought you were not going to add this?
>

I though so too. Somehow I lost track of a fixup.

I'll send a v3 tomorrow.

-Stafford

>

--000000000000a59cf905e3fd129d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, Jul 17, 2022, 6:23 PM Geert Uytterhoeven &lt;<=
a href=3D"mailto:geert@linux-m68k.org">geert@linux-m68k.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Hi Stafford,<br>
<br>
On Sun, Jul 17, 2022 at 5:35 AM Stafford Horne &lt;<a href=3D"mailto:shorne=
@gmail.com" target=3D"_blank" rel=3D"noreferrer">shorne@gmail.com</a>&gt; w=
rote:<br>
&gt; The generic pci.h header now only provides a definition of<br>
&gt; pci_get_legacy_ide_irq which is used by architectures that support PNP=
.<br>
&gt; Of the architectures that use asm-generic/pci.h this is only x86.<br>
&gt;<br>
&gt; This patch removes the old pci.h in order to make room for a new<br>
&gt; pci.h to be used by arm64, riscv, openrisc, etc.<br>
&gt;<br>
&gt; The existing code in pci.h is moved out to x86.=C2=A0 On other archite=
ctures<br>
&gt; we clean up any outstanding references.<br>
&gt;<br>
&gt; Suggested-by: Arnd Bergmann &lt;<a href=3D"mailto:arnd@arndb.de" targe=
t=3D"_blank" rel=3D"noreferrer">arnd@arndb.de</a>&gt;<br>
&gt; Link: <a href=3D"https://lore.kernel.org/lkml/CAK8P3a0JmPeczfmMBE__vn=
=3DJbvf=3DnkbpVaZCycyv40pZNCJJXQ@mail.gmail.com/" rel=3D"noreferrer norefer=
rer" target=3D"_blank">https://lore.kernel.org/lkml/CAK8P3a0JmPeczfmMBE__vn=
=3DJbvf=3DnkbpVaZCycyv40pZNCJJXQ@mail.gmail.com/</a><br>
&gt; Signed-off-by: Stafford Horne &lt;<a href=3D"mailto:shorne@gmail.com" =
target=3D"_blank" rel=3D"noreferrer">shorne@gmail.com</a>&gt;<br>
<br>
Thanks for your patch!<br>
<br>
&gt; --- a/arch/m68k/include/asm/pci.h<br>
&gt; +++ b/arch/m68k/include/asm/pci.h<br>
&gt; @@ -2,11 +2,14 @@<br>
&gt;=C2=A0 #ifndef _ASM_M68K_PCI_H<br>
&gt;=C2=A0 #define _ASM_M68K_PCI_H<br>
&gt;<br>
&gt; -#include &lt;asm-generic/pci.h&gt;<br>
&gt; -<br>
&gt;=C2=A0 #define=C2=A0 =C2=A0 =C2=A0 =C2=A0 pcibios_assign_all_busses()=
=C2=A0 =C2=A0 =C2=A01<br>
&gt;<br>
&gt;=C2=A0 #define=C2=A0 =C2=A0 =C2=A0 =C2=A0 PCIBIOS_MIN_IO=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0x00000100<br>
&gt;=C2=A0 #define=C2=A0 =C2=A0 =C2=A0 =C2=A0 PCIBIOS_MIN_MEM=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x02000000<br>
&gt;<br>
&gt; +static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int cha=
nnel)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return channel ? 15 : 14;<br>
&gt; +}<br>
&gt; +<br>
<br>
I thought you were not going to add this?<br></blockquote></div></div><div =
dir=3D"auto"><br></div><div dir=3D"auto">I though so too. Somehow I lost tr=
ack of a fixup.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ll=
 send a v3 tomorrow.</div><div dir=3D"auto"><br></div><div dir=3D"auto">-St=
afford=C2=A0</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
</blockquote></div></div></div>

--000000000000a59cf905e3fd129d--
