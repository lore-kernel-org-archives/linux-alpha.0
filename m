From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v2 0/5] locking: Introduce local{,64}_try_cmpxchg
Date: Tue, 11 Apr 2023 06:43:39 -0700
Message-ID: <1fee0372-3a3b-5e09-38c3-ffb3523fe195@intel.com>
References: <20230405141710.3551-1-ubizjak@gmail.com>
 <7360ffd2-a5aa-1373-8309-93e71ff36cbb@intel.com>
 <ZDVGFhMwOtpxJtnQ@FVFF77S0Q05N>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681220621; x=1712756621;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2GeQQq+KcbTCEU+rXh5JGw+yLkL8a8JmHupdRnaoc8M=;
  b=chh0jmd4I6VNBC14A5780CVuHTxHv34bO0UjY1fWhG0r+A/g9vuNnnrk
   E+fR5m5J7LjjjauKWjtM5cDvn/VshNJS7PkdCiRCVmTIhUshEwoVGEG8b
   wy1Pi7MzUi65BzAmzI0VR+9oQ7q8s3WT3M0V1L5tNCwwunJzcv97RHTzx
   8Qq1eRnZKzEXBwkocoGx0q2IWHtWIVYVgI46XPRMqoq1DfPfa0JUw94/i
   wfzMjpmAHVtA+0eunF8M3nQVkiQyBB+wHFH9lRuec31hAZeGU7Aky1Osl
   AO673s42/mPq2YqPWCRbRKBnog/LYpIYyM7jKV5gjF4yHdc6en+zZzG0n
   w==;
Content-Language: en-US
In-Reply-To: <ZDVGFhMwOtpxJtnQ@FVFF77S0Q05N>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mark Rutland <mark.rutland@arm.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, linux-alpha@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-arch@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.co>

On 4/11/23 04:35, Mark Rutland wrote:
> I agree it'd be nice to have performance figures, but I think those would only
> need to demonstrate a lack of a regression rather than a performance
> improvement, and I think it's fairly clear from eyeballing the generated
> instructions that a regression isn't likely.

Thanks for the additional context.

I totally agree that there's zero burden here to show a performance
increase.  If anyone can think of a quick way to do _some_ kind of
benchmark on the code being changed and just show that it's free of
brown paper bags, it would be appreciated.  Nothing crazy, just think of
one workload (synthetic or not) that will stress the paths being changed
and run it with and without these changes.  Make sure there are not
surprises.

I also agree that it's unlikely to be brown paper bag material.
