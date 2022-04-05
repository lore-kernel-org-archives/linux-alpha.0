From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: 5.17.0 boot issue on Miata
Date: Tue, 5 Apr 2022 17:01:25 +1200
Message-ID: <20220405050125.GA25969@tower>
References: <Yj0u150JJpsb9nj4@gherkin.frus.com>
 <20220326222157.GA13650@tower>
 <YkuejknyPDJoQEDC@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane-mx.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <YkuejknyPDJoQEDC@gherkin.frus.com>
Resent-Message-ID: <SdyFNqjGMtK.A.zGF.-08SiB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20220405050125.GA25969@tower
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@frus.com>
Cc: debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

On Mon, Apr 04, 2022 at 08:42:38PM -0500, Bob Tracy wrote:
> On Sun, Mar 27, 2022 at 11:21:57AM +1300, Michael Cree wrote:
> > On Thu, Mar 24, 2022 at 09:54:15PM -0500, Bob Tracy wrote:
> > > When I attempt to boot a 5.17.0 kernel built from the kernel.org
> > > sources, I see disk sector errors on my "sda" device, and the boot
> > > process hangs at the point where "systemd-udevd.service" starts.
> > > 
> > > Rebooting on 5.16.0 works with no disk I/O errors of any kind.
> > 
> > Oh, you can run a 5.16.y kernel on Alpha?  I have had problems
> > with everything since 5.9.y with rare, random, corruptions in
> > memory in user space (exhibiting as glibc detected memory
> > corruptions or segfaults).
> 
> Did we have this painted into the "SMP vs. not-SMP" corner at one point?

No, this affects both ES45 (with 3 cpus) and XP1000 (one cpu).

The problem is rare. I often have to run tests for 12 hours on
the XP1000 before I see a problem.  On miata it might occur even
less often.

I hope I am getting close to the bad commit, but it is taking
time when I run testing for a whole day before I feel confident
enough to mark the kernel as good.  And I have been wrong on
that one a couple of times now, having to repeat part of the
bisection.

Cheers,
Michael.

