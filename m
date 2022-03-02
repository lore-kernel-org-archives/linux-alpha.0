From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [RFC PATCH 5/7] serial: termbits: ADDRB to indicate 9th bit addressing mode
Date: Wed,  2 Mar 2022 11:56:04 +0200
Message-ID: <20220302095606.14818-6-ilpo.jarvinen@linux.intel.com>
References: <20220302095606.14818-1-ilpo.jarvinen@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646215039; x=1677751039;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VVGdFbQA5dpTmH1Oi8imwujW6M34G1DuUPJxrfXUWac=;
  b=dUJKeVCEss+KIYUuBxj/U2E91CJk4EQBdgVwdxdCiUH7IxQfuWD7ciBE
   7CTSyFgpqzbdVXtLW0mcWNq7J8kRPZ18sBOU0ZUXVEmY2ky0rSw9aMlH6
   S+dPvdcG7dZgST+UeOaYlEf1g296G0Vox4JkeCC4li8fuF3CgPIOBtxRO
   tcjGWlRvmtCknvVFzT5EmYFYRxjoKHyKE6Z6TPvG/mUAx5FK1VGd47s2w
   CAO8N0OKnJMehp6YSj03+QefFnWqLPSLcHb84M/Kz2WIHu6zeZlrts2Tr
   +bOCE5qMaBYaM5ifYiinoASp/vYfJoEIOQ6pKOsJRY6pMTMTC0FWz2kNF
   A==;
In-Reply-To: <20220302095606.14818-1-ilpo.jarvinen@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, Johan Hovold <johan@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, linux-api@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@l

Add ADDRB to termbits to indicate 9th bit addressing mode.
This change is necessary for supporting devices with RS485
multipoint addressing [*]. A later patch in the patch series
adds support for Synopsys Designware UART capable for 9th bit
addressing mode. In this mode, 9th bit is used to indicate an
address (byte) within the communication line. The 9th bit
addressing mode is selected using ADDRB introduced by an earlier
patch.

[*] Technically, RS485 is just an electronic spec and does not
itself specify the 9th bit addressing mode but 9th bit seems
at least "semi-standard" way to do addressing with RS485.

Cc: linux-api@vger.kernel.org
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: "David S. Miller" <davem@davemloft.net>
Cc: sparclinux@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arch@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
---
 arch/alpha/include/uapi/asm/termbits.h   | 1 +
 arch/mips/include/uapi/asm/termbits.h    | 1 +
 arch/parisc/include/uapi/asm/termbits.h  | 1 +
 arch/powerpc/include/uapi/asm/termbits.h | 1 +
 arch/sparc/include/uapi/asm/termbits.h   | 1 +
 drivers/tty/amiserial.c                  | 6 +++++-
 drivers/tty/moxa.c                       | 1 +
 drivers/tty/mxser.c                      | 1 +
 drivers/tty/serial/serial_core.c         | 2 ++
 drivers/tty/tty_ioctl.c                  | 2 ++
 drivers/usb/serial/usb-serial.c          | 5 +++--
 include/uapi/asm-generic/termbits.h      | 1 +
 12 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/include/uapi/asm/termbits.h b/arch/alpha/include/ua=
pi/asm/termbits.h
index 4575ba34a0ea..285169c794ec 100644
--- a/arch/alpha/include/uapi/asm/termbits.h
+++ b/arch/alpha/include/uapi/asm/termbits.h
@@ -180,6 +180,7 @@ struct ktermios {
 #define HUPCL	00040000
=20
 #define CLOCAL	00100000
+#define ADDRB	010000000		/* address bit */
 #define CMSPAR	  010000000000		/* mark or space (stick) parity */
 #define CRTSCTS	  020000000000		/* flow control */
=20
diff --git a/arch/mips/include/uapi/asm/termbits.h b/arch/mips/include/uapi=
/asm/termbits.h
index dfeffba729b7..e7ea31cfec78 100644
--- a/arch/mips/include/uapi/asm/termbits.h
+++ b/arch/mips/include/uapi/asm/termbits.h
@@ -181,6 +181,7 @@ struct ktermios {
 #define	 B3000000 0010015
 #define	 B3500000 0010016
 #define	 B4000000 0010017
+#define ADDRB	  0020000	/* address bit */
 #define CIBAUD	  002003600000	/* input baud rate */
 #define CMSPAR	  010000000000	/* mark or space (stick) parity */
 #define CRTSCTS	  020000000000	/* flow control */
diff --git a/arch/parisc/include/uapi/asm/termbits.h b/arch/parisc/include/=
uapi/asm/termbits.h
index 40e920f8d683..629be061f5d5 100644
--- a/arch/parisc/include/uapi/asm/termbits.h
+++ b/arch/parisc/include/uapi/asm/termbits.h
@@ -158,6 +158,7 @@ struct ktermios {
 #define  B3000000 0010015
 #define  B3500000 0010016
 #define  B4000000 0010017
+#define ADDRB	  0020000		/* address bit */
 #define CIBAUD    002003600000		/* input baud rate */
 #define CMSPAR    010000000000          /* mark or space (stick) parity */
 #define CRTSCTS   020000000000          /* flow control */
diff --git a/arch/powerpc/include/uapi/asm/termbits.h b/arch/powerpc/includ=
e/uapi/asm/termbits.h
index ed18bc61f63d..1b778ac562a4 100644
--- a/arch/powerpc/include/uapi/asm/termbits.h
+++ b/arch/powerpc/include/uapi/asm/termbits.h
@@ -171,6 +171,7 @@ struct ktermios {
 #define HUPCL	00040000
=20
 #define CLOCAL	00100000
+#define ADDRB	00200000		/* address bit */
 #define CMSPAR	  010000000000		/* mark or space (stick) parity */
 #define CRTSCTS	  020000000000		/* flow control */
=20
diff --git a/arch/sparc/include/uapi/asm/termbits.h b/arch/sparc/include/ua=
pi/asm/termbits.h
index ce5ad5d0f105..4ad60c4acf65 100644
--- a/arch/sparc/include/uapi/asm/termbits.h
+++ b/arch/sparc/include/uapi/asm/termbits.h
@@ -200,6 +200,7 @@ struct ktermios {
 #define B3000000  0x00001011
 #define B3500000  0x00001012
 #define B4000000  0x00001013  */
+#define ADDRB	  0x00002000  /* address bit */
 #define CIBAUD	  0x100f0000  /* input baud rate (not used) */
 #define CMSPAR	  0x40000000  /* mark or space (stick) parity */
 #define CRTSCTS	  0x80000000  /* flow control */
diff --git a/drivers/tty/amiserial.c b/drivers/tty/amiserial.c
index 533d02b38e02..3ca97007bd6e 100644
--- a/drivers/tty/amiserial.c
+++ b/drivers/tty/amiserial.c
@@ -1175,7 +1175,11 @@ static void rs_set_termios(struct tty_struct *tty, s=
truct ktermios *old_termios)
 {
 	struct serial_state *info =3D tty->driver_data;
 	unsigned long flags;
-	unsigned int cflag =3D tty->termios.c_cflag;
+	unsigned int cflag;
+
+	tty->termios.c_cflag &=3D ~ADDRB;
+
+	cflag =3D tty->termios.c_cflag;
=20
 	change_speed(tty, info, old_termios);
=20
diff --git a/drivers/tty/moxa.c b/drivers/tty/moxa.c
index f3c72ab1476c..07cd88152d58 100644
--- a/drivers/tty/moxa.c
+++ b/drivers/tty/moxa.c
@@ -2050,6 +2050,7 @@ static int MoxaPortSetTermio(struct moxa_port *port, =
struct ktermios *termio,
=20
 	ofsAddr =3D port->tableAddr;
=20
+	termio->c_cflag &=3D ~ADDRB;
 	mode =3D termio->c_cflag & CSIZE;
 	if (mode =3D=3D CS5)
 		mode =3D MX_CS5;
diff --git a/drivers/tty/mxser.c b/drivers/tty/mxser.c
index 836c9eca2946..220676363a07 100644
--- a/drivers/tty/mxser.c
+++ b/drivers/tty/mxser.c
@@ -577,6 +577,7 @@ static void mxser_change_speed(struct tty_struct *tty, =
struct ktermios *old_term
 	struct mxser_port *info =3D tty->driver_data;
 	unsigned cflag, cval;
=20
+	tty->termios.c_cflag &=3D ~ADDRB;
 	cflag =3D tty->termios.c_cflag;
=20
 	if (mxser_set_baud(tty, tty_get_baud_rate(tty))) {
diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_c=
ore.c
index 846192a7b4bf..8ab88293c917 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -1489,6 +1489,8 @@ static void uart_set_termios(struct tty_struct *tty,
 		goto out;
 	}
=20
+	tty->termios.c_cflag &=3D ~ADDRB;
+
 	uart_change_speed(tty, state, old_termios);
 	/* reload cflag from termios; port driver may have overridden flags */
 	cflag =3D tty->termios.c_cflag;
diff --git a/drivers/tty/tty_ioctl.c b/drivers/tty/tty_ioctl.c
index 63181925ec1a..934037d78868 100644
--- a/drivers/tty/tty_ioctl.c
+++ b/drivers/tty/tty_ioctl.c
@@ -319,6 +319,8 @@ unsigned char tty_get_frame_size(unsigned int cflag)
 		bits++;
 	if (cflag & PARENB)
 		bits++;
+	if (cflag & ADDRB)
+		bits++;
=20
 	return bits;
 }
diff --git a/drivers/usb/serial/usb-serial.c b/drivers/usb/serial/usb-seria=
l.c
index 24101bd7fcad..44b73aea80bb 100644
--- a/drivers/usb/serial/usb-serial.c
+++ b/drivers/usb/serial/usb-serial.c
@@ -525,9 +525,10 @@ static void serial_set_termios(struct tty_struct *tty,=
 struct ktermios *old)
=20
 	dev_dbg(&port->dev, "%s\n", __func__);
=20
-	if (port->serial->type->set_termios)
+	if (port->serial->type->set_termios) {
+		tty->termios.c_cflag &=3D ~ADDRB;
 		port->serial->type->set_termios(tty, port, old);
-	else
+	} else
 		tty_termios_copy_hw(&tty->termios, old);
 }
=20
diff --git a/include/uapi/asm-generic/termbits.h b/include/uapi/asm-generic=
/termbits.h
index 2fbaf9ae89dd..5f5228329d45 100644
--- a/include/uapi/asm-generic/termbits.h
+++ b/include/uapi/asm-generic/termbits.h
@@ -157,6 +157,7 @@ struct ktermios {
 #define  B3000000 0010015
 #define  B3500000 0010016
 #define  B4000000 0010017
+#define ADDRB     0020000	/* address bit */
 #define CIBAUD	  002003600000	/* input baud rate */
 #define CMSPAR	  010000000000	/* mark or space (stick) parity */
 #define CRTSCTS	  020000000000	/* flow control */
--=20
2.30.2

