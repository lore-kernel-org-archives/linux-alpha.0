From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2] Implement close-on-fork
Date: Fri, 15 May 2020 09:26:18 -0700
Message-ID: <20200515162618.GG16070@bombadil.infradead.org>
References: <20200515152321.9280-1-nate.karstens@garmin.com>
 <20200515155730.GF16070@bombadil.infradead.org>
 <5b1929aa9f424e689c7f430663891827@garmin.com>
Mime-Version: 1.0
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=5gAtDZQTZJyIz4lJd56+m7fpDX/8eOny8zsjfp/WK3g=; b=E1GnXv9HQmw3mxGy8aTAUkpqtO
        LX32SHoo6haT7C848Uk/mHhzb1Mi82vSzLqaqXMBeLxEoQreda9IbySpK9JiyNlQPchRwdvkB89TG
        cJ+ZIchO992dspfvL0oC6jojurfVU/cfECKy6b4WDO00Ad0indEJ6GElFVlP+vOsnr+pa4Me57i7o
        v0sl4fV4SdGx6yYezqRxl2STkyRwP+/LAThK7MDh1/uODW/aPFO3hJ7EO4jZogC7UkCBb7PIQyyo7
        VSmbm9T/M6YK8TtNYQtmwZP0KvbGfMxmwFDJlq3T7aof9Iy3/oiBMvZzpJb53+gP62xcqiXEXouOd
        2uN/J65w==;
Content-Disposition: inline
In-Reply-To: <5b1929aa9f424e689c7f430663891827@garmin.com>
Sender: linux-parisc-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Karstens, Nate" <Nate.Karstens@garmin.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>, "J. Bruce Fields" <bfields@fieldses.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, David Laight <David.Laight@aculab.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, sp

On Fri, May 15, 2020 at 04:07:33PM +0000, Karstens, Nate wrote:
> Matthew,
> 
> What alternative would you suggest?
> 
> >From an earlier email:
> 
> > ...nothing else addresses the underlying issue: there is no way to
> > prevent a fork() from duplicating the resource. The close-on-exec
> > flag partially-addresses this by allowing the parent process to
> > mark a file descriptor as exclusive to itself, but there is still
> > a period of time the failure can occur because the auto-close only
> > occurs during the exec(). Perhaps this would not be an issue with
> > a different process/threading model, but that is another discussion
> > entirely.
> 
> Do you disagree there is an issue?

Yes.  system() is defined as being unsafe for a threaded application
to call.  I pointed this out in the last thread.

