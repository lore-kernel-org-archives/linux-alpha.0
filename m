From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v2 0/5] locking: Introduce local{,64}_try_cmpxchg
Date: Wed, 5 Apr 2023 09:37:04 -0700
Message-ID: <7360ffd2-a5aa-1373-8309-93e71ff36cbb@intel.com>
References: <20230405141710.3551-1-ubizjak@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680712643; x=1712248643;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0xErBa/ZTd4QuIygEuCmz4Ddp7YfQ0AoZ3dVIG2ez3Y=;
  b=dqLPk3bQ9PiFQn0zDY+AcZjtRALJZLymqJ4MJ4H9QMKAMOhpd8WOcXId
   k8Hf8+rgp+Z9K7SytT0q1mK5gw1d8TiO59HJfrKBwaf3Ffu/xBXejZc5M
   1CMxxfS8HdphHR60dFj3ZWKdWUEOaBFZ8wF/LRaiaTsD5QU7PzZzVwNxv
   ZqCUYGItOeP3xk/3Ed6MvLguxuRN9XP+gDmYljboI1X1P5bjtsN5QuS9g
   mz1Vde2rXtnqNox+BC5E/d4/hW4YoMlhq311JQWEDB6ZvqP3Cb+hd0T2x
   xI4aUSmEvHngGnTNoQVFY+0+jF/VkgQCEE4xCX3DM1kEDdkimHQX98SoS
   w==;
Content-Language: en-US
In-Reply-To: <20230405141710.3551-1-ubizjak@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Uros Bizjak <ubizjak@gmail.com>, linux-alpha@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-arch@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ji

On 4/5/23 07:17, Uros Bizjak wrote:
> Add generic and target specific support for local{,64}_try_cmpxchg
> and wire up support for all targets that use local_t infrastructure.

I feel like I'm missing some context.

What are the actual end user visible effects of this series?  Is there a
measurable decrease in perf overhead?  Why go to all this trouble for
perf?  Who else will use local_try_cmpxchg()?

I'm all for improving things, and perf is an important user.  But, if
the goal here is improving performance, it would be nice to see at least
a stab at quantifying the performance delta.
