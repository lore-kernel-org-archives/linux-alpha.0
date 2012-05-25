From: Norbert Preining <preining@logic.at>
Subject: Re: Binutils bug with -Wl,--relax
Date: Fri, 25 May 2012 11:17:10 +0900
Message-ID: <20120525021710.GA24052@gamma.logic.tuwien.ac.at>
References: <CAEdQ38FNECGvsADRH-_6qzv660er6-Y5b1xhYk9tJ85KL2raBQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEdQ38FNECGvsADRH-_6qzv660er6-Y5b1xhYk9tJ85KL2raBQ@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha <linux-alpha@vger.kernel.org>

On Do, 24 Mai 2012, Matt Turner wrote:
> I began testing gcc-4.7.0 today on alpha and remembered that >=gcc-4.6
> cannot build itself on alpha without passing -Wl,--no-relax.

I think not only gcc 4.6, but all gcc from 4 on have a similar problme
as far as I remember. I hit this bug (if it is the same) every time
I build TeX Live on alpha-linux when compiling texk/web2c/pdftexdir/writezip.c.
The same args make it work.

Best wishes

Norbert
------------------------------------------------------------------------
Norbert Preining            preining@{jaist.ac.jp, logic.at, debian.org}
JAIST, Japan                                 TeX Live & Debian Developer
DSA: 0x09C5B094   fp: 14DF 2E6C 0307 BE6D AD76  A9C0 D2BF 4AA3 09C5 B094
------------------------------------------------------------------------
Ford grabbed him by the lapels of his dressing gown and
spoke to him as slowly and distinctly and patiently as if
he were somebody from a telephone company accounts
department.
                 --- Ford trying to rectify that situation.
                 --- Douglas Adams, The Hitchhikers Guide to the Galaxy
