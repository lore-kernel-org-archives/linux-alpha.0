From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@mru.ath.cx>
Subject: Re: howto boot alpha via SRM without supported SCSI controller
Date: Fri, 22 Oct 2004 17:15:13 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <yw1x1xfq3htq.fsf@mru.ath.cx>
References: <20041015110635.GB24800@gamma.logic.tuwien.ac.at>
	<yw1xbrf46wle.fsf@ford.guide>
	<20041022122428.GA6808@gamma.logic.tuwien.ac.at>
	<yw1xr7nq3ogx.fsf@mru.ath.cx>
	<20041022132629.GE6808@gamma.logic.tuwien.ac.at>
	<yw1xekjq3kcz.fsf@mru.ath.cx>
	<20041022144352.GB22918@gamma.logic.tuwien.ac.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20041022144352.GB22918@gamma.logic.tuwien.ac.at> (Norbert
 Preining's message of "Fri, 22 Oct 2004 16:43:52 +0200")
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Norbert Preining <preining@logic.at>
Cc: linux-alpha@vger.kernel.org, debian-alpha@lists.debian.org

Norbert Preining <preining@logic.at> writes:

>> >> The Digital Tulip series usually work well (surprise).  They are
>> >> getting rare these days, though.
>> >
>> I've used several tulip cards, never had a problem.  What does lspci
>> identify it as?
>
> 00:05.0 Ethernet controller: Digital Equipment Corporation DECchip 21=
140 [FasterNet] (rev 22)
>         Subsystem: D-Link System Inc DFE-500TX Fast Ethernet
>         Flags: bus master, medium devsel, latency 32, IRQ 25
>         I/O ports at 8800 [size=3D128]
>         Memory at 000000000a104000 (32-bit, non-prefetchable) [size=3D=
128]
>         Expansion ROM at 000000000a080000 [disabled] [size=3D256K]
>
> What do you have in your machine?

My tulip cards are genuine Digital brand cards, which might explain
the difference.

> BTW: As you seem to have a SX164, too: Do you experience `autistic'
> behaviour (ie, noreaction to kbd, net, whatever, but still working
> because I see -- after reboot -- marks in the syslog file) when the
> SX164 is connected to a 100Mb port? As soon as we plug our SX164 into=
 a
> 100Mb port and there is heavy networking load, the machine suddenly
> becomes autistic as described.

I haven't seen any of that behavior.

--=20
M=E5ns Rullg=E5rd
mru@mru.ath.cx
-
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
