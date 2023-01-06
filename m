From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH v2] Add new open(2) flag - O_EMPTY_PATH
Date: Fri, 6 Jan 2023 09:21:46 +0000
Message-ID: <ea8739b122674695ba9bf991b589817c@AcuMS.aculab.com>
References: <202212310842.ysbymPHY-lkp@intel.com>
 <20221231235618.117201-1-ahamza@ixsystems.com>
 <4b39cf528148470c934fb5823b35e9d5@AcuMS.aculab.com>
 <20230102143538.GA8886@hamza-HP-ZBook-15-G3>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <20230102143538.GA8886@hamza-HP-ZBook-15-G3>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Ameer Hamza' <ahamza@ixsystems.com>
Cc: "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "jlayton@kernel.org" <jlayton@kernel.org>, "chuck.lever@oracle.com" <chuck.lever@oracle.com>, "arnd@arndb.de" <arnd@arndb.de>, "guoren@kernel.org" <guoren@kernel.org>, "palmer@rivosinc.com" <palmer@rivosinc.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "slark_xiao@163.com" <slark_xiao@163.com>, "richard.henderson@linaro.org" <richard.henderson@linaro.org>, "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>, "mattst88@gmail.com" <mattst88@gmail.com>, "James.Bottomley@HansenPartnership.com" <James.Bottomley@HansenPartnership.com>, "deller@gmx.de" <deller@gmx.de>, "davem@davemloft.net" <davem@davemloft.net>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, linux-kernel@vger.kernel.

From: Ameer Hamza
> Sent: 02 January 2023 14:36
> 
> On Mon, Jan 02, 2023 at 02:01:38PM +0000, David Laight wrote:
> > From: Ameer Hamza
> > > Sent: 31 December 2022 23:56
> > >
> > > This patch adds a new flag O_EMPTY_PATH that allows openat and open
> > > system calls to open a file referenced by fd if the path is empty,
> > > and it is very similar to the FreeBSD O_EMPTY_PATH flag. This can be
> > > beneficial in some cases since it would avoid having to grant /proc
> > > access to things like samba containers for reopening files to change
> > > flags in a race-free way.
> > >
> >
> > But what does it do?
> > (Apart from add code to a common kernel code path.)
> >
> > 	David
>
> It can convert an O_PATH descriptor to one suitable for r/w work.
> If we already have a file descriptor: {opath_fd = open(&lt;path&gt;, O_PATH);}, we can call
> {openat(opath_fd, "", O_EMPTY_PATH | O_RDWR)} instead of going through procfs
> {open(/proc/self/fd/&lt;opath_fd&gt;, O_RDWR)}.

Aren't both of those security problems?

Testing the file's inode permission allow write access isn't enough
to verify that the program could actually open the file for writing.
The program also needs 'directory search' access on all the directories
back as far as an open directory fd.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

