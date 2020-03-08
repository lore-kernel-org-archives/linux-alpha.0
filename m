From: Matt Turner <mattst88@gmail.com>
Subject: Re: Some Alphas broken by f75b99d5a77d (PCI: Enforce bus address
 limits in resource allocation)
Date: Sun, 8 Mar 2020 12:41:46 -0700
Message-ID: <CAEdQ38G1YhEoQUEpDT6k_uwodxTOs=BYigm_VQaDDdfaoXM6Wg@mail.gmail.com>
References: <CAEdQ38EzZfUJA-8zg-DgczYTwkxqFL-AThxu0_fC2V-GkXGi2Q@mail.gmail.com>
 <20200302224732.GA175863@google.com> <20200308153004.GA17675@mail.rc.ru>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AIXaeQ+AY9PML0IQFpQFp/vwCGtcFG3KhmwRmsZSfDY=;
        b=SJJPA1mjHygjuC/7dcvLHUdYwhwwpAvps7tE7gbvWLBSsGSD3lwJlJ2v8Vfqe7jlFd
         mbdfXz0JeELiVcR032wXc8yC+X6Fhroikazjjv6fgxg168815s+q/heSOezUqDifRP9U
         pDklUkSMD4jfA3/pge9+fcMFkNzXZ5UmMngQ1iZy3tlTmIDmN+krpNPCnAPuZ38zKAiO
         2hwqxwkLA8ftm46L3wFbKFs4lwXXXQP9b+833TK0Fs9kdckJvURK7n1FsCCFgFIqsvk5
         SNdCEuPhLejcnwA6c64aoAU1hzMvOlFdQU47p7BIAIE7brvIaSePzCvSaFGhjIJAxcG3
         e18Q==
In-Reply-To: <20200308153004.GA17675@mail.rc.ru>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Yinghai Lu <yinghai@kernel.org>, linux-pci@vger.kernel.org, linux-alpha <linux-alpha@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Jay Estabrook <jay.estabrook@gmail.com>, Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

On Sun, Mar 8, 2020 at 8:30 AM Ivan Kokshaysky <ink@jurassic.park.msu.ru> wrote:
> Wholeheartedly agree. In fact, changes to generic PCI code required
> for proper root bus sizing are quite minimal now since we have
> struct pci_host_bridge. It's mostly additional checks for bus->self
> being NULL (as it normally is on the root bus) in the
> __pci_bus_size_bridges() path, plus new bridge->size_windows flag.
> See patch below (tested on UP1500). Note that on irongate we're
> only interested in calculation of non-prefetchable PCI memory aperture,
> but one can do the same for io and prefetchable memory as well.

Thanks Ivan! The patch works for me as well.
