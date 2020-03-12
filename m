From: Matt Turner <mattst88@gmail.com>
Subject: Re: Some Alphas broken by f75b99d5a77d (PCI: Enforce bus address
 limits in resource allocation)
Date: Wed, 11 Mar 2020 21:28:33 -0700
Message-ID: <CAEdQ38HhKq9L3UF=Hapmx-BJ7eLLRfo26ZxFUFqXx+ZEY0Axxg@mail.gmail.com>
References: <CAEdQ38EzZfUJA-8zg-DgczYTwkxqFL-AThxu0_fC2V-GkXGi2Q@mail.gmail.com>
 <20200302224732.GA175863@google.com> <20200308153004.GA17675@mail.rc.ru> <CAEdQ38G1YhEoQUEpDT6k_uwodxTOs=BYigm_VQaDDdfaoXM6Wg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pci-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kc0+yDmV56P7833fL1rNbt5FwQv4lowS4XpMZL4q1F4=;
        b=Qz/oWCDY3paePBJTYkBCuvoDZKmyiUazg+vNtKS1XBhZnFKfyrFGYXNm20mTcKaA5W
         Ztf911RY6ba21g87k6lg4fdj7NS5jdiLn59gzO7qqafDkchLI6+S6FASYlad3XULJokr
         lXrvIPqn7WQb8VJ+RI+6SsE90UogzPjYEfD9cni2WiF2eECnEvbW+gzXXsJibmeDo3Ty
         IcnUfMiTaC/9qvaVdYkEyPUYAhPT5yZBkjGqLCxj5R+yzD10lTkECEp7QZ+6R07dxv90
         XCo8+z+vkwnZPaKTu7mDBHjPjH2YrsLI3TckiYnJ7WNOSaCTVr5ukIximj+m7tsM6bNi
         zNkQ==
In-Reply-To: <CAEdQ38G1YhEoQUEpDT6k_uwodxTOs=BYigm_VQaDDdfaoXM6Wg@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Yinghai Lu <yinghai@kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-pci@vger.kernel.org, linux-alpha <linux-alpha@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Jay Estabrook <jay.estabrook@gmail.com>, Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

On Sun, Mar 8, 2020 at 12:41 PM Matt Turner <mattst88@gmail.com> wrote:
>
> On Sun, Mar 8, 2020 at 8:30 AM Ivan Kokshaysky <ink@jurassic.park.msu.ru> wrote:
> > Wholeheartedly agree. In fact, changes to generic PCI code required
> > for proper root bus sizing are quite minimal now since we have
> > struct pci_host_bridge. It's mostly additional checks for bus->self
> > being NULL (as it normally is on the root bus) in the
> > __pci_bus_size_bridges() path, plus new bridge->size_windows flag.
> > See patch below (tested on UP1500). Note that on irongate we're
> > only interested in calculation of non-prefetchable PCI memory aperture,
> > but one can do the same for io and prefetchable memory as well.
>
> Thanks Ivan! The patch works for me as well.

Bjorn, what would you like the next step to be?

If the PCI bits are fine with you, I assume you'd like them to go
through your tree, etc? I'm perfectly happy to see the alpha bits go
through the same tree.
