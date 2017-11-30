From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: [BUG] 4.14 cannot find configured disks/partitions
Date: Wed, 29 Nov 2017 23:49:29 -0600
Message-ID: <20171130054929.GC14814@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

On Tue, Nov 28, 2017 at 11:49:55PM -0600, Bob Tracy wrote:
> (...)
> 
> Upon trying to reboot on my 4.13 kernel, I discovered *it's* now broken
> as well, thanks to a recent udev update :-(.  Now I get a bunch of
> timeouts for all the filesystems (including the swap partition) not
> mounted immediately at boot time.  "journalctl -xb" is littered with
> applicable messages of the form
> 
> dev-sdaX.device: Job dev-sdaX.device/start timed out.
> Timed out waiting for device dev-sdaX.device.
> 
> In systemd's emergency mode, I can manually mount (or swapon as
> appropriate) the various sdaX partitions.

I *thought* this particular scenario sounded familiar.  Nearly three
years ago, this problem showed up when "systemd" and "udev" became
dependent on CONFIG_FHANDLE being set in kernel builds.  I didn't
suddenly start unsetting it again, so what changed in 2017?

--Bob
