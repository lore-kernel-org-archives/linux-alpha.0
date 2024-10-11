Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CED519F49E
	for <linux-alpha@vger.kernel.org>; Fri, 11 Oct 2024 18:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728670330; cv=none; b=up9ste+WuV626K+rMeN7vmtXAEk73GCBla0S1EeK4n7E4rZPiuCbMynO7JT/9evFt7fLzGr5vpl7T+MDCBPI6psOBAc97BWcGWrRjJEc80dKmbCrSzcxMFuKkwqSKZQWPCz/HK4UY1wkyNfJpKvpCPdToZSq41s1UYrUXd+0ZMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728670330; c=relaxed/simple;
	bh=KAP43U2v6w81RuXDoAO0hX2voUKdYd0ciolZ9lqY+iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FOAg38/bBHaqve8t+RuZ0sOcNH+caylrVOGgkqbiFVynfTqKIsp2NjdAFRSUkXdpzFkf7Gf7PxFO9UG6aXI0coSI8S5Gq/6zwUnbzsnCsLy3ffpggPkJaKGZ0gwwEVlIH+99QsqxVwd/gOb45aAPrJtFhjc0QYr2LUn53aclAaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FYkz0OsI; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FYkz0OsI"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5398c2e4118so2935e87.0
        for <linux-alpha@vger.kernel.org>; Fri, 11 Oct 2024 11:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728670327; x=1729275127; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAP43U2v6w81RuXDoAO0hX2voUKdYd0ciolZ9lqY+iw=;
        b=FYkz0OsIDqv165nlRvP5jCDDEdBnN9znipi4Y9X6PWTbLjnz0whOKU1QtVlt3k4b5z
         qn3ZZqPG9OYxPE3qPi0xsXZ+V+fl0rkombX0YRS5d3QEBWr58FyQagO6FHe35MNULjuj
         NJzqHyijdqq8fH2EPbPsqsMXtPTfsgnr9dH+YTuYrJEM7z46q4uHaJTLB0PF8L3r52+a
         xoE0abvU8eYDnpgld2u69qt1N8ie5rFUEorvFe2tLX7ZrFavgMSmW7NEnUbEG3Swud1w
         NztjMSsojdGNVyXl6WHtPJ7apUjeA8sLrexbxxVozvBAu5g6bbSWoa+rcZ/TS+kfB7V6
         FTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728670327; x=1729275127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KAP43U2v6w81RuXDoAO0hX2voUKdYd0ciolZ9lqY+iw=;
        b=FHV/jLRNeWVHWj20De48f7gTftbljRc3SUB8cAnAzLao8cjwmK4nbSRydyU3WfF1+s
         B2JLl7qY5FTQdfCSbIwWNG7IYM9qbKmlO8ss0hy7nF/stdxKsHE1nynSAYVH0hNS550+
         v4pFwqqAQqm+VneUDxnGvSymr/HkXSxo1P8ZadM8zS5CAO+A+9+lu/kPbO+h871+YYxJ
         HVfgUglx2mFdpo6p8h8AYGjA3oRuI+8w3zVMIilC6g/6fbxEsbfYCm2IENxVi1uxtYdM
         nq+8EjhA9dkmlYnkWStXoL+0fo9SQavnXuOSSDDZLSyaPQlrsnEkMYZlBfdE6u+fkKOv
         TAgw==
X-Forwarded-Encrypted: i=1; AJvYcCVZNFxv7nFwrGjTuZa/B8quq1IVWCr91bnWGgs9warrR7fiZ0lh1O8K9PjdQ5GIXEgVbePZtLngRZyfGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5HtGdXvCjGbUXtNqnxUGZDfAc715aU0dosRuE2iR/Sfe3SggH
	mAOjDtyBHV1ez9WLLvzYFFAvPhkiaKOtIOGiNWereoKUMt1Po1JO5GU2GN9V7igjDkQAcinZK47
	7bJlTn5PDzdc3q4E/MbqDNpzM/DQhlAR+UKvt
X-Google-Smtp-Source: AGHT+IEPzZYRUYBZDGGZnE1YCDc46bSYVdLJ+yiGqVFt9StDeDnto1Lbfh+eC0TGRLr+N2ieM1Z/sn2o6ag0xZNnFbs=
X-Received: by 2002:a05:6512:2821:b0:535:3d14:1313 with SMTP id
 2adb3069b0e04-539e5e762e7mr28681e87.0.1728670326127; Fri, 11 Oct 2024
 11:12:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1727440966.git.lorenzo.stoakes@oracle.com> <59e218670565accf978aeb8cf4745de4c0738773.1727440966.git.lorenzo.stoakes@oracle.com>
In-Reply-To: <59e218670565accf978aeb8cf4745de4c0738773.1727440966.git.lorenzo.stoakes@oracle.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 11 Oct 2024 20:11:28 +0200
Message-ID: <CAG48ez3XwT3aeXRDrW2e_46aAzyQ8iVGr6G7PrMz0KATaJNtew@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] mm: pagewalk: add the ability to install PTEs
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
	Vlastimil Babka <vbabka@suse.cz>, "Paul E . McKenney" <paulmck@kernel.org>, 
	David Hildenbrand <david@redhat.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Muchun Song <muchun.song@linux.dev>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-arch@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>, linux-kselftest@vger.kernel.org, 
	Sidhartha Kumar <sidhartha.kumar@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 2:51=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> Rather than add yet another implementation, we extend the generic pagewal=
k
> logic to enable the installation of page table entries by adding a new
> install_pte() callback in mm_walk_ops. If this is specified, then upon
> encountering a missing page table entry, we allocate and install a new on=
e
> and continue the traversal.
[...]
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Reviewed-by: Jann Horn <jannh@google.com>
