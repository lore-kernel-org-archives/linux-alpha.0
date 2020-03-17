From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: fix nautilus PCI setup
Date: Mon, 16 Mar 2020 21:57:37 -0700
Message-ID: <CAEdQ38Gz+LXMNDnGvxM6t+6YcdXryLN781x=uTZvJ_huF8Gv6w@mail.gmail.com>
References: <20200314194745.GB12510@mail.rc.ru>
Mime-Version: 1.0
Return-path: <linux-pci-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E9Mssj/6IzuQ2UbwiJqBfsEr29/GAc3gWyl0M/hxDuU=;
        b=HLpm8bkWcK4sc60kVlM/fecLDvKzJy5BHCY1ojSFdZkG0o/kzsxQ3teAaJTf9ytgf3
         zvR9cCe4CNeGdrzmnk8WBwZcNRVW6FEqEUTmP7zLJTtigNKWWU0R3WAR33jd5vX3aC7k
         K+j+veA1bQTd/AC5mvYXvgbJOhOmxQVEOUtje/tHz+P3V1XYxjAPgM5G60ByL5+ylL0e
         cAEVpGw3fnTxHgTsee1dBixEDKTDmsMwJeD8JtJR9vJhwKsZvLWq/iP+2vBE+doNRhs2
         zC2JTZFAz+f8xe28TwzBcrETYPY05Ahd51nO0MQDx65MuMm20OADk7FI+dTYZ+7okT8O
         Q8jQ==
In-Reply-To: <20200314194745.GB12510@mail.rc.ru>
Sender: linux-pci-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Yinghai Lu <yinghai@kernel.org>, linux-pci@vger.kernel.org, linux-alpha <linux-alpha@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Jay Estabrook <jay.estabrook@gmail.com>, Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

On Sat, Mar 14, 2020 at 12:47 PM Ivan Kokshaysky
<ink@jurassic.park.msu.ru> wrote:
>
> Example (hopefully reasonable) of the new "size_windows" flag usage.
>
> Fixes accidental breakage caused by commit f75b99d5a77d (PCI: Enforce
> bus address limits in resource allocation),

Works great. Thanks Ivan!

Tested-by: Matt Turner <mattst88@gmail.com>
