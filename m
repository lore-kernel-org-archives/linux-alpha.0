From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH mm-unstable v1 12/20] RDMA/siw: remove FOLL_FORCE usage
Date: Wed, 16 Nov 2022 20:46:03 -0400
Message-ID: <Y3WES5adl6yyS4ZB@ziepe.ca>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-13-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WnJEhr8C7TDzd9smvaKqqmF0av3OdyIW1Pdtz+1NmQc=; b=eqCoHRirwcCTwQ
	RKFMEuTNb8n237EJ5ij5bU4xfs5tcQPOiE9z5HK2VFGxm4oOgAxVZWVktK1KmMx2y6aDFVgE6y7+6
	2XHR5hlV5tvtV34JAbR6ujEDwqoYAaxJdcRDutKCl8n++BsZXaV1ryGVPLCWMJaYW9i26+cFDSWto
	6XtH7RO+jSpOb3M3doo9kB/9XmNP7C2Q1S8V4J8lSIl0r8je/hRxNaC4IiKKcdNrowJEaPG3j+c+h
	Cqk5qLZms65dOa0JevNtZC5T8mSxxlKh1NgytHEKw/4OKuE0jJ6vLiXK6DdOBPNLasxGeY0E3BfiB
	RX3zZmAiTgi5VFmh9WbA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rT9xjSJmKp4cCvf16bTKl9Dc4YEY7MjOtsK/w44qv+E=;
        b=VV2cb+pd6jfcSL2tauZE67KBioAHcybPQR+VfU40dKebsvpG7CB3+xd0Uv8h8MKz8R
         sbSQ7TqeMCU61fYQIjRwQoQBWrCcg8ekkdEQ8V7xYjRGPq0DN+C0Atnpvt0eAux7Zvaz
         PXr7WI31PYcmErRNWRYdBKljCyptLiKShcOF4gqH5bxcH7c9a48sUWSu+SLW+D60rEcT
         94q2cJm8yEvdEzbYpl0Vwvwu6uXwvrse0KXhbaR5xd9/LECZYdD6vR+hmUeAJTlxbvcq
         ueSGRE+vNlUSsDE90kXWUWeAcS6lHSqHDXkbeBbAuFPPnKLrO2HgUtltNTPZxflFTx6j
         B+8A==
Content-Disposition: inline
In-Reply-To: <20221116102659.70287-13-david@redhat.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-um/>
List-Post: <mailto:linux-um@lists.infradead.org>
List-Help: <mailto:linux-um-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=subscribe>
Sender: "linux-um" <linux-um-bounces@lists.infradead.org>
Errors-To: linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrea Arcangeli <aarcange@redhat.com>, Hugh Dickins <hughd@google.com>, Nadav Amit <namit@vmware.com>

On Wed, Nov 16, 2022 at 11:26:51AM +0100, David Hildenbrand wrote:
> GUP now supports reliable R/O long-term pinning in COW mappings, such
> that we break COW early. MAP_SHARED VMAs only use the shared zeropage so
> far in one corner case (DAXFS file with holes), which can be ignored
> because GUP does not support long-term pinning in fsdax (see
> check_vma_flags()).
> 
> Consequently, FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM is no longer required
> for reliable R/O long-term pinning: FOLL_LONGTERM is sufficient. So stop
> using FOLL_FORCE, which is really only for ptrace access.
> 
> Cc: Bernard Metzler <bmt@zurich.ibm.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Leon Romanovsky <leon@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/infiniband/sw/siw/siw_mem.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
