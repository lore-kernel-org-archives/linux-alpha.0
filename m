From: David Rientjes <rientjes@google.com>
Subject: [patch] alpha, mm: set all online nodes in N_NORMAL_MEMORY
Date: Thu, 21 Apr 2011 15:00:19 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1104211458580.20201@chino.kir.corp.google.com>
References: <1303317178.2587.30.camel@mulgrave.site> <alpine.DEB.2.00.1104201410350.31768@chino.kir.corp.google.com> <20110421220351.9180.A69D9226@jp.fujitsu.com> <alpine.DEB.2.00.1104211237250.5829@chino.kir.corp.google.com> <alpine.DEB.2.00.1104211500170.5741@router.home>
 <alpine.DEB.2.00.1104211411540.20201@chino.kir.corp.google.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=google.com; s=beta;
	t=1303423224; bh=QnDoRYKEDTeonYv9mmQz2QIaXWE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type;
	b=uGVa6r5gT5kNrnJyH3CSiUb13lPGufZcOqRGhjqBYSivoyoYfj5Y/UHp/LQYNjlZf
	 cyzBWJFtOAcSBpDHlzflA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=beta;
        h=domainkey-signature:date:from:x-x-sender:to:cc:subject:in-reply-to
         :message-id:references:user-agent:mime-version:content-type;
        bh=YneJL+JLPsCNl0a11RB8Fw8vhDYhkGI6huosZuTdRmo=;
        b=w9p/PAHHWb7lxXiwVMJqRf/abLUZYRkDsU8vbZjX2ej/goOjVu4t/O4WSF02rgzv8L
         ZKwLZ8X+0B1Uhv7dhikg==
In-Reply-To: <alpine.DEB.2.00.1104211411540.20201@chino.kir.corp.google.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Andrew Morton <akpm@linux-foundation.org>, Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

For alpha, N_NORMAL_MEMORY represents all nodes that have present memory 
since it does not support HIGHMEM.  This patch sets the bit at the time 
the node is initialized.

If N_NORMAL_MEMORY is not accurate, slub may encounter errors since it 
uses this nodemask to setup per-cache kmem_cache_node data structures.

Signed-off-by: David Rientjes <rientjes@google.com>
---
 arch/alpha/mm/numa.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/alpha/mm/numa.c b/arch/alpha/mm/numa.c
--- a/arch/alpha/mm/numa.c
+++ b/arch/alpha/mm/numa.c
@@ -313,6 +313,7 @@ void __init paging_init(void)
 			zones_size[ZONE_DMA] = dma_local_pfn;
 			zones_size[ZONE_NORMAL] = (end_pfn - start_pfn) - dma_local_pfn;
 		}
+		node_set_state(nid, N_NORMAL_MEMORY);
 		free_area_init_node(nid, zones_size, start_pfn, NULL);
 	}
 
