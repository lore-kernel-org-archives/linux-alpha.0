From: "Uwe Schindler" <uwe@thetaphi.de>
Subject: RE: recent udev upgrade failure on alpha
Date: Fri, 15 Jul 2011 16:04:00 +0200
Message-ID: <00af01cc42f8$0c691e40$253b5ac0$@thetaphi.de>
References: <20110224070203.GA28419@gherkin.frus.com> <20110224075149.GA28779@gherkin.frus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20110224075149.GA28779@gherkin.frus.com>
Content-Language: de
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Bob Tracy' <rct@gherkin.frus.com>, debian-alpha@lists.debian.org
Cc: linux-alpha@vger.kernel.org, mattst88@gmail.com, mcree@orcon.net.nz

Hi,

today I had some time to get my machine out of the XFS relocation failure on
booting, it now boots with EXT4 as root file system (was hard word, see
below). I have now linux-image-2.6.38-2-alpha-generic running (installed
from debian-ports) and system runs fine for now.

I tried then to upgrade the package "udev" (was on hold, to prevent me from
making system unbootable), with the hope that the inotify is working with
this debian kernel. Unfortunately that's not the case, UDEV complains about
missing inotify.

So is the patch below already included in some kernel images available? Or
does somebody have a recent udev version as .deb packages?

> On Thu, Feb 24, 2011 at 01:02:03AM -0600, Bob Tracy wrote:
> > Running "dpkg --configure udev" gives me the following:
> >
> > udevd[pid]: inotify_init failed: Function not implemented
> > udevd[pid]: error initializing inotify
> >
> > and the post-installation script fails.
> >
> > So...  What's missing or unimplemented on Alpha?  Prior versions of
> > "udev" worked just fine.
> 
> Found it.  inotify_init1() is a stub function on Alpha.  A heated
discussion
> *somewhere* produced a udev patch that *may* work:
> 
> --- a/udev/udev-watch.c
> +++ b/udev/udev-watch.c
> @@ -38,8 +38,10 @@ static int inotify_fd = -1;
>   */
>  int udev_watch_init(struct udev *udev)
>  {
> -       inotify_fd = inotify_init1(IN_CLOEXEC);
> -       if (inotify_fd < 0)
> +       inotify_fd = inotify_init();
> +       if (inotify_fd >= 0)
> +               util_set_fd_cloexec(inotify_fd);
> +       else
>                 err(udev, "inotify_init failed: %m\n");
>         return inotify_fd;
>  }

Uwe

P.S.: It was hard work to get my root file system converted, as the CD-ROM
drive is broken and I had no success setting up netboot. Finally this is
what I did to get rid of XFS:
- In aboot type in the kernel boot line by hand, but remove the root=/....
parameter. Tis makes initrd fail on mounting the root file system (this is
what I wanted to achieve). It falls to a shell, yipee
- Unfortunately the shell has no tools at all, so I created /mnt and /mnt2,
mounted my root filesystem to /mnt using busybox, also a USB2.0 harddisk as
backup to second /mnt2 point
- tarred the whole root file system to USB's /mnt2 (using busybox tar)
- copied /mnt/lib and /mnt/sbin to / (just to have it available after
unmounting everything again)
- unmount mounted root
- produce symlink in rootfs's /etc/mtab to /proc/mounts (to make ext2-tools
happy)
- recreate filesystem as EXT4 using the copied tools
- mount disk again to /mnt
- untar from USB HDD to /mnt
- flush and unmounts everything from busybox shell
- reboot and it was working with ext4 :-)
(so its possible without a boot disk, only with the default initramfs to fix
and create your root filesystem - phantastic)

