From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2 07/12] serial: termbits: ADDRB to indicate 9th bit
 addressing mode
Date: Mon, 4 Apr 2022 12:10:18 +0300 (EEST)
Message-ID: <a05978b6-ed73-4ee-c688-e383b47c35d5@linux.intel.com>
References: <20220404082912.6885-1-ilpo.jarvinen@linux.intel.com> <20220404082912.6885-8-ilpo.jarvinen@linux.intel.com> <CAK8P3a0iP79RQWr6-YDf=xQZvonZchYN-Rn7HN2pkNihZ=anAw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1630404425-1649063432=:1675"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649063433; x=1680599433;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=QqiEMALvxm0dsFsEQM+G8iM/nNOxk00l7kVM6nD9bW8=;
  b=ip4IK/Kz65GPYbS7B3tQML9YRAaTlXoahr+V5AZIYhkWW9/9bgZOzq4p
   40j04R1qFEMdckxTwxoLJZ8U2itWze56LHrq2BDWjUSnyXjxnc+1ke9w0
   DEjmKIhvMXKz3q/2ZoTfVjpvXfnYJ52JKocJoYuna+mqAt89zPKfolORo
   s5eImJyff5Oga1xNg0Q8mxAnDvOEoDUeEpt0DLejpFbL5ZbmBW9cVTH4r
   Fhwstbx3Hahw6CexOHXvj53Vb+iKCpH8M30wv0YsmuFhXrwZKWTMaBbeP
   awgM103wDaRf2/7G9PyTRCYoG+ZXYA0+LmQAtBT+tgVIBO4Y85p+GcR5j
   w==;
In-Reply-To: <CAK8P3a0iP79RQWr6-YDf=xQZvonZchYN-Rn7HN2pkNihZ=anAw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "open list:SERIAL DRIVERS" <linux-serial-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jiri Slaby <jirislaby-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, giulio.benetti-W14uJ/fiAyBY2hyreNRi6g@public.gmane.org, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Linux API <linux-api-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>, Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alpha <linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Bogendoerfer <tsbogend-I1c7kopa9pxLokYuJOExCg@public.gmane.org>, "open list:BROADCOM NVRAM DRIVER" <linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartner>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1630404425-1649063432=:1675
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 4 Apr 2022, Arnd Bergmann wrote:

> On Mon, Apr 4, 2022 at 10:29 AM Ilpo Järvinen
> <ilpo.jarvinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> 
> >
> >  #define CLOCAL 00100000
> > +#define ADDRB  010000000               /* address bit */
> >  #define CMSPAR   010000000000          /* mark or space (stick) parity */
> >  #define CRTSCTS          020000000000          /* flow control */
> >
> > diff --git a/arch/mips/include/uapi/asm/termbits.h b/arch/mips/include/uapi/asm/termbits.h
> > index dfeffba729b7..e7ea31cfec78 100644
> > --- a/arch/mips/include/uapi/asm/termbits.h
> > +++ b/arch/mips/include/uapi/asm/termbits.h
> > @@ -181,6 +181,7 @@ struct ktermios {
> >  #define         B3000000 0010015
> >  #define         B3500000 0010016
> >  #define         B4000000 0010017
> > +#define ADDRB    0020000       /* address bit */
> >  #define CIBAUD   002003600000  /* input baud rate */
> >  #define CMSPAR   010000000000  /* mark or space (stick) parity */
> >  #define CRTSCTS          020000000000  /* flow control */
> 
> It looks like the top bits are used the same way on all architectures
> already, while the bottom bits of the flag differ. Could you pick
> the next free bit from the top to use the same value 04000000000
> everywhere?

04000000000 isn't the top of the use:

diff --git a/arch/alpha/include/uapi/asm/termbits.h 
b/arch/alpha/include/uapi/asm/termbits.h
index 4575ba34a0ea..285169c794ec 100644
--- a/arch/alpha/include/uapi/asm/termbits.h
+++ b/arch/alpha/include/uapi/asm/termbits.h
@@ -178,10 +178,11 @@ struct ktermios {
 #define PARENB 00010000
 #define PARODD 00020000
 #define HUPCL  00040000
 
 #define CLOCAL 00100000
+#define ADDRB  010000000               /* address bit */
 #define CMSPAR   010000000000          /* mark or space (stick) parity */
 #define CRTSCTS          020000000000          /* flow control */
 
 #define CIBAUD 07600000
 #define IBSHIFT        16
diff --git a/arch/sparc/include/uapi/asm/termbits.h 
b/arch/sparc/include/uapi/asm/termbits.h
index ce5ad5d0f105..4ad60c4acf65 100644
--- a/arch/sparc/include/uapi/asm/termbits.h
+++ b/arch/sparc/include/uapi/asm/termbits.h
@@ -198,10 +198,11 @@ struct ktermios {
    adjust CBAUD constant and drivers accordingly.
 #define B4000000  0x00001013  */
+#define ADDRB    0x00002000  /* address bit */
 #define CIBAUD   0x100f0000  /* input baud rate (not used) */
 #define CMSPAR   0x40000000  /* mark or space (stick) parity */
 #define CRTSCTS          0x80000000  /* flow control */


Somehow I managed to convince myself earlier there isn't a bit available 
that would be consistent across archs but now that I recheck the 
04000000000 bit (0x20000000) you propose, it seems to be that nothing is 
using it.

It's not suprising I didn't get the magnitude of those long octal numbers 
right. ...They are such a pain to interpret correctly.


-- 
 i.

--8323329-1630404425-1649063432=:1675--
