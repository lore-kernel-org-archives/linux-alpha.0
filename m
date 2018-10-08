From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH stable v2 2/2] termios, tty/tty_baudrate.c: simplify,
 auto-generate baud table
Date: Mon, 8 Oct 2018 17:46:55 +0200
Message-ID: <20181008154655.GE3332@localhost>
References: <20181008040620.1248277-1-hpa@zytor.com>
 <20181008040620.1248277-3-hpa@zytor.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Vi2/uku5IYxNJTJmia6m4ECLtTso7nN62ecI51I0Nyw=;
        b=Bn8TqaAyVPIU8ZwVyHby1iPr3zyePtz8X9zn+LKTWsCSgm3zEpGOoMtTW6RjBTC2e7
         k7iK4UWG9H/tgOYNMokCCCSZcCQXQi9y1MCaMQJidnIiTsFWe01bKv5i+iD3UKvq4BkG
         WJv0vDX55rRnBEubufOZFt0YbwfXmH+YoLqKo7lGy5xhTScyyO6E8extIjlUpAJsh1+L
         QJa2pV762is809d6srBcHZn0K0Xy61WVHy+nScOOT05+6turQjRf/tqDB46PF3fN28G7
         QXZ0vXO/3WS+Gc3hz8Ekei8CJaoPOOgbrDRkMJAHaPzZEkr5BKONE/2Mlfp1dlcFivja
         m0sQ==
Content-Disposition: inline
In-Reply-To: <20181008040620.1248277-3-hpa@zytor.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org, Tobias Klausmann <klausman@schwarzvogel.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Al Viro <viro@zeniv.linux.org.uk>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Kate Stewart <kstewart@linuxfoundation.org>, Philippe Ombredanne <pombredanne@nexb.com>, Eugene Syromiatnikov <esyr@redhat.com>, linux-alpha@vger.kernel.org, linux-serial@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>, stable@vger.kernel.org

On Sun, Oct 07, 2018 at 09:06:20PM -0700, H. Peter Anvin wrote:
> From: "H. Peter Anvin (Intel)" <hpa@zytor.com>
> 
> Now when all architectures define BOTHER and IBSHIFT, we can
> unconditionally rely on these constants. Furthermore, the code can be
> significantly simplified in a number of places.
> 
> Rather than having two tables and needing to be able to keep them in
> sync at all times, have one auto-generated table. This also lets us
> avoid the fact that architectures that have CBAUDEX == 0 have BOTHER
> in a different location that those that don't.
> 
> The code for masking CBAUDEX as a fallback is never exercised on any
> architecture, because for all architectures, either the baud rate
> table is completely defined for all CBAUD values, or CBAUDEX == 0, so
> we can just remove it.
> 
> Finally, this patch avoids overrunning the baud_table[] for
> architectures with CBAUDEX == 0.

So we need a minimal fix for this only as this patch in particular
should not be backported to stable.

I'm not sure when I'll have time to review this one thoroughly, so
perhaps others can chime in meanwhile.

Johan
