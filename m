From: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH v2 00/13] arch, mm: deprecate DISCONTIGMEM
Date: Tue, 17 Nov 2020 10:14:57 +0200
Message-ID: <20201117081457.GA370809@linux.ibm.com>
References: <20201101170454.9567-1-rppt@kernel.org>
 <43c53597-6267-bdc2-a975-0aab5daa0d37@physik.fu-berlin.de>
 <20201117062316.GB370813@kernel.org>
 <d34f431a-288d-82a9-2632-85e8e695df12@physik.fu-berlin.de>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=MgojLclnAYOswLAieBVjfNC24dXThJ4NVpQsLaiik5E=;
 b=TGntiDlqS5lLNk5h6JaZN5NtNqD0A8LpOmFHhCVhG38uFwhja5GddMUMiv7qGT9usE9W
 07e7ujB4TtqYLdFU84qQH65osmUcr+EbKNL+fglujKsIZmHHh/8KblhrK8MsG9kpFBDo
 oJ4qjWE2KkyO1iI7Ce+/M88paMXfe92YLAlnjfNaZhSYRIfa0pV3MBX//HAQfB7nTij8
 rEafhv65TCkPC9pAllxgYAFRNvsBEt8lq/LbWcpgSjlLi5svy48hmtv8wIojuKKR8TTu
 NHHldFeV4404DH4jbHYf9DM2Ph5nUFNE+ictyxBT0Yvavza3Pv9Y+GpU0siCR2/Ut4Qj uA== 
Content-Disposition: inline
In-Reply-To: <d34f431a-288d-82a9-2632-85e8e695df12@physik.fu-berlin.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Alexey Dobriyan <adobriyan@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, Jonathan Corbet <corbet@lwn.net>, Matt Turner <mattst88@gmail.com>, Meelis Roos <mroos@linux.ee>, Michael Schmitz <schmitzmic@gmail.com>, Russell King <linux@armlinux.org.uk>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mm@kvack.org, linux-snps-arc@list

Hi Adrian,

On Tue, Nov 17, 2020 at 09:07:25AM +0100, John Paul Adrian Glaubitz wrote:
> Hi Mike!
> 
> On 11/17/20 7:23 AM, Mike Rapoport wrote:
> > There were minor differences only for m68k between the versions. I've
> > verified them on ARAnyM but if you have a real machine a run there would
> > be nice.
> 
> I do have a real machine (Amiga 68060) but it's currently not set up (but it
> will be in the near future). So I'm not sure if I can test the change within
> a short time frame.
>
> I will certainly report back when I run into issues on real hardware.

I hope there won't be any :)

-- 
Sincerely yours,
Mike.
