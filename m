From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@mru.ath.cx>
Subject: Re: 2.4.27, alpha arch, make bootimage and make bootpfile fails
Date: Thu, 14 Oct 2004 19:23:12 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <yw1xis9d8b9b.fsf@ford.guide>
References: <20041012173344.GA21846@gamma.logic.tuwien.ac.at>
	<20041013233247.A11663@jurassic.park.msu.ru>
	<20041014130035.GA4152@gamma.logic.tuwien.ac.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20041014130035.GA4152@gamma.logic.tuwien.ac.at> (Norbert
 Preining's message of "Thu, 14 Oct 2004 15:00:35 +0200")
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Norbert Preining <preining@logic.at>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-kernel@vger.kernel.org, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

Norbert Preining <preining@logic.at> writes:

> Dear Ivan, dear kernel kackers!
>
> On Mit, 13 Okt 2004, Ivan Kokshaysky wrote:
>> > 	make bootpfile
>
> Ok, now I have a boot file but the kernel is not started:
>
>>>> boot ewa0 -fl ...
> ...
> jumping to bootstrap code
> Linux/AXP bootp loader for linux 2.4.27
> Switching to OSF PAL-code .. 0k (rev 1000800020117)
> Loading the kernel...'root=3D/dev/sda1'
>
> Halted CPU 0
>
> halt code =3D 2
> kernel stack not valid halt
> PC =3D 200000000
> boot failure

Try building more things as modules instead of builtin, if possible.

--=20
M=E5ns Rullg=E5rd
mru@mru.ath.cx
-
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
