From: Bob Tracy <rct@gherkin.frus.com>
Subject: X11 on Alpha running Debian "sid"
Date: Mon, 8 Oct 2018 13:49:27 -0500
Message-ID: <20181008184927.GA7997@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
Resent-Message-ID: <tb3aD0FdIXO.A.D1E.Kb6ubB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20181008184927.GA7997@gherkin.frus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: debian-alpha@lists.debian.org

It had been an *extremely* long time since I dared try to run a graphical
console on my PWS 433au, so I screwed-up my courage and gave it a try...

"sddm" is extremely slow to initialize, and even slower to respond to
both keyboard and mouse input.  Usually, this means something screwy
going on with acceleration, which historically has barely worked on this
platform anyway.  AIGLX is something new showing up in the "Xorg.log.0"
file that wasn't there the last time I had X11 working (which should
tell you something about how long it has been), so that's a prime suspect.

On the system configuration side of things, the video card is a Radeon 7500
(RV200), which is pretty much as good as it gets on the Alpha.  Modern Xorg
releases do a respectable job of figuring things out on their own as far as
not needing to override anything (or at least not much) in a "xorg.conf"
file, so I moved that out of the way as part of the debugging effort.
That didn't make any difference as best I can tell, i.e., the display
still initializes properly, and while Xorg.0.log has a lot more
information related to "figuring things out" in it, there's nothing
there to raise an eyebrow.

KDE and GNOME are both elephantine on a 1.5 GB machine in 2018, so I'm
attempting to run with AfterStep.  It seems to mostly work, or *will*
when I replace all the "x-terminal-emulator" in-/re-direction going on
in the Wharf configuration.  Out of the box, the configuration seems
predisposed to use the gnome terminal, whereas AfterStep should default
to aterm --> urxvt.

So, if someone can provide a hint or three as to how to make "sddm" more
responsive, that would be much appreciated.  Alternatively, if I need to
be using a different display manager, suggestions would be appreciated
as long as they're window-manager-agnostic.  In particular, substantial
dependencies on KDE infrastructure should probably be avoided :-(.

--Bob

