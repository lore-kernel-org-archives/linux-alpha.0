From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 1/4] fs: Implement close-on-fork
Date: Fri, 1 May 2020 08:23:42 -0700
Message-ID: <20200501152342.GA29705@bombadil.infradead.org>
References: <20200420071548.62112-1-nate.karstens@garmin.com>
 <20200420071548.62112-2-nate.karstens@garmin.com>
 <36dce9b4-a0bf-0015-f6bc-1006938545b1@gmail.com>
 <0e884704c25740df8e652d50431facff@garmin.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=4jZBUar+kwlxf2npvTvVYY+2uyA6OkDur+ekCP/I/n4=; b=PQMcoMIXaHBSFdreh0e0CE+EW1
        UkgeqGCLPbD6ya0kmRq4nvF5UKcqFJlWSKj1Iybj0oSkquznHqiNMWWTdEWcC4Zd1VqgyaYa1GlJ8
        0ajMqmspKHSSPaqYW7aPqJvye/Sb234VuoDxCdBlPp+HGu35lV3Fro7YMeLsuXQJ4+uAJokq7bWPy
        6j4Jg/Ib+gmOUEh6pzhl61DwVwAJm7sdK18+9sV7+EHUngupKzFzenyzy5XgNTEzWUe6StL6poqq0
        iPoTnYmX/SKM8sEdEWd+hSzi1WlPz4nVImfTimXZUvdlNXzpkwiadDRN6COCYCHcg0g3Fm9KDbg7f
        A0ellLFg==;
Content-Disposition: inline
In-Reply-To: <0e884704c25740df8e652d50431facff@garmin.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Karstens, Nate" <Nate.Karstens@garmin.com>
Cc: Eric Dumazet <eric.dumazet@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>, "J. Bruce Fields" <bfields@fieldses.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.ke>

On Fri, May 01, 2020 at 02:45:16PM +0000, Karstens, Nate wrote:
> Others -- I will respond to feedback outside of implementation details in a separate message.

FWIW, I'm opposed to the entire feature.  Improving the implementation
will not change that.
