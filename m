From: Eric Biggers <ebiggers@kernel.org>
Subject: Re: Add fchmodat2() - or add a more general syscall?
Date: Wed, 26 Jul 2023 20:57:10 -0700
Message-ID: <20230727035710.GA15127@sol.localdomain>
References: <cover.1689092120.git.legion@kernel.org>
 <cover.1689074739.git.legion@kernel.org>
 <104971.1690300714@warthog.procyon.org.uk>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690430233;
        bh=2LZQxDDrrueBXO8BVcvN88sdAiFgW61YpvmWoV4rusk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EZdgMDJNvWHpTU/TbbeuJIRdZELQC4io44o7BRZjr/qEbqXP+mOb3SpnPc3GnzZUJ
         6/89F+qI71eFF4iUju0DDwCRfWxlmyu525kPI64StVeMn3g22mxzWiFX5SyeyJUOvC
         7vpMprEDvWDPdxrLmbFWPjI1sopKugt5VjA6tOeYBWY7dbKLYXy1ooOebTmGv3ACSj
         fFwMNdhI5gT7lq20ftyAy9B2B7F0Kx3men5CLDs/URmKMEbxn6qNQpfOdz4+yFLRKM
         U8TEEb4JSsQRcj9xreGkiiwQXGZr6UG1WIoN/6+4R39C1Goqdd0J+NCOS+t8EZnNCl
         LnOw3z+jPm6bA==
Content-Disposition: inline
In-Reply-To: <104971.1690300714@warthog.procyon.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: Alexey Gladkov <legion@kernel.org>, James.Bottomley@hansenpartnership.com, acme@kernel.org, alexander.shishkin@linux.intel.com, axboe@kernel.dk, benh@kernel.crashing.org, borntraeger@de.ibm.com, bp@alien8.de, catalin.marinas@arm.com, christian@brauner.io, dalias@libc.org, davem@davemloft.net, deepa.kernel@gmail.com, deller@gmx.de, fenghua.yu@intel.com, fweimer@redhat.com, geert@linux-m68k.org, glebfm@altlinux.org, gor@linux.ibm.com, hare@suse.com, hpa@zytor.com, ink@jurassic.park.msu.ru, jhogan@kernel.org, kim.phillips@arm.com, ldv@altlinux.org, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, li

On Tue, Jul 25, 2023 at 04:58:34PM +0100, David Howells wrote:
> Rather than adding a fchmodat2() syscall, should we add a "set_file_attrs()"
> syscall that takes a mask and allows you to set a bunch of stuff all in one
> go?  Basically, an interface to notify_change() in the kernel that would allow
> several stats to be set atomically.  This might be of particular interest to
> network filesystems.
> 
> David
> 

fchmodat2() is a simple addition that fits well with the existing syscalls.
It fixes an oversight in fchmodat().

IMO we should just add fchmodat2(), and not get sidetracked by trying to add
some super-generalized syscall instead.  That can always be done later.

- Eric
