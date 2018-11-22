From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [alpha] Debian 9.0 NETINST fails
Date: Thu, 22 Nov 2018 18:34:54 +1300
Message-ID: <20181122053454.5qzz3qvlna3xt2v5@tower>
References: <20181102184151.GA15241@gherkin.frus.com>
 <20181102185623.GB15241@gherkin.frus.com>
 <4cf52d37-6f60-1714-de43-f9c1b72202c7@web.de>
 <847ee7b7-29fa-c1ec-fd1d-610ddad190d9@physik.fu-berlin.de>
 <20181121205330.GA19204@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <20181121205330.GA19204@gherkin.frus.com>
Resent-Message-ID: <RXZJKQaL9BO.A.ZyC._3k9bB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20181122053454.5qzz3qvlna3xt2v5@tower
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@gherkin.frus.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Frank Scheiner <frank.scheiner@web.de>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

On Wed, Nov 21, 2018 at 02:53:30PM -0600, Bob Tracy wrote:
> On Wed, Nov 07, 2018 at 04:12:27PM +0100, John Paul Adrian Glaubitz wrote:
> > I can unfortunately not build updated installer images for Alpha since I
> > don't have an Alpha porterbox available where I can build the debian-installer
> > package for Alpha.
> > 
> > I do have two AlphaStation 233 sitting in the basement at the university now,
> > but I don't have any time and space to set them up to be used as porterboxes.
> > 
> > The only porterbox currently currently available to me is Michael Cree's "electro"
> > but the repositories of the chroots there don't include the debian-installer
> > component packages, so building d-i fails - at least last time I tried.
> 
> I've carved out a bit of time to deal with getting my PWS back on-line.
> The above is the most recent post in the thread, as far as I can tell...
> 
> Michael -- is it a relatively easy thing to do to make the d-i component
> packages available on "electro"?

I am not exactly sure what the problem is, but reading between the
lines I am starting to get the impression that Adrian expected the
package cache to be a complete copy of the archive.  It is not and
it is not intended to be. Approx works by caching only those things
that have been previously requested.

If I have surmised correctly then one only needs to issue a download
request to approx for the missing packages (and it should not matter
with that is a .deb or a .udeb) and that should get it into the local
cache.

> Another option: is the SMP version of the 4.9.0-3 kernel available to
> substitute into the existing netinst image? 

That's for Adrian to answer.  I am not familiar with building an
installer image.

Cheers,
Michael.

