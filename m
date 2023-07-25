From: David Howells <dhowells@redhat.com>
Subject: Re: Add fchmodat2() - or add a more general syscall?
Date: Tue, 25 Jul 2023 19:39:51 +0100
Message-ID: <107290.1690310391@warthog.procyon.org.uk>
References: <87fs5c3rbl.fsf@oldenburg3.str.redhat.com> <cover.1689092120.git.legion@kernel.org> <cover.1689074739.git.legion@kernel.org> <104971.1690300714@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690310411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7ss2tzNf07FPnrLqdDtf+Er94L4qFrw/j0drlGJAUJI=;
	b=R23RYJzz5rLqalVJISVNMz4XEb4FrUDC4fnGGteTe2U2iXMsDJUea+HuZ/FHdaUjThNm69
	Aw71ey1xvzwUF3sKKYwy3ksX7mLCouomDeP/hh+DP4s301CfhKEd8OC6SiT3p7BhtlLDmr
	a4uNlMI6Tt+HsfJxM7+jIhnkqDUHEps=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690310412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7ss2tzNf07FPnrLqdDtf+Er94L4qFrw/j0drlGJAUJI=;
	b=YSIn69pvwAyZ3JYlybhobQc6T92rzTFidJ4FPLp38mGc5WpsMeKk4SVGh1nW01XKn8c2Wu
	7rbV0H9GjxXx2GHU66iM8LZ4tnsG8lwCJnUCMOFbNl/Tznn8yJaGS+IvJBI/tYxUoSffgQ
	U/X3r840asW/1zt3FJVmNNxh1hmGuRY=
In-Reply-To: <87fs5c3rbl.fsf@oldenburg3.str.redhat.com>
Content-ID: <107289.1690310391.1@warthog.procyon.org.uk>
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
Content-Transfer-Encoding: 7bit
To: Florian Weimer <fweimer@redhat.com>
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, alexander.shishkin@linux.intel.com, stefan@agner.ch, ldv@altlinux.org, James.Bottomley@HansenPartnership.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-api@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, Arnd Bergmann <arnd@arndb.de>, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, catalin.marinas@arm.com, jhogan@kernel.org, mattst88@gmail.com, fenghua.yu@intel.com, gor@linux.ibm.com, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org, ink@jurassic.park.msu.ru, viro@zeniv.linux.org.uk, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, christian@bra

Florian Weimer <fweimer@redhat.com> wrote:

> > Rather than adding a fchmodat2() syscall, should we add a
> > "set_file_attrs()" syscall that takes a mask and allows you to set a bunch
> > of stuff all in one go?  Basically, an interface to notify_change() in the
> > kernel that would allow several stats to be set atomically.  This might be
> > of particular interest to network filesystems.
> 
> Do you mean atomically as in compare-and-swap (update only if old values
> match), or just a way to update multiple file attributes with a single
> system call?

I was thinking more in terms of the latter.  AFAIK, there aren't any network
filesystems support a CAS interface on file attributes like that.  To be able
to do a CAS operation, we'd need to pass in the old values as well as the new.

Another thing we could look at is doing "create_and_set_attrs()", possibly
allowing it to take a list of xattrs also.

David

