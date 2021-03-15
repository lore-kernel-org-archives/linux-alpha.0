From: "Kirill A. Shutemov" <kirill-oKw7cIdHH8eLwutG50LtGA@public.gmane.org>
Subject: Re: [PATCH RFCv2] mm/madvise: introduce MADV_POPULATE_(READ|WRITE)
 to prefault/prealloc memory
Date: Mon, 15 Mar 2021 15:22:13 +0300
Message-ID: <20210315122213.k52wtlbbhsw42pks@box>
References: <20210308164520.18323-1-david@redhat.com>
Mime-Version: 1.0
Return-path: <linux-api-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NTc0pSC6ULv7Oqo3W3BMnNj1V6ogGKFoV43UcdG1gw0=;
        b=pj9oJ7H41ug5yJ5S6H0nmrDTorRFP5qpfgv8i0hsLgLSj6j5PjG4r6CtBYKYzFwGQ7
         qUwbmG/8/o72CrhYOuy1punTJ8eK8uXtrdScLOXhZqHigyzjZUkihsGUq4xZefGGdJyJ
         275Qs7hRExo2D1+cRyIGrQJ6i4ctnY1t01+0PJ6CKUa2AlaACxmAEx0k8rYtovkkg4lP
         l1xe1r6L8Z9HbZcmF3rYR+SPpPKz6i2+3Ny1STnPMThtmy5e0onayZVYWo+QbcgfkMHc
         xxoSTqoI9G0vymB+Dbv7E8Hbo2tjTUaTbVKY7ml8UnFXGPXy5tYMAX1HVhaerXR5DKSJ
         d5CQ==
Content-Disposition: inline
In-Reply-To: <20210308164520.18323-1-david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michal Hocko <mhocko-IBi9RG/b67k@public.gmane.org>, Oscar Salvador <osalvador-l3A5Bk7waGM@public.gmane.org>, Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Minchan Kim <minchan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jann Horn <jannh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgg-uk2M96/98Pc@public.gmane.org>, Dave Hansen <dave.hansen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hugh Dickins <hughd-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rik van Riel <riel-ebMLmSuQjDVBDgjK7y7TUQ@public.gmane.org>, "Michael S . Tsirkin" <mst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Kirill A . Shutemov" <kirill.shutemov-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Vlastimil Babka <vbabka-AlSwsSmVLrQ@public.gmane.org>, Richard Henderson <rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org>, Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>, Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Bogendoerfer <tsbogend-I1c7kopa9pzNi4+bAlmZwQ@public.gmane.org>

On Mon, Mar 08, 2021 at 05:45:20PM +0100, David Hildenbrand wrote:
> +			case -EHWPOISON: /* Skip over any poisoned pages. */
> +				start += PAGE_SIZE;
> +				continue;

Why is it good approach? It's not abvious to me.

-- 
 Kirill A. Shutemov
