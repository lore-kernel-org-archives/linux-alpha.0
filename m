From: Florian Weimer <fweimer@redhat.com>
Subject: Re: Add fchmodat2() - or add a more general syscall?
Date: Tue, 25 Jul 2023 18:10:22 +0200
Message-ID: <87fs5c3rbl.fsf@oldenburg3.str.redhat.com>
References: <cover.1689092120.git.legion@kernel.org>
	<cover.1689074739.git.legion@kernel.org>
	<104971.1690300714@warthog.procyon.org.uk>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690301442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G/zZPwexsp4seUyrA2hhadzoNaw+twMBRSn/pl5a3MA=;
	b=c5kWlYZMdlE/INv+F6h0svdWyDDVeD+XQXfiqU/Nxvv4X+KSrgxkOnN0tq9em2zOvEMoxl
	xYQFsCkLvnwxuuX9eVz0/hv+rhXSdR4sM7ZlTE0GUXOTH8ZpbAKf+uRvm40rYeX3++WYTm
	vOlsqRX2lJ0L0HMqd8tNlkdKE82rXhs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690301442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G/zZPwexsp4seUyrA2hhadzoNaw+twMBRSn/pl5a3MA=;
	b=c5kWlYZMdlE/INv+F6h0svdWyDDVeD+XQXfiqU/Nxvv4X+KSrgxkOnN0tq9em2zOvEMoxl
	xYQFsCkLvnwxuuX9eVz0/hv+rhXSdR4sM7ZlTE0GUXOTH8ZpbAKf+uRvm40rYeX3++WYTm
	vOlsqRX2lJ0L0HMqd8tNlkdKE82rXhs=
In-Reply-To: <104971.1690300714@warthog.procyon.org.uk> (David Howells's
	message of "Tue, 25 Jul 2023 16:58:34 +0100")
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, alexander.shishkin@linux.intel.com, stefan@agner.ch, ldv@altlinux.org, James.Bottomley@HansenPartnership.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-api@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, Arnd Bergmann <arnd@arndb.de>, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, catalin.marinas@arm.com, jhogan@kernel.org, mattst88@gmail.com, fenghua.yu@intel.com, gor@linux.ibm.com, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org, ink@jurassic.park.msu.ru, viro@zeniv.linux.org.uk, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, christian@bra

* David Howells:

> Rather than adding a fchmodat2() syscall, should we add a "set_file_attrs()"
> syscall that takes a mask and allows you to set a bunch of stuff all in one
> go?  Basically, an interface to notify_change() in the kernel that would allow
> several stats to be set atomically.  This might be of particular interest to
> network filesystems.

Do you mean atomically as in compare-and-swap (update only if old values
match), or just a way to update multiple file attributes with a single
system call?

Thanks,
Florian

