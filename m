From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2] Implement close-on-fork
Date: Fri, 15 May 2020 11:43:58 -0700
Message-ID: <20200515184358.GH16070@bombadil.infradead.org>
References: <20200515152321.9280-1-nate.karstens@garmin.com>
 <20200515155730.GF16070@bombadil.infradead.org>
 <5b1929aa9f424e689c7f430663891827@garmin.com>
 <1589559950.3653.11.camel@HansenPartnership.com>
 <4964fe0ccdf7495daf4045c195b14ed6@garmin.com>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=eFWvwLKFGzyiQJFsBdanngzoQxBkkdEj+F7mphDLxWo=; b=lTfU4JiLO4rvJaOgBk2NqxYW3T
        r7Kubiu5kiBwMf7d1hoMbm0czYSTR9RH9Kms3OSitDKBTX1a53oSE57RFovvFwN0YaEPjoFuUc/9n
        lAnw4XnNRIRCeGwfzN9s/qYZSF8kdXKQQ3Fr9M9Ij+J1A4QmBI16m/czKM4ARCjvpY0oP/ezuFSPk
        TOfDeFiEMIqTrtZ30ED6vqh8O2YQjW8dp+BOTi8k7xslvQjBNJ24tjD/MDRPsufRY4EWb012d0DK4
        8ATYyVr/WmqUmT1ZQPQrSi0Huu4+3s4d06hGb+JVg0OaMwWNhxPvVIdAYeGOekKbML0my53lEPx0C
        azFjaYAQ==;
Content-Disposition: inline
In-Reply-To: <4964fe0ccdf7495daf4045c195b14ed6@garmin.com>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Karstens, Nate" <Nate.Karstens@garmin.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>, "J. Bruce Fields" <bfields@fieldses.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Helge Deller <deller@gmx.de>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, David Laight <David.Laight@aculab.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, sparclinux@vger.k

On Fri, May 15, 2020 at 06:28:20PM +0000, Karstens, Nate wrote:
> Our first attempt, which was to use the pthread_atfork() handlers, failed because system() is not required to call the handlers.
> 
> Most of the feedback we're getting on this seems to say "don't use system(), it is unsafe for threaded applications". Is that documented anywhere? The man page says it is "MT-Safe".

https://pubs.opengroup.org/onlinepubs/9699919799/functions/system.html

> Aside from that, even if we remove all uses of system() from our application (which we already have), then our application, like many other applications, needs to use third-party shared libraries. There is nothing that prevents those libraries from using system(). We can audit those libraries and go back with the vendor with a request to replace system() with a standard fork/exec, but they will also want documentation supporting that.

They might also be using any number of other interfaces which aren't
thread-safe.

> If the feedback from the community is truly and finally that system() should not be used in these applications, then is there support for updating the man page to better communicate that?

Yes, absolutely.

I think you're mischaracterising our feedback.  It's not "We don't want
to fix this interface".  It's "We don't want to slow down everything else
to fix this interface (and by the way there are lots of other problems
with this interface that you aren't even trying to address)".
