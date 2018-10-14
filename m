From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: Relocation (type 4) overflow on alpha for big module
Date: Sun, 14 Oct 2018 12:33:06 -0500
Message-ID: <20181014173306.GA14639@gherkin.frus.com>
References: <5bc11e00-258d-a6ea-fe63-ddcfdb847071@linux.ee>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5bc11e00-258d-a6ea-fe63-ddcfdb847071@linux.ee>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Meelis Roos <mroos@linux.ee>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Oct 14, 2018 at 10:07:13AM +0300, Meelis Roos wrote:
> I decided to try btrfs on one of my alphas and got a surprise - btrfs module does not load:

Confirmed on a PWS 433au running 4.19.0-rc6 with latest "sid" toolchain.

--Bob
