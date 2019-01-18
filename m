From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: PWS 433au (Miata) recovery update
Date: Thu, 17 Jan 2019 23:26:40 -0600
Message-ID: <20190118052640.GA23364@gherkin.frus.com>
References: <20190116071014.GA11881@gherkin.frus.com>
 <alpine.LFD.2.21.1901172329010.14808@eddie.linux-mips.org>
Mime-Version: 1.0
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.1901172329010.14808@eddie.linux-mips.org>
Resent-Message-ID: <hJE8UTnZ8JF.A.CoG.lOWQcB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20190118052640.GA23364@gherkin.frus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org, mcree@orcon.net.nz, mattst88@gmail.com

On Fri, Jan 18, 2019 at 12:19:52AM +0000, Maciej W. Rozycki wrote:
> (much useful information set in the appropriate historical context)

Thank you for your thoughts.

The earlier reported problem with "/lib/systemd/systemd-udevd" evidently
requiring AF_UNIX socket support to be built-in rather than modular has
been confirmed.  Setting "CONFIG_UNIX=y" in the kernel configuration was
enough to get me past that particular problem I was seeing with the
initial ramdisk.  So, per advice I was given a long time ago, *do*
examine the "systemd" README file under "/usr/share/doc": many kernel
configuration requirements are mentioned there.  As far as gleaning the
additional udev-related info, one *might* infer it from the error
messages produced by the executable, *or* one can examine the udev-
related files under "/lib/systemd/system", one of which explicitly
mentions AF_UNIX in the context of a restricted address family.

I also note that the current "initramfs-tools" have evidently forgotten
how to automatically check and mount local file systems *other* than "/"
and "/usr".  Every boot since restoring my PWS thus far has dropped me
into emergency mode with everything mounted read-write and ready to go
(including swap) *other* than the local non-tmpfs file systems.
Manually running the appropriate flavor of "fsck" and mounting the file
systems before exiting emergency mode results in the expected normal
startup of multi-user system services.

"journalctl -xb" has, for the case of one such file system that didn't
get checked/mounted, the following messages:

(...)
-- The job identifier is 271 and the job result is done.
Dec 21 13:02:10 smirkin systemd[1]: Starting of /dev/sda2 not supported.
-- Subject: A start job for unit dev-sda2.device has failed
-- Defined-By: systemd
-- Support: https://www.debian.org/support
-- 
-- A start job for unit dev-sda2.device has finished with a failure.
-- 
-- The job identifier is 307 and the job result is unsupported.
Dec 21 13:02:10 smirkin systemd[1]: Dependency failed for File System Check on /dev/sda2.
-- Subject: A start job for unit systemd-fsck@dev-sda2.service has failed
-- Defined-By: systemd
-- Support: https://www.debian.org/support
-- 
-- A start job for unit systemd-fsck@dev-sda2.service has finished with a failure.
-- 
-- The job identifier is 306 and the job result is dependency.
Dec 21 13:02:10 smirkin systemd[1]: Dependency failed for /boot.
-- Subject: A start job for unit boot.mount has failed
-- Defined-By: systemd
-- Support: https://www.debian.org/support
