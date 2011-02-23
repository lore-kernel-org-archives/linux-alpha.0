From: Matt Turner <mattst88@gmail.com>
Subject: Re: [patch 00/19] Bugfix and irq_chip conversion
Date: Wed, 23 Feb 2011 21:17:39 +0000
Message-ID: <AANLkTim_67njzyc=gi3S4Bt=n_8LMu1CnU2seSU1VcQs@mail.gmail.com>
References: <20110206143037.124533892@linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=6v9Vp0FyLZQbb1G06W+OslDKkZSCftGrl/ptIl6L6uA=;
        b=osLqoK3dAtPpEK3VCaml/7Cxs3ZCXDNRKBvdh/KQVdBik8uojG1lAESauxoBshOpYL
         /fFocMYqt4xNTQeB4moObzDKSFVvMuWL4T5XyOAioB1BUoSG2wKU0xHLzdvoGEfR8Q61
         85BRP8cG55dl/M1ZsZn/WW7+TRiad42u3+XuY=
In-Reply-To: <20110206143037.124533892@linutronix.de>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-alpha@vger.kernel.org, Kyle McMartin <kyle@redhat.com>

On Sun, Feb 6, 2011 at 2:32 PM, Thomas Gleixner <tglx@linutronix.de> wr=
ote:
> This series fixes the SMP fallout of the doIRQ removal and converts
> all irq chip functions to the new types. Compile tested as far as it
> goes.
>
> Thanks,
>
> =A0 =A0 =A0 =A0tglx

I'm going to do my best to get these tested and included for .38, but
I'm swamped, so I've asked a couple other people to give them a test.

(Just didn't want to you think I was ignoring your patches or that I
didn't appreciate the work. Thanks for the patches. :)

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
