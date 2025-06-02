Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6041805A
	for <linux-alpha@vger.kernel.org>; Mon,  2 Jun 2025 07:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748849596; cv=none; b=ZjTicb1yDqc/fI5b5xqFUZxFYsvf/rW/dLEbRErNBIzV4tlmUgLyIJGq/DL60HAfsuwqXn66HbPHCv8L9paGlisLKhVBWRqpbxZWVOfdvZvw8666SASHfA6Ym9vi283xRAfEcLoMO/LXF2zT6IL7oKskZ/D6rhcWlqaeTKDrI3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748849596; c=relaxed/simple;
	bh=M1aVid0SrPBuXVff6il9dTWS4ajhHuekCcpOu/R3d1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VbsZtXOAjr22zvB/LQ3sPH+BKrnLXP6ALNcIBByAY0OFZKa4KXAneKUXMu9+kMXSWwYiMnzpxKqUKFO3/ZkyEzZge+VFxYkWAqSRceShsl169FDpY5iivik6bvvuzOF2JAGpr7w8A7yHnh3MDnVhBlmT20/BOVjyHRhCguTArwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HN+8L2GN; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HN+8L2GN"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a361b8a664so3952474f8f.3
        for <linux-alpha@vger.kernel.org>; Mon, 02 Jun 2025 00:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748849593; x=1749454393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AHRu38uSbdlKm5QIiBsNEv/ALIq0jn+S2Qbr8/2ycTg=;
        b=HN+8L2GN1vPrVzV4mYCyzJrxzL79Jj2Mz3OEziMCB82p+i72H7ywFsxcmXexOgfxyy
         lSNqtv2sHBamDs1904usiRZu0tm77HUH8I49PWwZZZL86lovj3EIm7FeJHjIhZa0f9DR
         vE3e6/irL6FVyVCXFSaNQGgL+5mRHDuT5Pq1H6/OhWBKczaalGmGabUMxh8LGvaJnyD8
         3EatzUhmSQSt/886IOuAmCX5ooRmJIDAvBAX7XXqwlUVQOGEiHwUVozml8F1Cu+7KYOs
         MfsnMpRSgfhmmOsdAYGuSGOOw5MvaajFFdjMDzNuZxxvbdWv8HZ5H/QMj9IpgdegRvNL
         xWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748849593; x=1749454393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHRu38uSbdlKm5QIiBsNEv/ALIq0jn+S2Qbr8/2ycTg=;
        b=gHSiCPzOP+tZkrrBRH6Jiy2acviO5dAo1kH+y18GHP3AtynFoYhjjJH4SSPK8JPzwS
         EuXz+dfdDZoBtMWnQxofRw/yrO7Qj1i7ftG1n4xcJMJl1akrwwG1dqisV7dVJ4dUzWBf
         W8wGU/JMJfBOobefLDFssncxtjRPUHENdbQfVXulA+pQWCm10cwKqIflYer4+IG1sgi+
         zG2yDX5PYQjLUngBRiqJFM+VwjdChR0YXct9nDCS1v02ND3AQ5/R4AEIl0CGjAQfmAKg
         NVJ4t5WJahBHihT0+2PSlVAT6FApTsflIx+A28+jopRm6szE1T1KngStnJmzi8znr+HP
         6VOw==
X-Gm-Message-State: AOJu0YzuCbl5u0BAXJo65qbyxUCD2OmnBLjcA3NyrK4bImMDCXyQuFCF
	FNDKAkp/xeJg1tGNvPPxgaObY6/Hh0l9k2atciGrNnFHAG5TOeux39+MNXr3p3eYTx8=
X-Gm-Gg: ASbGnctO/Pu+iCrTpOlc8evhLuLXPNz0FwEahclU1GQpdaCECzcb4kyGwLf9MHQMAUZ
	5m5xWkqBmdpG4a4lCyFdozIkynqrDaNPRYUWcFnqC8Gd3jwhCNMo/hIe9PoNdth4VwKEWJmh1h0
	fKzCjttFI/GIVUj8jfKWV7dLyQ5/x8Uapl4Q8Sx3f+ID6MeoaDcg+j5mL1AAZ6nZRTJDmvozp4k
	ztt61puH85vczV172z1oq3bR16WpPaH5SNm4VkzC3ewrF8XvXWh/7pNNGPzWPuo2cBpSS7Bojv2
	EIaKRglkSDPkzAKf/xh0PNnqa9YuluVvOg+TFD13ViB4sK/GFti32vLARPldFlcGQA==
X-Google-Smtp-Source: AGHT+IHNHnOlxr/xE8CbhPdhb5rXIg4Kh6a64GZnWG/+O1I/kGxbhauPaRmTbC3820arXMYpcQhTCA==
X-Received: by 2002:a05:6000:3112:b0:3a0:7f9c:189a with SMTP id ffacd0b85a97d-3a4f799acd4mr9339831f8f.0.1748849593244;
        Mon, 02 Jun 2025 00:33:13 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450d7f8edebsm110106995e9.6.2025.06.02.00.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 00:33:12 -0700 (PDT)
Date: Mon, 2 Jun 2025 10:33:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-alpha@vger.kernel.org
Subject: Re: [bug report] Linux-2.6.12-rc2
Message-ID: <aD1TtLMZT3enaFQj@stanley.mountain>
References: <aDbE6P6e4gd7pbMC@stanley.mountain>
 <db221c64-0653-41c5-acfa-f7cb9e831150@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db221c64-0653-41c5-acfa-f7cb9e831150@app.fastmail.com>

On Fri, May 30, 2025 at 07:46:20AM +0200, Arnd Bergmann wrote:
> On Wed, May 28, 2025, at 10:10, Dan Carpenter wrote:
> >
> > arch/alpha/kernel/err_marvel.c:884 marvel_find_io7_with_error() warn: 
> > statement has no effect 'csrs->POx_ERR_SUM.csr'
> > arch/alpha/kernel/err_marvel.c:892 marvel_find_io7_with_error() warn: 
> > statement has no effect 'io7->csrs->PO7_ERROR_SUM.csr'
> >
> 
> > I occasionally try to run Smatch against code that I can't actually
> > compile and it found this code from before the git era.  These days
> > we build with -Wall and so this kind of code doesn't normally compile
> > on x86 or Arm.  We would get a warning like:
> >
> > test.c:18:9: warning: statement with no effect [-Wunused-value]
> >    18 |         x;
> >       |         ^
> >
> > So it makes me wonder if this code can actually build?
> >
> 
> FWIW, I tried building the file with gcc-15 and don't see a
> warning for that construct, even with the -Wextra.
> 
> After digging around some more, I found that this is the
> definition of the structure, and that the 'volatile' in there
> causes gcc and clang to not consider the statement to be
> free of side-effects. I assume it will actually cause a
> load from an MMIO register here:
> 
> typedef struct {
>  volatile unsigned long csr __attribute__((aligned(64)));
> } io7_csr;

Huh.  Thanks, Arnd.  I hadn't even considered that.

regards,
dan carpenter

