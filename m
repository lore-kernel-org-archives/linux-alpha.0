From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [RFC 07/12] sh, rwsem: provide __down_write_killable
Date: Wed, 3 Feb 2016 14:19:05 +0300
Message-ID: <56B1E229.3060605@cogentembedded.com>
References: <1454444369-2146-1-git-send-email-mhocko@kernel.org>
 <1454444369-2146-8-git-send-email-mhocko@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=fsP1haTq6/dw/alv+1rKUgQycMaBXA0/B37viTZJrf0=;
        b=E2+6yJAJ2elBz59ajcp1Fdg8L+R7WykPXPrGdadtF8VUt7vpTmi1bZ6lOtgjcQf6Vc
         TSELgTHjVuCAlwMmxGjyrGqBJm9XFv0yvbVBxjtdAphxhTt4vu2Q4CgO4tJJ49TpyWzG
         1IlBVP67xdhRp/GizT/k2rJeMueWVZ8DFTDjsFW90c7breAK5u3vGiXFujvtVxVrdmJ5
         ys1MlCE6jcikE0IqGA2Q5nwnD8hQ4ByIYKj3XfbgrwAjbnaEyeusN0zLKizLaMJr7DeL
         FqufwHcxi0r7mi8utEHZxEvJvB2MSgOwfP476MjGHB7m4Pm6LJ+wmrOQh/spDDCq+1iB
         UKAg==
In-Reply-To: <1454444369-2146-8-git-send-email-mhocko@kernel.org>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michal Hocko <mhocko@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, "David S. Miller" <davem@davemloft.net>, Tony Luck <tony.luck@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, x86@kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.org, Michal Hocko <mhocko@suse.com>

Hello.

On 2/2/2016 11:19 PM, Michal Hocko wrote:

> From: Michal Hocko <mhocko@suse.com>
>
> which is uses the same fast path as __down_write except it falls back to

    s/is//. Same typo (?) in the other patches...

> rwsem_down_write_failed_killable slow path and return -EINTR if killed.
>
> Signed-off-by: Michal Hocko <mhocko@suse.com>

[...]

MBR, Sergei
