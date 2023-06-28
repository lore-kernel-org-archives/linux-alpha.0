From: Yin Fengwei <fengwei.yin@intel.com>
Subject: Re: [PATCH v1 00/10] variable-order, large folios for anonymous
 memory
Date: Thu, 29 Jun 2023 07:59:24 +0800
Message-ID: <dcbbea37-7fbf-3a7c-6cfb-04dae715e967@intel.com>
References: <20230626171430.3167004-1-ryan.roberts@arm.com>
 <CAOUHufaUTbUw9MTzw8D=sVrEB+RP6LSBQVGn93TWk=ozV8XobA@mail.gmail.com>
 <CAOUHufa0S_ayrys0XzDbH8KJi5HxvbGCh_bSAhDpAgcmSJjFUQ@mail.gmail.com>
 <1fb0c4cb-a709-de20-d643-32ed43550059@arm.com>
 <CAOUHufbtNPkdktjt_5qM45GegVO-rCFOMkSh0HQminQ12zsV8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687996790; x=1719532790;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1+OeyyHHyne3JXkmRuJel0Pw2Z9Ooa48wSggUjOTeTo=;
  b=aQPNtXRobwtfHoSPuua24rS7y9zvEa4b0yienzPPVkwlPQGCMuiNJOfr
   U6crJ0hJ8AgjP11MetcZkZz7pL4sJuG0bU4K3s/qnNVnYH9+89Bs2dKx3
   r6j4x5gDjSLELyRD4ON8aAY4hTETkKakfXpC0B19uXiIZRlPBPPRCSOoa
   5Q742i68eTqPdmzaIQcYRIib/ycq1PCr6hVRhpF9NBU0JeWu4o44mxsQh
   NkT3GmZXwZt3u3sTcubFnb1oJnDyjnCK6VIUzrTmocKzDsHuWKgKaAXep
   8mnoXlMKTmfxtRbXBoguPbLkECNV5WH0EMze2/mUTad2ke8H3WmMNUFXT
   A==;
Content-Language: en-US
In-Reply-To: <CAOUHufbtNPkdktjt_5qM45GegVO-rCFOMkSh0HQminQ12zsV8Q@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Yu Zhao <yuzhao@google.com>, Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org

Hi Yu,

On 6/29/23 02:22, Yu Zhao wrote:
> And please make sure it's disabled by default, because we are still
> missing many important functions, e.g., I don't think we can mlock()
> when large() && !pmd_mappable(), see mlock_pte_range() and
> mlock_vma_folio(). We can fix it along with many things later, but we
> need to present a plan and a schedule now. Otherwise, there would be
> pushback if we try to land the series without supporting mlock().
> 
> Do you or Fengwei plan to take on it? (I personally don't.) If not,
Do you mean the mlock() with large folio? Yes. I can work on it. Thanks.


Regards
Yin, Fengwei

> I'll try to find someone from our team to look at it. (It'd be more
> scalable if we have a coordinated group of people individually solving
> different problems.)
