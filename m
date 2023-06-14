From: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH] alpha/mm: Fix comparing pointer
Date: Wed, 14 Jun 2023 08:37:06 -0400
Message-ID: <ZIm0cu1FdlKo5ww0@x1n>
References: <20230614065602.29731-1-zhanglibing@cdjrlc.com>
 <258e87a54a1dd59b4f3d62ba9fa42242@208suo.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686746230;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iALzGBdIRz3HoCIqpIVxwdpEjosaJBnZn2PpBfVlcPs=;
        b=WALwuvzgvkH5iS2yngLzqTo73ridoDrxR4/MZcaASUJ/865rCGEpmnfK3V3gYQeyDXIl5k
        DQjWpHDbQ48iQgdyd25DxOBp9xJjXcPl5YL+ozXenfADHnYMv0USVJJhD7sC0qaLcATzwQ
        VyaZMmR+SGUCjFt/W0Qbl0BqK5dchko=
Content-Disposition: inline
In-Reply-To: <258e87a54a1dd59b4f3d62ba9fa42242@208suo.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wuyonggang001@208suo.com
Cc: viro@zeniv.linux.org.uk, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 14, 2023 at 02:59:20PM +0800, wuyonggang001@208suo.com wrote:
> Fix the following coccicheck warning:
> 
> arch/alpha/mm/fault.c:200:52-53: WARNING comparing pointer to 0
> 
> Signed-off-by: Yonggang Wu <wuyonggang001@208suo.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

