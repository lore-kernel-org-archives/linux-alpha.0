From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@mru.ath.cx>
Subject: Re: howto boot alpha via SRM without supported SCSI controller
Date: Fri, 15 Oct 2004 13:37:33 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <yw1xbrf46wle.fsf@ford.guide>
References: <20041015110635.GB24800@gamma.logic.tuwien.ac.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20041015110635.GB24800@gamma.logic.tuwien.ac.at> (Norbert
 Preining's message of "Fri, 15 Oct 2004 13:06:35 +0200")
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Norbert Preining <preining@logic.at>
Cc: linux-alpha@vger.kernel.org, debian-alpha@lists.debian.org

Norbert Preining <preining@logic.at> writes:

> Hi all!
>
> I am looking for a method to boot our alpha after we have upgraded to=
 a
> new SCSI controller, which isn't supported by the SRM console (Adapte=
c).
> (our alpha is CONFIG_PC164)
>
> Up to now I have collected the followng options:
>
> aboot:
> =3D=3D=3D=3D=3D=3D
> - Put aboot and kernel on a floppy, boot from floppy
> 	this is working, but I am not a big friend of it.

aboot and kernel on HD on onboard controller is another option.
That's how I boot my sx164.

> network:
> =3D=3D=3D=3D=3D=3D=3D=3D
> - Boot via network/bootp
> 	this doesn't work up to now, OTOH I want the alpha to be
> 	not dependent on another machine

Have you tried booting with aboot over the network.  It's worked for
me.

> milo:

I wouldn't do that.

--=20
M=E5ns Rullg=E5rd
mru@mru.ath.cx
-
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
