Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.219.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793820926;
	b=FU05ljR3qQRGWn0ey5dEtZDtar0wb5qlGa5N0ugAn4QdD6Zq0x8SkWY38vbfE+H2Wi/0
	 HK6fBOwx9xjYYlHHCFYI453cGZlEghXjneh45OqOKKFcQSGUmfK/SYl45oT0fv9/uUtIH
	 ZP4ZMRAe7XkXOsRKKg6qHkTaqoUH6QoXSXXqukZtH/EqsxI9WftLtOafYaiCRqRq312DI
	 QvO4AoSai23IdHecZH3J9E/+DEmllWu7eN2V46bCzkpfIoPk/JfwyoGqaF5dDX3r740UG
	 YawoazSV9njuCdnhXIT4cTGi3u0LDsh4/zlYbMiJg7vF6zOP3vTfwkgrWDeCgfVSoZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YEqbpUp+lNFQJykxGv+r+fj99eI3Ju/YPVh/28lMDl0=;
	b=0ZrfCuAADAp9EtStKF0SLL5OTPcYuRO8Rn5/72bZewBjqj4nEupz7buVZOh1BmvaBrTi
	 s1m/mT84VWewtTfL5V+yqA+djule/HFuNk3JdY4KcRUdYeGGv3VMTtcpwpBFY0ii9w8Gb
	 HDSDFSbxGCmrUnA3LMwB1KEcyzkgG5hmRD89Foqfa/dCdgto79GpcP+lwABt59y90KRzW
	 hijs+i72Voe46j7/hMRheghPR489pwJd8EvyuWD4MQ8MbVmFVly5UmUr9PXlML/8/xynS
	 eLsb/v+lZeqliIOs4wZ1HUlnSRRouxjzVLPHkNbbixC9d6iajNGvLwhQHHm+vIjfhfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WKvTJpx8;
	arc=fail smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4065607B55A
	for <linux-alpha@vger.kernel.org>; Wed,  4 Nov 2026 19:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4065607B55A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WKvTJpx8
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91e7af9a67fso8484186d6.2
        for <linux-alpha@vger.kernel.org>; Wed, 04 Nov 2026 11:35:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793820925; cv=none;
        d=google.com; s=arc-20260327;
        b=aZenwndpeus79jCVh23PfDWulw81sHOAU1yX4fTRjG49Ni8lTlZbUuPPxTYbFcdsIA
         Z+8RwoNd4sXueD6mUWZHCRN96WUzfZFYkE1vfJNLVgblPkR3qRwSxDX6G+nJycm5C8B3
         Av/0rIkhpdU8XXgAm4Gpk0pFu5vUa6iigpSx7gZWc1//BAi7UZKb1y+bm0sjUC4h/1ZW
         7wAN/ZzdunecUZdIqFBYUkhgV3/G1CWXgujbZTRQTs6erGJ7HNRjk3dcQ7jhFQ2xAE6I
         yZfxmSfYKOzd4cqdnDq24BGPAh9nw5fDGiVm53U3d27LeaqIo+DA23tXbP2972JP9WF+
         M9Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YEqbpUp+lNFQJykxGv+r+fj99eI3Ju/YPVh/28lMDl0=;
        fh=lqnOMIHW2c4PWp+LV75l6Z5I9VrqREy0hJaGay/jLIw=;
        b=TGRfhEzJeQliXMjt85Mg27jfUXn/H5eRwHjtbUL4f1Hsqx3abQxkyizhuPDWvc8MUz
         vLwa5LhSHI/aZ+YFGZZK8G+HkYXUocr2qkJ1yiHvWC7S7pWheR85ENEPmprk5UXEf/aJ
         EJY1P+k8u9JLPA4xKDUeYnKJc7Y9CPLJTTNyyIa8Ewkzc9WHvoGasHKrKHuRh1fF2gYs
         ZpGm9WzQcbzDhdY7EVUW9ZvFmYbaKyAJNrSed773gh56fCcUvGa2H2T+LIu0iB3kTx2O
         QLfXRMlVEiH8cAyrNb81pQ+rBEEXke1OZ0rGZ6++26PYR/vtp/INgUUzdkM5CTgbS3mO
         TW6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793820925; x=1794425725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YEqbpUp+lNFQJykxGv+r+fj99eI3Ju/YPVh/28lMDl0=;
        b=WKvTJpx8poNzgxl3uDkcvc0rL8iUYBn3U30inguq0YhUdLyRyQF7YfDWkosvThwb22
         wxFIvpLQPo4Iu8S7vB/VACSt1oIZM8AEN1dHhadz1hm8YYLQPDi48dV3VY27T0DHXzq4
         rFvX4Dj7a8nltOVkXqD46MRuYET4RiUR1d4LSGE5QfJBf1o14CFwTgFODp9r1Kk0nAub
         iLHblA00KuwRNFeKl7o0cEHTfGBOyxwbcriULiQTmN5uYYzVYavaKf+na97iG0PvI9Z/
         OLiDgaincIrJvxe8ZdQVxLMOqAsl+YKWe7bkoslVZjPuiKQsVWAXqBMTPYZ2ioeMhem5
         8cuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820925; x=1794425725;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YEqbpUp+lNFQJykxGv+r+fj99eI3Ju/YPVh/28lMDl0=;
        b=1XH8hsKqANB98UnHz5F+ggPJv61gEyKyA9q4JAlVapPcXsfx7tx6uLkPeC2/MGbZ3O
         +oxaA/19egFWi+NWLYvX7ZpHQ4xOl69ubg08jP4bcvlRXn5Fb+dv2GVZcNo2sEfR+d5H
         lS8JeC/jIVhA+1OCa7GlVdesk3KpcysmOJZcil3s2Zqm+raH1qhdFGGjh/bN4Ue3CK2S
         duGJJD6JBI+3p+al9Gz67960G3djEXHwWJsnvKfivN/Kmpv5F8cs59YJwrrU4QOtp6Yl
         IZUekFmlodHW6hRQ3sk5MmnaVuu/2No97hW7tujpf/H8K+i/tqD2n01q0JShPsTi28hm
         9jFg==
X-Forwarded-Encrypted: i=1; AKwUvBzywbY2f5V6PnG/IaZMocKn7sN7YoHQridA9f9zt7BfseK7MEJggmJSTWJW4tiMokNnFvKgWQiixHqadg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+8C8qg2PBVAxCgCAA98CIWBoSTTKw1nAvzv2yt2CbAnX7FnhGr
	BNdhX4Rai4HWAVJ/H9QZ4BlEtTW1/Kqhyl1iiaFut3bR/8cgqHzD/Ix1dqxjaZTlla1sP2+kQqP
	UNxC4VXFe+Mt/Rav0fO8MjTTS7awBK9Q=
X-Gm-Gg: AYBFou3JUPJ2XDVdisl7MQCitJerlfuC6IHtJlIWqUeGzSgAKvgRtZxeniZqDf2/Cet
	CY//GmOKAhEp41Y52sARdrf6YJIUGnyAbIpHFjSe6ZHozBEuOYwf+q/6X8PsjllVXlhQB3QLhrw
	0e4At34UTDEQB+7d/wEr/6O4czVvz0v2XH4lQqTTVpCT0Njp5XYcL4iFKo0jnMJzPBiFFeP2kzl
	tvIIqe7GQ58dZZrVjTaSrLplpazVjc6niro4re4SbbuYrKnK2xKuSQd5aD7zVAobnJe+nrvpBUJ
	GAAEyEAm9f2xMUqdjVAisVX0FUWzz7tkqKrMNhW5NOh4eZrY6o9E+dUGfOSRGSooJsP86ICOIV8
	G2rEMMSPM1Mt7zRoh52m2jvb4Wr7mAKktSm+q/nClNwKDR9EN70KB7TDjSbRHeWMBmY5tzNjCCi
	BQRUmxtbdSwZN+ozQMHGglJMHOJhM5whGneX+noZrGhqDjbhNmLLjk0g==
X-Received: by 2002:ad4:5de6:0:b0:91c:73fc:a5a8 with SMTP id
 6a1803df08f44-91ca4b02679mr279668136d6.9.1793820924547; Wed, 04 Nov 2026
 11:35:24 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103214120.1099893-1-linmag7@gmail.com>
In-Reply-To: <20261103214120.1099893-1-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 4 Nov 2026 14:35:10 -0500
X-Gm-Features: AclHuK8KYTUTOKm35fu7c8yL7Ef6TtUTjlBUJHXfgRJ9Y5XR8YSD4d0UlaU10G8
Message-ID: <CAEdQ38EHu74R-AouOXAwD2LJEUZgx5S3CurNGE9x4zJsTxp5OA@mail.gmail.com>
Subject: Re: [PATCH 00/14] alpha: fix entry bugs and consolidate generic helpers
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 4:43=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com> =
wrote:
> With GENERIC_ENTRY upstream for Alpha, this series moves syscall dispatch
> and ordinary interrupt/exception entry and exit into C using generic
> helpers, and removes redundant fork, core-dump, audit and ptrace code.

Each patch builds, and the whole series boots and runs fine on my ES47
(EV7) with both CPUs enabled and lockdep on. seccomp_bpf passes 142/142
as both a normal user and root, and the ptrace syscall_info and
peeksiginfo selftests pass. No lockdep reports or warnings in dmesg.

I also wrote a small test that reads 512 bytes from /dev/zero in a loop
while a 1ms itimer fires SIGALRM. Without the series, 188 of 200000 reads
came back wrong; with it, none did. So patch 4 fixes a real problem.

Two small things, neither worth a respin on its own:

Patch 2: the comment in regs_return_value() says a3 is an error flag
only at syscall exit, but the code negates r0 for any user-mode regs
with r19 set. That's the same as MIPS, and nothing on alpha calls it
outside syscall exit today (we have no uprobes), so the code is fine.
The comment just reads as though there's a check that isn't there.

Patches 3/5/6: the ALPHA_SYSCALL_META_* bits come in as 0x10, 0x20,
then 0x8, and the RESULT define has an extra tab. Cosmetic.

For the series:

Tested-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
