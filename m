From: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH] mm: Remove dummy struct bootmem_data/bootmem_data_t
Date: Thu, 26 Mar 2020 12:02:24 +0800
Message-ID: <20200326040224.GK3039@MiWiFi-R3L-srv>
References: <20200326022617.26208-1-longman@redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585195357;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=nCZVOAI+we4AXCG4GcEDrDdIAY2DXRRQnsZBhAj73FU=;
        b=F+Hs/R5eJSi1Ks5iF077Ru5kywAvO3iBI9xraQIGkK+HKMZTie1/VLLZqYyt4ms2JnotF6
        YV12H+cJUjPZ+dymI/sUbI2/FsdEWoFFktLEYqbRTWQ8CkrStrRPpJEgBaKDuRE2eWikoP
        7ZeLBhZ69malbGqo6vvrT7s8A9guHqo=
Content-Disposition: inline
In-Reply-To: <20200326022617.26208-1-longman@redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Waiman Long <longman@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On 03/25/20 at 10:26pm, Waiman Long wrote:
> Both bootmem_data and bootmem_data_t structures are no longer defined.
> Remove the dummy forward declarations.
> 
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  arch/alpha/include/asm/mmzone.h | 2 --
>  include/linux/mmzone.h          | 1 -
>  2 files changed, 3 deletions(-)
> 
> diff --git a/arch/alpha/include/asm/mmzone.h b/arch/alpha/include/asm/mmzone.h
> index 7ee144f484f1..9b521c857436 100644
> --- a/arch/alpha/include/asm/mmzone.h
> +++ b/arch/alpha/include/asm/mmzone.h
> @@ -8,8 +8,6 @@
>  
>  #include <asm/smp.h>
>  
> -struct bootmem_data_t; /* stupid forward decl. */
> -
>  /*
>   * Following are macros that are specific to this numa platform.
>   */
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 462f6873905a..5c388eced889 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -706,7 +706,6 @@ struct deferred_split {
>   * Memory statistics and page replacement data structures are maintained on a
>   * per-zone basis.
>   */
> -struct bootmem_data;
>  typedef struct pglist_data {
>  	struct zone node_zones[MAX_NR_ZONES];
>  	struct zonelist node_zonelists[MAX_ZONELISTS];

Looks good to me.

Reviewed-by: Baoquan He <bhe@redhat.com>

