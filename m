From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: recent udev upgrade failure on alpha
Date: Thu, 24 Feb 2011 01:51:49 -0600
Message-ID: <20110224075149.GA28779@gherkin.frus.com>
References: <20110224070203.GA28419@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110224070203.GA28419@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: debian-alpha@lists.debian.org
Cc: linux-alpha@vger.kernel.org, mattst88@gmail.com, mcree@orcon.net.nz

On Thu, Feb 24, 2011 at 01:02:03AM -0600, Bob Tracy wrote:
> Running "dpkg --configure udev" gives me the following:
> 
> udevd[pid]: inotify_init failed: Function not implemented
> udevd[pid]: error initializing inotify
> 
> and the post-installation script fails.
> 
> So...  What's missing or unimplemented on Alpha?  Prior versions of
> "udev" worked just fine.

Found it.  inotify_init1() is a stub function on Alpha.  A heated
discussion *somewhere* produced a udev patch that *may* work:

--- a/udev/udev-watch.c
+++ b/udev/udev-watch.c
@@ -38,8 +38,10 @@ static int inotify_fd = -1;
  */
 int udev_watch_init(struct udev *udev)
 {
-       inotify_fd = inotify_init1(IN_CLOEXEC);
-       if (inotify_fd < 0)
+       inotify_fd = inotify_init();
+       if (inotify_fd >= 0)
+               util_set_fd_cloexec(inotify_fd);
+       else
                err(udev, "inotify_init failed: %m\n");
        return inotify_fd;
 }

(Formatting of the above is probably bogus due to conversion from a
formatted html presentation, but the gist of the fix should be apparent).

Time to retrieve the source package and rebuild it...

-- 
------------------------------------------------------------------------
Bob Tracy          |  "Every normal man must be tempted at times to spit
rct@frus.com       |   upon his hands, hoist the black flag, and begin
                   |   slitting throats."	-- H.L. Mencken
------------------------------------------------------------------------
