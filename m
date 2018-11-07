From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: [alpha] Debian 9.0 NETINST fails
Date: Wed, 7 Nov 2018 09:08:26 -0600
Message-ID: <20181107150826.GA9833@gherkin.frus.com>
References: <20181102184151.GA15241@gherkin.frus.com>
 <20181102185623.GB15241@gherkin.frus.com>
 <4cf52d37-6f60-1714-de43-f9c1b72202c7@web.de>
Mime-Version: 1.0
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <4cf52d37-6f60-1714-de43-f9c1b72202c7@web.de>
Resent-Message-ID: <x12WU-gTHrG.A.bIH.DAw4bB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20181107150826.GA9833@gherkin.frus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Scheiner <frank.scheiner@web.de>
Cc: debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org, mcree@orcon.net.nz, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

On Tue, Nov 06, 2018 at 01:36:45PM +0100, Frank Scheiner wrote:
> sorry, looks like I missed your mails to the debian-alpha list until now.

Not a problem.  As a temporary workaround, I've got an "amd64" "testing"
distro loaded on a spare i5-based system.  We have time to explore
options and possibly put together a "recent" alpha installer that will work.

> (...) 
> ****
> 
> As a workaround, could it work to netboot the matching stock SMP kernel
> (4.9.0-3) with the netboot installer initrd from [1]? I don't know how to
> extract the initrd from the `netabootwrap`ed image though.

Example:
# mount -t iso9660 debian-9.0-alpha-NETINST-1.iso /mnt/cdrom -o loop,ro

> Or could it work to netboot the SMP kernel with the cdrom installer initrd
> from [1] and the installer CDROM in the CDROM drive?
> 
> [1]. http://ftp.ports.debian.org/debian-ports/pool-alpha/main/d/debian-installer/debian-installer-images_20170615_alpha.tar.gz
> 
> ****
> 
> Other approach: as per [2] hppa for example uses two kernels. So could we
> just change [2] for alpha to also include the SMP kernel, with e.g. that
> patch:
> 
> ```
> --- debian/installer/kernel-versions	2018-11-06 13:30:54.152319148 +0100
> +++ debian/installer/kernel-versions-new	2018-11-06 13:31:38.992320296 +0100
> @@ -1,5 +1,6 @@
>  # arch     version flavour       installedname suffix build-depends
>  alpha      -       alpha-generic -             y      -
> +alpha      -       alpha-smp     -             y      -
>  amd64      -       amd64         -             -      -
>  arm64      -       arm64         -             -      -
>  armel      -       marvell       -             y      -
> ```
> 
> ...and the installer images will also include the SMP kernel?
> 
> [2]: https://salsa.debian.org/kernel-team/linux/raw/master/debian/installer/kernel-versions

I'm not going to be able to look at this too closely for the next few
days, but my thought was to simply replace the generic kernel with the
smp kernel on the existing "netinst" ISO.  The most obvious issue is
finding (or building) the correct version of the smp kernel.  Rebuilding
the ISO image once the kernel binary has been copied into place looks to
be a straightforward procedure: the relevant details are present on the
existing ISO image in the ".disk" directory (the "mkisofs" file).

This isn't the correct fix by any means, but as workarounds go, not too
distasteful because everything else on the installer image remains
unchanged (except for possibly a few file checksums if anything involved
in the actual installation process cares about them).

At the moment, I don't have the necessary infrastructure to build an
alpha kernel.  If someone could build the appropriate 4.9.0-3 smp kernel
and make it available for download, I think I can handle the rest...

I guess while I'm poking around in the existing ISO image, I should look
to see which video drivers are included in the "initrd" image.  A non-
graphical method of installation is perfectly acceptable if that's an
option: for all I know, that *is* the option :-).

As far as thinking outside the box a little bit, it's helpful to
consider what my actual goal(s) might be.  What I really need to be
able to do is (a) partition the hard disk; (b) create file systems;
(c) install the "aboot" boot sector; and (d) copy my backup into place
from an external USB device.  If having USB support on a CD booted in
"rescue" mode is expecting a bit much, the restoration could be
accomplished over a network connection (trivially if NFS support is
built into the mix).  In other words, I don't really need to be able
to do even a minimal Debian installation.  Depending on the "rescue"
feature set available, even an older known-to-work alpha installer
image might be sufficient to accomplish what I want.  With an older
installer image, the main concerns would be support for "ext3/ext4"
file system types, and having the most recent version of "aboot".  The
Debian 8.0 installer might meet those basic requirements: I haven't
checked.

--Bob

