From: David Rientjes <rientjes@google.com>
Subject: Re: [patch 01/14] alpha: invoke oom-killer from page fault
Date: Thu, 22 Apr 2010 13:46:47 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1004221346350.25350@chino.kir.corp.google.com>
References: <20100422160613.723698029@suse.de> <20100422161222.762354051@suse.de>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=google.com; s=beta;
	t=1271969215; bh=pshGS+kapF8s83gyTdAyvPMvueM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type;
	b=ib/k2nQGRuVCWjqva+4qzIpmJInF8NjdqaDjD+n9NyCcxO1MBRqCKB/PtD6fU+NVl
	 IP9JvXT0G7nzruIIR9uPQ==
In-Reply-To: <20100422161222.762354051@suse.de>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: npiggin@suse.de
Cc: linux-arch@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>

On Fri, 23 Apr 2010, npiggin@suse.de wrote:

> As explained in commit 1c0fe6e3bd, we want to call the architecture independent
> oom killer when getting an unexplained OOM from handle_mm_fault, rather than
> simply killing current.
> 
> Cc: linux-alpha@vger.kernel.org
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: linux-arch@vger.kernel.org
> Signed-off-by: Nick Piggin <npiggin@suse.de>

Acked-by: David Rientjes <rientjes@google.com>
