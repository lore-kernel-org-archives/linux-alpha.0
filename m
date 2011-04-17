From: Jay Estabrook <jay.estabrook@gmail.com>
Subject: Re: [bug] 2.6.39-rc3 fails to boot on Alpha
Date: Sun, 17 Apr 2011 14:52:00 -0400
Message-ID: <4DAB36D0.8080503@gmail.com>
References: <19883.912.266127.538215@pilspetsen.it.uu.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=SisSKECVgpWqGXEiFmC37hH9ZxE8SejzheVqZI5+Q8Y=;
        b=RuWaTUihVGIPo8XxuutYHLfUd2s4oe2QfoTaeD/v/VYqO8gaM/a85ppAwmOJZoMNKF
         8preHtB1LnHIXHPrtvnu6MZX40dWEze+NsvqDk2SCNMzunf6OVHwKJxst95lQFD0AW4Y
         9Y7Re9d1gE6D3o3uLKhQZHWkqY08ozsZqX9xQ=
In-Reply-To: <19883.912.266127.538215@pilspetsen.it.uu.se>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mikael Pettersson <mikpe@it.uu.se>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Try replacing the reference to "no_irq_chip" with "dummy_irq_chip"
in arch/alpha/irq_alpha.c: int_rtc_irq().

For me, it was dying in the first RTC interrupt taken.

Jay

On 04/17/2011 11:13 AM, Mikael Pettersson wrote:
> 2.6.39-rc3 doesn't boot on my Alpha (XP900).  As soon as aboot has loaded
> and started the kernel I get:
> 
> halted CPU 0
> 
> halt code = 4
> invalid PTBR
> PC = fffffc00003130d0
> 
> (that PC value points to an "lda" instruction in sys_osf_proplist_syscall)
> 
> There's no other output except this, so I don't think the kernel got very far.
> 
> Haven't checked 2.6.39-rc[12] or bisected anything yet, but 2.6.38 works fine.
> 
> /Mikael
> --
> To unsubscribe from this list: send the line "unsubscribe linux-alpha" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
