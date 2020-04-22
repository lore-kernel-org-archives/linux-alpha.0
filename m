From: Changli Gao <xiaosuo@gmail.com>
Subject: Re: [PATCH 1/4] fs: Implement close-on-fork
Date: Wed, 22 Apr 2020 11:41:14 +0800
Message-ID: <CABa6K_Ev9d8wsb6HRCRPceOF7grDDjm41cV_CTjOiMHwoNsjTw@mail.gmail.com>
References: <20200420071548.62112-1-nate.karstens@garmin.com>
 <20200420071548.62112-2-nate.karstens@garmin.com> <36dce9b4-a0bf-0015-f6bc-1006938545b1@gmail.com>
 <CABa6K_HWsy9DdjsKXE2d_JrC+OsNuW+OALS+-_HiV3r2XgC1bw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+aIQ7CAWOBcU4ts0/fedMSy1OdIZkB+G+ss8GRXa6l8=;
        b=quZ3GSH+esBmeLJV8D7JiyC3UPdJ0/5yQxctsMpeaF/D8vgU4N2v3gHtHOedzCBT2z
         tZlfa3q1E+t33luzTRHSk5REzYwU0E45OkQ1hZ/vnO/FwhMVSRQDdY3QXFrTvu1wziYR
         DuEYDWxbh2sCeBK38DN8lztLAUw3iaMHi/PdBKjIBqa4cZzcX/TI2x5BGdIVFe1qtogI
         ZcU9zamOpuKRc5GFGguB+e92b/wywvu6kko8ennoddy4QYDlnUPC1iaybqEg9MwDFhHe
         +yhoo0yXbZbAl66aDlOfWtJfp16Y9UxUMvyIeTMDrd8czfK8Se6t5bEjM7pQBXTuXIam
         pWtg==
In-Reply-To: <CABa6K_HWsy9DdjsKXE2d_JrC+OsNuW+OALS+-_HiV3r2XgC1bw@mail.gmail.com>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: Nate Karstens <nate.karstens@garmin.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>, "J. Bruce Fields" <bfields@fieldses.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, Linux Netdev List <netdev@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Apr 22, 2020 at 11:38 AM Changli Gao <xiaosuo@gmail.com> wrote:
> At the same time, we'd better extend other syscalls, which set the
> FD_CLOEXEC when  creating FDs. i.e. open, pipe3...
>

Ignore me, I missed the latter patches.



-- 
Regards,
Changli Gao(xiaosuo@gmail.com)
