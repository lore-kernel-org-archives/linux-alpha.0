From: Yu Zhao <yuzhao@google.com>
Subject: Re: [PATCH v1 00/10] variable-order, large folios for anonymous memory
Date: Wed, 28 Jun 2023 18:27:34 -0600
Message-ID: <CAOUHufbC76OdP16mRsY3i920qB7khcu8FM+nUOG0kx5BMRdKXw@mail.gmail.com>
References: <20230626171430.3167004-1-ryan.roberts@arm.com>
 <CAOUHufaUTbUw9MTzw8D=sVrEB+RP6LSBQVGn93TWk=ozV8XobA@mail.gmail.com>
 <CAOUHufa0S_ayrys0XzDbH8KJi5HxvbGCh_bSAhDpAgcmSJjFUQ@mail.gmail.com>
 <1fb0c4cb-a709-de20-d643-32ed43550059@arm.com> <CAOUHufbtNPkdktjt_5qM45GegVO-rCFOMkSh0HQminQ12zsV8Q@mail.gmail.com>
 <dcbbea37-7fbf-3a7c-6cfb-04dae715e967@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687998490; x=1690590490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3sxRrExQR7lJV6jvWZ5R7RjbSffn5YHmj9jbb61spI=;
        b=r2Ch6dd3Oy5ATuKjb580eq8/KXAABw0eOUHkyDtSlLZiQoaZjpTJL/7bARwrgsW66k
         d2gMqg+IrkJCoNVDp2q+/9sCHmVd53nm0vMnZ0uitf5p0hbRBrL4EmdKnkJHDiZK5Oc4
         9oauP8LfD9PAmECrNwlGnV/GIPOUxtyckNSg8ttFE6DANxvYAoTyhysJxBmF7iaOW2Dw
         +uODy5JlFkcEFh0BMppTXoOmmYbFyaKVIgNS3q7JjDNRYN1XUwoy2z0fBIfWvecERfpQ
         soehKD9L2ke2xP6yQiqOAYGP5UH3iItDNw0fQTZK7Xg98xvlIYZg/e0AeDMJg7Ulwxb6
         t2KA==
In-Reply-To: <dcbbea37-7fbf-3a7c-6cfb-04dae715e967@intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Yin Fengwei <fengwei.yin@intel.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists

On Wed, Jun 28, 2023 at 5:59=E2=80=AFPM Yin Fengwei <fengwei.yin@intel.com>=
 wrote:
>
> Hi Yu,
>
> On 6/29/23 02:22, Yu Zhao wrote:
> > And please make sure it's disabled by default, because we are still
> > missing many important functions, e.g., I don't think we can mlock()
> > when large() && !pmd_mappable(), see mlock_pte_range() and
> > mlock_vma_folio(). We can fix it along with many things later, but we
> > need to present a plan and a schedule now. Otherwise, there would be
> > pushback if we try to land the series without supporting mlock().
> >
> > Do you or Fengwei plan to take on it? (I personally don't.) If not,
> Do you mean the mlock() with large folio? Yes. I can work on it. Thanks.

Great. Thanks!

Other places that have the similar problem but are probably easier to
fix than the mlock() case:
* madvise_cold_or_pageout_pte_range()
* shrink_folio_list()
