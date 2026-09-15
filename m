Received: from mailscanner07.zoner.fi (mailscanner07.zoner.fi [5.44.246.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4D04D09ED;
	Tue, 15 Sep 2026 19:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.44.246.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499577; cv=none; b=Dnzp6RHybJTRjaKjlShpTLyOknyhy6cyK/SQ7+lgumlhtBOVq0n+EgTqZ6KuuqqUp4i+TDmHKcUarx8Ku3uLWvRg4iVro+lCITk8kTZTZ4b3ez4jLD6UigTa5iDkBfsLTBzkRiuQwy0o13FW2gVSmQB5IAv/DgF4ghY+LglMNeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499577; c=relaxed/simple;
	bh=UWlvlYA1nQ/Rf0YH3R9YJFbzoMphjZo7hxdgkTD5dRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=esKSYpldeEHNWVr1hXKbk2EMKnyyl+suhyuOEUDm/BotYDwm5t0iu9gcO/aa2Q3K3sumOHU56B/Ng59heDTW8eoIE18UyBSn+6kHTN0WkbuW2bk9DRXElDNnlsVI21UK8CyIyyhAGlcn5Ti5XpHVyRdoALt6HUab8OKAm+tIYSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tukaani.org; spf=pass smtp.mailfrom=tukaani.org; dkim=pass (2048-bit key) header.d=tukaani.org header.i=@tukaani.org header.b=Tc02G63x; arc=none smtp.client-ip=5.44.246.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tukaani.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tukaani.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tukaani.org header.i=@tukaani.org header.b="Tc02G63x"
Received: from www25.zoner.fi (www25.zoner.fi [84.34.147.45])
	by mailscanner07.zoner.fi (Postfix) with ESMTPS id 129EF2124A;
	Tue, 15 Sep 2026 22:03:02 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tukaani.org
	; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description; bh=yEadPsKEdUhgtNJN2KJP2KHvipnmPz+ZncI2aR4M8PA=; b=Tc02G
	63x1K2afvKH0d/VhObYAJOnjulIxKm9MXmPta34CfeukLV4kY5K6+zfENTg/xQWN9vVWKBRkAL2gd
	GgQjrjAzJwf4WkJAUmCIT2aOnhG3aRN4x0JjqxhcBrkGd33cFB60OvrLM27AybtCayB98KXk+44hL
	VVON0Z4usZuKfgACNsYCpnMFT1qGVJhcAWYR6l8S3T2k9t3eux3C1Lijj3ZxkH+DQv1dIacdqVWOj
	tsl76wuwPNTiy/WfEUG+SED5HwxWGKGCqT848SALUpr2gw3qsCTClCJTGBFKhrpDVAmFdD5sP1H6D
	cgBm8yG953el9t4DstDlUvvfX7C3A==;
Received: from mail.zoner.fi ([84.34.147.244])
	by www25.zoner.fi with esmtp (Exim 4.99.5)
	(envelope-from <lasse.collin@tukaani.org>)
	id 1x6YQP-000000025G3-0H87;
	Tue, 15 Sep 2026 22:03:01 +0300
Date: Tue, 15 Sep 2026 22:03:01 +0300
From: Lasse Collin <lasse.collin@tukaani.org>
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm
 <linmag7@gmail.com>, Nick Terrell <terrelln@fb.com>, David Sterba
 <dsterba@suse.com>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org
Subject: Re: [PATCH 1/3] xz: add arch-specific tuning for alpha
Message-ID: <20260915220301.64f72f3f.lasse.collin@tukaani.org>
In-Reply-To: <20260912-alpha-kernel-compression-v1-1-ce9d55330193@gmail.com>
References: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com>
	<20260912-alpha-kernel-compression-v1-1-ce9d55330193@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2026-09-12 Matt Turner wrote:
> Alpha has fixed-length, 4-byte-aligned instructions and no XZ BCJ
> filter, so it wants the same LZMA2 settings as the other
> 4-byte-aligned targets. Without an entry it hits the default case,
> which warns
> 
>   scripts/xz_wrap.sh: Arch-specific tuning is missing for 'alpha'
> 
> and conservatively assumes 2-byte alignment. Alpha gains
> HAVE_KERNEL_XZ later in this series; the correct alignment also
> shrinks a UP1500 kernel's XZ image from 6469320 to 6448840 bytes.
> 
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  scripts/xz_wrap.sh | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/scripts/xz_wrap.sh b/scripts/xz_wrap.sh
> index f19369687030..5af0d9045cbc 100755
> --- a/scripts/xz_wrap.sh
> +++ b/scripts/xz_wrap.sh
> @@ -10,6 +10,7 @@
>  # XZ-compressed kernel isn't currently supported on every listed arch.
>  #   Arch        Align   Notes
> +#   alpha         4
>  #   arm          2/4    ARM and ARM-Thumb2
>  #   arm64         4
>  #   csky          2
> @@ -44,6 +45,10 @@ BCJ=
>  # Set the BCJ filter if one is available.
>  # It must match the #ifdef usage in lib/decompress_unxz.c.
>  case $SRCARCH in
> +	alpha)
> +		ALIGN=4
> +		;;
> +
>  	arm)
>  		if is_enabled CONFIG_THUMB2_KERNEL; then
>  			ALIGN=2
> 

Thanks for Cc'ing me. For this patch:

Reviewed-by: Lasse Collin <lasse.collin@tukaani.org>

I looked at the other patches too and didn't see any issues around the
decompressor usage, but I didn't really review them.

-- 
Lasse Collin
