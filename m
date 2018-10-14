From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: Relocation (type 4) overflow on alpha for big module
Date: Mon, 15 Oct 2018 07:41:48 +1300
Message-ID: <20181014184148.m6jb5ohb5onu6c3k@tower>
References: <5bc11e00-258d-a6ea-fe63-ddcfdb847071@linux.ee>
 <20181014173306.GA14639@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181014173306.GA14639@gherkin.frus.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@gherkin.frus.com>
Cc: Meelis Roos <mroos@linux.ee>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Oct 14, 2018 at 12:33:06PM -0500, Bob Tracy wrote:
> On Sun, Oct 14, 2018 at 10:07:13AM +0300, Meelis Roos wrote:
> > I decided to try btrfs on one of my alphas and got a surprise - btrfs module does not load:
> 
> Confirmed on a PWS 433au running 4.19.0-rc6 with latest "sid" toolchain.

Known and long-standing problem in the Alpha kernel module loader.
Requires extra code implmented to support loading such large modules
which no one has done.  Workaround is to build the kernel with such
modules (e.g. radeon, btrfs) in-built.

Cheers
Michael.
