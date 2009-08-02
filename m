From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 1/2] alpha: use .data.init_task instead of .data.init_thread.
Date: Sun, 02 Aug 2009 09:25:56 -0700
Message-ID: <4A75BE14.50908@twiddle.net>
References: <1249073786-29788-1-git-send-email-tabbott@ksplice.com> <4A7360C3.2060507@twiddle.net> <alpine.DEB.1.10.0907311739040.2539@vinegar-pot.mit.edu> <4A737EB1.1000602@twiddle.net> <alpine.DEB.1.10.0907311933360.2539@vinegar-pot.mit.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.10.0907311933360.2539@vinegar-pot.mit.edu>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tim Abbott <tabbott@ksplice.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Anders Kaseorg <andersk@ksplice.com>, Nelson Elhage <nelhage@ksplice.com>, linux-alpha@vger.kernel.org

On 07/31/2009 04:56 PM, Tim Abbott wrote:
> Also, some explicit ALIGN(8)'s between various initcall sections were
> removed; this should be harmless as the implicit alignment of
> initcall_t was already 8.
>
> Signed-off-by: Geoffrey Thomas<geofft@ksplice.com>
> Signed-off-by: Tim Abbott<tabbott@ksplice.com>
> Cc: Richard Henderson<rth@twiddle.net>
> Cc: Ivan Kokshaysky<ink@jurassic.park.msu.ru>
> Cc: Sam Ravnborg<sam@ravnborg.org>

Signed-off-by: Richard Henderson <rth@twiddle.net>


r~
