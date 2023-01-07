From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] alpha: fix FEN fault handling
Date: Sat, 7 Jan 2023 21:28:19 +0000
Message-ID: <Y7nj80buxCO3u69l@ZenIV>
References: <Y7jD8XDZGnQkTvMI@ZenIV>
 <84c0d4ea-09e2-4907-d03d-939d40fa3c96@twiddle.net>
 <Y7jdARsEQXPugR0t@ZenIV>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=gZ5XmGirc6FCl6ou2Qasr4G69KVXbpNVAED/n34XKmY=; b=GwYMpCxOsC5bIi02qz3OvrHrjM
        eFp7IWCI81rHwWO06k46VsOYFJrOZ0ht/tmsvIbYSoJke0COmGPPn5jemp3pNDRJRoCXBGKPODDtr
        tKOgo9ur1OaZPJv9kKsSe30Gq71u7lnUeRlTels09XTfftiYZqwPS+8P6345PZoEDXhSz++RKp0gH
        qtQooygv8hOtZMwmthUPlt47vLbOfe+QtjD43QndHSSGEQ3PYaozFVJyRodIwy6xf0lK+boHm21RY
        KaxIzchTGwDvij3zVMvNEU/OshVbeSnWPnn1UvAg+4oew+vtnKrcvSrqFDJgblJYFvZ8orUSX8+lW
        XVUB1hKw==;
Content-Disposition: inline
In-Reply-To: <Y7jdARsEQXPugR0t@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Jan 07, 2023 at 02:46:26AM +0000, Al Viro wrote:

> Not sure it's worth bothering with in palcode-clipper - for Linux it's
> useless (run out of timeslice and FEN will end up set, no matter what),
> nothing in NetBSD or OpenBSD trees generates that call_pal, current
> FreeBSD doesn't support alpha and their last version to do so hadn't
> generated that call_pal either...  What else is out there?  OSF?

BTW, out of curiosity - what was
              case 5: /* illoc */
              default: /* unexpected instruction-fault type */
about in that switch in do_entIF()?

All documentation I'd been able to find had only 0..4 as expected
values (bpt/bugcheck/gentrap/fen/opdec)...
