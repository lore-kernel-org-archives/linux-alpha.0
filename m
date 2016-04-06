From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] sh, rwsem: drop superfluous arch specific implementation
Date: Wed, 6 Apr 2016 11:50:00 +0200
Message-ID: <CAMuHMdUVmNn7eo6K5R37B6_tfuq7CrOBgS_uio93JOBWzvoW1w@mail.gmail.com>
References: <20160404090335.GB10272@dhcp22.suse.cz>
	<1459760800-13477-1-git-send-email-mhocko@kernel.org>
	<1459760800-13477-2-git-send-email-mhocko@kernel.org>
	<20160406092655.GP3448@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc;
        bh=XdZKJazQnpmBMdMXMdOjL6oXWOFD8/vYXIjDHfKzPGs=;
        b=bM9FDJ7ximlbI8MR23Bw0PP2dUeehtzSB3ogJTY6JDm3L8vWl68VjITP5rava5oN2I
         3vuWNxV1L5tGcv/sRIuIX+0frJbtk7cP4m/YxtcNRDbYZi8cWFVdY90fC5ySxkhf/yKb
         bPoLqDNBCVKhCvWpLuEAAp2l3dr6VN91CmlKh2WLZWl7LnD7dh1jtogMIhdRBmVDsfVJ
         JUdmsKRH7UChufrPdzCqGoXO0nC8DP5plgKXaQSf632Zjf6cwbSxrA2bhmnoqWzH+5e8
         bBcm7hKqd4D9wN1hP4MP6afi6QofzJIcb99oFaW+O5O940WKxuw+54MzX+Pikxrlfqjp
         /pZQ==
In-Reply-To: <20160406092655.GP3448@twins.programming.kicks-ass.net>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: Michal Hocko <mhocko@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, "David S. Miller" <davem@davemloft.net>, Tony Luck <tony.luck@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, the arch/x86 maintainers <x86@kernel.org>, alpha <linux-alpha@vger.kernel.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, Linux-Arch <linux-arch@vger.kernel.org>, Michal Hocko <mhocko@suse.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>

Dag Peter,

On Wed, Apr 6, 2016 at 11:26 AM, Peter Zijlstra <peterz@infradead.org> wrote:
> +Cc maintainers, linux-sh list is very high signal-to-noise as its been
> appropriated for renesas arm parts.

FTR, Renesas ARM parts have moved to linux-renesas-soc.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
