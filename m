Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388602ED165
	for <linux-alpha@vger.kernel.org>; Fri, 14 Nov 2025 19:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763147651; cv=none; b=ZRFMrUEa3HtyaXkXiUJsuVlZuf7Eb4Zkjmh87PPaBmS4FSVKzZ4Wcqju7sF+tAv0QgF+AhmfFw4z64a4a66BKl6ptvtL0ry6XsoIiKQDnBv2223N8hToj42rHBItwfZB5r/5mYWR5jdSRxwIMlLKHQoOtB1YXHqSnKjf/jdPzgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763147651; c=relaxed/simple;
	bh=aI9onR+f63JFzaNIBKoGx3OAwegzLui4sLBarF2xej0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XmstczBKN23NpvyteXAcqN6okq1ioxIRVOCE7dm/SzNpRhEAgDqfUqoblhPYSvx84wwdwObSDz3XE5iAEpyn4Ai5MeyOTXU5YCghTUO59lmKndP6gxQ/4JUfpX8bKaVTbDmREt94/lA5Sz8TMFV6vlEgoKqXwgeQqvgFxo3kSmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDv/yGil; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDv/yGil"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6408f9cb1dcso3510045a12.3
        for <linux-alpha@vger.kernel.org>; Fri, 14 Nov 2025 11:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763147647; x=1763752447; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aI9onR+f63JFzaNIBKoGx3OAwegzLui4sLBarF2xej0=;
        b=mDv/yGilxm1t28vSlrre/2ltqEgfZcjvcB4hu8QNA/8xV80FIFn/c0aNSUre4ryXEq
         CvvXFpucKzKj215etP67wAyZfJIiaYsh35yDVgi1XAeciX6KncBmSiBNzODol0dTCixP
         +vzj6Nc7sfceoJqLdFjj+Tevf5kVtCW0G9cphFgQ8D5XIW+PW2HAEOXf7ZamiFGxWQlf
         jop4KKWm3xTg5IQWmFjy7wZqiLcEXpmSjJi1szpCLzVkmN0bm/TyXmpDQb+bkCMYbggB
         R6ZfxFXONOZC7zLWDJzwAmGpi7URO5Lv/Ld7FF9ZmMyFQQfLBzPpQhORyMrW/dsAqojt
         pBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763147647; x=1763752447;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aI9onR+f63JFzaNIBKoGx3OAwegzLui4sLBarF2xej0=;
        b=t1KKpDKd7gbi6oSBex+Ql58RlTuHzqyRzAmOGlvV84BUHrOO1OZnESfwlR5RUIqzh3
         CweuNz08mrl2IGwkX30G+juSwAxaxowrsIt+uOBBwxtfqOhVDtp/5ulZtRYPTJCRAznm
         l712sJV3ME0TjzXiOifR+wTwDAlecQy/E/Cx2oc4+aBH6N7y8/qDM8DUht/V3x9ef7+w
         fe9uk3YjUtdUnQ6EbtRo2FpyyUEYrkM4Xi1CkllY6wUcz8NFK5ECPiHvlebmn0K7gmpK
         +YEJP3rzQksK60fAw1wpmExRLU9gnUFNdpq85Tf8cw9NzqjFNmJL6WjgDsd6Lembsi9/
         ElJw==
X-Forwarded-Encrypted: i=1; AJvYcCUtH1KQuiwyLQKW3sWcJzi9PvK8uRE/Sm1+LJHc8a1oImtkOwmvpuNlJ6Y8t80hIwT/rZLe+RB7JpJ9ew==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdx2pe6N2x7aF/8URSE8WKJ3tHfZABxBx3r0wKE47i3jD/UNop
	j8p2P4yCBaq5b+UboIts6nIMSBBKgaacFzbsYvFYMUiYLTs2H5yviaPnyVQebXMR82IMwV/qmVm
	/tZutkSLQk587M7zuzDcOyCPEh+Llers=
X-Gm-Gg: ASbGnctmxqxH/V8A20rv5q4CDBfCBC/1WB8f4/iHKTHhYbOJs41/FCCQ3ReUIoBukn2
	yIXCNqjsZWsmDKdxpSdDT09Dfe6YIEBZH9b2EzLz42HYFJvXqc+o0rdE3+MucgEOqOLGd4gdZSj
	IsDTwXW9A/TjqLWLwmblDuUTeeKXbtfRexocX+i93fTXrTv3xCIq7A1TCW4I/U3KaB/zw8UUBoN
	Tn7LUh6dkSV32VqZPyXji8vKb/lLkm2fVXSIde9p/Uxyl+EKZAuwrntK+82yQ==
X-Google-Smtp-Source: AGHT+IEvBu7ESLrGNRMv2QiwL16IZgt6aUNJ72TYzx+vz9COzg0vAhK2L9oI/n3nL6QJ1JU+lRhqexZnJfrgTYt3DEI=
X-Received: by 2002:a05:6402:4603:b0:640:f974:7629 with SMTP id
 4fb4d7f45d1cf-64350e225e0mr3893696a12.15.1763147647239; Fri, 14 Nov 2025
 11:14:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763117269.git.zhengqi.arch@bytedance.com> <66cd5b21aecc3281318b66a3a4aae078c4b9d37b.1763117269.git.zhengqi.arch@bytedance.com>
In-Reply-To: <66cd5b21aecc3281318b66a3a4aae078c4b9d37b.1763117269.git.zhengqi.arch@bytedance.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 14 Nov 2025 20:13:55 +0100
X-Gm-Features: AWmQ_blqeEJIFeEqLe5Vq5SGpFC4UPadwiIAm270RAB9lR4JL9-RyEZ3PVaRM7w
Message-ID: <CA+=Fv5SGu_Y-zwryrQiTQDy32SipMk_dfjZezth1=aZmnDKNeA@mail.gmail.com>
Subject: Re: [PATCH 1/7] alpha: mm: enable MMU_GATHER_RCU_TABLE_FREE
To: Qi Zheng <qi.zheng@linux.dev>
Cc: will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com, 
	peterz@infradead.org, dev.jain@arm.com, akpm@linux-foundation.org, 
	david@redhat.com, ioworker0@gmail.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-um@lists.infradead.org, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

I applied your patches to a fresh pull of torvalds/linux.git repo but was unable
to build the kernel (on Alpha) with this patch applied.

I made the following changes in order to get it to build on Alpha:

diff --git a/mm/pt_reclaim.c b/mm/pt_reclaim.c
index 7e9455a18aae..6761b0c282bf 100644
--- a/mm/pt_reclaim.c
+++ b/mm/pt_reclaim.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/hugetlb.h>
-#include <asm-generic/tlb.h>
 #include <asm/pgalloc.h>
+#include <asm/tlb.h>

 #include "internal.h"


/Magnus
