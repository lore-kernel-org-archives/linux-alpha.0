From: Cye Borg <cyborgyn@gmail.com>
Subject: Re: [PATCH 02/10] ARM: disable CONFIG_IDE in footbridge_defconfig
Date: Mon, 22 Mar 2021 17:43:16 +0100
Message-ID: <CAD4NMuY1s5kORzeYbHXNBnzb82nZobz6BqwufFqPpsLjvttnYw@mail.gmail.com>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-3-hch@lst.de>
 <20210319170753.GV1463@shell.armlinux.org.uk>
 <20210319175311.GW1463@shell.armlinux.org.uk>
 <20210322145403.GA30942@lst.de> <20210322151503.GX1463@shell.armlinux.org.uk>
 <224b110e-7c42-4e19-800e-e0fa23d3bf7f@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="000000000000df0d4105be22c352"
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gwquwXRPklzMHw+r3uwVbgzAP27IF7susOXw11SNkK4=;
 b=SRMRmjJRi2hGjF6XXTjCX8QaOPIVxg0nv0gAKl1R3UcNny/EdP/jyzwsx0JJ15bFOh
 CfDsiVYzd2EogFtp7Bo5su9o42UhF/ScaHyP1WFF92ooDgvQGei6h+qG2PMlkzLNOgKi
 MiMSmE+YIhLm9azuD6TECxtg/Q+ZkctiML3s/O1eMdqQGpOM6GmljvZEfY37IqhVIsxs
 N0+BTijHkEPY0/y6lQk2C4DwPhYmSpOqNm7vOjvVgwHwgwWbBYdEWb+crdwSLi+SO1tq
 NzQUHA0nd7/2qgiBl3bolNIkUzy5odAZHSKP5Kt0Cz5Pt77/ua+cz6livZhtrPGLXYIy
 GNZw==
In-Reply-To: <224b110e-7c42-4e19-800e-e0fa23d3bf7f@physik.fu-berlin.de>
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
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Jens Axboe <axboe@kernel.dk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-doc@vger.kernel.org, Russell King - ARM Linux admin <linux@armlinux.org.uk>, Christoph Hellwig <hch@lst.de>, linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>

--000000000000df0d4105be22c352
Content-Type: text/plain; charset="UTF-8"

And lspci from Compaq PWS 500au:
snow / # lspci
00:03.0 Ethernet controller: Digital Equipment Corporation DECchip 21142/43
(rev 30)
00:07.0 ISA bridge: Contaq Microsystems 82c693
00:07.1 IDE interface: Contaq Microsystems 82c693
00:07.2 IDE interface: Contaq Microsystems 82c693
00:07.3 USB controller: Contaq Microsystems 82c693
00:0b.0 Multimedia video controller: 3Dfx Interactive, Inc. Voodoo 2 (rev
02)
00:0c.0 PCI bridge: Digital Equipment Corporation DECchip 21052 (rev 01)
00:14.0 PCI bridge: Digital Equipment Corporation DECchip 21152 (rev 02)
01:04.0 VGA compatible controller: Cirrus Logic GD 5430/40 [Alpine] (rev 47)
01:05.0 Display controller: Intergraph Corporation Device 00eb (rev 40)
02:04.0 SCSI storage controller: QLogic Corp. ISP1020 Fast-wide SCSI (rev
05)
02:0a.0 SCSI storage controller: Broadcom / LSI 53c810 (rev 01)

It's also using pata_cypress.

Barnabas Viragh

On Mon, Mar 22, 2021 at 5:10 PM John Paul Adrian Glaubitz <
glaubitz@physik.fu-berlin.de> wrote:

> On 3/22/21 4:15 PM, Russell King - ARM Linux admin wrote:
> > I'm quite surprised that the CY82C693 even works on Alpha - I've
> > asked for a lspci for that last week but nothing has yet been
> > forthcoming from whoever responded to your patch for Alpha - so I
> > can't compare what I'm seeing with what's happening with Alpha.
>
> Here is lspci on my DEC Alpha XP-1000:
>
> root@tsunami:~> lspci
> 0000:00:07.0 ISA bridge: Contaq Microsystems 82c693
> 0000:00:07.1 IDE interface: Contaq Microsystems 82c693
> 0000:00:07.2 IDE interface: Contaq Microsystems 82c693
> 0000:00:07.3 USB controller: Contaq Microsystems 82c693
> 0000:00:0d.0 VGA compatible controller: Texas Instruments TVP4020
> [Permedia 2] (rev 01)
> 0001:01:03.0 Ethernet controller: Digital Equipment Corporation DECchip
> 21142/43 (rev 41)
> 0001:01:06.0 SCSI storage controller: QLogic Corp. ISP1020 Fast-wide SCSI
> (rev 06)
> 0001:01:08.0 PCI bridge: Digital Equipment Corporation DECchip 21152 (rev
> 03)
> 0001:02:09.0 Ethernet controller: Intel Corporation 82541PI Gigabit
> Ethernet Controller (rev 05)
> root@tsunami:~>
>
> It's using pata_cypress:
>
> root@tsunami:~> lsmod|grep cypress
> pata_cypress            3595  3
> libata                235071  2 ata_generic,pata_cypress
> root@tsunami:~
>
> Adrian
>
> --
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer - glaubitz@debian.org
> `. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
>
>

--000000000000df0d4105be22c352
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>And lspci from Compaq PWS 500au:</div><div>snow / # l=
spci<br>00:03.0 Ethernet controller: Digital Equipment Corporation DECchip =
21142/43 (rev 30)<br>00:07.0 ISA bridge: Contaq Microsystems 82c693<br>00:0=
7.1 IDE interface: Contaq Microsystems 82c693<br>00:07.2 IDE interface: Con=
taq Microsystems 82c693<br>00:07.3 USB controller: Contaq Microsystems 82c6=
93<br>00:0b.0 Multimedia video controller: 3Dfx Interactive, Inc. Voodoo 2 =
(rev 02)<br>00:0c.0 PCI bridge: Digital Equipment Corporation DECchip 21052=
 (rev 01)<br>00:14.0 PCI bridge: Digital Equipment Corporation DECchip 2115=
2 (rev 02)<br>01:04.0 VGA compatible controller: Cirrus Logic GD 5430/40 [A=
lpine] (rev 47)<br>01:05.0 Display controller: Intergraph Corporation Devic=
e 00eb (rev 40)<br>02:04.0 SCSI storage controller: QLogic Corp. ISP1020 Fa=
st-wide SCSI (rev 05)<br>02:0a.0 SCSI storage controller: Broadcom / LSI 53=
c810 (rev 01)</div><div><br></div><div>It&#39;s also using pata_cypress.</d=
iv><div><br></div><div>Barnabas Viragh<br></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 22, 2021 at 5:1=
0 PM John Paul Adrian Glaubitz &lt;<a href=3D"mailto:glaubitz@physik.fu-ber=
lin.de">glaubitz@physik.fu-berlin.de</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On 3/22/21 4:15 PM, Russell King - ARM =
Linux admin wrote:<br>
&gt; I&#39;m quite surprised that the CY82C693 even works on Alpha - I&#39;=
ve<br>
&gt; asked for a lspci for that last week but nothing has yet been<br>
&gt; forthcoming from whoever responded to your patch for Alpha - so I<br>
&gt; can&#39;t compare what I&#39;m seeing with what&#39;s happening with A=
lpha.<br>
<br>
Here is lspci on my DEC Alpha XP-1000:<br>
<br>
root@tsunami:~&gt; lspci<br>
0000:00:07.0 ISA bridge: Contaq Microsystems 82c693<br>
0000:00:07.1 IDE interface: Contaq Microsystems 82c693<br>
0000:00:07.2 IDE interface: Contaq Microsystems 82c693<br>
0000:00:07.3 USB controller: Contaq Microsystems 82c693<br>
0000:00:0d.0 VGA compatible controller: Texas Instruments TVP4020 [Permedia=
 2] (rev 01)<br>
0001:01:03.0 Ethernet controller: Digital Equipment Corporation DECchip 211=
42/43 (rev 41)<br>
0001:01:06.0 SCSI storage controller: QLogic Corp. ISP1020 Fast-wide SCSI (=
rev 06)<br>
0001:01:08.0 PCI bridge: Digital Equipment Corporation DECchip 21152 (rev 0=
3)<br>
0001:02:09.0 Ethernet controller: Intel Corporation 82541PI Gigabit Etherne=
t Controller (rev 05)<br>
root@tsunami:~&gt;<br>
<br>
It&#39;s using pata_cypress:<br>
<br>
root@tsunami:~&gt; lsmod|grep cypress<br>
pata_cypress=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3595=C2=A0 3<br>
libata=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 235071=C2=A0 =
2 ata_generic,pata_cypress<br>
root@tsunami:~<br>
<br>
Adrian<br>
<br>
-- <br>
=C2=A0.&#39;&#39;`.=C2=A0 John Paul Adrian Glaubitz<br>
: :&#39; :=C2=A0 Debian Developer - <a href=3D"mailto:glaubitz@debian.org" =
target=3D"_blank">glaubitz@debian.org</a><br>
`. `&#39;=C2=A0 =C2=A0Freie Universitaet Berlin - <a href=3D"mailto:glaubit=
z@physik.fu-berlin.de" target=3D"_blank">glaubitz@physik.fu-berlin.de</a><b=
r>
=C2=A0 `-=C2=A0 =C2=A0 GPG: 62FF 8A75 84E0 2956 9546=C2=A0 0006 7426 3B37 F=
5B5 F913<br>
<br>
</blockquote></div>

--000000000000df0d4105be22c352--
