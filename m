From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 1/2] alpha: use .data.init_task instead of .data.init_thread.
Date: Fri, 31 Jul 2009 16:30:57 -0700
Message-ID: <4A737EB1.1000602@twiddle.net>
References: <1249073786-29788-1-git-send-email-tabbott@ksplice.com> <4A7360C3.2060507@twiddle.net> <alpine.DEB.1.10.0907311739040.2539@vinegar-pot.mit.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.10.0907311739040.2539@vinegar-pot.mit.edu>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tim Abbott <tabbott@ksplice.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Anders Kaseorg <andersk@ksplice.com>, Nelson Elhage <nelhage@ksplice.com>, linux-alpha@vger.kernel.org

On 07/31/2009 03:02 PM, Tim Abbott wrote:
> The INIT_TASK_DATA(THREAD_SIZE) macro call aligns to THREAD_SIZE (=
> 2*PAGE_SIZE).  So I'm not removing the 2 page alignment; I'm just moving
> it along with the code that needs to be aligned.

Sure.

>
> This change:
>
> -	. = ALIGN(2 * PAGE_SIZE);
> +	. = ALIGN(PAGE_SIZE);
>   	__init_end = .;
>
> removes the now-unnecessary (2 * PAGE_SIZE) alignment for __init_end
> caused by moving .data.init_task (it should have been in the first patch).

While it's technically unnecessary, it's also very much desired.

Think about it.  Suppose we have 9 pages of init, followed by the
two-page-aligned INIT_TASK_DATA.  So we get a page worth of padding
added.  It's better to have the two-page-alignment within the init
section so as to get 10 pages of init followed by no padding.  In
this way the page of padding gets freed with the rest of init.

Are you following me at all here?


r~
