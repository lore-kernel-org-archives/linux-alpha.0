From: Christian Brauner <brauner@kernel.org>
Subject: Re: Add fchmodat2() - or add a more general syscall?
Date: Thu, 27 Jul 2023 12:27:42 +0200
Message-ID: <20230727-kassieren-aneinander-052b18a84546@brauner>
References: <cover.1689092120.git.legion@kernel.org>
 <cover.1689074739.git.legion@kernel.org>
 <104971.1690300714@warthog.procyon.org.uk>
 <20230727035710.GA15127@sol.localdomain>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690453676;
	bh=deaD8pujkpTtajMkrzG6FDy9HzkESG69/qNzMXZtjw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I7SQDE13fzKBcFUp5ePMk9YUxZ5LwkMwJzEhJh5gygi5y3Ao4HYQUhpzqZ+RcAGng
	 bn4vp/EfbLNeCzrahJPNrwO1OBRujz9xBo7+Gwbo3boim4OhzbOb3qoiVHBiAMEaWJ
	 PUG9ntl7QrNnL9tqEWTP/FDqYRjBLv6Pe+hC4010c/XsSyQFDc2T5KRE4F0CEfvhIP
	 4kdpLRFtj8U5bMLrtJSUPNEcwdIVIx3V75HfNd2zboybu6ykt1PDPjB308ZqP7GtZB
	 ns0n3LOD64u1iaWvsMh+b+uKRfMRf5JlVFDa1qQYJ082NdSiyLNQ81rIjYiYhPr8X+
	 TOPX0LSqgemIg==
Content-Disposition: inline
In-Reply-To: <20230727035710.GA15127@sol.localdomain>
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
To: Eric Biggers <ebiggers@kernel.org>
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, fenghua.yu@intel.com, alexander.shishkin@linux.intel.com, x86@kernel.org, stefan@agner.ch, ldv@altlinux.org, James.Bottomley@hansenpartnership.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-api@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, Arnd Bergmann <arnd@arndb.de>, ysato@users.sourceforge.jp, deller@gmx.de, linux-sh@vger.kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, catalin.marinas@arm.com, jhogan@kernel.org, mattst88@gmail.com, fweimer@redhat.com, gor@linux.ibm.com, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org, bp@a, lien8.de, viro@zeniv.linux.org.uk, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, chris

On Wed, Jul 26, 2023 at 08:57:10PM -0700, Eric Biggers wrote:
> On Tue, Jul 25, 2023 at 04:58:34PM +0100, David Howells wrote:
> > Rather than adding a fchmodat2() syscall, should we add a "set_file_attrs()"
> > syscall that takes a mask and allows you to set a bunch of stuff all in one
> > go?  Basically, an interface to notify_change() in the kernel that would allow
> > several stats to be set atomically.  This might be of particular interest to
> > network filesystems.
> > 
> > David
> > 
> 
> fchmodat2() is a simple addition that fits well with the existing syscalls.
> It fixes an oversight in fchmodat().
> 
> IMO we should just add fchmodat2(), and not get sidetracked by trying to add
> some super-generalized syscall instead.  That can always be done later.

Agreed.
