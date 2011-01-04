From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [BUG] implicit declaration of kfree/kzalloc in i2c-i801.c on
 Alpha
Date: Tue, 4 Jan 2011 14:11:51 -0800
Message-ID: <20110104141151.b6035bf3.randy.dunlap@oracle.com>
References: <20110104061821.GA25886@gherkin.frus.com>
	<AANLkTikOsULOVq01CEiPuoK4-sFTk+KWJiLY0wnzUZ17@mail.gmail.com>
	<AANLkTikyX3F+NjHVTGVV6rKyJhZQCcb3150-91La0rHs@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <AANLkTikyX3F+NjHVTGVV6rKyJhZQCcb3150-91La0rHs@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pekka Enberg <penberg@kernel.org>
Cc: Matt Turner <mattst88@gmail.com>, Bob Tracy <rct@gherkin.frus.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, mcree@orcon.net.nz, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Tue, 4 Jan 2011 22:56:18 +0200 Pekka Enberg wrote:

> On Tue, Jan 4, 2011 at 9:37 PM, Matt Turner <mattst88@gmail.com> wrot=
e:
> > On Tue, Jan 4, 2011 at 1:18 AM, Bob Tracy <rct@gherkin.frus.com> wr=
ote:
> >> Another 2.6.37-rc8 build failure on alpha:
> >>
> >> (...)
> >> =A0CC [M] =A0drivers/i2c/busses/i2c-i801.o
> >> drivers/i2c/busses/i2c-i801.c: In function 'i801_probe':
> >> drivers/i2c/busses/i2c-i801.c:737: error: implicit declaration of =
function 'kzalloc'
> >> drivers/i2c/busses/i2c-i801.c:737: warning: assignment makes point=
er from integer without a cast
> >> drivers/i2c/busses/i2c-i801.c:855: error: implicit declaration of =
function 'kfree'
> >> make[3]: *** [drivers/i2c/busses/i2c-i801.o] Error 1
> >> make[2]: *** [drivers/i2c/busses] Error 2
> >> make[1]: *** [drivers/i2c] Error 2
> >> make: *** [drivers] Error 2
> >>
> >> --Bob
> >
> > Is this specific to alpha? I wonder why we don't see this on other =
platforms?
>=20
> The x86 version of <asm/pci.h> includes <linux/slab.h> which hides th=
e
> problem on x86 at least. There was a big cleanup of implicit
> <linux/slab.h> inclusions few months ago which has exposed the
> problem.
>=20
> It's a bug in the driver, just add the include there.

exactly.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your cod=
e ***
desserts:  http://www.xenotime.net/linux/recipes/
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
