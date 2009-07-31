From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 1/2] alpha: use .data.init_task instead of .data.init_thread.
Date: Fri, 31 Jul 2009 14:38:40 -0700
Message-ID: <4A736460.5070509@twiddle.net>
References: <1249073786-29788-1-git-send-email-tabbott@ksplice.com> <4A7360C3.2060507@twiddle.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <4A7360C3.2060507@twiddle.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tim Abbott <tabbott@ksplice.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Anders Kaseorg <andersk@ksplice.com>, Nelson Elhage <nelhage@ksplice.com>, linux-alpha@vger.kernel.org

On 07/31/2009 02:23 PM, Richard Henderson wrote:
> Similarly it is *not* a bug that the page_aligned sections were before
> data, because we already knew we had 2 page alignment from the end of
> init + 2 pages of init_thread.

Indeed, I'll go further and say that the common definition of 
RW_DATA_SECTION is buggy.

> #define RW_DATA_SECTION(cacheline, nosave, pagealigned, inittask)       \
>         . = ALIGN(PAGE_SIZE);                                           \
>         .data : AT(ADDR(.data) - LOAD_OFFSET) {                         \
>                 INIT_TASK(inittask)                                     \
>                 CACHELINE_ALIGNED_DATA(cacheline)                       \
>                 READ_MOSTLY_DATA(cacheline)                             \
>                 DATA_DATA                                               \
>                 CONSTRUCTORS                                            \
>                 NOSAVE_DATA(nosave)                                     \
>                 PAGE_ALIGNED_DATA(pagealigned)                          \
>         }

Given that we align the entire .data section why have interior padding 
to re-align for page-aligned data?  Surely a better ordering would be

	. = ALIGN(PAGE_SIZE);
	.data : AT(ADDR(.data) - LOAD_OFFSET) {
		INIT_TASK(inittask)
		NOSAVE_DATA
		PAGE_ALIGNED_DATA(pagealigned)
		CACHELINE_ALIGNED_DATA(cacheline)
		READ_MOSTLY_DATA(cacheline)
		DATA_DATA
		CONSTRUCTORS
	}

with that change, and without

> -	. = ALIGN(2 * PAGE_SIZE);
> +	. = ALIGN(PAGE_SIZE);
>  	__init_end = .;

the patch looks like it'd be ok.  All you're doing with this fragment is 
failing to free a page of padding.  You could change it to

	. = ALIGN(THREAD_SIZE)

if it makes you feel better.


r~
