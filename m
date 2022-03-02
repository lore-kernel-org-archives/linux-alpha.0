From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [RFC PATCH 6/7] serial: General support for multipoint addresses
Date: Wed,  2 Mar 2022 11:56:05 +0200
Message-ID: <20220302095606.14818-7-ilpo.jarvinen@linux.intel.com>
References: <20220302095606.14818-1-ilpo.jarvinen@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-api-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646215056; x=1677751056;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Cvy61TtTqRadNEYqsnnn/6324FPZ4RKg0XhIh6rkW/U=;
  b=UmOUUkWkJPVMli6ArEB4oVslR4jG71PWGLIPtIfo8U6kg5g8/OhU4+oR
   gxjR/HOp2drmpbAEReVRYHMGG2bz4xgi9nq1n4ROZ7TMMl93Ow6H2ZNk5
   LMGwFOo8dTeMhBIrb0nM6tsmH1iEW7MOY07yTJdXv6qAAER0CBR6DW/gk
   j3zD15USuHBIrHjFS2V0WUPtO9J99XlTkESAKV9r7U9HnjA1uOFzqayoX
   bnE2kfizRglx6qo90xXCKBeNPlHgxF5uhg3o1y8ZekmS9JcQFin6V+4Eo
   5eDTftHq24EwJSg8o1x5fY1e+ZG31TGofwpN5wNRjY5SlQicEik82HV3D
   g==;
In-Reply-To: <20220302095606.14818-1-ilpo.jarvinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-serial-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jiri Slaby <jirislaby-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-api-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Henderson <rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org>, Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>, Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Bogendoerfer <tsbogend-I1c7kopa9pxLokYuJOExCg@public.gmane.org>, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "James E.J. Bottomley" <James.Bottomley-d9PhHud1JfjCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>, Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linuxppc-dev@l

This patch adds generic support for serial multipoint
addressing. Two new ioctls are added. TIOCSADDR is used to
indicate the destination/receive address. TIOCGADDR returns
the current address in use. The driver should implement
set_addr and get_addr to support addressing mode.

Adjust ADDRB clearing to happen only if driver does not provide
set_addr (=3Dthe driver doesn't support address mode).

This change is necessary for supporting devices with RS485
multipoint addressing [*]. A following patch in the patch series
adds support for Synopsys Designware UART capable for 9th bit
addressing mode. In this mode, 9th bit is used to indicate an
address (byte) within the communication line. The 9th bit
addressing mode is selected using ADDRB introduced by the
previous patch.

Transmit addresses / receiver filter are specified by setting
the flags SER_ADDR_DEST and/or SER_ADDR_RECV. When the user
supplies the transmit address, in the 9bit addressing mode it is
sent out immediately with the 9th bit set to 1. After that, the
subsequent normal data bytes are sent with 9th bit as 0 and they
are intended to the device with the given address. It is up to
receiver to enforce the filter using SER_ADDR_RECV. When userspace
has supplied the receive address, the driver is expected to handle
the matching of the address and only data with that address is
forwarded to the user. Both SER_ADDR_DEST and SER_ADDR_RECV can
be given at the same time in a single call if the addresses are
the same.

The user can clear the receive filter with SER_ADDR_RECV_CLEAR.

[*] Technically, RS485 is just an electronic spec and does not
itself specify the 9th bit addressing mode but 9th bit seems
at least "semi-standard" way to do addressing with RS485.

Cc: linux-api-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Richard Henderson <rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org>
Cc: Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>
Cc: Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thomas Bogendoerfer <tsbogend-I1c7kopa9pxLokYuJOExCg@public.gmane.org>
Cc: linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: "James E.J. Bottomley" <James.Bottomley-d9PhHud1JfjCXq6kfMZ53/egYHeGw8J=
k@public.gmane.org>
Cc: Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gm=
ane.org>
Cc: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Yoshinori Sato <ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org>
Cc: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Cc: linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Chris Zankel <chris-YvXeqwSYzG2sTnJN9+BGXg@public.gmane.org>
Cc: Max Filippov <jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-xtensa-PjhNF2WwrV/0Sa2dR60CXw@public.gmane.org
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arch-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen-VuQAYsv1563Yd54FQh9/CA@pub=
lic.gmane.org>
---
 .../driver-api/serial/serial-rs485.rst        | 23 ++++++-
 arch/alpha/include/uapi/asm/ioctls.h          |  3 +
 arch/mips/include/uapi/asm/ioctls.h           |  3 +
 arch/parisc/include/uapi/asm/ioctls.h         |  3 +
 arch/powerpc/include/uapi/asm/ioctls.h        |  3 +
 arch/sh/include/uapi/asm/ioctls.h             |  3 +
 arch/sparc/include/uapi/asm/ioctls.h          |  3 +
 arch/xtensa/include/uapi/asm/ioctls.h         |  3 +
 drivers/tty/serial/8250/8250_core.c           |  2 +
 drivers/tty/serial/serial_core.c              | 62 ++++++++++++++++++-
 include/linux/serial_core.h                   |  6 ++
 include/uapi/asm-generic/ioctls.h             |  3 +
 include/uapi/linux/serial.h                   |  8 +++
 13 files changed, 123 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/serial/serial-rs485.rst b/Documentati=
on/driver-api/serial/serial-rs485.rst
index 6bc824f948f9..2f45f007fa5b 100644
--- a/Documentation/driver-api/serial/serial-rs485.rst
+++ b/Documentation/driver-api/serial/serial-rs485.rst
@@ -95,7 +95,28 @@ RS485 Serial Communications
 		/* Error handling. See errno. */
 	}
=20
-5. References
+5. Multipoint Addressing
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+   The Linux kernel provides serial_addr structure to handle addressing wi=
thin
+   multipoint serial communications line such as RS485. 9th bit addression=
g mode
+   is enabled by adding ADDRB flag in termios c_cflag.
+
+   Serial core calls device specific set/get_addr in response to TIOCSADDR=
 and
+   TIOCGADDR ioctls with a pointer to serial_addr. Destination and receive
+   address can be specified using serial_addr flags field. Receive address=
 may
+   also be cleared using flags. Once an address is set, the communication
+   can occur only with the particular device and other peers are filtered =
out.
+   It is left up to the receiver side to enforce the filtering.
+
+   Address flags:
+	- SER_ADDR_RECV: Receive (filter) address.
+	- SER_ADDR_RECV_CLEAR: Clear receive filter (only for TIOCSADDR).
+	- SER_ADDR_DEST: Destination address.
+
+   Note: not all devices supporting RS485 support multipoint addressing.
+
+6. References
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
  [1]	include/uapi/linux/serial.h
diff --git a/arch/alpha/include/uapi/asm/ioctls.h b/arch/alpha/include/uapi=
/asm/ioctls.h
index 971311605288..500cab3e1d6b 100644
--- a/arch/alpha/include/uapi/asm/ioctls.h
+++ b/arch/alpha/include/uapi/asm/ioctls.h
@@ -125,4 +125,7 @@
 #define TIOCMIWAIT	0x545C	/* wait for a change on serial input line(s) */
 #define TIOCGICOUNT	0x545D	/* read serial port inline interrupt counts */
=20
+#define TIOCSADDR	_IOWR('T', 0x63, struct serial_addr)
+#define TIOCGADDR	_IOWR('T', 0x64, struct serial_addr)
+
 #endif /* _ASM_ALPHA_IOCTLS_H */
diff --git a/arch/mips/include/uapi/asm/ioctls.h b/arch/mips/include/uapi/a=
sm/ioctls.h
index 16aa8a766aec..3859dc46857e 100644
--- a/arch/mips/include/uapi/asm/ioctls.h
+++ b/arch/mips/include/uapi/asm/ioctls.h
@@ -96,6 +96,9 @@
 #define TIOCGISO7816	_IOR('T', 0x42, struct serial_iso7816)
 #define TIOCSISO7816	_IOWR('T', 0x43, struct serial_iso7816)
=20
+#define TIOCSADDR	_IOWR('T', 0x63, struct serial_addr)
+#define TIOCGADDR	_IOWR('T', 0x64, struct serial_addr)
+
 /* I hope the range from 0x5480 on is free ... */
 #define TIOCSCTTY	0x5480		/* become controlling tty */
 #define TIOCGSOFTCAR	0x5481
diff --git a/arch/parisc/include/uapi/asm/ioctls.h b/arch/parisc/include/ua=
pi/asm/ioctls.h
index 82d1148c6379..62337743db64 100644
--- a/arch/parisc/include/uapi/asm/ioctls.h
+++ b/arch/parisc/include/uapi/asm/ioctls.h
@@ -86,6 +86,9 @@
 #define TIOCSTOP	0x5462
 #define TIOCSLTC	0x5462
=20
+#define TIOCSADDR	_IOWR('T', 0x63, struct serial_addr)
+#define TIOCGADDR	_IOWR('T', 0x64, struct serial_addr)
+
 /* Used for packet mode */
 #define TIOCPKT_DATA		 0
 #define TIOCPKT_FLUSHREAD	 1
diff --git a/arch/powerpc/include/uapi/asm/ioctls.h b/arch/powerpc/include/=
uapi/asm/ioctls.h
index 2c145da3b774..84fd69ac366a 100644
--- a/arch/powerpc/include/uapi/asm/ioctls.h
+++ b/arch/powerpc/include/uapi/asm/ioctls.h
@@ -120,4 +120,7 @@
 #define TIOCMIWAIT	0x545C	/* wait for a change on serial input line(s) */
 #define TIOCGICOUNT	0x545D	/* read serial port inline interrupt counts */
=20
+#define TIOCSADDR	_IOWR('T', 0x63, struct serial_addr)
+#define TIOCGADDR	_IOWR('T', 0x64, struct serial_addr)
+
 #endif	/* _ASM_POWERPC_IOCTLS_H */
diff --git a/arch/sh/include/uapi/asm/ioctls.h b/arch/sh/include/uapi/asm/i=
octls.h
index 11866d4f60e1..f82966b7dba2 100644
--- a/arch/sh/include/uapi/asm/ioctls.h
+++ b/arch/sh/include/uapi/asm/ioctls.h
@@ -113,4 +113,7 @@
 #define TIOCMIWAIT	_IO('T', 92) /* 0x545C */	/* wait for a change on seria=
l input line(s) */
 #define TIOCGICOUNT	0x545D	/* read serial port inline interrupt counts */
=20
+#define TIOCSADDR	_IOWR('T', 0x63, struct serial_addr)
+#define TIOCGADDR	_IOWR('T', 0x64, struct serial_addr)
+
 #endif /* __ASM_SH_IOCTLS_H */
diff --git a/arch/sparc/include/uapi/asm/ioctls.h b/arch/sparc/include/uapi=
/asm/ioctls.h
index 7fd2f5873c9e..e44624c67c79 100644
--- a/arch/sparc/include/uapi/asm/ioctls.h
+++ b/arch/sparc/include/uapi/asm/ioctls.h
@@ -125,6 +125,9 @@
 #define TIOCMIWAIT	0x545C /* Wait for change on serial input line(s) */
 #define TIOCGICOUNT	0x545D /* Read serial port inline interrupt counts */
=20
+#define TIOCSADDR	_IOWR('T', 0x63, struct serial_addr)
+#define TIOCGADDR	_IOWR('T', 0x64, struct serial_addr)
+
 /* Kernel definitions */
=20
 /* Used for packet mode */
diff --git a/arch/xtensa/include/uapi/asm/ioctls.h b/arch/xtensa/include/ua=
pi/asm/ioctls.h
index 6d4a87296c95..759ca9377f2a 100644
--- a/arch/xtensa/include/uapi/asm/ioctls.h
+++ b/arch/xtensa/include/uapi/asm/ioctls.h
@@ -127,4 +127,7 @@
 #define TIOCMIWAIT	_IO('T', 92) /* wait for a change on serial input line(=
s) */
 #define TIOCGICOUNT	0x545D	/* read serial port inline interrupt counts */
=20
+#define TIOCSADDR	_IOWR('T', 0x63, struct serial_addr)
+#define TIOCGADDR	_IOWR('T', 0x64, struct serial_addr)
+
 #endif /* _XTENSA_IOCTLS_H */
diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/=
8250_core.c
index 01d30f6ed8fb..f67bc3b76f65 100644
--- a/drivers/tty/serial/8250/8250_core.c
+++ b/drivers/tty/serial/8250/8250_core.c
@@ -1008,6 +1008,8 @@ int serial8250_register_8250_port(const struct uart_8=
250_port *up)
 		uart->port.rs485	=3D up->port.rs485;
 		uart->rs485_start_tx	=3D up->rs485_start_tx;
 		uart->rs485_stop_tx	=3D up->rs485_stop_tx;
+		uart->port.set_addr	=3D up->port.set_addr;
+		uart->port.get_addr	=3D up->port.get_addr;
 		uart->dma		=3D up->dma;
=20
 		/* Take tx_loadsz from fifosize if it wasn't set separately */
diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_c=
ore.c
index 8ab88293c917..8235f696d073 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -1346,6 +1346,56 @@ static int uart_set_iso7816_config(struct uart_port =
*port,
 	return 0;
 }
=20
+static int uart_set_addr(struct uart_port *port,
+			 struct serial_addr __user *serial_addr_user)
+{
+	struct serial_addr addr;
+	unsigned long flags;
+	int ret;
+
+	if (copy_from_user(&addr, serial_addr_user, sizeof(*serial_addr_user)))
+		return -EFAULT;
+
+	spin_lock_irqsave(&port->lock, flags);
+	if (port->set_addr)
+		ret =3D port->set_addr(port, &addr);
+	else
+		ret =3D -EINVAL;
+	spin_unlock_irqrestore(&port->lock, flags);
+	if (ret)
+		return ret;
+
+	if (copy_to_user(serial_addr_user, &addr, sizeof(addr)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int uart_get_addr(struct uart_port *port,
+			 struct serial_addr __user *serial_addr_user)
+{
+	struct serial_addr addr;
+	unsigned long flags;
+	int ret;
+
+	if (copy_from_user(&addr, serial_addr_user, sizeof(*serial_addr_user)))
+		return -EFAULT;
+
+	spin_lock_irqsave(&port->lock, flags);
+	if (port->get_addr)
+		ret =3D port->get_addr(port, &addr);
+	else
+		ret =3D -EINVAL;
+	spin_unlock_irqrestore(&port->lock, flags);
+	if (ret)
+		return ret;
+
+	if (copy_to_user(serial_addr_user, &addr, sizeof(addr)))
+		return -EFAULT;
+
+	return 0;
+}
+
 /*
  * Called via sys_ioctl.  We can use spin_lock_irq() here.
  */
@@ -1423,6 +1473,15 @@ uart_ioctl(struct tty_struct *tty, unsigned int cmd,=
 unsigned long arg)
 	case TIOCGISO7816:
 		ret =3D uart_get_iso7816_config(state->uart_port, uarg);
 		break;
+
+	case TIOCSADDR:
+		ret =3D uart_set_addr(uport, uarg);
+		break;
+
+	case TIOCGADDR:
+		ret =3D uart_get_addr(uport, uarg);
+		break;
+
 	default:
 		if (uport->ops->ioctl)
 			ret =3D uport->ops->ioctl(uport, cmd, arg);
@@ -1489,7 +1548,8 @@ static void uart_set_termios(struct tty_struct *tty,
 		goto out;
 	}
=20
-	tty->termios.c_cflag &=3D ~ADDRB;
+	if (!uport->set_addr)
+		tty->termios.c_cflag &=3D ~ADDRB;
=20
 	uart_change_speed(tty, state, old_termios);
 	/* reload cflag from termios; port driver may have overridden flags */
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 31f7fe527395..ebe1d0ec11d8 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -135,6 +135,12 @@ struct uart_port {
 						struct serial_rs485 *rs485);
 	int			(*iso7816_config)(struct uart_port *,
 						  struct serial_iso7816 *iso7816);
+
+	int			(*set_addr)(struct uart_port *p,
+					    struct serial_addr *addr);
+	int			(*get_addr)(struct uart_port *p,
+					    struct serial_addr *addr);
+
 	unsigned int		irq;			/* irq number */
 	unsigned long		irqflags;		/* irq flags  */
 	unsigned int		uartclk;		/* base uart clock */
diff --git a/include/uapi/asm-generic/ioctls.h b/include/uapi/asm-generic/i=
octls.h
index cdc9f4ca8c27..689743366091 100644
--- a/include/uapi/asm-generic/ioctls.h
+++ b/include/uapi/asm-generic/ioctls.h
@@ -106,6 +106,9 @@
 # define FIOQSIZE	0x5460
 #endif
=20
+#define TIOCSADDR	_IOWR('T', 0x63, struct serial_addr)
+#define TIOCGADDR	_IOWR('T', 0x64, struct serial_addr)
+
 /* Used for packet mode */
 #define TIOCPKT_DATA		 0
 #define TIOCPKT_FLUSHREAD	 1
diff --git a/include/uapi/linux/serial.h b/include/uapi/linux/serial.h
index f868685b35a0..7b198fd5d390 100644
--- a/include/uapi/linux/serial.h
+++ b/include/uapi/linux/serial.h
@@ -151,4 +151,12 @@ struct serial_iso7816 {
 	__u32	reserved[5];
 };
=20
+struct serial_addr {
+	__u32	flags;
+#define SER_ADDR_RECV			(1 << 0)
+#define SER_ADDR_RECV_CLEAR		(1 << 1)
+#define SER_ADDR_DEST			(1 << 2)
+	__u32	addr;
+};
+
 #endif /* _UAPI_LINUX_SERIAL_H */
--=20
2.30.2

