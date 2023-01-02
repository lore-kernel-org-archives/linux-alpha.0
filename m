From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH v2] Add new open(2) flag - O_EMPTY_PATH
Date: Mon, 2 Jan 2023 14:01:38 +0000
Message-ID: <4b39cf528148470c934fb5823b35e9d5@AcuMS.aculab.com>
References: <202212310842.ysbymPHY-lkp@intel.com>
 <20221231235618.117201-1-ahamza@ixsystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20221231235618.117201-1-ahamza@ixsystems.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Ameer Hamza' <ahamza@ixsystems.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "jlayton@kernel.org" <jlayton@kernel.org>, "chuck.lever@oracle.com" <chuck.lever@oracle.com>, "arnd@arndb.de" <arnd@arndb.de>, "guoren@kernel.org" <guoren@kernel.org>, "palmer@rivosinc.com" <palmer@rivosinc.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "slark_xiao@163.com" <slark_xiao@163.com>, "richard.henderson@linaro.org" <richard.henderson@linaro.org>, "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>, "mattst88@gmail.com" <mattst88@gmail.com>, "James.Bottomley@HansenPartnership.com" <James.Bottomley@HansenPartnership.com>, "deller@gmx.de" <deller@gmx.de>, "davem@davemloft.net" <davem@davemloft.net>
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "awalker@ixsystems.com" <awalker@ixsystems.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>

From: Ameer Hamza
> Sent: 31 December 2022 23:56
> 
> This patch adds a new flag O_EMPTY_PATH that allows openat and open
> system calls to open a file referenced by fd if the path is empty,
> and it is very similar to the FreeBSD O_EMPTY_PATH flag. This can be
> beneficial in some cases since it would avoid having to grant /proc
> access to things like samba containers for reopening files to change
> flags in a race-free way.
> 

But what does it do?
(Apart from add code to a common kernel code path.)

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

