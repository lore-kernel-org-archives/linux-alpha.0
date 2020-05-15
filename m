From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2] Implement close-on-fork
Date: Fri, 15 May 2020 08:57:30 -0700
Message-ID: <20200515155730.GF16070@bombadil.infradead.org>
References: <20200515152321.9280-1-nate.karstens@garmin.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=vg97Zc+yBbH72pdkZwDBNGODCPrdrEdYXXBAaIV2Oiw=; b=bzUzwrUjBws0tIpnnw6gyN9V0/
        DEHrV9rVluyQUK+FkkQ1eobbrpCgDX5J1ZpBZlnmP/MjvMAlP952p1uy/0WAvi0Md/Hfiw3Ls4zih
        WXY29L9IuNuFXLm1+of43Qf/L+4asIjGHEWNGUXw9ez8PnkiC7FOy9huhUcn0GCg/yrl0gOON5YFU
        QqMg4LZ1RUNsWnTsSrkQgsKr5vKbLOqDS8YkkJ0O1BTSqd8RB5uK8jM7DtbTSsrmlMVLr8EGdpbRc
        Z6H+F7nNTNM/Ng9QVTpmfc+4lxFZxc4lLU2pDnH5voOjqtDjqjozbkFFhHNjAJ2s0ocUy7a2ljjOj
        g+gi0BIw==;
Content-Disposition: inline
In-Reply-To: <20200515152321.9280-1-nate.karstens@garmin.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nate Karstens <nate.karstens@garmin.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>, "J. Bruce Fields" <bfields@fieldses.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, David Laight <David.Laight@aculab.com>, linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Changli Gao <xiaosuo@gmail.com>, a.josey@opengroup.

On Fri, May 15, 2020 at 10:23:17AM -0500, Nate Karstens wrote:
> Series of 4 patches to implement close-on-fork. Tests have been
> published to https://github.com/nkarstens/ltp/tree/close-on-fork
> and cover close-on-fork functionality in the following syscalls:

[...]

> This functionality was approved by the Austin Common Standards
> Revision Group for inclusion in the next revision of the POSIX
> standard (see issue 1318 in the Austin Group Defect Tracker).

NAK to this patch series, and the entire concept.

Is there a way to persuade POSIX that they made a bad decision by
standardising this mess?
