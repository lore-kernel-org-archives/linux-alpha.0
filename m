From: Helge Deller <deller@gmx.de>
Subject: Re: [alpha] Debian 9.0 NETINST fails
Date: Thu, 22 Nov 2018 08:58:23 +0100
Message-ID: <666da863-ccba-2972-c5e4-ae42870c3775@gmx.de>
References: <20181102184151.GA15241@gherkin.frus.com>
 <20181102185623.GB15241@gherkin.frus.com>
 <4cf52d37-6f60-1714-de43-f9c1b72202c7@web.de>
 <847ee7b7-29fa-c1ec-fd1d-610ddad190d9@physik.fu-berlin.de>
 <20181121205330.GA19204@gherkin.frus.com>
 <20181122053454.5qzz3qvlna3xt2v5@tower>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
In-Reply-To: <20181122053454.5qzz3qvlna3xt2v5@tower>
Content-Language: en-US
Resent-Message-ID: <cHmNSigOXiK.A.TyF.NHm9bB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/666da863-ccba-2972-c5e4-ae42870c3775@gmx.de
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michael Cree <mcree@orcon.net.nz>, Bob Tracy <rct@gherkin.frus.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Frank Scheiner <frank.scheiner@web.de>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

Hi Michael,

On 22.11.18 06:34, Michael Cree wrote:
> On Wed, Nov 21, 2018 at 02:53:30PM -0600, Bob Tracy wrote:
>> On Wed, Nov 07, 2018 at 04:12:27PM +0100, John Paul Adrian Glaubitz wrote:
>>> I can unfortunately not build updated installer images for Alpha since I
>>> don't have an Alpha porterbox available where I can build the debian-installer
>>> package for Alpha.
>>>
>>> I do have two AlphaStation 233 sitting in the basement at the university now,
>>> but I don't have any time and space to set them up to be used as porterboxes.
>>>
>>> The only porterbox currently currently available to me is Michael Cree's "electro"
>>> but the repositories of the chroots there don't include the debian-installer
>>> component packages, so building d-i fails - at least last time I tried.
>>
>> I've carved out a bit of time to deal with getting my PWS back on-line.
>> The above is the most recent post in the thread, as far as I can tell...
>>
>> Michael -- is it a relatively easy thing to do to make the d-i component
>> packages available on "electro"?
> 
> I am not exactly sure what the problem is, but reading between the
> lines I am starting to get the impression that Adrian expected the
> package cache to be a complete copy of the archive.

Yes.
This is, because that's the way the installer images are being built
on the original build servers with the unmodified scripts/tools.
If you want the build process to be able to work with caching proxies,
someone needs to do modifications and bring them upstream.
Adrian offered to set up the build process as he has done it for many
of the architectures already. As far as I read his answers, he seems not
to be so much interested to do special work now "just" for alpha....

> It is not and it is not intended to be. Approx works by caching only
> those things that have been previously requested.
Sure, understood.

> If I have surmised correctly then one only needs to issue a download
> request to approx for the missing packages (and it should not matter
> with that is a .deb or a .udeb) and that should get it into the local
> cache.

Someone has to do it then...

What's the problem of having a complete copy of the archive on electro?

Helge

>> Another option: is the SMP version of the 4.9.0-3 kernel available to
>> substitute into the existing netinst image?
> 
> That's for Adrian to answer.  I am not familiar with building an
> installer image.
> 
> Cheers,
> Michael.
> 

