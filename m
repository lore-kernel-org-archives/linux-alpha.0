Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52DE2D59E8
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 01:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596660; cv=pass; b=eLN3jCYDg4zCtocJQDpDPz/Jpn7iLQVnn/2EQ8khsMFs2EwPJJAKbbxRbWjqy+a52eeijNADxJgi+omAYHrdCeeiFFH00ocbxjnCkK1Nb4IuqevdSOciiLmJIG1uXXDMQZ1PoP7o244ffGgBWxOT8YYnsoWiTsao2ZyPOREVz1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596660; c=relaxed/simple;
	bh=PjXhq1bwf1IsoZVyd2lMtLh7MWQTYMfimRSXqhCMkbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oiupSMG8qBsw+0NZLlHBNGUuUzHGE3zXQGHxOdZPJxOynQFB7nIbz1YfYNCFo9tkOQjOxcvQdxCteV0HrOVKI5nIIEmbYqUUC21mnnN+6RUjLR5PHlKqoCICfNgxVU9rd/eE2CAbTpbUrrJQCJLAPKqIEYmri9pxWnXv9wsldWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZJj8Sip; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZJj8Sip"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bad794b197so228947e87.1
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 18:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791596657; cv=none;
        d=google.com; s=arc-20260327;
        b=Bf8n3Xxjq3DdarT1Ym7wEsR+fJ7Ycx8dBz9vjSVyybE00VJLLfrdMqavwPDl2qxjeD
         7SO4iEUpHNx06c3wZKImEXHsx11a6B2TkOe6cUG8Fw6WSfmz/MXC9jGzle+wKLLhVGPZ
         YOLYMu9SzY3h1uJI+JhbFOLiC6mHZ4JOsXudZUYJxky7DhZJO66zjvOMFRrXgjpzoiJ4
         C1zT6aJJR8zz7ZGVgI/ajXG8BvUDJ+1u5q3jxiERa3C7rc7TBNCrUFQBVcDDQwL58egf
         CzBGaLmPmIhbh4UOkkJiULAP+TjR1o5416FI9hL2oe4X2Bu32A5nwsXVs5pvpTKPdFik
         1WzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PjXhq1bwf1IsoZVyd2lMtLh7MWQTYMfimRSXqhCMkbg=;
        fh=fkkhdhBdMnxI+WLEg+K+HxSeNES/VULxUrep8x+UJb4=;
        b=GJH2CyytQzHfCS9WYTOBN2fsWC98vX1ezrOGvQgrcjGBTm7mfbOR+aivfydrSuGPub
         +ne78ZQfy7JM8Fx5ppK11Y2P1QjJqTKuxQsfd1PGAiOLcastJrtFgMNDRWnyyBC14oIN
         cbFVa1NeGjKaawf8U98Tjsq7RDxreaYWoai3SmbVq/8sYP6QT2hwJmRdp1oHFnFiJPWB
         3nZnQy9eNcp1fqNC6x/b92LIteroSG4LNaobAtEIg/epq8dHxqL/C/lwDchs3Pm8FhkG
         EEbM6cSExNwT88wpVMnmMC/9BXRtuc+srU19oWUmjDjusAQ3YosyNwKCP52qooH1NFki
         ijEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791596657; x=1792201457; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PjXhq1bwf1IsoZVyd2lMtLh7MWQTYMfimRSXqhCMkbg=;
        b=jZJj8SipIH32RFYVrE8+5zxNiO4nUL3TzN8to81Zk+518X19iX9NYpTuBX02C10SEu
         B7BmwYqhO9Bb/pp4/wr5636mIHQ7pGyGCFHEG0wVN3sQlBYHPc2ExjrUj5Uh5vW123Sa
         wsbU6VFG/LYX7VF7K0gf95/OUJvOZ0X85/3dk1/sOG79pxZ2kUjU9ail1xMUxC1Sfdzb
         9bK2GgyAQ/e61yb3tflwno7tKrJGzWF28g9wUsIBM48PO7P+Hq1JS8PebVen0frk4FS/
         X9dHET50o2wk1B6qG8V3QtJn9Yy5hC9YAIV3RrSf/pKRMmHoplGI0wOGEmd7brxNr6vw
         vMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596657; x=1792201457;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PjXhq1bwf1IsoZVyd2lMtLh7MWQTYMfimRSXqhCMkbg=;
        b=hjB1HPFCoqMwJI4M9jX7g90D2v1ZdekeLzr9Ok1Yx0FKaxOPugZgwQCP8wDAbK0r1M
         68FbPnZT/dIIUdejvszgCaNEWUabF95xiRPgoz1z+tzGtwUV3dg9x9YcfOoOSUpgepaR
         Kj07s/2yKNte5inc2e+XuOqu4bZudyAx954CYS+CpHC9jY63Z3TJB2voZmDD3fsJiiaW
         ufK/YdaI22zSfMe5S2EuHzuj8mU53wx+0bRrgP8E60REFz+OiaCTFmKZlv5GtAxbCQNt
         OofQs+dwD+g3BvPVRuwzEk+V5XBdljfUAlZI/wmLv9xag/N/tQkWUantHHRqdsfLBa/Q
         dHyg==
X-Forwarded-Encrypted: i=1; AKwUvBwhYCcYrjAV4CBHb1/YFAEiHFe8zBdxELDOv2H9dWae2xOYD5r/k5e11rsrvRe+awHl7hoBVjBxGtqmqw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIbonPSGAZSs+F3CZ10DXCkZvHng6AaAT2pY//WKtQBNOjkdmP4
	eIxAo3EUIYnji6Fy9weOl/PYefluFzRUR6UhfCg9vsSHTB9nIIj0Q9QDtm+4iGOiGayZbzuZn8r
	I2Btu1zYX9t2v+BHVRwSQFMmxj/atk9c=
X-Gm-Gg: AYBFou1huK7hoMGCcBF+KENYnN4tIF936ohzQbZwQYEcF1h3FKkRtaOB6IepgZBZRHZ
	+bh1HdZjRatWW2eO29FcY0FY5det81oGlkm72zIa1MKxWQJJbaod38ByrpJzUb9Gv+1TIzNYGW5
	BbJcgiS1bdw0fYf5nkFla+NkMzkc3rrnIaqXyb5nLBbtGExP0LDYkeAFnj3gpcAYN5XHamZ3CRc
	ZEWb2Hx8JWAxGQ6MqF5At7ybq1AGP6p+gGguyzd03lcmVRCtZbGW1/r1nFbtw5oOdzRe9pfPyJa
	sJP75nmo4qNwZIM/eoiTV1oMEg9rH1Uhn5o/kXf+rPnqLhk9PYW3YVqE6+NHbmKsvaOEE+tvi6T
	KjFYakAFfJX/fMdraiZCPCqX+CXXSNgWMLyVcMor5RrYvrVwTwH/r2YGLxGduGaoSqZz6otw=
X-Received: by 2002:a05:6512:4012:b0:5b8:d8ec:bee5 with SMTP id
 2adb3069b0e04-5bcde6c6fbbmr1252328e87.24.1791596656639; Fri, 09 Oct 2026
 18:44:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009210449.971057-1-linmag7@gmail.com> <20261009210449.971057-5-linmag7@gmail.com>
In-Reply-To: <20261009210449.971057-5-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:44:04 -0400
X-Gm-Features: AclHuK_zId0_yh9bj0LvR21b7Dyfnsf-U5B4cO_z-cljbb_gEYRCPqonHzDk6DU
Message-ID: <CAEdQ38EpOApGeo15BAppLF+rV4-qxXo2VUfeA8W0fx-o12x0BQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] alpha: invalidate the local context in flush_tlb_page()
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 09, 2026 at 11:03:49PM +0200, Magnus Lindholm wrote:
> Add this before changing the
> current->active_mm test to current->mm: that change will also send lazy
> callers here, so their local invalidate must already be in place.

Thanks, this is the order I wanted. With only this patch applied a lazy
caller still does the old targeted tbi(), so no step is worse than the
one before it.
