From: Gianluca Bonetti <gianluca.bonetti@gmail.com>
Subject: Re: Does SRM care what IDE optical drive it sees?
Date: Fri, 26 Feb 2010 09:41:13 +0100
Message-ID: <6cc5c91e1002260041i27072fbbu2824b564ea75982d@mail.gmail.com>
References: <20100226040843.GA28184@gherkin.frus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=EtA/zSw/qOJq3ZomqNQVCK7hd3zmZ30sLtA/32P8wSY=;
        b=UiJLUoMXq2bwPqnmYslU7hZ65/LADceY63LGLX8duZG2ERY+IYtEJEAGTrNoGhSjvG
         XRoY0xw5V3RGO3hLpUPITXyp0bWbB+KL+Ms3tIMWPJNOoChOlQOpdrJhS/RvqX+5aqrt
         IO++cFlidJgGEQpnG5y7u1JtwUMoyrTJCDUYk=
In-Reply-To: <20100226040843.GA28184@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bob Tracy <rct@gherkin.frus.com>
Cc: linux-alpha@vger.kernel.org, debian-alpha@lists.debian.org

2010/2/26 Bob Tracy <rct@gherkin.frus.com>:
> Situation: I've got a PWS 433au (Miata) on which I've been trying to =
do
> a "from scratch" install of Lenny. =C2=A0(See the gory details on
> debian-alpha). =C2=A0To make a long story short, I had reason to try =
and
> replace the existing CD-ROM drive with a CD-RW burner, and the Alpha
> refused to boot. =C2=A0I couldn't even get the power-up diagnostics t=
o run.
>
> I put the original CD-ROM drive back in the system (and removed the n=
ew
> one). =C2=A0Result: everything works correctly.
>
> Is SRM really that picky about the optical drive? =C2=A0Or did I simp=
ly
> install a defective drive (not likely, but I'll consider the
> possibility)?

Hello Bob.

VMS is very picky about CDROM drives, only a few works.
About Debian GNU/Linux and also NetBSD, I could say you that any CDROM
drive I have usually works good.

Bye
gl
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
