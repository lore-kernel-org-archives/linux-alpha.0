Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DEB2BE7DC
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 01:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596595; cv=pass; b=rS0/F4ptGRcLstAec2DIBVYr/ECDu1ABP5nJdOlVlDa/ENAWZP0VKDOUKrz4Fhud56Uh3puxZhOYrrplSBp2gqaJntLDHsG1HSv1BqO/Ts+guxlRwt06RfgNBQPXJqVszl/BQnCmAWhDHOzYPuiNO4dq6FIu1sVQ2T5lvMmGW3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596595; c=relaxed/simple;
	bh=dLHjI842JfdyXNE0lCpGbDvN4U+EGuIm2s0SXDnWoww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d2MQI/lr6YIM8D+YcFXLV1bap3PwP3EIYF/JR5Mm3Rme52+iRraRhahCnvk1HF6wv3vSngIoGm4E2ROtFofi8yaHE6TpIQyvNFdfbmO3riIMZxSfeYADyCgwLU4iphR6dWYg6+5huT0jova8rjRSwmwu4x7RItV2qMlTMKdN53k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IyuU8v9u; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyuU8v9u"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a65ed9c7cfso2777301fa.3
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 18:43:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791596592; cv=none;
        d=google.com; s=arc-20260327;
        b=pTPGLtCdbFrrHKw5JDcyNXx37vd5FdbYUeLMXY2wy4HP/TbyJF3G+slrQcnEWWzDqv
         cHlwQL+xSHz4jESQR2kSard0g34qFnYPpjsATu9Q5KgSi+3f3kBAP60zDJZ9jPrTxzUL
         4McLBS1FUqh6eXhCqXTPRv4ialLQzP2Veq0kq0mrxEDCHGwVqisNVWsmPGZcZQxqk4CF
         G94re84S1CgvF/OTKxtw+qr6Pu5NM7xCF27+FXyAnNO+bYjEty42Ba8AATRkJTaC8bvC
         nqnMIYVU1toQbfeO9kbxFEgSX84TbGp3W/8l5OGNo1X7aosk0RAU6FDR6UYvfiUGz2dh
         D3sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EyysmEI4Etsf9glt231lGx5fXVOH6sNcjfT+1NIiX/w=;
        fh=bwB5/kM8KZsJJcXODlq7yQ51A8hXQN0PuFuOkkvcZg0=;
        b=fQwTGIVsw3PBgUSNBJ/ya/j8wo9iCbm2shNRTx0zbUBjRozV/LChaEiDIhn66BEKi4
         panxpU3lrAwHFl8ty/nUoff2qdTL6WjOcICtanBLPbfAolo+ZM9RBcNbgATnzFBW6WnW
         EfXgzBnEbip6p5fV9aJsgVmrNKyFbkHZI1s0iQF1JlL+0+X1PEVTN4EeoWYVEiTbC+2s
         6BsyMY+TtGpO3ODLZnEqCsQTrvLDxMapkbfjib3xHnUr5tqqQLb0SPYFSIyO4+KlYMwD
         lkLUdTxaZd1zb7GZ17zA2XLzCPJJkvKX2HvWK5mdarDDi1v1paL/5/Qoo1XWLBuHqJQe
         rvxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791596592; x=1792201392; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EyysmEI4Etsf9glt231lGx5fXVOH6sNcjfT+1NIiX/w=;
        b=IyuU8v9uBMAt2Og+hiGQJOJlwHkTIx24PQ6rjHShK4vSDMBvCFV5kK3I+cJgzFuVC1
         aB5KIo+AdYB2vLOydrqpW5qjIwNCDAhaT0NOHyVzRXI1Uc85gg69RRQ4rNmBR/ApK/WN
         jxQZUrd0kuvmlSJeX3gm1qBp8A2jlMLe7RzJFMmId4/u7jObrHUczcsWFn1XWH85LMaf
         pXQ1CkX1eBAwlUA5YAkACcLwv2dkmJujTOZuTi/TYnmQKu7vA11h4p6ZOsi5q+jfHcOf
         wHD+Ax7b/4O8TnqqujtTLIqUuhYfPLu0NSUEjhCtubjnhv0OHItaTOZ0x+wVTWgrajZB
         AOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596592; x=1792201392;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EyysmEI4Etsf9glt231lGx5fXVOH6sNcjfT+1NIiX/w=;
        b=ufExFRZFRQdCCf8kdlC2Teg9TibT8E3LCfRZb92PFS6EmyuUEE1roZ8S0UKMPPdJiR
         U3ZxekiXG4/lI+r7FkIjhqAGmB+umt1uptvKcrSUZ6sDtZ9QUMom4nolurEWuyfP4tR5
         K0JoCkKNq1Qecdzt1k88NhxHX6JEPWKPPKfUstHFFojh/3zHCBCjY4MMZeQoRvWxRPOU
         vIrjRtvd6JfE0zZMQQKTi5ZjFLNYbLxqxt7n5YnybvEI9Nde07NE1uAatfVkaOprv8IU
         toGgUIs47VcS8k5XcjOz9CH4H2JmSB/2acy8Yo5Hou49v7xl2ivMpc4Pg1FBTiK8Kfdi
         6Rbg==
X-Forwarded-Encrypted: i=1; AKwUvBzkKrhafDjAi8LPOpUNLAhjwzEN5AU+niJ+RoBw7Vvvhg1NiifQCDugpkf+psoOC+vsDIx7sMdcD6qYaw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIczjopaIwioeNcvQGX2/NLocA4x5QVGU7gX3pV1YlLjiSDdSMf
	2OyjShbb23Pupxihghd5MtR8WJkrgcZ1CAnOFd2uydtNFvtfbHdL4lqcHOnLDkfgmV2nIyen1Wf
	SkEn8oGe4eTykXP9vOo4UpDqBzC0ys9w=
X-Gm-Gg: AYBFou34t3y8ZoEoRnyDT0rwA1PQyQ9c1sf4BoHv60Fvyi5BeWLVY51MzWZEjiIQbYm
	bNVrzzEwSIFvDRxk2qmNilWprTLmdLx25oENgxZ8evVcfNMDJLfcet79nZa6HLBRqn8yI+62xtI
	vEyfKy5NxYZA0FHL009TuuqWk6Xu0OvFJtVIG07skDFJx3iKJasEia7KeqKPjGlG44LqCLzUi+k
	NgYGDfmiPoprnF9pccLJzb0oR2VTXjSCWpSjgJq7EbefiVBUEC5CkU/uAaKeuJ3kxRXg4/OgZEQ
	VLfDEhSJN1cmwSf4E2Z6Ccv/TIfrICwHz2H9WSDdkyWhZIedDR1P2uhJndvL2nr2WSMASg0ihdt
	dGcceXn5MrKpFli/mgPrmoyciglfO+o8K2D0YaVzdbZsNqsD/KvBQlj9Hq29oMF9fHk3xpKI=
X-Received: by 2002:a05:6512:2309:b0:5bb:7ae3:bbe3 with SMTP id
 2adb3069b0e04-5bcde8c142bmr1156652e87.37.1791596591709; Fri, 09 Oct 2026
 18:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009210449.971057-1-linmag7@gmail.com> <20261009210449.971057-3-linmag7@gmail.com>
In-Reply-To: <20261009210449.971057-3-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:42:59 -0400
X-Gm-Features: AclHuK-vtZnBj66F3yVBEX9kA7XqzAvRwZHKT-o048qUxLS3G15CGfwGYGZihvM
Message-ID: <CAEdQ38Hu3OvqD1KtcEKLb55aCzPu6+Dd+uA-YQNfxzfv9kfRsA@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] alpha: run check_mmu_context() from finish_arch_post_lock_switch()
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 09, 2026 at 11:03:47PM +0200, Magnus Lindholm wrote:
> +/* Alpha has no kernel preemption; these callers cannot migrate here. */

Nothing in the file says who "these callers" are. Something like:

/*
 * Also called from kthread_use_mm() with preemption enabled. Alpha has
 * no kernel preemption, so the task is still on the CPU that ran
 * switch_mm().
 */

> +     /* A deferred shootdown can also invalidate a newly allocated ASN. */
> +     cpu_data[cpu].need_new_asn = 1;

That closes the zero-slot case. I went through the window again with
this in place. An IPI that sees asn_lock zeroes the slot and the hook
reloads. One that arrives after asn_lock is cleared flushes the
context PAL_swpctx already loaded, and the hook finds the slot nonzero.

The hook's __load_new_mm_context() now runs with interrupts on, so an
IPI can nest inside it. Both are loading the same mm, so the worst
outcome is that it gets the same ASN twice. flush_tlb_mm() from process
context has always had that.

Reviewed-by: Matt Turner <mattst88@gmail.com>
