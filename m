From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [RFC PATCH 6/7] serial: General support for multipoint addresses
Date: Mon, 7 Mar 2022 11:48:01 +0200 (EET)
Message-ID: <ab43569c-6488-12a6-823-3ef09f2849d@linux.intel.com>
References: <20220302095606.14818-1-ilpo.jarvinen@linux.intel.com>
 <20220302095606.14818-7-ilpo.jarvinen@linux.intel.com>
 <20220306194001.GD19394@wunner.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-971395012-1646646016=:1677"
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646646554; x=1678182554;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=zC3EygN9B67AQNPvzALqT8NwONoTEFy8bHC2L1G4njc=;
 b=W28BMBpXy598i6KxO4bY4gPGt9zVM5TTEksM0CK9+5j0ciB3OnZJve6t
 FMRaz+qPkhat8zNr6gakN/43e+5EOXlv25nbnIhzyIHdEL359ipJobi4K
 WqSqxNcdhtqVu2bi8meJgbr3kN8CDX9ctnuFpvIeOEdEQveWge1Co+DjB
 CgXKtWBuPaYckQi7PLEbRQ9jIGEMa9M0sIRzXccsckmJHKTqR+DOZJ+Wq
 aE0FPCmfK8p53EUfrLqjLzGt1BkEc1JAvc4jGghDAuyYhm7+nCQ2FWqps
 hVlLxCc++MXQo01+pupLlfUh99ByKQqvudFKTgpmmbRNAjVM9TurZizpo A==;
In-Reply-To: <20220306194001.GD19394@wunner.de>
Content-ID: <cbee2ae-83f0-872e-34dd-cb9866dd3f6e@linux.intel.com>
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
To: Lukas Wunner <lukas@wunner.de>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-sh@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Rich Felker <dalias@libc.org>, Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org, linux-api@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, linux-doc@vger.kernel.org, linux-serial <linux-serial@vger.kernel.org>, Matt Turner <mattst88@gmail.com>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Johan Hovold <johan@kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>, Thomas Bogendoerfer <tsbogend@alpha.franken>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-971395012-1646646016=:1677
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-ID: <07d5f9f-7fe3-3c54-6566-1873a5191970@linux.intel.com>

On Sun, 6 Mar 2022, Lukas Wunner wrote:

> On Wed, Mar 02, 2022 at 11:56:05AM +0200, Ilpo J=E4rvinen wrote:
>=20
> > This change is necessary for supporting devices with RS485
> > multipoint addressing [*].
>=20
> If this is only used with RS485, why can't we just store the
> addresses in struct serial_rs485 and use the existing TIOCSRS485
> and TIOCGRS485 ioctls?  There's 20 bytes of padding left in
> struct serial_rs485 which you could use.  No need to add more
> user-space ABI.

It could if it is agreed that serial multipoint addressing is just
a thing in RS-485 and nowhere else? In that case, there is no point
in adding more generic support for it.

> > [*] Technically, RS485 is just an electronic spec and does not
> > itself specify the 9th bit addressing mode but 9th bit seems
> > at least "semi-standard" way to do addressing with RS485.
>=20
> Is 9th bit addressing actually used by an Intel customer or was
> it implemented just for feature completeness? I think this mode
> isn't used often (I've never seen a use case myself), primarily
> because it requires disabling parity.

On what basis? ...The datasheet I'm looking at has a timing diagram=20
with both D8 (9th bit) and parity so I think your information must be
incorrect. I don't have direct contacts with customers but I'm told
it's important for other org's customers.


--=20
 i.
--8323329-971395012-1646646016=:1677--
