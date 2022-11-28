From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH mm-unstable v1 16/20] mm/frame-vector: remove FOLL_FORCE
 usage
Date: Mon, 28 Nov 2022 09:18:47 +0100
Message-ID: <9d0bf98a-3d6a-1082-e992-1338e1525935@redhat.com>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-17-david@redhat.com>
 <81fb0fa3-2e06-b765-56ac-a7d981194e59@redhat.com>
 <08b65ac6-6786-1080-18f8-d2be109c85fc@xs4all.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669623533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ueiNL/RrPlD3vRod9MDAxJpgFwmJj0Jyg8USWk7yPz8=;
	b=S+oFkjKVP3mckzd7VBbvH1QuZTZol0q9wTWffdsPiXu+2nmhjaLmPhu8ziCyV0KCioRPJI
	5JQ7Ka6QTT7w/TcDd4C3+oasgr3fATIDGVWRdSU8qp6A71RrRGJewLWoV59J4JHfMOQ3z1
	2VHUt/gcI6faTsrG8illEYtRpXcU/30=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669623533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ueiNL/RrPlD3vRod9MDAxJpgFwmJj0Jyg8USWk7yPz8=;
	b=S+oFkjKVP3mckzd7VBbvH1QuZTZol0q9wTWffdsPiXu+2nmhjaLmPhu8ziCyV0KCioRPJI
	5JQ7Ka6QTT7w/TcDd4C3+oasgr3fATIDGVWRdSU8qp6A71RrRGJewLWoV59J4JHfMOQ3z1
	2VHUt/gcI6faTsrG8illEYtRpXcU/30=
In-Reply-To: <08b65ac6-6786-1080-18f8-d2be109c85fc@xs4all.nl>
Content-Language: en-US
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-ia64@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>, linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, Alex William son <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.>

On 28.11.22 09:17, Hans Verkuil wrote:
> Hi David,
> 
> On 27/11/2022 11:35, David Hildenbrand wrote:
>> On 16.11.22 11:26, David Hildenbrand wrote:
>>> FOLL_FORCE is really only for ptrace access. According to commit
>>> 707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are always
>>> writable"), get_vaddr_frames() currently pins all pages writable as a
>>> workaround for issues with read-only buffers.
>>>
>>> FOLL_FORCE, however, seems to be a legacy leftover as it predates
>>> commit 707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are
>>> always writable"). Let's just remove it.
>>>
>>> Once the read-only buffer issue has been resolved, FOLL_WRITE could
>>> again be set depending on the DMA direction.
>>>
>>> Cc: Hans Verkuil <hverkuil@xs4all.nl>
>>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Cc: Tomasz Figa <tfiga@chromium.org>
>>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> ---
>>>    drivers/media/common/videobuf2/frame_vector.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/media/common/videobuf2/frame_vector.c
>>> index 542dde9d2609..062e98148c53 100644
>>> --- a/drivers/media/common/videobuf2/frame_vector.c
>>> +++ b/drivers/media/common/videobuf2/frame_vector.c
>>> @@ -50,7 +50,7 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
>>>        start = untagged_addr(start);
>>>          ret = pin_user_pages_fast(start, nr_frames,
>>> -                  FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
>>> +                  FOLL_WRITE | FOLL_LONGTERM,
>>>                      (struct page **)(vec->ptrs));
>>>        if (ret > 0) {
>>>            vec->got_ref = true;
>>
>>
>> Hi Andrew,
>>
>> see the discussion at [1] regarding a conflict and how to proceed with
>> upstreaming. The conflict would be easy to resolve, however, also
>> the patch description doesn't make sense anymore with [1].
> 
> Might it be easier and less confusing if you post a v2 of this series
> with my patch first? That way it is clear that 1) my patch has to come
> first, and 2) that it is part of a single series and should be merged
> by the mm subsystem.
> 
> Less chances of things going wrong that way.
> 
> Just mention in the v2 cover letter that the first patch was added to
> make it easy to backport that fix without being hampered by merge
> conflicts if it was added after your frame_vector.c patch.

Yes, that's the way I would naturally do, it, however, Andrew prefers 
delta updates for minor changes.

@Andrew, whatever you prefer!

Thanks!

-- 
Thanks,

David / dhildenb

