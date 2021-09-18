From: Thorsten Glaser <t.glaser@tarent.de>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
Date: Sat, 18 Sep 2021 19:17:48 +0200 (CEST)
Message-ID: <56956079-19c3-d67e-d3f-92e475c71f6b@tarent.de>
References: <20210918095134.GA5001@tower> <202109181311.18IDBKQB005215@valdese.nms.ulrich-teichert.org> <CAHk-=whY5mLggPSr2U00mqgUbRJYnYSxtNZm4FnEtQrHftYr8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CAHk-=whY5mLggPSr2U00mqgUbRJYnYSxtNZm4FnEtQrHftYr8Q@mail.gmail.com>
Content-Language: de-DE-1901
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ulrich Teichert <krypton@ulrich-teichert.org>, Michael Cree <mcree@orcon.net.nz>, Guenter Roeck <linux@roeck-us.net>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org, Netdev <netdev@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>

On Sat, 18 Sep 2021, Linus Torvalds wrote:

> > > On Thu, Sep 16, 2021 at 11:35:36AM -0700, Linus Torvalds wrote:
> > > > Naah. I think the Jensen actually had an ISA slot. Came with a
> > > > whopping 8MB too, so the ISA DMA should work just fine.
> > > >
> > > > Or maybe it was EISA only? I really don't remember.
> >
> > It's EISA only. I've made some pictures of a somewhat dusty inside of

> So we do want CONFIG_ISA for alpha, even if not Jensen.

Considering you can actually put ISA cards, 8 and 16 bit both,
into EISA slots, I’d have assumed so. I don’t understand the
“EISA only” question above.

bye,
//mirabilos (not using an Alpha but still using x86 ISA cards)
-- 
<cnuke> den AGP stecker anfeilen, damit er in den slot aufm 440BX board passt…
oder netzteile, an die man auch den monitor angeschlossen hat und die dann für
ein elektrisch aufgeladenes gehäuse gesorgt haben […] für lacher gut auf jeder
LAN party │ <nvb> damals, als der pizzateig noch auf dem monior "gegangen" ist
