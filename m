From: mru@users.sourceforge.net (=?iso-8859-1?q?M=E5ns_Rullg=E5rd?=)
Subject: Re: Miata 500 is alphaev6 ? (segfault while configure glibc with
 --target=alphaev6)
Date: Tue, 09 Sep 2003 14:09:15 +0200
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <yw1xu17m9n9w.fsf@users.sourceforge.net>
References: <20030903143157.GA17699@localhost>
	<20030903150024.GA18306@localhost> <20030903151532.GH14376@lug-owl.de>
	<200309091412.35341.rezso@rdsor.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <libc-alpha-return-13378-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
In-Reply-To: <200309091412.35341.rezso@rdsor.ro> (Balint Cristian's message
 of "Tue, 9 Sep 2003 14:12:35 +0300")
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Balint Cristian <rezso@rdsor.ro>
Cc: linux-alpha@vger.kernel.org, libc-alpha@sources.redhat.com

Balint Cristian <rezso@rdsor.ro> writes:

> Is subj true ?  I get seg fault compiling glibc with
> --target=3Dalphaev6 some error that segfault at the test binary while
> "cheking long long"
>
> Is something wrong with gcc or glibc ? Or is not alphaev6, not
> support alphaev6 instruction set and segfault.

Miata is ev56, and does not support the ev6 additions.

--=20
M=E5ns Rullg=E5rd
mru@users.sf.net
