Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102C951993B
	for <linux-alpha@vger.kernel.org>; Mon,  7 Sep 2026 16:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788800039; cv=pass; b=tXC5yMb/cfO/b7ZMyBEcEYzC0nZAAxj1ACE+vI8c49UT7Xd2ycSwXitUrHFmoltYNpYvxDJscB2Bz6ZCLzQ5m9hqIQsdZTYjMG0fU/OGbJJIMzXhbt5Mve3WWB9SF/5DkpOj8FWwR9uu7q8DhzLauDPFwZQuAhzMMNLs1R6KmEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788800039; c=relaxed/simple;
	bh=7nZvXQAXFpGDq6OvBtcrjZaQ3gxcarFF2OJUmuf6SHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S52C6h4vJNwuoBBF0OVWf0tNg549gh1fzPg/2QyRy4hRAt5Yn1ND+Rv/se3AeJWJi/jzITpO80P3xqcOb2/HcSKy58LVhiliHAF00F89VQpTzyNzAk1MSsMS44nm3BEOO99ejYvl7bt6J9YzZ0pqO5PjWY0FPAcan2reDxvKg8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZOEcfTft; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZOEcfTft"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5307425f44bso312011cf.1
        for <linux-alpha@vger.kernel.org>; Mon, 07 Sep 2026 09:53:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788800036; cv=none;
        d=google.com; s=arc-20260327;
        b=T/m2jjOeOEZ2ch+sqc1OQzTCy/DX1rKP6gScXTIpqZtEMej5Sc38UX6DPlnfFfVeO4
         QA/FgrCwBaGCyXGoJG/PnYgH85OroOKc82MGZQEIVToEEWKZyvM9lZxmANP3plhUjHEU
         wjQW6S8TMjGn8BIBHzFHL9tM1zOXaxN2sK2ubvzAtdkmS4jp3FmZIUpG+5uzuJRJ9hmM
         132IWNRdXnNfM0s0AqlGrEUP/qlwx+MilRXOcAdaCo813fOvfaU8j/wisANfWupj/JQz
         E0MbHNuvvBIcsb6hISaKy+28W7pmt0tmQI0rA0t3Q/nwjQifHDf+AdaQ7HXDMcypV7ZX
         qv9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WOgo3zFXzbtiQDjz57z5HXaLiQwAncd9HG4Gw1Bp/lg=;
        fh=iOkv+O2qLfcYM0Ct/zqffZW171aWmYvi7RjL0yGPPm4=;
        b=bO0+MrLjY+ycT2Gj59Z53QiI+dZYs5iPFIqj4OoNFyI/h+sdA4VKburDRhY+2pdHaE
         nBLVNQRBNliOHzvaOW/gDB54DezPSp06vL0hCDl2mjBL4rjWD+TK+2jsBKvb+kr3WOCt
         jFt7Hrk756/OPTaOgvOgjXYlnp1justtcN+OskjkqbXrWF8QElMyCD8VOzeb9xePAMLO
         x1IeFuPe5attn5t2613SP0Zk3AbQsgpHS8h2zFhXPPpniCIf4ULw5YLiGUMefm3jQvYz
         Kx6GkPidXuHh78xaQStE6kYED1gRbeDSWuvguScJKj/hLGn/eWzMGGBUtxHbkbKdJc/c
         5OxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788800036; x=1789404836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WOgo3zFXzbtiQDjz57z5HXaLiQwAncd9HG4Gw1Bp/lg=;
        b=ZOEcfTftJhzBn8TSOkOKtoVoBUfs0xbVZP9wHIME5s8DaKMIumqZANXdTWAZZQG4bO
         PsjF2/5Q7dfdSw5e/4doJHeaSAcrrwzHm5okWijPOCxUqMYTFuITP+L3zhdL7LBMLzBT
         Jt+SHOoAutj1CLKQTV1FN0mPF2EGxDqFcsLwjlFwQHiJXiI0RuPd1xWARyOCutR3amvc
         sQxz5M40LQ87mSFr29zXtVACvT1zPuvn5cV0my4RhbsT0V7tcqvEyDMudV1T+uNnLK+a
         Py2kZwd1qLLizUDEbVxEWP3v9J2sunX74cBomy/fdJ0WlRZ+GPuOIbhrioUU/SARwrl5
         i5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788800036; x=1789404836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOgo3zFXzbtiQDjz57z5HXaLiQwAncd9HG4Gw1Bp/lg=;
        b=oPumZ9vHScRTVJDhqIrQjzVP2uOt9uuO5kS8SvCxMudlyJD3oUyN9XmSNscA5+Bqn/
         XBXW/A1vhuft3XN/Pgly5tQdzDfPXA0GYYdUzoegPtoVfqUkwwmAmbAN8TqiJNUeTUAv
         EoALZDaiKO9A0n4SB0plSll+qT8sxFvfrgtWQlq6DgEWW61OXt8x93ZonxXzCDWXCVMD
         JOQ4kM6kHLazV1Xa0/pGaDRwa5alYQq4x4YrJodarHnZicUzvnmH23GHb/Y9IzF4oXeD
         KOvNyunrjF8Avi0Rbi5C1fo9/bE59GqqWi8lbcZEUj9pXGKCpz0f4zKJuWtO+hs6BORE
         aFWQ==
X-Forwarded-Encrypted: i=1; AKwUvByQAa2MRIP5viUARAWZQDZSjoRaMJkgdjLFbXPPcC3F/pD2Z2qWuK1n0ftQfARhXjF95S8b6/DcmBhfvA==@vger.kernel.org
X-Gm-Message-State: AFuF++nN8fwxLywss5nZcv8fhr0gZ4IVngQgIwHjXb/lULFPUd/wPkp/
	LaRN4WKMVgJy0YHorAyD/KAbgH5o3OY37613A938yZ81VV0fDWxR1gr/GvhceHma2XEvGE61n0K
	cRcSGUljdPbxk7FN7oMDhp+u91pomqTM5RNgGG28F
X-Gm-Gg: AYBFou3cPUF7scrHeYKHFSoxpiLGSwliKKDZhwJOtxfx3u3bXMgRWb7hbU3rvNpFbHV
	pMTassUoLLZh3KPHVJRz9BDTYTQC0sL29w0Zd4sfKpNTZYEcgSYoo9WnTmxjngmNfG/bvr7LHVg
	QAKrmp/22i0j+l/S2LkFiemqtx3t0k2xXhgnHO6p2VeqB9ii2cGqrwAkz79YnDo4m1Hn813gsRP
	nG2tJnb8DhYkCBXmn3i57oy8FITz0yMOzs9VhhiO26b94W+EAvFTmpWG+xQu9fuYmcvHbUHNMzz
	7Hxv9tYeScrCfR8lWmU8Pskn8f4BqI8OUq5nPiWx4E8=
X-Received: by 2002:a05:622a:28e:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-530920caba6mr3560401cf.0.1788800035234; Mon, 07 Sep 2026
 09:53:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-rcu-pagetable-freeing-v1-0-5456a81c8212@kernel.org>
 <20260901-rcu-pagetable-freeing-v1-12-5456a81c8212@kernel.org>
 <apbUpMDJglS99_yK@thinkstation> <apbfzUwBQyxe3P9R@gremlin>
 <apcH74QsR5I-DIbL@thinkstation> <apcJhtvnd45EkjJI@gremlin>
In-Reply-To: <apcJhtvnd45EkjJI@gremlin>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 7 Sep 2026 09:53:43 -0700
X-Gm-Features: AcwNN1WRGdFWOzxEbOcmfkztqDuQQAGpor7Xm60pdWlD2DjKNo1Y7S4S7DNXdgs
Message-ID: <CAJuCfpH_v4YU+hsQDU_yQ4HZDf-2C6DuiJU5PGL+uVAsTwkZug@mail.gmail.com>
Subject: Re: [PATCH 12/12] mm: change the contract for free_pgtables(), update docs
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Simon Schuster <schuster.simon@siemens-energy.com>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Russell King <linux@armlinux.org.uk>, Vineet Gupta <vgupta@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-snps-arc@lists.infradead.org, linux-arch@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-alpha@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, 
	Hugh Dickins <hughd@google.com>, Qi Zheng <qi.zheng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 10:25=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> On Tue, Sep 01, 2026 at 06:15:17PM +0100, Kiryl Shutsemau wrote:
> > On Tue, Sep 01, 2026 at 03:31:26PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > On Tue, Sep 01, 2026 at 02:57:13PM +0100, Kiryl Shutsemau wrote:
> > > > On Tue, Sep 01, 2026 at 12:01:32PM +0100, Lorenzo Stoakes (ARM) wro=
te:
> > > > > diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> > > > > index b91b1a98029c..ff8ff3706485 100644
> > > > > --- a/mm/pgtable-generic.c
> > > > > +++ b/mm/pgtable-generic.c
> > > > > @@ -386,9 +386,21 @@ pte_t *pte_offset_map_rw_nolock(struct mm_st=
ruct *mm, pmd_t *pmd,
> > > > >   * be read-only/read-write protected.
> > > > >   *
> > > > >   * Note that free_pgtables(), used after unmapping detached vmas=
, or when
> > > > > - * exiting the whole mm, does not take page table lock before fr=
eeing a page
> > > > > - * table, and may not use RCU at all: "outsiders" like khugepage=
d should avoid
> > > > > - * pte_offset_map() and co once the vma is detached from mm or m=
m_users is zero.
> > > > > + * exiting the whole mm, does not take the page table lock befor=
e freeing a
> > > > > + * table.
> > > > > + *
> > > > > + * However, the PMD entry is cleared first, and the table freed =
only after
> > > > > + * an RCU grace period, so a walker that mapped the table under
> > > > > + * rcu_read_lock() stays safe, and the pmd_same() recheck in
> > > > > + * pte_offset_map_lock() detects the teardown.
> > > > > + *
> > > > > + * Therefore it is safe for "outsiders" like khugepaged to use
> > > > > + * pte_offset_map() and co. for VMAs that might be undergoing pa=
ge table
> > > > > + * teardown.
> > > >
> > > > Is it strictly true?
> > > >
> > > > free_pte_range() clears the pmd without taking the PTL, so the
> > > > pmd_same() recheck in pte_offset_map_lock() can pass and the pmd ge=
ts
> > > > cleared right after.
> > > >
> > > > Readers are fine -- __pte_offset_map() holds rcu_read_lock() until
> > > > pte_unmap(), so the table cannot go away.
> > > >
> > > > khugepaged is an odd example here. collapse_pte_mapped_thp() and
> > > > retract_page_tables() don't rely on this recheck -- they take pmd_l=
ock()
> > > > plus the ptl and do their own pmd_same() under both.
> > > >
> > > > Can we say walks are safe and leave the write rule where it is?
> > >
> > > Hmm yeah, ah page tables, what a rabbit hole of horror :)
> > >
> > > I guess this is effectively a reflection of the 'write lock on write,=
 RCU load
> > > on read' pattern in RCU itself generally.
> > >
> > > So, maybe something like:
> > >
> > >  * Note that free_pgtables(), used after unampping detached vmas, or =
when
> > >  * exiting the whoel mm, does not take a page table lock before freei=
ng a page
> > >  * table.
> > >  *
> > >  * As page table freeing itself is RCU-safe, page table readers can s=
afely run
> > >  * concurrently with page table teardown. However, writers cannot, as=
 without
> > >  * a lock nothing prevents concurrent teardown.
> > >  */
> > >
> > > Instead? What do you think?
> >
> > s/whoel/whole/
>
> Haha yup the inevitable typo...

Also s/unampping/unmapping please.
>
> >
> > Otherwise, LGTM.
>
> Thanks! :)
>
> >
> > --
> >   Kiryl Shutsemau / Kirill A. Shutemov
>
> --
> Cheers, Lorenzo
