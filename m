From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 07/29] x86: Restore "text" Program Header with dummy
 section
Date: Thu, 10 Oct 2019 12:33:05 +0200
Message-ID: <20191010103305.GD7658@zn.tnic>
References: <20190926175602.33098-1-keescook@chromium.org>
 <20190926175602.33098-8-keescook@chromium.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1570703593;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=61VcXOO6OC0TSDKYRbLOk7EXig9eCgXyOc1Sw8qjbMo=;
        b=QrtsacxT1YtNlQnr0l29ht/E0oAvW+TPvKSyK2g0/hm1JIpJUv3weRvTAKtk5um+tIL7NZ
        sMKAq2cd3qZJrCB8QeMiLz+W0PHOQeM7u7ISY1ucpnilVubyTseLgfkDcEzyeyNOoeMuUd
        DvcpBmRi6/Jkc81xIBQiQ4XT3IX11oI=
Content-Disposition: inline
In-Reply-To: <20190926175602.33098-8-keescook@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kees Cook <keescook@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Michal Simek <monstr@monstr.eu>, linux-parisc@vger.kernel.org, linux-xtensa@linux-xtensa.org, x86@kernel.org, linux-kernel@vger.kernel.org

On Thu, Sep 26, 2019 at 10:55:40AM -0700, Kees Cook wrote:
> Instead of depending on markings in the section following NOTES to
> restore the associated Program Header, use a dummy section, as done
> in other architectures.

This is very laconic and after some staring at ld.info, I think you mean
this:

"   If you place a section in one or more segments using ':PHDR', then
the linker will place all subsequent allocatable sections which do not
specify ':PHDR' in the same segments."

but I could be way off. Yes, no?

IOW, please write in the commit messages first what the problem is
you're addressing.

> This is preparation for moving NOTES into the
> RO_DATA macro.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  arch/x86/kernel/vmlinux.lds.S | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
> index e2feacf921a0..788e78978030 100644
> --- a/arch/x86/kernel/vmlinux.lds.S
> +++ b/arch/x86/kernel/vmlinux.lds.S
> @@ -147,8 +147,9 @@ SECTIONS
>  	} :text = 0x9090
>  
>  	NOTES :text :note
> +	.dummy : { *(.dummy) } :text
>  
> -	EXCEPTION_TABLE(16) :text = 0x9090
> +	EXCEPTION_TABLE(16)

This is killing the filler byte but I have a suspicion that'll change
eventually to INT3... :)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
