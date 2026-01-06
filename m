Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7FF361DBA
	for <linux-alpha@vger.kernel.org>; Tue,  6 Jan 2026 18:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767723014; cv=none; b=HbFbAhA0G5OOahwcjQ/5iMCn96mDVKHWDK+c8H/+g1V6/xVohLULod2vsKnR77Ub8/gF7Q+c45/lc+jCNFACoTgnM8CwPModPFanztn/0PzswTLn8RyEFmLYOzapcAN74Dh01neHq8MogAZD1Xs0U8JG2vy2N0N/wUbtOS6hEvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767723014; c=relaxed/simple;
	bh=FA5K1h59DamYmHfd/3KzrftMB3SlzXiq6xZrqAtXpUY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qb8bB8NThPgMs21mYCXNd3wY5tuipwhjwgh9M0grlOVm7vXTlWbVYXD1bl80KKaVTPOKvalQugQiwbVb4GkPC6/nIGCOcRSQfWhKQg+B/0F2FJaS3zUreeG9n+8Ae4GyifDvjiZD5BGXjY4OhhmKjPMP90/JoYbzEW0bDU0dWcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9dMYRvs; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9dMYRvs"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-559966a86caso359586e0c.2
        for <linux-alpha@vger.kernel.org>; Tue, 06 Jan 2026 10:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767723012; x=1768327812; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FA5K1h59DamYmHfd/3KzrftMB3SlzXiq6xZrqAtXpUY=;
        b=W9dMYRvsvPwdGns0U+luJdewM1L8cdAuYRl8upNWUEI/a6yoQSaJDrUcc5ah9e6Sg6
         SZoYuoBNbWApAm5khR/vExg9NUTP7YPnE1kmz/NN7Vn5ckBeVAnijAAst1MukfkcDumP
         Bi/3JvyADxr+vwCEnCfT+i4qu37/nBq7qcRC5O8kYZfNitY7vN2SC21bsX85jSHzqLwv
         TJXuggUnOpQ3tYu8/+qoiRhP3Fld8SV7gomzatsky4CnRREsK1SQAqG49ieZfz+ek5+O
         RYa0IiCrBv0RmpBUQ8cYSiDPY6zaQaIgmMH+laI5YtJm6yOBnRBVnQFA2tu7Sh7qisuU
         o3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767723012; x=1768327812;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FA5K1h59DamYmHfd/3KzrftMB3SlzXiq6xZrqAtXpUY=;
        b=pR4M2KhSZ5Ou2Got4Gi5axkNJFTp6Ec9AApTs8tLXvr7MnLUSji7Bi/DERNiOPZEtf
         la/aqdsDxDI4TmYwTNM1x9a15c+wubtguMh4tPkk3p5awEPFiax0sq5twfUVKOGQpXWN
         tkSUUHeV6RaEmL4abrmrhScJjh/KWDtco5X++zpGx4KpkOSwxIjuUjmtmjAme4YuyRrW
         +yi9dEFsBg7CLSTjV33LOewmJY52PsVcO4ytB+bgYZmJWbMTscDCyva04y3QiNJxqoWr
         Tcz08xEoJ8K7YKhsfvef+Ph8rZKMPxpXbkxMRdjxXK/MBWaN1ZXitBach5wUnWftSQMs
         HpmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWwhNTWqGKcvj+jUnI/49IL3ZoiPhsHRUaodkWPlTcsCQdVAjNpUBg2aGmHC8fDYYqFQG4Q6v044wc8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXJo//EAJ71hWJvnTt2dg4rFKGBqVZd5FAJl4P10HlO2bENV5l
	DJ1VkCmLfzuh1N0FPxeoFusEOql9UVWNhdq0ZHxK1lUNMhjkZ3kdGTPmyvCrvZ1awV90Eb2b0Qe
	VD3/pFY1znuXUASPOeKdAj7kQd73Dqxs=
X-Gm-Gg: AY/fxX7xWu2pOkg7Av6VQ55X+SPCz1l2ZSWOoCnja3QIKYs/W8pkUsvQ5tXLrLwK4fH
	yb6ug07ytgtLkZzRrU3Tps8hnhgx+Bgf19Rvl5gIsIDBAETy5SR7Ewo5MD1mPjxygeymUqIa++8
	6r4SjBJNZHnb2ckxRDPQGnPeEhUkURj4NDC8LgxcZv6IfcNMLFKQ4u3+UUCIWFziByawcLYt0Fw
	c6s8ngtmulcWahA5nDQ+zPFh+dXH+1H478CrCYC2J2R7bcIlmwcwG9WIOLWawgy5kbGI7Ls5oWm
	CDyK/TNJt9JlciyGSmMWxbPGV2GCe5IlAET4JLDSpCHz6Pz2Tfm7SCXxGll5kQDAoH0yGA==
X-Google-Smtp-Source: AGHT+IEzM6uzsby5xONrmyvo79KKv1khmsEtcrKCNxTZYO6PGVmqS5XUVYGCBnifuoNVlHpFc1b1YTr3dML32FKLJb0=
X-Received: by 2002:a05:6122:4588:b0:55f:c41f:e841 with SMTP id
 71dfb90a1353d-5633961d29emr1258483e0c.19.1767723011623; Tue, 06 Jan 2026
 10:10:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jubilee Young <workingjubilee@gmail.com>
Date: Tue, 6 Jan 2026 10:10:00 -0800
X-Gm-Features: AQt7F2p086qc5pwBemh62_ewB14pkoVXXEKa-ORCn_rynkROkTW0RdWFPTK7cp8
Message-ID: <CAPNHn3o4hKBf-BSNxRzsboYifWL-3ULwxGCOBhZ-r_5g-oKzTQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] rust: sync: support using bool with READ_ONCE
To: peterz@infradead.org
Cc: a.hindborg@kernel.org, Alice Ryhl <aliceryhl@google.com>, anna-maria@linutronix.de, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, brauner@kernel.org, catalin.marinas@arm.com, 
	dakr@kernel.org, frederic@kernel.org, fujita.tomonori@gmail.com, 
	Gary Guo <gary@garyguo.net>, jack@suse.cz, jstultz@google.com, linmag7@gmail.com, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lossin@kernel.org, lyude@redhat.com, mark.rutland@arm.com, 
	Matt Turner <mattst88@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, richard.henderson@linaro.org, 
	rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de, 
	tmgross@umich.edu, viro@zeniv.linux.org.uk, will@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

Can you cite a practical, real-world example of a target where this is the case?
And is this a target that the Linux community has a strong consensus
it should support?
Would it be able to boot with the existing Linux codebase? Could it
then run software?
For example, plug in a USB device and pull images that were written by
another machine?

Jubilee
Rust compiler team member
