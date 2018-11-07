From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [alpha] Debian 9.0 NETINST fails
Date: Wed, 7 Nov 2018 16:12:27 +0100
Message-ID: <847ee7b7-29fa-c1ec-fd1d-610ddad190d9@physik.fu-berlin.de>
References: <20181102184151.GA15241@gherkin.frus.com>
 <20181102185623.GB15241@gherkin.frus.com>
 <4cf52d37-6f60-1714-de43-f9c1b72202c7@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
In-Reply-To: <4cf52d37-6f60-1714-de43-f9c1b72202c7@web.de>
Content-Language: en-US
Resent-Message-ID: <xaof59h19sM.A.djH.wDw4bB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/847ee7b7-29fa-c1ec-fd1d-610ddad190d9@physik.fu-berlin.de
Content-Type: text/plain; charset="us-ascii"
To: Frank Scheiner <frank.scheiner@web.de>, Bob Tracy <rct@gherkin.frus.com>, debian-alpha@lists.debian.org
Cc: linux-alpha@vger.kernel.org, mcree@orcon.net.nz

Hello!

On 11/6/18 1:36 PM, Frank Scheiner wrote:
> I believe since then no newer installer image for Alpha was produced.
I can unfortunately not build updated installer images for Alpha since I
don't have an Alpha porterbox available where I can build the debian-installer
package for Alpha.

I do have two AlphaStation 233 sitting in the basement at the university now,
but I don't have any time and space to set them up to be used as porterboxes.

The only porterbox currently currently available to me is Michael Cree's "electro"
but the repositories of the chroots there don't include the debian-installer
component packages, so building d-i fails - at least last time I tried.

Adrian
