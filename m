From: Mateusz Guzik <mjguzik@gmail.com>
Subject: Re: [linus:master] [locking] c8afaa1b0f: stress-ng.zero.ops_per_sec
 6.3% improvement
Date: Tue, 15 Aug 2023 09:43:04 +0200
Message-ID: <CAGudoHFFdFa=0y0XSEMNF4eucngxHKs7tby3rf32A-Wn1cqivQ@mail.gmail.com>
References: <202308151426.97be5bd8-oliver.sang@intel.com> <CAHk-=whbOEhPUL1m8Ua-+-E7kJXED4xa+duzRF-wJKR84NAPWg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692085384; x=1692690184;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dopEln9VPZxL0Iq2JZLCcr+rwxXbLb8d+hQCQTunBsQ=;
        b=sXpXbQ7X0/LnTySjZDkaO9nHDDYr/pU3abQLw5n+GIKm504OloCtIss+QlRkXMojYd
         lnsMof65iO5zpZY4PDmzq4MvCqh87E7X54BHvQSyyEBEsvQLKlRcO9PFHOwnoC26UxSi
         0EOZolvVtmL/fjRleZjuvqGddQNE1ZoIFWROwVG2UGNYm6q4+PQ4gJr4l2gvaDj98KI7
         LNthh1PBVu5kZzVpkcc4O5PE+NiDnj53oYq5p6Usr6X7mva8914eox15YAr9OxM1pcMm
         bfXnNogduAOX/QmakZMZx8O5v4D5wLTjB0DaOjr43HLmAUvjt7TZ5afaza86l8WrDnrm
         0KsQ==
In-Reply-To: <CAHk-=whbOEhPUL1m8Ua-+-E7kJXED4xa+duzRF-wJKR84NAPWg@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com

On 8/15/23, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> On Tue, 15 Aug 2023 at 07:12, kernel test robot <oliver.sang@intel.com>
> wrote:
>>
>> kernel test robot noticed a 6.3% improvement of stress-ng.zero.ops_per_sec
>> on:
>
> WTF? That's ridiculous. Why would that even test new_inode() at all?
> And why would it make any difference anyway to prefetch a new inode?
> The 'zero' test claims to just read /dev/zero in a loop...
>
> [ Goes looking ]
>

Ye man, I was puzzled myself but just figured it out and was about to respond ;)

# bpftrace -e 'kprobe:new_inode { @[kstack()] = count(); }'
Attaching 1 probe...

@[
    new_inode+1
    shmem_get_inode+137
    __shmem_file_setup+195
    shmem_zero_setup+46
    mmap_region+1937
    do_mmap+956
    vm_mmap_pgoff+224
    do_syscall_64+46
    entry_SYSCALL_64_after_hwframe+115
]: 2689570

the bench is doing this *A LOT* and this looks so fishy, for the bench
itself and the kernel doing it, but I'm not going to dig into any of
that.

>>      39.35            -0.3       39.09
>> perf-profile.calltrace.cycles-pp.inode_sb_list_add.new_inode.shmem_get_inode.__shmem_file_setup.shmem_zero_setup
>
> Ahh. It also does the mmap side, and the shared case ends up always
> creating a new inode.
>
> And while the test only tests *reading* and the mmap is read-only, the
> /dev/zero file descriptor was opened for writing too, for a different
> part of a test.
>
> So even though the mapping is never written to, MAYWRITE is set, and
> so the /dev/zero mapping is done as a shared memory mapping and we
> can't do it as just a private one.
>
> That's kind of stupid and looks unintentional, but whatever.
>
> End result: that benchmark ends up being at least partly (and a fairly
> noticeable part) a shmem setup benchmark, for no actual good reason.
>
> Oh well. I certainly don't mind the removal apparently then also
> helping some odd benchmark case, but I don't think this translates to
> anything real. Very random.
>
>                     Linus
>


-- 
Mateusz Guzik <mjguzik gmail.com>
