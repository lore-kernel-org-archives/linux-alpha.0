From: =?ISO-8859-1?Q?Ra=FAl_Porcel?= <armin76@gentoo.org>
Subject: Re: problem compiling kernel ld error relocation truncated to fit:
 GPREL16 against symbol
Date: Tue, 06 Dec 2011 17:46:30 +0100
Message-ID: <4EDE46E6.4000000@gentoo.org>
References: <CAHEkXCQ5HeiSmSkFSh5bLvo-VO225bKugDXYVFp34-zbb3uriA@mail.gmail.com> <4EBF12B2.1070504@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <4EBF12B2.1070504@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Cree <mcree@orcon.net.nz>
Cc: carl hansen <carlhansen1234@gmail.com>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org, Uros Bizjak <ubizjak@gmail.com>

On 11/13/2011 01:43 AM, Michael Cree wrote:
[snip]
> 
> Is there anyone more knowledgeable than I about gcc who can give us
> guidance as to why gcc-4.6 should be enlarging the data segment so much
> that the small data model cannot be used?  Or is there a fix required in
> the kernel code?

Guess Uros can help here...

