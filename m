From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 28/29] x86/mm: Report actual image regions in /proc/iomem
Date: Thu, 10 Oct 2019 20:00:08 +0200
Message-ID: <20191010180008.GH7658@zn.tnic>
References: <20190926175602.33098-1-keescook@chromium.org>
 <20190926175602.33098-29-keescook@chromium.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1570730415;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=Xe1SX//dDoWeX+ij/nDraOaVSkSMgvg4F8+xxebszBM=;
        b=ho8GObx8x8ogaRx5uJLjl31cqJAZGDuZNy/gKli2vkRXyewbGzasCVSSCyhDoQQwLUSAdB
        6Ch+ilhWD9WU/Q44lP40VOutBHAqCxDcNCYXoLlw0x0BYwbf3EhUuehrKk4qWbR8joF/Uh
        MKxwSv/3EwfqYFCfTb6K2+9UEj5t1ns=
Content-Disposition: inline
In-Reply-To: <20190926175602.33098-29-keescook@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kees Cook <keescook@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Michal Simek <monstr@monstr.eu>, linux-parisc@vger.kernel.org, linux-xtensa@linux-xtensa.org, x86@kernel.org, linux-kernel@vger.kernel.org

On Thu, Sep 26, 2019 at 10:56:01AM -0700, Kees Cook wrote:
> The resource reservations in made for the kernel image did not reflect
			      ^
			      /proc/iomem

> the gaps between text, rodata, and data. This adds the rodata resource

s/This adds/Add/

> and updates the start/end calculations to match the respective calls to

s/updates/update/

> free_kernel_image_pages().
> 
> Before (booted with "nokaslr" for easier comparison):

...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
