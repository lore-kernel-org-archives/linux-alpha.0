From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH mm-unstable v1 11/20] RDMA/usnic: remove FOLL_FORCE usage
Date: Wed, 16 Nov 2022 20:45:44 -0400
Message-ID: <Y3WEONlxYkwrglYR@ziepe.ca>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-12-david@redhat.com>
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
	List-Owner; bh=Dl9QArwZzu9bAn52wLntOFLF9pyzrmjypHH2lY73UzY=; b=pirgEPW2e6tTiV
	q3wZJE+GjKsz6byihlRu4+sFTziOxtX74EBPmSN1uasBRFNpfNdSVQl6zy+lX40FzkCCpM2NDZfyN
	+dmpwpy6FQIenugesKqVgPrM2OkumEk2AREjM09ebJwbgaY3MwGYcM9CkBzBLrBML8dZfAkBKXqtE
	Q2/W3iCkj50T4qbc3fypVHdBy9DuvdMiwHVJMhZjSRLPYIroOxv9YWGdIF8lEUVdc8VyMCDBEJTXw
	BMfoNCdK3X4oy/M7gvK/9siRzAeooPUCq6zA9VH6d+6HIx/QayWJvHGBD1XOQBBddqk1b0e50PDwW
	i+FSNHDzj2ZkqkOmuIsA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6GmH5bBgQAPTYyWGM7n52ZkzuQiQsRGb4mBRnSjjrbs=;
        b=l2lxIbefVRjdcatsHe8zxGxmcFT5QX0zkZlGmTA+6hS7woiLsGV9I6bNGV4zHN8kjb
         l2p/UcY6CYSTNWmi7VujvEPDLopmeYV5y04nexmylfHHZLvrChhtK9ZoFHB8KXFnQm2L
         u2KxlP3m/08gOzMOWFz7wJqhAgcRBAizzZiUHkaGNmUyt44/uIl+uDznkLyQC/8LtiyK
         IYJyOaMVreNHxUrE7KnyIf6buUGiBVrXdyfdI9hycSXNdg6N07L9Zen1tNKJCn4NMx7j
         3tR7ySmG4oePdK/F1paF+sUf2cgVO41erHwEOTLPwwAJA2UwmtpAOpPTOIoYWmh1mJkM
         +oJg==
Content-Disposition: inline
In-Reply-To: <20221116102659.70287-12-david@redhat.com>
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

On Wed, Nov 16, 2022 at 11:26:50AM +0100, David Hildenbrand wrote:
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
> Cc: Christian Benvenuti <benve@cisco.com>
> Cc: Nelson Escobar <neescoba@cisco.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Leon Romanovsky <leon@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/infiniband/hw/usnic/usnic_uiom.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
