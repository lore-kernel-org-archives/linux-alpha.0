From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 16/19] alpha: titan: Convert irq_chip functions
Date: Wed, 23 Feb 2011 23:03:49 +0100 (CET)
Message-ID: <alpine.LFD.2.00.1102232303170.2701@localhost6.localdomain6>
References: <20110206143037.124533892@linutronix.de> <20110206143149.420669286@linutronix.de> <AANLkTinUGRXoa_wS-DGEuugXaJe_Zku8NrmLF4LF5WWX@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-1463795968-381648636-1298498630=:2701"
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <AANLkTinUGRXoa_wS-DGEuugXaJe_Zku8NrmLF4LF5WWX@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, Kyle McMartin <kyle@redhat.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463795968-381648636-1298498630=:2701
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Feb 2011, Matt Turner wrote:
> On Sun, Feb 6, 2011 at 2:32 PM, Thomas Gleixner <tglx@linutronix.de> wrot=
e:
> > =A0static inline void
> > -titan_disable_irq(unsigned int irq)
> > +titan_disable_irq(struct irq_data *d)
> > =A0{
> > =A0 =A0 =A0 =A0spin_lock(&titan_irq_lock);
> > =A0 =A0 =A0 =A0titan_cached_irq_mask &=3D ~(1UL << (irq - 16));
>=20
> These hunks are missing a
> +       unsigned int irq =3D d->irq;

OOps.
=20
> I can fix that up myself though.

That'd be great. Thanks,

       tglx

---1463795968-381648636-1298498630=:2701--
