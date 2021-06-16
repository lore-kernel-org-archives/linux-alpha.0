From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: +
 mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t.patch
 added to -mm tree
Date: Wed, 16 Jun 2021 16:09:04 -0700
Message-ID: <20210616160904.cf834ee8c9e7a26008aa833e@linux-foundation.org>
References: <20210615233808.hzjGO1gF2%akpm@linux-foundation.org>
        <202106162159.MurvDMy6-lkp@intel.com>
        <87zgvpnbl7.fsf@linux.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1623884944;
        bh=IZsHCzpYhVnOA7preGSau6rA8qgP6HKFxjKgSja1eL0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ya2ZP+w0tecCWkQRgX69bO6HYOyjDnO010jk/O2wAw6Zsuovzv7xhHhgIc6Yk06uA
         ZCYvxCbCkVf5yXwFRNMAJgFp6ixuvqqQCReTczkt8P04D6CZgdculdlGx+OgR5Ln+8
         UNBs7mcjgMaobwjFyc/CwbMPq9cERYDE+ontS7S0=
In-Reply-To: <87zgvpnbl7.fsf@linux.ibm.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc: kernel test robot <lkp@intel.com>, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, kbuild-all@lists.01.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Wed, 16 Jun 2021 19:41:32 +0530 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:

> We may want to fixup pgd_page_vaddr correctly later. pgd_page_vaddr() gets
> cast to different pointer types based on architecture. But for now this
> should work? This ensure we keep the pgd_page_vaddr() same as before. 

I'll drop

mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t.patch
mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t.patch          

for now.
