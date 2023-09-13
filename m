From: Sohil Mehta <sohil.mehta@intel.com>
Subject: Re: [PATCH 2/2] arch: Reserve map_shadow_stack() syscall number for
 all architectures
Date: Wed, 13 Sep 2023 12:18:28 -0700
Message-ID: <29da2af0-5c88-f937-a9b6-db2d5f481321@intel.com>
References: <20230911180210.1060504-1-sohil.mehta@intel.com>
 <20230911180210.1060504-3-sohil.mehta@intel.com>
 <8b7106881fa227a64b4e951c6b9240a7126ac4a2.camel@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694632732; x=1726168732;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=63yUsneY/RmYlInZ/dnG/mTcTTecI9ZNgQJsTP1BacY=;
  b=EzXrpENLKFT+1KNmOdSPiRCRxBp3lXW8P2Gf5BQZPhIoDAduY+hD2seJ
   LlrqWseDxj4TK4WJKoonThmGCtVoTe/5jBjhto4fDlES2IaKgjoWOuVAd
   DLqq95omA5OYPMlPi7weDKS9R1ANu7XdCmQCf8geaZbjHtH9+V1yNxvTP
   bvYizDvqHFFvA5MxqzMa/RNIs4djfxqEIOP8hOWn7Oucu43I+3ME8OC4H
   OXzPZVE7+SPYxl/gofi1cnzyjISrFdE82bYg5oinYWxFUOId1dzGrGxGP
   WWNzVyq2/YR5HrKiKCnvVtriq+aoxxDl2dSAzVIisu41RclLV7b9WQx3q
   A==;
Content-Language: en-US
In-Reply-To: <8b7106881fa227a64b4e951c6b9240a7126ac4a2.camel@intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>
Cc: "svens@linux.ibm.com" <svens@linux.ibm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "schwab@linux-m68k.org" <schwab@linux-m68k.org>, "brgerst@gmail.com" <brgerst@gmail.com>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "monstr@monstr.eu" <monstr@monstr.eu>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>, "dalias@libc.org" <dalias@libc.org>, "lukas.bulwahn@gmail.com" <>

On 9/11/2023 2:10 PM, Edgecombe, Rick P wrote:
> On Mon, 2023-09-11 at 18:02 +0000, Sohil Mehta wrote:
>> diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl
>> b/arch/powerpc/kernel/syscalls/syscall.tbl
>> index 20e50586e8a2..2767b8a42636 100644
>> --- a/arch/powerpc/kernel/syscalls/syscall.tbl
>> +++ b/arch/powerpc/kernel/syscalls/syscall.tbl
>> @@ -539,3 +539,4 @@
>>  450    nospu   set_mempolicy_home_node         sys_set_mempolicy_hom
>> e_node
>>  451    common  cachestat                       sys_cachestat
>>  452    common  fchmodat2                       sys_fchmodat2
>> +453    common  map_shadow_stack                sys_map_shadow_stack
> 
> I noticed in powerpc, the not implemented syscalls are manually mapped
> to sys_ni_syscall. It also has some special extra sys_ni_syscall()
> implementation bits to handle both ARCH_HAS_SYSCALL_WRAPPER and
> !ARCH_HAS_SYSCALL_WRAPPER. So wondering if it might need special
> treatment. Did you see those parts?
> 

Thanks for pointing this out. Powerpc seems to be unique in their
handling of not implemented syscalls. Maybe it's because of their
special casing of the ARCH_HAS_SYSCALL_WRAPPER.

The code below in arch/powerpc/include/asm/syscalls.h suggests to me
that it should be safe to map map_shadow_stack() to sys_ni_syscall() and
the special handling will be taken care of.

#ifndef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
long sys_ni_syscall(void);
#else
long sys_ni_syscall(const struct pt_regs *regs);
#endif

I don't quite understand the underlying reasoning for it though. Do you
have any additional insight into how we should handle this?

I am thinking of doing the following in the next iteration unless
someone chimes in and says otherwise.

--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -539,4 +539,4 @@
 450    nospu   set_mempolicy_home_node         sys_set_mempolicy_home_node
 451    common  cachestat                       sys_cachestat
 452    common  fchmodat2                       sys_fchmodat2
-453    common  map_shadow_stack                sys_map_shadow_stack
+453    common  map_shadow_stack                sys_ni_syscall

