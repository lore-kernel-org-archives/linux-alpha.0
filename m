From: Alexey Gladkov <legion@kernel.org>
Subject: Re: [PATCH v3 2/5] fs: Add fchmodat4()
Date: Tue, 11 Jul 2023 14:49:50 +0200
Message-ID: <ZK1P7kkjTvSU8M++@example.org>
References: <87o8pscpny.fsf@oldenburg2.str.redhat.com>
 <cover.1689074739.git.legion@kernel.org>
 <d11b93ad8e3b669afaff942e25c3fca65c6a983c.1689074739.git.legion@kernel.org>
 <ZK1K1BOf43JOJWMx@casper.infradead.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689079809;
        bh=dNf0h22e3NNw5WnIyQMA79RXwcCjXd4yUaNvlYSmEks=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cNjPPHJCjkBuTo31uxO23EaD7iBmnxEZwpJnZPbX4Xt0szcj8ZgyO+hFXrziDLnmJ
         WJfKsnZYW2NOQL3/ej8bLyiHu3o1cYgHqGtMbPw/xU5DUyrh9wH/uRCTzT6nteqM17
         ih0fj7MI3xs3DsWKDpGWHK/svwtx6ndwsmveTHwe5/53fRS3olzp6tBliGqf9sdGX9
         kN9/UPhMXhRiCAx1fAJd0t7sk9E2Jrj7YEssyG4k1JXRDx+YpYchn3i5vwcM7u3hPP
         uyPhDJtpjTnpxvOXge4E7SaouWn3esU19tKAKmZoLjNyYWqbKP+E5Cdjp80IatCv7m
         LrjabKUWygppA==
Content-Disposition: inline
In-Reply-To: <ZK1K1BOf43JOJWMx@casper.infradead.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <willy@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, Palmer Dabbelt <palmer@sifive.com>, James.Bottomley@hansenpartnership.com, acme@kernel.org, alexander.shishkin@linux.intel.com, axboe@kernel.dk, benh@kernel.crashing.org, borntraeger@de.ibm.com, bp@alien8.de, catalin.marinas@arm.com, christian@brauner.io, dalias@libc.org, davem@davemloft.net, deepa.kernel@gmail.com, deller@gmx.de, dhowells@redhat.com, fenghua.yu@intel.com, firoz.khan@linaro.org, fweimer@redhat.com, geert@linux-m68k.org, glebfm@altlinux.org, gor@linux.ibm.com, hare@suse.com, heiko.carstens@de.ibm.com, hpa@zytor.com, ink@jurassic.park.msu.ru, jhogan@kernel.org, kim.phillips@arm.com, ldv@altlinux.org, linux-alpha@vger.k

On Tue, Jul 11, 2023 at 01:28:04PM +0100, Matthew Wilcox wrote:
> On Tue, Jul 11, 2023 at 01:25:43PM +0200, Alexey Gladkov wrote:
> > -static int do_fchmodat(int dfd, const char __user *filename, umode_t mode)
> > +static int do_fchmodat4(int dfd, const char __user *filename, umode_t mode, int lookup_flags)
> 
> This function can still be called do_fchmodat(); we don't need to
> version internal functions.

Yes. I tried not to change too much when adopting a patch. In the new
version, I will return the old name. Thanks.

-- 
Rgrds, legion

