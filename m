Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBF0318EF4;
	Sun, 16 Aug 2026 17:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786902101; cv=none; b=ILqhLp9ooqQTrq1hHPFZbEBuOwzN3uW715HuFTnOL7fpFEySD0ZlEHH2GhN5xTPuZkp1Ypc7ZredtJgTTsOxDthTlTyq4rK8pVrj7V++vpkubsesrhppqt705ApYaZt6RnV+8fgptA6ksVJCW/kpO1V5ROt7ueBOzXSNj6z4ACU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786902101; c=relaxed/simple;
	bh=ImVkDC+Cz7m9YLv8RA70eoorQ2LMC1IYDMuyYo3Oh2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQ1HheMpMSunzOEtIHVHa8atFanWKJgRcjmKcMdONPj15+rnU4qGMum562LLqUoaSs4opfnDbjdIQkFkGnUYavyNX/Dkaq74Rntxjabt7Ghw6MDrnP/wNOsVPmDjADxnJRFsT9/rFaMuPwhImIeGIItoGx3hjBTEDnEGuifPOR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=vAtabzjm; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="vAtabzjm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pv8HnO0neC3QXg07WGvX4zl0tgMmJi6+7pa3VI0iQZ0=; b=vAtabzjmGDLUZEiXB4qGC8alH5
	I5jSwhzhCxoADzpQvXL+IoS9jHDHyIXhUAKWJM/NSC8df5VJf3K510gBjXNy4frmB8pMt8pmAYy5Y
	6tW9hP/UBK6b9fTJEqOMM4s2LBC9LOvqnwaM1qb3mbKOEwUcqyClcOzgiwq47UL1EcqK6BP1QR4L9
	7BMD+e5MQVHIHeFkgRxrFrhv8V4JdsmdgMV5HxF1B1M0lRMRrJ7cqz1hC2iivbrdBfvcnLoDbEtad
	s+M/Tdjlp2P1tfEusprOl6bzmOYxGJF9eQKDwOQAKtJUlUxFRpJLUBQyzoGz9q+2V+WP4FwYB4c3r
	5m9XnuGg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99.4 #2 (Red Hat Linux))
	id 1wverS-00000005BMR-1U34;
	Sun, 16 Aug 2026 17:41:30 +0000
Date: Sun, 16 Aug 2026 18:41:29 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Julian Braha <julianbraha@gmail.com>
Cc: richard.henderson@linaro.org, linmag7@gmail.com, qi.zheng@linux.dev,
	akpm@linux-foundation.org, geert@linux-m68k.org,
	catalin.marinas@arm.com, rppt@kernel.org, joao@joaoff.com,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] alpha: cleanup dead ALPHA_LARGE_VMALLOC
Message-ID: <20260816174129.GU2636677@ZenIV>
References: <20260816143835.1068971-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816143835.1068971-1-julianbraha@gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Sun, Aug 16, 2026 at 03:38:35PM +0100, Julian Braha wrote:
> Currently, the ALPHA_LARGE_VMALLOC config option can never be enabled,

> meaning that all references to it are dead code.
> 
> Let's remove this dead option and its associated code.
> 
> This dead code was found by kconfirm, a static analysis tool for Kconfig.

See https://lore.kernel.org/all/20251130030146.GN3538@ZenIV/
