From: "Uwe Schindler" <uwe@thetaphi.de>
Subject: RE: recent udev upgrade failure on alpha
Date: Thu, 24 Feb 2011 11:09:55 +0100
Message-ID: <002101cbd40a$fcb4a610$f61df230$@thetaphi.de>
References: <20110224070203.GA28419@gherkin.frus.com> <20110224075149.GA28779@gherkin.frus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
In-Reply-To: <20110224075149.GA28779@gherkin.frus.com>
Content-Language: de
Resent-Message-ID: <YJWlTeKO8XH.A.gEB.pBjZNB@liszt>
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
Content-Type: text/plain; charset="us-ascii"
To: 'Bob Tracy' <rct@gherkin.frus.com>, debian-alpha@lists.debian.org
Cc: linux-alpha@vger.kernel.org, mattst88@gmail.com, mcree@orcon.net.nz

Hi Bob,

I downgraded udev on this unstable machine by downloading and archiving the
old source package (which is still on the servers for "stable"). This works
for now.

My bigger problem is that recent kernels (even the stable one no longer work
for me). On mounting my root  xfs filesystem it produces a message about a
wrong relocation format / some other linking problem when loading the XFS
.ko (the exact message is not known, its somewhere in the screen buffer of
the already rebooted with older kernel machine, I can only remember what the
problem was - next time I try I will take a pen and write down the message
on console). This happens with the last stable kernel version, did not test
2.7.37-1 until now. 
The last kernel that works for me is 2.6.31-1-alpha-generic. Does anybody
knows what the problem loading the XFS module is?

Unstable is else still running fine!

Uwe

-----
Uwe Schindler
H.-H.-Meier-Allee 63, D-28213 Bremen
http://www.thetaphi.de
eMail: uwe@thetaphi.de


> -----Original Message-----
> From: Bob Tracy [mailto:rct@gherkin.frus.com]
> Sent: Thursday, February 24, 2011 8:52 AM
> To: debian-alpha@lists.debian.org
> Cc: linux-alpha@vger.kernel.org; mattst88@gmail.com; mcree@orcon.net.nz
> Subject: Re: recent udev upgrade failure on alpha
> 
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
> 
> (Formatting of the above is probably bogus due to conversion from a
> formatted html presentation, but the gist of the fix should be apparent).
> 
> Time to retrieve the source package and rebuild it...
> 
> --
> ------------------------------------------------------------------------
> Bob Tracy          |  "Every normal man must be tempted at times to spit
> rct@frus.com       |   upon his hands, hoist the black flag, and begin
>                    |   slitting throats."	-- H.L. Mencken
> ------------------------------------------------------------------------
> 
> 
> --
> To UNSUBSCRIBE, email to debian-alpha-REQUEST@lists.debian.org
> with a subject of "unsubscribe". Trouble? Contact
listmaster@lists.debian.org
> Archive: http://lists.debian.org/20110224075149.GA28779@gherkin.frus.com


