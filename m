From: Christian Brauner <brauner@kernel.org>
Subject: Re: Add fchmodat2() - or add a more general syscall?
Date: Wed, 26 Jul 2023 15:30:51 +0200
Message-ID: <20230726-arztbesuch-division-ee0343632e3c@brauner>
References: <87fs5c3rbl.fsf@oldenburg3.str.redhat.com>
 <cover.1689092120.git.legion@kernel.org>
 <cover.1689074739.git.legion@kernel.org>
 <104971.1690300714@warthog.procyon.org.uk>
 <107290.1690310391@warthog.procyon.org.uk>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690378264;
        bh=HS5sUeLSMwNW9P5zkSBnlwFMDf5b4OM9IVMq33WbW+U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iun9Va1e08ezdxo92/bg5MGdihHdrBrDXCPN2ZuWEZMFn0+OcEXanuIHv+EfWsuNU
         L+Hxeq52/Ccp23FMh5y1r628rwDUn1FsDYgXV4giQWpOryyyH6Wz7U1/JH10rPMXbb
         Jiny/AP6Rjp/r+N2q9Fk7zju31hIIvg2lQlqj+b+9vq+HbD2Z1tLgaskjEpsllb4Ql
         VgHQzVKaqbMr879rRkud1caFzU2c3Fv3yxztgXx3GhJMZ90I0OKFAjGqdqfapsMwg9
         ijZCYka6GelxzX2yem0uLWMKJaHqScGsLr30PfErtdYqG0FS1DFvWLCP1t/H0ZSwer
         Mo5PnIaBy2w0w==
Content-Disposition: inline
In-Reply-To: <107290.1690310391@warthog.procyon.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: Florian Weimer <fweimer@redhat.com>, Alexey Gladkov <legion@kernel.org>, James.Bottomley@HansenPartnership.com, acme@kernel.org, alexander.shishkin@linux.intel.com, axboe@kernel.dk, benh@kernel.crashing.org, borntraeger@de.ibm.com, bp@alien8.de, catalin.marinas@arm.com, christian@brauner.io, dalias@libc.org, davem@davemloft.net, deepa.kernel@gmail.com, deller@gmx.de, fenghua.yu@intel.com, geert@linux-m68k.org, glebfm@altlinux.org, gor@linux.ibm.com, hare@suse.com, hpa@zytor.com, ink@jurassic.park.msu.ru, jhogan@kernel.org, kim.phillips@arm.com, ldv@altlinux.org, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vg

On Tue, Jul 25, 2023 at 07:39:51PM +0100, David Howells wrote:
> Florian Weimer <fweimer@redhat.com> wrote:
> 
> > > Rather than adding a fchmodat2() syscall, should we add a
> > > "set_file_attrs()" syscall that takes a mask and allows you to set a bunch
> > > of stuff all in one go?  Basically, an interface to notify_change() in the

That system call would likely be blocked in seccomp sandboxes completely
as seccomp cannot filter structs. I don't consider this an argument to
block new good functionality in general as that would mean arbitrarily
limiting us but it is something to keep in mind. If there's additional
benefit other than just being able to set mutliple values at once then
yeah might be something to discuss.

> > > kernel that would allow several stats to be set atomically.  This might be
> > > of particular interest to network filesystems.
> > 
> > Do you mean atomically as in compare-and-swap (update only if old values
> > match), or just a way to update multiple file attributes with a single
> > system call?
> 
> I was thinking more in terms of the latter.  AFAIK, there aren't any network
> filesystems support a CAS interface on file attributes like that.  To be able
> to do a CAS operation, we'd need to pass in the old values as well as the new.
> 
> Another thing we could look at is doing "create_and_set_attrs()", possibly
> allowing it to take a list of xattrs also.

That would likely require variable sized pointers in a struct which is
something we really try to stay away from. I also think it's not a good
idea to lump xattrs toegether with generic file attributes. They should
remain a separate api imho.
