From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH] atomic: add *_dec_not_zero
Date: Wed, 4 May 2011 04:33:24 -0400
Message-ID: <BANLkTimctgbto3dsnJ3d3r7NggS0KF9_Sw@mail.gmail.com>
References: <1304458235-28473-1-git-send-email-sven@narfation.org> <AE90C24D6B3A694183C094C60CF0A2F6D8AD0D@saturn3.aculab.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=ZjYSQ3FUv2Mh+C2C8y6rq/DkVU0IKBkQeY8EgZl9N+E=;
        b=JmKIltEPoJoMs5Ywot7vURXXM+ZorhWQ8uB+yucxRNvkd/WAnP7MOjR+NOo76BHiy9
         +ipOg425jJhQfQr5pCXWyB4r9XRaRuk24Vyah/jrRdDmqnHbomG/2C+yYEBt7R9G0TaI
         FAQuLqzfOJ2G24RMUlqrZy8UIkGDpfXvfEHQg=
In-Reply-To: <AE90C24D6B3A694183C094C60CF0A2F6D8AD0D@saturn3.aculab.com>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Laight <David.Laight@aculab.com>
Cc: Sven Eckelmann <sven@narfation.org>, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-mips@linux-mips.org, linux-m32r@ml.linux-m32r.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, linux-cris-kernel@axis.com, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, Chris Metcalf <cmetcalf@tilera.com>, David Howells <dhowells@redhat.com>, linux-m68k@lists.linux-m68k.org, linux-am33-list@redhat.com, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, uclinux-dist-devel@blackfin.uclinux.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org

On Wed, May 4, 2011 at 04:05, David Laight wrote:
>> Introduce an *_dec_not_zero operation. =C2=A0Make this a special cas=
e of
>> *_add_unless because batman-adv uses atomic_dec_not_zero in differen=
t
>> places like re-broadcast queue or aggregation queue management. Ther=
e
>> are other non-final patches which may also want to use this macro.
>
> Isn't there a place where a default definition of this can be
> defined? Instead of adding it separately to every architecture.

that's what asm-generic is for.  if the arch isnt using it, it's
either because the arch needs to convert to it, or they're using SMP
and asm-generic doesnt yet support that for atomic.h.

for example, the Blackfin port only needed updating for the SMP case.
in the non-SMP case, we're getting the def from asm-generic/atomic.h.
-mike
