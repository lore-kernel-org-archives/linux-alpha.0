From: Bob Tracy <rct@frus.com>
Subject: Re: 5.17.0 boot issue on Miata
Date: Mon, 4 Apr 2022 20:42:38 -0500
Message-ID: <YkuejknyPDJoQEDC@gherkin.frus.com>
References: <Yj0u150JJpsb9nj4@gherkin.frus.com>
 <20220326222157.GA13650@tower>
Mime-Version: 1.0
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane-mx.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <20220326222157.GA13650@tower>
Resent-Message-ID: <oUeBAezppa.A.IXE.i65SiB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/YkuejknyPDJoQEDC@gherkin.frus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

On Sun, Mar 27, 2022 at 11:21:57AM +1300, Michael Cree wrote:
> On Thu, Mar 24, 2022 at 09:54:15PM -0500, Bob Tracy wrote:
> > When I attempt to boot a 5.17.0 kernel built from the kernel.org
> > sources, I see disk sector errors on my "sda" device, and the boot
> > process hangs at the point where "systemd-udevd.service" starts.
> > 
> > Rebooting on 5.16.0 works with no disk I/O errors of any kind.
> 
> Oh, you can run a 5.16.y kernel on Alpha?  I have had problems
> with everything since 5.9.y with rare, random, corruptions in
> memory in user space (exhibiting as glibc detected memory
> corruptions or segfaults).

Did we have this painted into the "SMP vs. not-SMP" corner at one point?
Miata is an automatic not-SMP case for hand-built kernels for that
architecture, which might explain why I'm not seeing the problems with
user space memory corruption.

Just successfully booted on v5.17-rc1 a little while ago.  Moving on to
"-rc2".

--Bob

