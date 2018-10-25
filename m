From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: vmlinux ld relocation errors on Alpha
Date: Wed, 24 Oct 2018 21:39:32 -0500
Message-ID: <20181025023932.GA12242@gherkin.frus.com>
References: <20181024144629.GA6338@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181024144629.GA6338@gherkin.frus.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: debian-alpha@lists.debian.org, linux-kernel@vger.kernel.org, mcree@orcon.net.nz

On Wed, Oct 24, 2018 at 09:46:29AM -0500, Bob Tracy wrote:
> Back in January of 2017, a patch set was created for the 4.9.0 kernel and
> *hopefully* sent upstream to address the subject issue.
> (...).
> Am currently attempting a native 4.19.0 build with an up-to-date debian
> "sid" toolchain.  If the build succeeds, than the issue became OBE for
> whatever reason.  Otherwise, it would be nice to know what happened to
> the patch set.  Should know either way as far as the build in a few more
> hours.

Successful build, so I guess "OBE" applies.  If someone reading this
knows, how was this fixed?  My guess would be improvements in the
compiler tool chain, most particularly "bintools".

Sorry for the noise.

--Bob
