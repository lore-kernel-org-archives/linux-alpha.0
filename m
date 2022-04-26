From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v5 05/10] serial: termbits: ADDRB to indicate 9th bit
 addressing mode
Date: Tue, 26 Apr 2022 19:29:08 +0300 (EEST)
Message-ID: <9a9dda88-b239-9c63-82d-2f7678fdbf9@linux.intel.com>
References: <20220426122448.38997-1-ilpo.jarvinen@linux.intel.com> <20220426122448.38997-6-ilpo.jarvinen@linux.intel.com> <Ymfq+jUXfZcNM/P/@kroah.com> <b667479-fb27-8712-cec8-938eed179240@linux.intel.com> <17547658-4737-7ec1-9ef9-c61c6287b8b@linux.intel.com>
 <Ymf9UhyXj7o8cNhq@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1964830911-1650990558=:1644"
Return-path: <sparclinux-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650991024; x=1682527024;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=YkchwpoFBWYE6wjpBeZGz+2BPwCBUpcUNyTQQIFBqC8=;
  b=fLbV+umM1okXVQ+opaeKUa4wNxnCdAzm4VnPEF/Hs9JbF7BotaUAB3lF
   +8/U7u3Q0z9WIhRb4GSFMsLJ4/V1+i8kJ/QFzbju8etjyTdBQgzzCEg+M
   7fWePO0cEhsoNrbvSI9kO9ya5OtaK5FqwGgSJfNizUGe9P02X6uPCDMUa
   133RzbODLblYJbbu6rmBDBLeZc7moxEYOB6eaAoFFtFKnNyYUw5uQyWsM
   6Gt7zJ5+Fmll5TXWf9FkU0QzYKrCfj9UxWoEpprDy6gIKahKLqoSTHBfu
   KE7QWlVl8q1PdUqJXKm+WtUxY+nBv1lX9BsdJOHLBPRfY69g6ARz9eS2H
   w==;
In-Reply-To: <Ymf9UhyXj7o8cNhq@kroah.com>
List-ID: <linux-alpha.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-serial <linux-serial@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Lukas Wunner <lukas@wunner.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Vicente Bergas <vicencb@gmail.com>, Johan Hovold <johan@kernel.org>, heiko@sntech.de, giulio.benetti@micronovasrl.com, Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-api@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, Michael Ellerman <>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1964830911-1650990558=:1644
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue, 26 Apr 2022, Greg KH wrote:

> On Tue, Apr 26, 2022 at 05:01:31PM +0300, Ilpo J=E4rvinen wrote:
> >=20
> > ADDRB value is the same for all archs (it's just this octal vs hex=20
> > notation I've followed as per the nearby defines within the same file
> > which makes them look different).
> >=20
> > Should I perhaps add to my cleanup list conversion of all those octal o=
nes=20
> > to hex?
>=20
> Argh, yes, please, let's do that now, I totally missed that.  Will let
> us see how to unify them as well.

Unifying them might turn out impractical, here's a rough idea now many
copies ... | uniq -c finds for the defines (based on more aggressively=20
cleaned up lines than the patch will have):
     89 1
     74 2
     14 3
     58 4
     11 5
     54 6
There just tends to be 1 or 2 archs which are different from the others.

...I'll send the actual octal-to-hex patch once the arch builds complete.

--=20
 i.

--8323329-1964830911-1650990558=:1644--
