From: David Howells <dhowells@redhat.com>
Subject: Add fchmodat2() - or add a more general syscall?
Date: Tue, 25 Jul 2023 16:58:34 +0100
Message-ID: <104971.1690300714@warthog.procyon.org.uk>
References: <cover.1689092120.git.legion@kernel.org> <cover.1689074739.git.legion@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690300733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DCrVdTZAI+0vQC3PoQE4vcBJ0YMLagHeZdYmArSL1lk=;
	b=griUMn1q4eeP1zmcvhaRXefAef156UStd0wpGMerGjloMA7xTAqBRTVLqWG2n5Q3Iz1vPd
	n8lQ4HZqrT9ySAl47rq1+AlnpzBwcFFDujv8Yh05RM4LXljUHJsHmGcCRyRYOKSOd7UXbZ
	U68Ohtncgb0upf2l7gQlT84Y2nSRisg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690300734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DCrVdTZAI+0vQC3PoQE4vcBJ0YMLagHeZdYmArSL1lk=;
	b=AKC+T8h9RwiWpakAD+oF4qSMen3scsdNgjSE9JHf4vh4WlLXhifO/9fZCk5/+ft1Ly/HZt
	lC2W+qruSMGIfnYhBy9vpSbZED9syovHQtyXzFTP2D501gtfst39NFWKnRraAoa/tiMKlS
	XzziHCahZk0KSRGRYkQjCM7SpcM1MQg=
In-Reply-To: <cover.1689092120.git.legion@kernel.org>
Content-ID: <104970.1690300714.1@warthog.procyon.org.uk>
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
To: Alexey Gladkov <legion@kernel.org>
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, fenghua.yu@intel.com, alexander.shishkin@linux.intel.com, x86@kernel.org, stefan@agner.ch, ldv@altlinux.org, James.Bottomley@HansenPartnership.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, Arnd Bergmann <arnd@arndb.de>, ysato@users.sourceforge.jp, deller@gmx.de, linux-sh@vger.kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, catalin.marinas@arm.com, jhogan@kernel.org, mattst88@gmail.com, fweimer@redhat.com, gor@linux.ibm.com, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org, ink@jurassic.park.msu.ru, viro@zeniv.linux.org.uk, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, christian@brauner.io

Rather than adding a fchmodat2() syscall, should we add a "set_file_attrs()"
syscall that takes a mask and allows you to set a bunch of stuff all in one
go?  Basically, an interface to notify_change() in the kernel that would allow
several stats to be set atomically.  This might be of particular interest to
network filesystems.

David

