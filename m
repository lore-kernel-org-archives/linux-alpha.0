From: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: Regression bisected to fa3354e4ea39 (mm: free_area_init: use
 maximal zone PFNs rather than zone sizes)
Date: Tue, 27 Jul 2021 23:41:05 +0300
Message-ID: <YQBvYUupT/jgDMqI@linux.ibm.com>
References: <20210726192311.uffqnanxw3ac5wwi@ivybridge>
 <YP8Vxt0xuV1m5EPS@linux.ibm.com>
 <CAEdQ38F2ddbM0WBjut6MH-0TpencKmx9Wu4++gLtfQ5HGRwxFQ@mail.gmail.com>
 <YP+rI9Fh4wl/O6/8@linux.ibm.com>
 <CAEdQ38G+ZfXmc01iZTc+q4dYpRqQJUz0KNFCPwTQ25AYqJVbMA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=GXrqMLJnfay41Qa+AEwE55svFy1XguVHqDhNlpP+SmY=;
 b=hB+/zUXeprcYwbn6nKjhIwwbuz3kv4QY69lNUMnB2OPWbtKODl6V2tW7u12lcV56s0/9
 Bj+qYrmvrNlPc2puSZqY340ul56S8x4iBctf9wylkYs29a/WOIcFWAUpGMOkGbf8/SfN
 5GXh96CCilH9y5AtjGjtiIzoQhd/eCtnqoInsP2tiTR3ir+yz+1EZA+bvHxgMV07aE3S
 +6PBjnR1jRxZ5Kc0WuzXj03Hcskwi8GQnJr7HMagPA/J71VF9RjtPEf+oUzhSURVsBA4
 6pJffJVZgggdz4XnhRV3iszXx2F80nXiu1PePvJgG3VVEgWsA5eIAKeWbqkPztMazBCk +Q== 
Content-Disposition: inline
In-Reply-To: <CAEdQ38G+ZfXmc01iZTc+q4dYpRqQJUz0KNFCPwTQ25AYqJVbMA@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: Michael Cree <mcree@orcon.net.nz>, linux-mm@kvack.org, linux-alpha <linux-alpha@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Tue, Jul 27, 2021 at 12:24:26PM -0700, Matt Turner wrote:
> On Mon, Jul 26, 2021 at 11:43 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
> >
> > On Mon, Jul 26, 2021 at 02:23:20PM -0700, Matt Turner wrote:
> > > On Mon, Jul 26, 2021 at 1:06 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
> > > >
> > > > Hi Matt,
> > > >
> > > > On Mon, Jul 26, 2021 at 12:27:50PM -0700, Matt Turner wrote:
> > > > > Reply-To:
> > > > >
> > > > > Hi Mike!
> > > > >
> > > > > Since commit fa3354e4ea39 (mm: free_area_init: use maximal zone PFNs rather
> > > > > than zone sizes), I get the following BUG on Alpha (an AlphaServer ES47 Marvel)
> > > > > and loading userspace leads to a segfault:
> > > > >
> > > > > (I didn't notice this for a long time because of other unrelated regressions,
> > > > > the pandemic, changing jobs, ...)
> > > >
> > > > I suspect there will be more surprises down the road :)
> > > >
> > > > > BUG: Bad page state in process swapper  pfn:2ffc53
> > > > > page:fffffc000ecf14c0 refcount:0 mapcount:1 mapping:0000000000000000 index:0x0
> > > > > flags: 0x0()
> > > > > raw: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > > > > raw: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > > > > page dumped because: nonzero mapcount  Modules linked in:
> > > > > CPU: 0 PID: 0 Comm: swapper Not tainted 5.7.0-03841-gfa3354e4ea39-dirty #26
> > > > >        fffffc0001b5bd68 fffffc0001b5be80 fffffc00011cd148 fffffc000ecf14c0
> > > > >        fffffc00019803df fffffc0001b5be80 fffffc00011ce340 fffffc000ecf14c0
> > > > >        0000000000000000 fffffc0001b5be80 fffffc0001b482c0 fffffc00027d6618
> > > > >        fffffc00027da7d0 00000000002ff97a 0000000000000000 fffffc0001b5be80
> > > > >        fffffc00011d1abc fffffc000ecf14c0 fffffc0002d00000 fffffc0001b5be80
> > > > >        fffffc0001b2350c 0000000000300000 fffffc0001b48298 fffffc0001b482c0
> > > > > Trace:
> > > > > [<fffffc00011cd148>] bad_page+0x168/0x1b0
> > > > > [<fffffc00011ce340>] free_pcp_prepare+0x1e0/0x290
> > > > > [<fffffc00011d1abc>] free_unref_page+0x2c/0xa0
> > > > > [<fffffc00014ee5f0>] cmp_ex_sort+0x0/0x30
> > > > > [<fffffc00014ee5f0>] cmp_ex_sort+0x0/0x30
> > > > > [<fffffc000101001c>] _stext+0x1c/0x20
> > > > >
> > > > > I haven't tried reproducing this on other machines or QEMU, but I'd be glad to
> > > > > if that helps.
> > > >
> > > > If it's reproducible on QEMU I can debug it locally.
> > > >
> > > > > Any ideas?
> > > >
> > > > It seems like memory map is not properly initialized. Can you enable
> > > > CONFIG_DEBUG_MEMORY_INIT and add mminit_debug=4 to the command line. The
> > > > interesting part of the log would be before "Memory: xK/yK available ..."
> > > > line.
> > > >
> > > > Hopefully it'll give some clues.
> > >
> > > Sure thing. Please find attached.
> >
> > > aboot: loading uncompressed vmlinuz-5.7.0-03841-gfa3354e4ea39-dirty...
> > > aboot: loading compressed vmlinuz-5.7.0-03841-gfa3354e4ea39-dirty...
> > > aboot: PHDR 0 vaddr 0xfffffc0001010000 offset 0xc0 size 0x17c5ae0
> > > aboot: bss at 0xfffffc00027d5ae0, size 0xe4ea0
> > > aboot: zero-filling 937632 bytes at 0xfffffc00027d5ae0
> > > aboot: loading initrd (5965252 bytes/5825 blocks) at 0xfffffc05ff2cc000
> > > aboot: starting kernel vmlinuz-5.7.0-03841-gfa3354e4ea39-dirty with arguments ro panic=5 domdadm root=/dev/md1 console=srm  mminit_debug=4
> > > Linux version 5.7.0-03841-gfa3354e4ea39-dirty (mattst88@ivybridge) (gcc version 11.1.0 (Gentoo 11.1.0-r2 p3), GNU ld (Gentoo 2.36.1 p3) 2.36.1) #26 SMP Sun Jul 25 18:20:06 PDT 2021
> > > printk: bootconsole [srm0] enabled
> > > Booting on Marvel variation Marvel/EV7 using machine vector MARVEL/EV7 from SRM
> > > Major Options: SMP EV67 VERBOSE_MCHECK DEBUG_SPINLOCK MAGIC_SYSRQ
> > > Command line: ro panic=5 domdadm root=/dev/md1 console=srm  mminit_debug=4
> > > memcluster 0, usage 1, start        0, end     1984
> > > memcluster 1, usage 0, start     1984, end  1048576
> > > memcluster 2, usage 1, start  2097152, end  2097224
> > > memcluster 3, usage 0, start  2097224, end  3145728
> > > Initial ramdisk at: 0x(____ptrval____) (5965252 bytes)
> > > Found an IO7 at PID 0
> > > Initializing IO7 at PID 0
> > > FIXME: disabling master aborts
> > > FIXME: disabling master aborts
> > > FIXME: disabling master aborts
> > > FIXME: disabling master aborts
> > > SMP: 2 CPUs probed -- cpu_present_mask = 3
> > > Zone ranges:
> > >   DMA      [mem 0x0000000000f80000-0x00000fffffffdfff]
> > >   Normal   empty
> > > Movable zone start for each node
> > > Early memory node ranges
> > >   node   0: [mem 0x0000000000f80000-0x00000001ffffffff]
> > >   node   0: [mem 0x0000000400090000-0x00000005ffffffff]
> >
> > I think that the issue is that memory marked as used in memcluster is never
> > added to memblock and it skews node/zone sizing calculations.
> 
> Thanks, this patch fixes it. With the patch applied, I see
> 
> Zone ranges:
>   DMA      [mem 0x0000000000000000-0x00000fffffffdfff]
>   Normal   empty
> Movable zone start for each node
> Early memory node ranges
>   node   0: [mem 0x0000000000000000-0x00000001ffffffff]
>   node   0: [mem 0x0000000400000000-0x00000005ffffffff]
> Initmem setup node 0 [mem 0x0000000000000000-0x00000005ffffffff]
> 
> If you want to send me this patch with your S-o-b I'll take it through
> my alpha git tree.

The patch is on its way :)

Now I'm really curios how commit e7793e53901b ("arc: update comment about
HIGHMEM implementation") will work out.

 
> Thanks Mike!
> Matt

-- 
Sincerely yours,
Mike.
