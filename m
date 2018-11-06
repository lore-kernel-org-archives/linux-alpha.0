From: Frank Scheiner <frank.scheiner@web.de>
Subject: Re: [alpha] Debian 9.0 NETINST fails
Date: Tue, 6 Nov 2018 13:36:45 +0100
Message-ID: <4cf52d37-6f60-1714-de43-f9c1b72202c7@web.de>
References: <20181102184151.GA15241@gherkin.frus.com>
 <20181102185623.GB15241@gherkin.frus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
In-Reply-To: <20181102185623.GB15241@gherkin.frus.com>
Content-Language: en-US
Resent-Message-ID: <jutM2jSeecO.A.PdG.IsY4bB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/4cf52d37-6f60-1714-de43-f9c1b72202c7@web.de
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bob Tracy <rct@gherkin.frus.com>, debian-alpha@lists.debian.org
Cc: linux-alpha@vger.kernel.org, mcree@orcon.net.nz, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Dear Bob,

sorry, looks like I missed your mails to the debian-alpha list until now.

On 11/2/18 19:56, Bob Tracy wrote:
> Additional info...  Frank Scheiner reported similar badness on his PWS
> back in March of 2017.  See the "debian-alpha" archive link:
> 
> https://lists.debian.org/debian-alpha/2017/03/msg00007.html
> 
> Executive summary: SMP 4.x kernels work fine, but the generic Debian
> kernel does *not* (or at least didn't at that time).

I can confirm this. I don't remember exactly when I tried the Debian 9 
Sid installer image with 4.x generic kernel provided by Adrian, but I 
remember that it produced the same result, i.e.:

```
[...]
halted CPU 0

halt code = 5
HALT instruction executed
[...]
```

I believe since then no newer installer image for Alpha was produced.

****

As a workaround, could it work to netboot the matching stock SMP kernel 
(4.9.0-3) with the netboot installer initrd from [1]? I don't know how 
to extract the initrd from the `netabootwrap`ed image though.

Or could it work to netboot the SMP kernel with the cdrom installer 
initrd from [1] and the installer CDROM in the CDROM drive?

[1]. 
http://ftp.ports.debian.org/debian-ports/pool-alpha/main/d/debian-installer/debian-installer-images_20170615_alpha.tar.gz

****

Other approach: as per [2] hppa for example uses two kernels. So could 
we just change [2] for alpha to also include the SMP kernel, with e.g. 
that patch:

```
--- debian/installer/kernel-versions	2018-11-06 13:30:54.152319148 +0100
+++ debian/installer/kernel-versions-new	2018-11-06 13:31:38.992320296 +0100
@@ -1,5 +1,6 @@
  # arch     version flavour       installedname suffix build-depends
  alpha      -       alpha-generic -             y      -
+alpha      -       alpha-smp     -             y      -
  amd64      -       amd64         -             -      -
  arm64      -       arm64         -             -      -
  armel      -       marvell       -             y      -
```

...and the installer images will also include the SMP kernel?

[2]: 
https://salsa.debian.org/kernel-team/linux/raw/master/debian/installer/kernel-versions

Cheers,
Frank

