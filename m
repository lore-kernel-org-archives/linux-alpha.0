From: Cye Borg <cyborgyn@gmail.com>
Subject: Re: [PATCH 02/10] ARM: disable CONFIG_IDE in footbridge_defconfig
Date: Mon, 22 Mar 2021 16:44:43 +0100
Message-ID: <CAD4NMuaasexgWUmYD0CwhxuFS760Pj4GVuBpJNp+g0YBXpSPnw@mail.gmail.com>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-3-hch@lst.de>
 <20210319170753.GV1463@shell.armlinux.org.uk>
 <20210319175311.GW1463@shell.armlinux.org.uk>
 <20210322145403.GA30942@lst.de> <20210322151503.GX1463@shell.armlinux.org.uk>
 <20210322151823.GA2764@lst.de>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0000000000007d960b05be21f2a0"
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zTBufNw4i/2n7snfGRiAb8kqCxwWobWjwTB6oKESZ0M=;
 b=JPyw4UZw2XwOct90taF3URGMHz1LhhZ9jbMRPbZnTq2rdbZYvet2VmhekAnLYqS8TZ
 9fgKg8mg2eGcwmnbpxEejFZq2ot0eB3RggThBEXrelNA/RjoLxGHrm7pLCwQW35+O+db
 MoHPHctNpYV3kfKhUBxgPHz3I18LgaC3FqB5Hy8MRZV1vEQ6zpa46Jrimhy0lwiMtN3n
 F8lg7EmEefEEwQ6cPVEpEMcwWqErOAp7cRjlyik3lmyqSHb66RklRvApTpZrk8DxHLvu
 0Q1uQxXH0yyLl2tRp1lzgR62YpcK1CmFSlNgZohKnaO1u1meCjWqaUzNLn+JCdW4yXR6
 4ZvQ==
In-Reply-To: <20210322151823.GA2764@lst.de>
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
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-doc@vger.kernel.org, Russell King - ARM Linux admin <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>

--0000000000007d960b05be21f2a0
Content-Type: text/plain; charset="UTF-8"

I use pata_cypress on Alpha, and for the above mentioned problems,
it always restricted me to use only one IDE channel out of the two
available. Also, not forcing it to use PIO mode, it always failed to
operate. I would love to test on Alpha, and give you feedback about
a fix/finished implementation of the driver. I have both Alpha Server DS20E
and Alpha Personal Workstation 500 including that freak chipset.

Let me know if/when I can help with my limited capabilities.

Thanks, best regards,
Barnabas Viragh

On Mon, Mar 22, 2021 at 4:19 PM Christoph Hellwig <hch@lst.de> wrote:

> On Mon, Mar 22, 2021 at 03:15:03PM +0000, Russell King - ARM Linux admin
> wrote:
> > It gets worse than that though - due to a change to remove
> > pcibios_min_io from the generic code, moving it into the ARM
> > architecture code, this has caused a regression that prevents the
> > legacy resources being registered against the bus resource. So even
> > if they are there, they cause probe failures. I haven't found a
> > reasonable way to solve this yet, but until there is, there is no
> > way that the PATA driver can be used as the "legacy mode" support
> > is effectively done via the PCI code assigning virtual IO port
> > resources.
> >
> > I'm quite surprised that the CY82C693 even works on Alpha - I've
> > asked for a lspci for that last week but nothing has yet been
> > forthcoming from whoever responded to your patch for Alpha - so I
> > can't compare what I'm seeing with what's happening with Alpha.
>
> That sounds like something we could fix with a quirk for function 2
> in the PCI resource assignment code.  Can you show what vendor and
> device ID function 2 has so that I could try to come up with one?
>

--0000000000007d960b05be21f2a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I use pata_cypress on Alpha, and for the above mentio=
ned problems, <br></div><div>it always restricted me to use only one IDE ch=
annel out of the two</div><div>available. Also, not forcing it to use PIO m=
ode, it always failed to</div><div>operate. I would love to test on Alpha, =
and give you feedback about</div><div>a fix/finished implementation of the =
driver. I have both Alpha Server DS20E</div><div>and Alpha Personal Worksta=
tion 500 including that freak chipset.</div><div><br></div><div>Let me know=
 if/when I can help with my limited capabilities.</div><div><br></div><div>=
Thanks, best regards,</div><div>Barnabas Viragh<br></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 22, 20=
21 at 4:19 PM Christoph Hellwig &lt;<a href=3D"mailto:hch@lst.de">hch@lst.d=
e</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Mon, Mar 22, 2021 at 03:15:03PM +0000, Russell King - ARM Linux admin w=
rote:<br>
&gt; It gets worse than that though - due to a change to remove<br>
&gt; pcibios_min_io from the generic code, moving it into the ARM<br>
&gt; architecture code, this has caused a regression that prevents the<br>
&gt; legacy resources being registered against the bus resource. So even<br=
>
&gt; if they are there, they cause probe failures. I haven&#39;t found a<br=
>
&gt; reasonable way to solve this yet, but until there is, there is no<br>
&gt; way that the PATA driver can be used as the &quot;legacy mode&quot; su=
pport<br>
&gt; is effectively done via the PCI code assigning virtual IO port<br>
&gt; resources.<br>
&gt; <br>
&gt; I&#39;m quite surprised that the CY82C693 even works on Alpha - I&#39;=
ve<br>
&gt; asked for a lspci for that last week but nothing has yet been<br>
&gt; forthcoming from whoever responded to your patch for Alpha - so I<br>
&gt; can&#39;t compare what I&#39;m seeing with what&#39;s happening with A=
lpha.<br>
<br>
That sounds like something we could fix with a quirk for function 2<br>
in the PCI resource assignment code.=C2=A0 Can you show what vendor and<br>
device ID function 2 has so that I could try to come up with one?<br>
</blockquote></div>

--0000000000007d960b05be21f2a0--
