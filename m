From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: recent udev upgrade failure on alpha
Date: Thu, 24 Feb 2011 04:25:47 -0600
Message-ID: <20110224102547.GA29330@gherkin.frus.com>
References: <20110224070203.GA28419@gherkin.frus.com> <4D662AD3.5000700@orcon.net.nz>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4D662AD3.5000700@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: debian-alpha@lists.debian.org, mattst88@gmail.com, linux-alpha@vger.kernel.org

On Thu, Feb 24, 2011 at 10:54:27PM +1300, Michael Cree wrote:
> Oops, sorry, I should've sent a message to the list to warn people of this!

Not your job to protect us from ourselves :-).  Besides...  What better
way to see who's still actively (in some sense) involved in the Alpha
community, eh?

> As you have identified the problem is that the syscall inotify_init1() 
> is not implemented in the Debian supplied kernel.  It did not make it 
> into the kernel until version 2.6.33. I did submit a bug report and a 
> patch to update the kernel to the Debian bugzilla but I was too late and 
> the Squeeze freeze beat me to it and it didn't get included.

Actually, I've been running "sid" for a long time...  The risk of a
broken system has always been there, but needless to say I've been
lucky.  Besides, that's the only way to get current packages on the
Alpha from Debian these days.  That's a roundabout way of saying I'm
running late enough kernels (both Debian-supplied and built from
kernel.org source) that inotify_init1() was definitely present in the
running kernel when I did the upgrade.  As you point out later in your
reply, libc6.1 hasn't caught up on Alpha: I noticed the stubbed-out
function.

As I type this, I'm back up and running with a patched udev_166-1.  It
was easier and faster to patch/build "udev" than do a libc6.1 build.
When the smoke cleared, I simply copied in the new version of
"/sbin/udevd" and was finally able to configure the installed package
(as well as the other 49-or-so packages).  That's more excitement than I
wanted this evening: local time is now 0424 and I've been up since 0700
yesterday :-(.

-- 
------------------------------------------------------------------------
Bob Tracy          |  "Every normal man must be tempted at times to spit
rct@frus.com       |   upon his hands, hoist the black flag, and begin
                   |   slitting throats."	-- H.L. Mencken
------------------------------------------------------------------------
