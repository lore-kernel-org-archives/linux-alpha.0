From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: PWS 433au (Miata) recovery update
Date: Wed, 16 Jan 2019 16:50:44 -0600
Message-ID: <20190116225044.GA16573@gherkin.frus.com>
References: <20190116071014.GA11881@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <20190116071014.GA11881@gherkin.frus.com>
Resent-Message-ID: <PBkqRZzd9ZN.A.Q9D.TV7PcB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20190116225044.GA16573@gherkin.frus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org
Cc: mcree@orcon.net.nz, mattst88@gmail.com

On Wed, Jan 16, 2019 at 01:10:14AM -0600, Bob Tracy wrote:
> (initramfs / systemd / udevd issue)

I think I may have this one painted into a corner...

CONFIG_UNIX (at least) needs to be "y" instead of "m".  This is a
relatively new dependency.

For userland applications used in the boot process to have such
dependencies on kernel configuration options is "unfortunate" to
put it mildly.

--Bob

