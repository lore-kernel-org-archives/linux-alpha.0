From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Newer kernels on the Jensen (was: [PATCH v2 0/4] Introduce and
Date: Fri, 22 Oct 2021 10:46:37 +0200
Message-ID: <5a774482-5a0e-a06d-2ef0-d1727bb41be5@physik.fu-berlin.de>
References: <202110191946.19JJkeut004465@valdese.nms.ulrich-teichert.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <202110191946.19JJkeut004465@valdese.nms.ulrich-teichert.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ulrich Teichert <krypton@ulrich-teichert.org>
Cc: Linux Alpha <linux-alpha@vger.kernel.org>

Hi Ulrich!

On 10/19/21 21:46, Ulrich Teichert wrote:
> I've also tried booting from the CD-ROM on my Jensen and that worked insofar
> as the installer starts up, which is cool, but no SCSI devices were detected.
> EISA support seems to be activated, though:
> ...
> [    0.193359] thermal_sys: Registered thermal governor 'user_space'
> [    0.195312] EISA bus registered
> [    0.249999] random: fast init done
> ...
> 
> I've modprobe'd the AHA174x kernel module by hand, as it was not inserted
> automatically, but all I got was this line in the syslog:
> ...
> Oct 19 17:07:28 main-menu[245]: INFO: Menu item 'di-utils-shell' selected
> Oct 19 17:11:43 kernel: [  535.043671] SCSI subsystem initialized
> ...
> Nothing more. According to the documentation the module needs no arguments
> and should auto-probe, but it did not detect any devices.

I'm currently out of ideas what could be the reason for the device detection not
working, so I'll have to rely on your own debugging work. Either the driver is
missing the hardware IDs for your particular card (maybe it was patched out?!)
or there is an additional module that needs to enabled in the Debian kernel.

> I apologize for not doing more digging ATM,
> full bootlogs from the serial line as attachments,

No problem. If you find out anything more, please let me know.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

