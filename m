From: Oliver Falk <oliver@linux-kernel.at>
Subject: [patch 1/1] alpha: Fix use of irq_to_desc in irq.c
Date: Mon, 28 Feb 2011 13:49:47 +0100
Message-ID: <4D6B99EB.1040803@linux-kernel.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-alpha@vger.kernel.org, kyle@redhat.com, Matt Turner <mattst88@gmail.com>

=46ixes:
arch/alpha/kernel/irq.c: In function =E2=80=98irq_select_affinity=E2=80=
=99:
arch/alpha/kernel/irq.c:47: error: subscripted value is neither array=20
nor pointer
make[1]: *** [arch/alpha/kernel/irq.o] Error 1


--- arch/alpha/kernel/irq.c.orig	2011-02-28 11:34:05.000000000 +0100
+++ arch/alpha/kernel/irq.c	2011-02-28 11:32:24.000000000 +0100
@@ -44,7 +44,7 @@

  int irq_select_affinity(unsigned int irq)
  {
-	struct irq_desc *desc =3D irq_to_desc[irq];
+	struct irq_desc *desc =3D irq_to_desc(irq);
  	static int last_cpu;
  	int cpu =3D last_cpu + 1;


Seems to be a typo from here:

<http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3D=
commitdiff;h=3Da891b393dd7f6ed84ecee98c0eac4a808ff2cbbc>

-of
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
