From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: fix compile error from IRQ clean up
Date: Wed, 9 Mar 2011 17:41:33 +0000
Message-ID: <AANLkTi=kuPM3oq86M4Ztc6D2yK-UhLo2Amx8DRqfY_kw@mail.gmail.com>
References: <1299687313-13363-1-git-send-email-mattst88@gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=URmeeAMTLEoDP7jlPpK/YYjke4n3VNQV8fO3aWsoX68=;
        b=UgvSpl8OYXEqCDyui3D0v3apYztwLTfb5weTFQX9fePKc4KY7lnLmgs8ZmW19HAOyj
         elLZDVM8UAmsXaAvhCKdTdhxKbsgANkAGYhqNv36oblRvyoEAdU7p/E501Y59/fk7dr6
         cHTR7NNqJDie7KmtuCAVNWT8C3pHIfoHasJmE=
In-Reply-To: <1299687313-13363-1-git-send-email-mattst88@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org, Matt Turner <mattst88@gmail.com>

On Wed, Mar 9, 2011 at 4:15 PM,  <mattst88@gmail.com> wrote:
> From: Matt Turner <mattst88@gmail.com>

Ah, crap. This is clearly supposed to have a

Signed-off-by: Matt Turner <mattst88@gmail.com>
