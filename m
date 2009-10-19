From: Matt Turner <mattst88@gmail.com>
Subject: Re: Unimplemented syscalls on Alpha
Date: Mon, 19 Oct 2009 11:53:25 -0400
Message-ID: <b4198de60910190853k54267f9flcf6453d6e23f6da3@mail.gmail.com>
References: <1255939868-5050-1-git-send-email-mcree@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=5UN2gxDmYeTe3527tl5tyo1H2njX2f6QIX2LjsJZOVA=;
        b=PgeBGXK9sLU9KQL2tLTBFtM9nyoAZExlukS4LNVU9pSUhNUZKxNizssXJtGkwYiScV
         F1+P7ccHjdYYuZl/IA6X2DgJWP+8sTOcplWMB9FJbif22+X6r5mtrejHga5xTuT8t/X+
         lLOxo42dQ7MD/sMcmojm0xCDWCikDShmsSDUw=
In-Reply-To: <1255939868-5050-1-git-send-email-mcree@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michael Cree <mcree@orcon.net.nz>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Oct 19, 2009 at 4:11 AM, Michael Cree <mcree@orcon.net.nz> wrot=
e:
> I couldn't but help notice the increasing number of unimplemented sys=
calls
> on the Alpha architecture. =A0I thought I might poke around to see wh=
at might
> be required to get these implemented and got a pleasant surprise when=
 it
> seems some only need an entry in the syscall table. =A0Indeed, the pa=
tch in
> reply to this message gets preadv and pwritev going -- tested with th=
e
> sample program at http://lkml.org/lkml/2009/4/6/535.

Cool. I was looking into doing this, but I didn't know how to test the =
syscalls.

I tried to keep a list of missing syscalls here,
http://alphalinux.org/wiki/index.php/TODO_List but as you can see it's
already out of date.

> I am happy to write patches to wire up more of the syscalls, but I am
> wondering which ones are as straightforward as the preadv/pwritev cas=
e?
> That is, do any require extra programming other than the syscall tabl=
e? =A0Do
> I need to get the entries in the syscall table in the same order as o=
ther
> architectures?

I'm curious and unsure about this too. Patches would be great. I think
we should figure out who we need to CC to get patches into the kernel,
as neither of our maintainers have any sort of Alpha tree. I've
noticed a few patches submitted to this list have never made it into
the kernel, as well, maybe we should start an alpha tree?

The entries do not need to be in the same order of have the same
number as other architectures, just once you set the number you cannot
change it (without breaking the ABI).

Thanks Michael,
Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
