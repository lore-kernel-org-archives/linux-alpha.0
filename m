From: Norbert Preining <preining@logic.at>
Subject: Re: 2.4.27, alpha arch, make bootimage and make bootpfile fails
Date: Wed, 13 Oct 2004 23:10:29 +0200
Message-ID: <20041013211029.GB5056@gamma.logic.tuwien.ac.at>
References: <20041012173344.GA21846@gamma.logic.tuwien.ac.at> <20041013233247.A11663@jurassic.park.msu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <20041013233247.A11663@jurassic.park.msu.ru>
Resent-Message-ID: <ZoTdGC.A.v9D.OnZbBB@murphy>
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-alpha/>
Content-Type: text/plain; charset="iso-8859-1"
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: linux-kernel@vger.kernel.org, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

On Mit, 13 Okt 2004, Ivan Kokshaysky wrote:
> > /usr/src/linux-2.4.27/arch/alpha/lib/lib.a -o bootloader
> > /usr/src/linux-2.4.27/lib/lib.a(vsprintf.o): In function `vsnprintf':
> > vsprintf.o(.text+0xcd4): undefined reference to `printk'
>=20
> Thanks for the report. The appended patch should fix that.

Thanks a lot. This fixed it. Testing will be done tomorrow.

Best wishes

Norbert

-------------------------------------------------------------------------=
------
Norbert Preining <preining AT logic DOT at>         Technische Universit=E4=
t Wien
gpg DSA: 0x09C5B094      fp: 14DF 2E6C 0307 BE6D AD76  A9C0 D2BF 4AA3 09C=
5 B094
-------------------------------------------------------------------------=
------
WHAPLODE DROVE (n.)
A homicidal golf stroke.
			--- Douglas Adams, The Meaning of Liff


--=20
To UNSUBSCRIBE, email to debian-alpha-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian=
.org

