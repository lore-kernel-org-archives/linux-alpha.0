Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C1E1A0BD4
	for <linux-alpha@vger.kernel.org>; Tue,  3 Sep 2024 09:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725356355; cv=none; b=FD9MBT+dzR78HJsN6sbatIPbm3frm8lqO+W0yM4kcsjo6Xvs8R+gtUeY6AzaMX6gsftNQpGXQUH1FaYDnDDWW6ZxWOXLsmhv4G95TOqt6jlNKzxH8sWWgw0lwir73qaOZs7TYJ2Lbfkn8Xk8ma7zRU/mg3XlG+2q+NNzXpa+GCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725356355; c=relaxed/simple;
	bh=Roj+Ea7LEvenEhyYiuiVmXINZE+I65g3EEz0Bl+4ooc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sh8J9D0wV21dKqaqPpcjd5M+dNmdibcPZXUsPb599IizUd0kvnGrxK+9QzokEA3X2sD5YXqJZ0c4wnomITYxarBPUC+IzRy4cZT0Xv5p922FW9QEL1CDhTcEbm8txee3FZmRkfXpkBVUdisZ5nO+FEtcKYG5pGE/cknGi0DJU7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dzg0MTH8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dzg0MTH8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725356352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ROekkmcoe+OX/H/SJ0CegmonvJxcYbn0m80zXzGYZLw=;
	b=Dzg0MTH81X5MuDrt2OLTZjTsfh9S3IMwT3enhoGoSO6WkamznRckYPFV/zOLIYifHtDPca
	1BhbhhsTEHZPay5jkVb1UzEAC5MMmXvBQ+sjnV4TH/VcTe8ZWyQmeNvCC9sazU0q3Vk4Zx
	a1E8p1kuNnRNg9omv2MGxYn1oIYzP+I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-xhn07VVBNHC8W0q6jlhBWA-1; Tue, 03 Sep 2024 05:39:11 -0400
X-MC-Unique: xhn07VVBNHC8W0q6jlhBWA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42c80412dc1so21029025e9.2
        for <linux-alpha@vger.kernel.org>; Tue, 03 Sep 2024 02:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725356350; x=1725961150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROekkmcoe+OX/H/SJ0CegmonvJxcYbn0m80zXzGYZLw=;
        b=GLd7bMIsqme4kp6K/eOT7XqC4JmKY/53ENbelSlwXV8aAkHcjwW6oQswYbTdm2M0or
         kQ+zDqfFNgdEBUvdOH8yh24BwHlz/hGSJ1kBiBXA96IePtEZT5kb0Kuglp9H29CrzG1F
         a/JrAFUeV0pASlvWWFJkrfL2F034E2Ts/fTuI01m1T0UuQqTjXTYCCCa3BJZ2djCmjJZ
         p7+o/Jml9CPaAu4YmFOY2sioufXHdxpjvQvqecpBMHNIDguoP4Xs6fGoB5DYbxwTtPSq
         UHyq/WzfUYyJC42EZ+PBSG2v2qbBGL9TVaSZmpAy5LL/NhFQxClxQ7y24idJb3izPKB6
         IGtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHCZ1GX+EUirUf0O5Md7rfp8aC5Tp3rEMTNCCxjs18pNCoztsxHrcmh9qtOYKVIl4fWQcZEz74E6cKfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIIWVc1wFl1Fsg3tWUfVIcSuZLGd9y2ULWXwyOHBADt+JLAm0D
	RDBDfMTFpW8YUJIhCU8zHtPwb3NI8KwXZ7u1hPNQv2XMynGgK58V8wp6Hrjf11pEKvTAHW1w7u/
	MuGIJe1z1iilvUTs+dnRMAhcBwf98GjbB7oFdIddJy6fbZPQZzvySx73oR5Zf
X-Received: by 2002:a05:600c:3d0d:b0:426:4f47:6037 with SMTP id 5b1f17b1804b1-42bdc6375abmr66533015e9.19.1725356350122;
        Tue, 03 Sep 2024 02:39:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmeosf/mJIf4OuBVOC1FXDQtaN47WobnVUFS/lrBzspPK+LAJFhvAiwYTR4QIKkjIzV+Hhfw==
X-Received: by 2002:a05:600c:3d0d:b0:426:4f47:6037 with SMTP id 5b1f17b1804b1-42bdc6375abmr66532735e9.19.1725356349385;
        Tue, 03 Sep 2024 02:39:09 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:95c6:9977:c577:f3d1:99e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bba57bb20sm142356975e9.4.2024.09.03.02.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 02:39:08 -0700 (PDT)
Date: Tue, 3 Sep 2024 05:39:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>, Jason Wang <jasowang@redhat.com>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-media@vger.kernel.org, virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] vdpa_sim: don't select DMA_OPS
Message-ID: <20240903053857-mutt-send-email-mst@kernel.org>
References: <20240828061104.1925127-1-hch@lst.de>
 <20240828061104.1925127-2-hch@lst.de>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828061104.1925127-2-hch@lst.de>

On Wed, Aug 28, 2024 at 09:10:28AM +0300, Christoph Hellwig wrote:
> vdpa_sim has been fixed to not override the dma_map_ops in commit
> 6c3d329e6486 ("vdpa_sim: get rid of DMA ops"), so don't select the
> symbol and don't depend on HAS_DMA.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  drivers/vdpa/Kconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/vdpa/Kconfig b/drivers/vdpa/Kconfig
> index 5265d09fc1c409..b08de3b7706109 100644
> --- a/drivers/vdpa/Kconfig
> +++ b/drivers/vdpa/Kconfig
> @@ -11,8 +11,7 @@ if VDPA
>  
>  config VDPA_SIM
>  	tristate "vDPA device simulator core"
> -	depends on RUNTIME_TESTING_MENU && HAS_DMA
> -	select DMA_OPS
> +	depends on RUNTIME_TESTING_MENU
>  	select VHOST_RING
>  	select IOMMU_IOVA
>  	help
> -- 
> 2.43.0

