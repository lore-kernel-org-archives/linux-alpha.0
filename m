From: Norbert Preining <preining@logic.at>
Subject: Re: 2.6.9 on alpha thread.
Date: Mon, 1 Nov 2004 23:45:15 +0100
Message-ID: <20041101224515.GB13912@gamma.logic.tuwien.ac.at>
References: <200410312215.03450.rezso@rdsor.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200410312215.03450.rezso@rdsor.ro>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Balint Cristian <rezso@rdsor.ro>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Alexander.Rauth@promotion-ie.de, linux-alpha@vger.kernel.org

On Son, 31 Okt 2004, Balint Cristian wrote:
> qlogicisp: mbox_command loop timeout #2

I would take a look at the following thread on linux-scsi:
http://marc.theaimsgroup.com/?t=3D108000526700001&r=3D1&w=3D2

and use the patch from
https://verein.lst.de/~hch/qla1280-isp1040.diff.bz2
(Christoph Hellwig)

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
`The first ten million years were the worst,' said Marvin,
`and the second ten million, they were the worst too. The
third ten million I didn't enjoy at all. After that I went
into a bit of a decline.'
                 --- Marvin reflecting back on his 576,000,003,579 year
                 --- career as Milliways' car park attendent.
                 --- Douglas Adams, The Hitchhikers Guide to the Galaxy
-
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
