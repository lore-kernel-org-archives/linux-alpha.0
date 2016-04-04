From: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH 1/2] xtensa, rwsem: drop superfluous arch specific implementation
Date: Mon, 4 Apr 2016 13:23:56 +0300
Message-ID: <CAMo8BfLCqaJ36qPQm4ttAREw22YDwTwT-JeRfr_mu_d0pAcGsg@mail.gmail.com>
References: <20160404090335.GB10272@dhcp22.suse.cz>
	<1459760800-13477-1-git-send-email-mhocko@kernel.org>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc;
        bh=qUkBRaSm5bjGOAnc49bg7qmtT6cKjGENt/YQtcqH70o=;
        b=RhV+DCASM66VURtuSjKBV8WOwrTsW+j9vUudQ6yOcNZYQg5NnYhLbwuBXdX3BZAhVn
         rdIEcQkR0slKal6vomaU4CF0einhpTQVos2DZJbFPm6mKhZ2YFx81agLpEMCWxnKZe7r
         9CfY3uhGO3H19oQRCfXBlNGFA7sCYKqWs7UQJwyWSpMHGNIjNhmvhFKQFU/LFYljNQYx
         vi8Fhm9iRDUp6OKKXgXTIHvabUm0QoY/AaYX9S7unDTfsM60dUgKZHzvW7Zx1MFmu4V5
         V368BVTSAnGB8pcsm/CwbYbAnZXEZDzuW6WCvG9tuahps1yoyg2ihO9g9CS1S0LR3imR
         Z73Q==
In-Reply-To: <1459760800-13477-1-git-send-email-mhocko@kernel.org>
Sender: linux-ia64-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Hocko <mhocko@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, "David S. Miller" <davem@davemloft.net>, Tony Luck <tony.luck@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Chris Zankel <chris@zankel.net>, "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>, "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>, "open list:IA64 (Itanium) PL..." <linux-ia64@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, "open list:SUPERH" <linux-sh@vger.kernel.org>, "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, Linux-Arch <linux-arch@vger.kernel.org>, Michal Hocko <mhocko@suse.com>

On Mon, Apr 4, 2016 at 12:06 PM, Michal Hocko <mhocko@kernel.org> wrote:
> From: Michal Hocko <mhocko@suse.com>
>
> since "locking, rwsem: drop explicit memory barriers" the arch specific
> code is basically same as the the generic one so we can drop the
> superfluous code.
>
> Suggested-by: Davidlohr Bueso <dave@stgolabs.net>
> Signed-off-by: Michal Hocko <mhocko@suse.com>
> ---
>  arch/xtensa/include/asm/Kbuild  |   1 +
>  arch/xtensa/include/asm/rwsem.h | 134 ----------------------------------------
>  2 files changed, 1 insertion(+), 134 deletions(-)
>  delete mode 100644 arch/xtensa/include/asm/rwsem.h

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
