From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH v2] alpha: fix nautilus PCI setup
Date: Sun, 22 Mar 2020 13:34:54 -0700
Message-ID: <CAEdQ38GNWO05mu_TD3aydsy1T9gvgFL9L_hyzeD=vWzTGCNMXA@mail.gmail.com>
References: <20200318005029.GA8326@mail.rc.ru>
Mime-Version: 1.0
Return-path: <linux-pci-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f+1MxSbfv7IX5t2AzTeEksKn+lUCwLfRaz02Xo40oyE=;
        b=DE7Tmiu+iaa4ir3fmjEDCWhZvlCNT70QegrwRZVBG0gutmbKfKnp+AT+nwA7ycm6Hf
         Lp4wXBuek8Mtp9QxMPMduFDHfBH0KY3wvDSryvJ3Ndug+uOPoSyim6liBncb2jnNQbSc
         R4NCyp89jaW6UJA5IBomrRrN38mRE4I9XnDKk2c744ORgbEHiqDQeg67/ELyfv55H4ow
         Z3VB1+xp7+K7IWyqoFIuYjnakApXwmcRwwGSsYCtWJXa1CtO7LfUgjhzqG/akrLi77+0
         CFxWMVV8PjGaZHYC/AW77wm0kyg7QjKDo5dWzVZi/wKvsahzlj5YaIWlRTzZxxjAjehS
         9MCA==
In-Reply-To: <20200318005029.GA8326@mail.rc.ru>
Sender: linux-pci-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Yinghai Lu <yinghai@kernel.org>, linux-pci@vger.kernel.org, linux-alpha <linux-alpha@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Jay Estabrook <jay.estabrook@gmail.com>, Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

On Tue, Mar 17, 2020 at 5:50 PM Ivan Kokshaysky
<ink@jurassic.park.msu.ru> wrote:
>
> Example (hopefully reasonable) of the new "size_windows" flag usage.
>
> Fixes accidental breakage caused by commit f75b99d5a77d (PCI: Enforce
> bus address limits in resource allocation),
>
> Signed-off-by: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> ---

For completeness:

Tested-by: Matt Turner <mattst88@gmail.com>

Thanks Ivan!
