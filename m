From: Norbert Preining <preining@logic.at>
Subject: Re: 2.4.27, alpha arch, make bootimage and make bootpfile fails
Date: Wed, 20 Oct 2004 13:19:10 +0200
Message-ID: <20041020111910.GB6569@gamma.logic.tuwien.ac.at>
References: <20041012173344.GA21846@gamma.logic.tuwien.ac.at> <20041013233247.A11663@jurassic.park.msu.ru> <20041014130035.GA4152@gamma.logic.tuwien.ac.at> <20041019195450.A5679@jurassic.park.msu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <20041019195450.A5679@jurassic.park.msu.ru>
Resent-Message-ID: <3Ur96C.A.tBC.zmkdBB@murphy>
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-alpha/>
Content-Type: text/plain; charset="iso-8859-1"
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: linux-kernel@vger.kernel.org, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

On Die, 19 Okt 2004, Ivan Kokshaysky wrote:
> I was able to reproduce that on SX164 with both bootpfile and bootpzfil=
e.
> As it turns out, the final kernel destination overlaps the initial stac=
k
> region. Please test the appended patch.

Bingo. Thanks a lot. I tested bootpfile and this worked without any
problems. Very nice.

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
TUMBY (n.)
The involuntary abdominal gurgling which fills the silence following
someone else's intimate personal revelation.
			--- Douglas Adams, The Meaning of Liff


--=20
To UNSUBSCRIBE, email to debian-alpha-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian=
.org

