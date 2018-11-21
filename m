From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: [alpha] Debian 9.0 NETINST fails
Date: Wed, 21 Nov 2018 14:53:30 -0600
Message-ID: <20181121205330.GA19204@gherkin.frus.com>
References: <20181102184151.GA15241@gherkin.frus.com>
 <20181102185623.GB15241@gherkin.frus.com>
 <4cf52d37-6f60-1714-de43-f9c1b72202c7@web.de>
 <847ee7b7-29fa-c1ec-fd1d-610ddad190d9@physik.fu-berlin.de>
Mime-Version: 1.0
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <847ee7b7-29fa-c1ec-fd1d-610ddad190d9@physik.fu-berlin.de>
Resent-Message-ID: <4QzhNvWXKEN.A.ZhF.fXc9bB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20181121205330.GA19204@gherkin.frus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Frank Scheiner <frank.scheiner@web.de>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org, mcree@orcon.net.nz

On Wed, Nov 07, 2018 at 04:12:27PM +0100, John Paul Adrian Glaubitz wrote:
> I can unfortunately not build updated installer images for Alpha since I
> don't have an Alpha porterbox available where I can build the debian-installer
> package for Alpha.
> 
> I do have two AlphaStation 233 sitting in the basement at the university now,
> but I don't have any time and space to set them up to be used as porterboxes.
> 
> The only porterbox currently currently available to me is Michael Cree's "electro"
> but the repositories of the chroots there don't include the debian-installer
> component packages, so building d-i fails - at least last time I tried.

I've carved out a bit of time to deal with getting my PWS back on-line.
The above is the most recent post in the thread, as far as I can tell...

Michael -- is it a relatively easy thing to do to make the d-i component
packages available on "electro"?

Another option: is the SMP version of the 4.9.0-3 kernel available to
substitute into the existing netinst image?  Unless I'm missing something,
rebuilding the ISO with that substitution appears to be a simple task
(assuming the existing initrd image for the generic kernel can be used).
I *did* see further postings indicating that, while the SMP kernel *did*
boot where the generic one wouldn't, there were other issues encountered
subsequent to booting.

I have not yet tried a prior netinst image, so there's a window of
opportunity here are far as me being a willing/motivated tester of the
installer if a working one can be cobbled together.  After all, I'm
currently sitting at the "worst case scenario" state and would lose
nothing but a bit of time by trying a new installer :-).  For that
matter, if "the community" thinks a better thing to do would be to try
out the Gentoo installer, I think I could get to the desired end state
via that route as well.

Opinions welcome.

--Bob

