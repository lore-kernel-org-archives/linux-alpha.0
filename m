From: Norbert Preining <preining@logic.at>
Subject: howto boot alpha via SRM without supported SCSI controller
Date: Fri, 15 Oct 2004 13:06:35 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20041015110635.GB24800@gamma.logic.tuwien.ac.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-alpha@vger.kernel.org, debian-alpha@lists.debian.org

Hi all!

I am looking for a method to boot our alpha after we have upgraded to a
new SCSI controller, which isn't supported by the SRM console (Adaptec)=
=2E
(our alpha is CONFIG_PC164)

Up to now I have collected the followng options:

aboot:
=3D=3D=3D=3D=3D=3D
- Put aboot and kernel on a floppy, boot from floppy
	this is working, but I am not a big friend of it.

network:
=3D=3D=3D=3D=3D=3D=3D=3D
- Boot via network/bootp
	this doesn't work up to now, OTOH I want the alpha to be
	not dependent on another machine

milo:
=3D=3D=3D=3D=3D
- Put milo on a flopy disk and boot SRM -> milo
	i haven't succeeded with this up to now, only once with a=20
	very old milo.dd, but then I need a second floppy for the kernel
	and this is not feasible
- put mile (if it is running once) into the flash
	hmm, that would be nice ...


So now my questions:
- How do I make a milo bootable floppy?
	I want to take the milo images from http://milo.core-systems.de/
	(Stefan Reinauer), but there is no milo.dd. I found a
	description how to accomplish this:
		objstrip -v -p milo-image mboot
		cat mboot milo-image > milo.dd
	I dd this milo.dd onto a floppy, booted from it, but the process
	stuck at
		Jumping to PALcode
	(or something similar)

- Now assume I can get milo to boot. Is it possible to write milo into
  the flash as described in the MILO HOWTO?
	Our machine is a PC164 board (Booting on EB164 variation PC164
	using machine vector PC164 from SRM, CONFIG_PC164).

- Finally, are there any other options to boot this alpha
	. without the need for another machine (boot server)
	. without floppy
=09

Thanks a lot for any suggestions!

Best wishes

Norbert

-----------------------------------------------------------------------=
--------
Norbert Preining <preining AT logic DOT at>         Technische Universi=
t=E4t Wien
gpg DSA: 0x09C5B094      fp: 14DF 2E6C 0307 BE6D AD76  A9C0 D2BF 4AA3 0=
9C5 B094
-----------------------------------------------------------------------=
--------
PODE HOLE (n.)
A hole drilled in chipboard lavatory walls by homosexuals for any one
of a number of purposes.
			--- Douglas Adams, The Meaning of Liff
-
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
