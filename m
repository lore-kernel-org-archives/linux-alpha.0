From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [alpha] Debian 9.0 NETINST fails
Date: Thu, 22 Nov 2018 09:34:29 +0100
Message-ID: <04e3c137-1c38-a377-2442-5ea7d8242041@physik.fu-berlin.de>
References: <20181102184151.GA15241@gherkin.frus.com>
 <20181102185623.GB15241@gherkin.frus.com>
 <4cf52d37-6f60-1714-de43-f9c1b72202c7@web.de>
 <847ee7b7-29fa-c1ec-fd1d-610ddad190d9@physik.fu-berlin.de>
 <20181121205330.GA19204@gherkin.frus.com>
 <20181122053454.5qzz3qvlna3xt2v5@tower>
 <666da863-ccba-2972-c5e4-ae42870c3775@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
In-Reply-To: <666da863-ccba-2972-c5e4-ae42870c3775@gmx.de>
Content-Language: en-US
Resent-Message-ID: <DJIl_dM_J8E.A.GlC.2pn9bB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/04e3c137-1c38-a377-2442-5ea7d8242041@physik.fu-berlin.de
Content-Type: text/plain; charset="us-ascii"
To: Helge Deller <deller@gmx.de>, Michael Cree <mcree@orcon.net.nz>, Bob Tracy <rct@gherkin.frus.com>, Frank Scheiner <frank.scheiner@web.de>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

On 11/22/18 8:58 AM, Helge Deller wrote:
> This is, because that's the way the installer images are being built
> on the original build servers with the unmodified scripts/tools.
> If you want the build process to be able to work with caching proxies,
> someone needs to do modifications and bring them upstream.
> Adrian offered to set up the build process as he has done it for many
> of the architectures already. As far as I read his answers, he seems not
> to be so much interested to do special work now "just" for alpha....
I didn't follow the whole thread so I don't remember what the actual problem
is/was. But what I need is a Debian/Alpha porterbox which has a proper
Debian Ports archive mirror in its sources.list such that the Debian Installer
packages are being mirrored.

Once I have that, I can manually build the debian-installer package on Alpha,
then build fresh images on casulana, the Debian CD build server which has
a full mirror of the Debian Ports archive. The debian-installer package needs
to be built natively, it cannot be cross-built, as far as I know.

I would use qemu-user, but so far trying to build debian-installer with qemu-user
emulating Alpha didn't work. For m68k and sh4, for example, this works fine.

Adrian
