From: Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1] binfmt: remove support for em86 (alpha only)
Date: Wed, 28 Apr 2021 22:36:27 -0400
Message-ID: <CAEdQ38FOJdZxB7OGd569Lkn+RGPyjoukriwDfBEf2QKHvYguXQ@mail.gmail.com>
References: <20210420175631.46923-1-david@redhat.com>
Mime-Version: 1.0
Return-path: <linux-api-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O/vop45HHXD7xdWpJ3LqRkscEPKwG+bV95vmdn+ZXRQ=;
        b=i9Mdnar7Joz9zzIF+3zVrEX8TnA0bOMhfP20/XDOX7h1QzUlUFFJEbYBw0YV0NUb9Y
         RKKzADx1vNokvehQsmrVtCF2rzcUU0FjeaEv5nBgR3yhMJLBmqhBbGH0LjGFm3TzU8Wl
         On1sD4rmam2ZrXYCu1huAsYhr7ggHBkfKdVtzaTZfrEaP37cRlbCMN2/Fi3PefqRQDEA
         CQMrussJzSTFPozJa6vAY4h/5wbIOnWfItR4KN8vMwhM3gs8K5Z93265aBA4y7OSWC6m
         UaM2osFrT4x+L1RGNKU5eZTsaLWFcvGYTtR7X+l0GIWqEObXT1Lop4/60kgpq17YeKQv
         rqug==
In-Reply-To: <20210420175631.46923-1-david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexander Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, Richard Henderson <rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org>, Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, linux-fsdevel <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux API <linux-api-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-alpha <linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

This seems very reasonable, and I'll merge it through my tree unless
someone beats me to it.
