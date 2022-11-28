From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH mm-unstable v1 16/20] mm/frame-vector: remove FOLL_FORCE
 usage
Date: Mon, 28 Nov 2022 14:59:27 -0800
Message-ID: <20221128145927.df895bf1966cfa125cae9668@linux-foundation.org>
References: <20221116102659.70287-1-david@redhat.com>
        <20221116102659.70287-17-david@redhat.com>
        <81fb0fa3-2e06-b765-56ac-a7d981194e59@redhat.com>
        <08b65ac6-6786-1080-18f8-d2be109c85fc@xs4all.nl>
        <9d0bf98a-3d6a-1082-e992-1338e1525935@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1669676369;
        bh=8eUsQnXrojDc3xf/FA0TCQqqadaNCz4PLnjHT4xDE/M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=p/c6sfRX9un7PSA9WHRKHQPKKlq0P4NHxZWk+3LaBZS7DQenvFmjKk0jQBgH6o535
         rwsyByROkiEJmDN58P/Z53hmZWo4xmybXT0VaPtvGqyQZyuQQjThzncIMjLPHHFdpc
         3v4hl13h6A47jhJOM5850oDp2I/9vqahh0Q1uqps=
In-Reply-To: <9d0bf98a-3d6a-1082-e992-1338e1525935@redhat.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Hildenbrand <david@redhat.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Greg Kroah-Hartman <greg>

On Mon, 28 Nov 2022 09:18:47 +0100 David Hildenbrand <david@redhat.com> wrote:

> > Less chances of things going wrong that way.
> > 
> > Just mention in the v2 cover letter that the first patch was added to
> > make it easy to backport that fix without being hampered by merge
> > conflicts if it was added after your frame_vector.c patch.
> 
> Yes, that's the way I would naturally do, it, however, Andrew prefers 
> delta updates for minor changes.
> 
> @Andrew, whatever you prefer!

I'm inclined to let things sit as they are.  Cross-tree conflicts
happen, and Linus handles them.  I'll flag this (very simple) conflict
in the pull request, if MM merges second.  If v4l merges second then
hopefully they will do the same.  But this one is so simple that Linus
hardly needs our help.

But Linus won't be editing changelogs so that the changelog makes more
sense after both trees are joined.  I'm inclined to let the changelog
sit as it is as well.
