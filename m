Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792626808;
	b=wH9/F5P7sPh46mOZK4ko4QGH1KkVvgyxXa4DhfiYG8+tTPoJdQxzRm+n8ynUS/Pz3FZu
	 qq+GGkQuZ7eFE+9j2ik+ZaObnOlEqAGj/4YRpuhNhxFj7K+zTmzXYTl+RzncJcyuVY/9d
	 zRiSHu3hvzjRpN5dFLdkQcLxCbD2bm0MGaEvWTvb1oDjFmKONRO+ArVAzuVyK6oC4CWJU
	 OaDjtcEcQdb202j9MiSQRXjarMtGFmNWeEGuyGdV16Ggn6mDrVuZnw1oDohLV6Kl/wF9p
	 DXSD7N6079NIR6QUgy3nTaTlmDi/yX1JAQ4MoVNuiofHemoh8nkqWntp7Kfpy6YM5qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792626808;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=PAarVvwA8jLvX2xPmIO09k+kh8VOhImM1MI/Asr0iGM=;
	b=ak4XKBbKZ/TU213rQLxdJh5U3/LpyRvCenijZoIBgpFh5B7I/E68lAIhrmOClScK8/cY
	 rBD/I7f7nqf5qzXF5R6L2OuIjf0Da5SnM7dFaPdYZY7fD/M0FT3Ig41Q2FpB4XIFV1TM5
	 vBwhj78IeGHt8OLjb/ATwajs515TRj9P5vidtNCEk9G+neDpnGmp3nc/fBYkX0KOYJTun
	 9D+YCuULYEfOqXnCw9KyrkzKhBhInGV5BLqDFDrDmvyMkjiZmMpz2GfLZsRMdR8p7Ph8q
	 2OQvC9eDYFAkkVXvj+2MXKQuNF0clS4xnufjKBnHte5/zKCydUXjKdcUsircdmjtUKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K9QKZP5R;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B48606A319;
	Wed, 21 Oct 2026 23:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4B48606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K9QKZP5R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792626808; x=1824162808;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PAarVvwA8jLvX2xPmIO09k+kh8VOhImM1MI/Asr0iGM=;
  b=K9QKZP5RbJVuPMTHQX03yh8xMvDbHRWsPMP/2oy557jYEglidF5h1/ju
   RWeEVbxUrbkh92WlBG9DbNcVzqJm3bRIfcV+JMVC1Ao3Coz7KtIRIJ+rx
   JxIQeKSJEYKRN9e467ty4wWrzNnV/XEhUOR8r1ZG0mZlzXJZjUuV1t4Kr
   3e7mr9HP4j7e6kFWPhlwVeZA8WJfoIg1iG7VLhchYpMuKk/D84JsVv2tr
   4UgwAmRNBHsfiz9m+MDfZjyBxP47gYopDGDYQzG4ypDbTl6/105S+d2Ln
   TgYL4UdfMprd9fLW2vC+7T8bAfoeRzKLZYoAYmw7islLQogsFDQqxYGc+
   g==;
X-CSE-ConnectionGUID: jQlPEcRPSA6WZq1zrOel1w==
X-CSE-MsgGUID: ZEsgPuoARZyZocVknxLZjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1382564"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1382564"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 16:53:27 -0700
X-CSE-ConnectionGUID: jz+1dEQvT3u9nhuADwNG0A==
X-CSE-MsgGUID: PGXw+BBWQu63n/cB5LZ1zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3256700"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.241.239]) ([10.124.241.239])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 16:53:24 -0700
Message-ID: <215dc157-8cbc-4c84-857f-d372c1ce922b@linux.intel.com>
Date: Thu, 22 Oct 2026 07:53:22 +0800
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] alpha: add simd_enabled argument to perf_reg_validate()
To: Peter Zijlstra <peterz@infradead.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Magnus Lindholm <linmag7@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261021-alpha-perf_reg_validate-v1-1-a8e8cc23ea7a@linutronix.de>
 <CA+=Fv5QWoVZqOR1uHTaE20XWBkXoVqbjTE6bF2iDvvJn6j5hfA@mail.gmail.com>
 <20261021134714-fbc85127-2188-4c7b-b472-ed719c520541@linutronix.de>
 <20261021153856.GR2823843@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20261021153856.GR2823843@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 10/21/2026 11:38 PM, Peter Zijlstra wrote:
> On Wed, Oct 21, 2026 at 01:49:35PM +0200, Thomas Weißschuh wrote:
>> Hi Magnus!
>>
>> On Wed, Oct 21, 2026 at 12:23:55PM +0200, Magnus Lindholm wrote:
>>> On Wed, Oct 21, 2026 at 10:18 AM Thomas Weißschuh
>>> <thomas.weissschuh@linutronix.de> wrote:
>> (...)
>>
>>> Thanks for catching this. I reproduced the build failure on current
>>> mainline and confirmed your fix with GENERIC SMP and DP264 UP builds.
>>> Both also passed perf register validation and sampling tests in QEMU.
>>>
>>> Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
>>> Tested-by: Magnus Lindholm <linmag7@gmail.com>
>> Thanks.
>>
>>> If you have a route for this patch upstream, please go ahead and take it,
>>> unless Linus would prefer to pick it up directly.
>> I have no route upstream. I hope for Linus to pick it up.
>> But if that does not happen, maybe you could send a PR.
> I can stick it in tip/perf/urgent if that helps :-) I'm the one merging
> the broken patch in the first place I suppose :/
>
>> How this issue made it past -next would also be interesting to know.
> Yeah this; normally I get robots screaming at me for things like this.

It looks the issue is caused by the merging order. When the patch series
"Support SIMD/eGPRs/SSP registers sampling for perf" gets queued, the alpha
patches which adds alpha specific perf_reg_validate() variant is still not
merged, so the robot didn't find this issue. Thanks.


