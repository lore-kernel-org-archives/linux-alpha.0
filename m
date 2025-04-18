Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB1D2868B
	for <linux-alpha@vger.kernel.org>; Fri, 18 Apr 2025 21:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745010698; cv=none; b=NKLssWmQ0uWvQpAMP1L8nJca0BMfBNefkpt1WcX1FGYy7zr8txwQ94PIWdMXv8v9GzblRetQgyrQzRJPZJQIm+G1Tm1nvYPNkXobECowgL2G1vOBcsa/8wjzGJiagfcaqCdNLpb3ylypZsKs+VSwU8lA1yI+aFOa2zeNj2yf6js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745010698; c=relaxed/simple;
	bh=H93/9GEFcjpvx1qy3qGsiFgA/EU8Rjuh7rXPxSjJMWQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=dfwZ2Hkj4Sgjb5cwRR15CCS3Pf2iJUHkNu6rbUu+sOVzsrVtJr7hXA0+8YpMNxm37toaM1AIAXvwQ2K/y7o2BoQd+cBflVHXgEfbCcVsxKTim9KrHvrj9Wdmmojjj+030sV3+5DBy+nTFadoEetTeoJ4BMQ5gQLbCekSpmTbXVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=e8TIgeUj; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="e8TIgeUj"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745010693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nEfMZCJYJjq1p4pMLitVHU5aT6JAbeH5Z6gnYZpSYvY=;
	b=e8TIgeUjloX/9YtfWIhZ2Hat9l+yQwz4p/UeVvSMr3FDLbr2u77redq+cxErM7p6AVAjVb
	FdS2iO8MOJ4jF1UmhYn260xhbKIuRM2Fe83NQ2cVNc2KzrirICeF6wsYgIZ4hJ4yq8gts7
	iOi+B+zHAsG8sSa8Uov17vDmSwE38yw=
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.2\))
Subject: Re: [PATCH] smp: Replace deprecated strcpy() with strscpy()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <202504181322.5D3B93E93@keescook>
Date: Fri, 18 Apr 2025 23:11:20 +0200
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>,
 linux-hardening@vger.kernel.org,
 linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <ABD8884A-36DF-457C-83D4-49F4F63C339F@linux.dev>
References: <20250417192054.69663-2-thorsten.blum@linux.dev>
 <202504181322.5D3B93E93@keescook>
To: Kees Cook <kees@kernel.org>
X-Migadu-Flow: FLOW_OUT

On 18. Apr 2025, at 22:23, Kees Cook wrote:
> On Thu, Apr 17, 2025 at 09:20:52PM +0200, Thorsten Blum wrote:
>> strcpy() is deprecated; use strscpy() instead.
> 
> Are there more strcpy() uses in arch/alpha? Maybe do all of them and
> give the Subject prefix as "alpha:". If not, the "smp:" prefix is likely
> to non-specific. Maybe "alpha: smp:".

There are a handful left, but they're not as straightforward as this
one - so I'd prefer to keep them separate.

Could the committer change the subject to "alpha: smp:" or should I
submit a v2 just for the title?

Thanks,
Thorsten

