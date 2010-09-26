From: Ben Hutchings <ben@decadent.org.uk>
Subject: getxpid() parent lookup is broken
Date: Sun, 26 Sep 2010 05:34:54 +0100
Message-ID: <1285475695.2697.202.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-x9jRS0n6Z8qBxiwzaqbE"
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: linux-alpha@vger.kernel.org


--=-x9jRS0n6Z8qBxiwzaqbE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I noticed that Tomoyo doesn't build on Alpha because Tomoyo tries to
call sys_getpid() and sys_getppid().  That's a bug in Tomoyo, but when I
looked at why Alpha is different I found that the implementation of
getxpid() hasn't been kept in sync getppid() for other architectures and
is presumably now incorrect.

sys_getppid():
	rcu_read_lock();
	pid =3D task_tgid_vnr(current->real_parent);
	rcu_read_unlock();

task_tgid_vnr(current->real_parent) expands through various inline
functions to:

pid_nr_ns(current->real_parent->group_leader->pids[PIDTYPE_PID].pid,
          current->nsproxy->pid_ns)

sys_getxpid():
	/* See linux/kernel/timer.c sys_getppid for discussion
	   about this loop.  */
	ldq	$3, TASK_GROUP_LEADER($2)
	ldq	$4, TASK_REAL_PARENT($3)
	ldl	$0, TASK_TGID($2)
1:	ldl	$1, TASK_TGID($4)
#ifdef CONFIG_SMP
	mov	$4, $5
	mb
	ldq	$3, TASK_GROUP_LEADER($2)
	ldq	$4, TASK_REAL_PARENT($3)
	cmpeq	$4, $5, $5
	beq	$5, 1b
#endif

The comment is obviously out-of-date.  This isn't following RCU protocol
and it isn't namespace-aware.  I think it needs to be turned into a
wrapper for the generic code.

Ben.

--=20
Ben Hutchings
Once a job is fouled up, anything done to improve it makes it worse.

--=-x9jRS0n6Z8qBxiwzaqbE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIVAwUATJ7Naee/yOyVhhEJAQLRiw//fB2y8jk1BkxEZJGIhnCAJuZDEInPdGm8
Rq+Jyfn/h1zAtyYKwwELOf7WRJo2ryRNbOroE1YcAizTHJsHmQg4ZUVAs7caTV2z
VUwwfD7p2mzZ0umg4j/JH3zlI/vhR1IqJvBLymvSyR7Fd/4N6/P1Fnm4RXS0OWw1
9JLaJPvX8xcnAVkNbPTcKlZ3Qlpyr1HYp7V0ZH7UB2yu9CKrr1mM35uRK79txrR7
bsOBHDEQDPGXyN2JLZaoLNdQmuUCleuH15pYt7xMsKuSIbZDSKKjFySuMy0sRSI6
EFLOwW28x/FswZ3RXtZEY59MvYGO76/wEyY7L2vvgtNG4xbP4d8iWy9+7FgGrgtM
07rzTMPpfdPZl4hABee3J7+Q92twMSeXawi/ZzVwVPbSaAPCrqwqpXFclneS1DsH
BwRhUo6sSPGwWuXBHreuQXxm8yD7bYDa7+nqGgmC38I98mjGcYLXl0/EEDS3IrS+
KS4e5ZUuEXJuBRbrLPvfcb/dd0FE3X85r53+/dq4oHzXrhY3/aC/q2F2y9G8Xa9P
Y8HTGMOYyxBkKmVQM9eP/4QPyOZ2AFTdMUz99l5/23f11VHXQPYCDn2Dl/LyyOxi
/b9+2SLQIG3DK5eWan3tJ2zHFvI1c/BlYXkdNkKtIXzZL/Xuyugl4WRpUmtmOkKZ
3K3coHJeXDM=
=1w4Z
-----END PGP SIGNATURE-----

--=-x9jRS0n6Z8qBxiwzaqbE--
