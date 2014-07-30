From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH 2/2] alpha: Add sched_set/getattr and renameat2 syscalls
Date: Thu, 31 Jul 2014 10:21:13 +1200
Message-ID: <20140730222113.GC23324@stolen.phys.waikato.ac.nz>
References: <1406756552-23864-1-git-send-email-rth@twiddle.net>
 <1406756552-23864-3-git-send-email-rth@twiddle.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1406756552-23864-3-git-send-email-rth@twiddle.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On Wed, Jul 30, 2014 at 11:42:32AM -1000, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <rth@twiddle.net>
> ---
>  arch/alpha/include/asm/unistd.h      | 2 +-
>  arch/alpha/include/uapi/asm/unistd.h | 3 +++
>  arch/alpha/kernel/systbls.S          | 3 +++
>  3 files changed, 7 insertions(+), 1 deletion(-)

I thought Matt had already sent my patch to do just that to Linus.

Cheers
Michael.
