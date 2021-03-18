From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: [PATCH 01/10] alpha: use libata instead of the legacy ide driver
Date: Thu, 18 Mar 2021 18:03:42 +0000
Message-ID: <yw1xwnu4gwzl.fsf@mansr.com>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-2-hch@lst.de>
 <YFLrLwjZubWUvA2J@zeniv-ca.linux.org.uk>
 <20210318060724.GA29117@lst.de> <yw1x1rccie35.fsf@mansr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
In-Reply-To: <yw1x1rccie35.fsf@mansr.com> (=?iso-8859-1?Q?=22M=E5ns_Rullg?=
 =?iso-8859-1?Q?=E5rd=22's?= message of "Thu,
 18 Mar 2021 17:09:02 +0000")
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Al Viro <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>

M=E5ns Rullg=E5rd <mans@mansr.com> writes:

> Christoph Hellwig <hch@lst.de> writes:
>
>> On Thu, Mar 18, 2021 at 05:54:55AM +0000, Al Viro wrote:
>>> On Thu, Mar 18, 2021 at 05:56:57AM +0100, Christoph Hellwig wrote:
>>> > Switch the alpha defconfig from the legacy ide driver to libata.
>>>=20
>>> Umm...  I don't have an IDE alpha box in a usable shape (fans on
>>> CPU module shat themselves), and it would take a while to resurrect
>>> it, but I remember the joy it used to cause in some versions.
>>>=20
>>> Do you have reports of libata variants of drivers actually tested on
>>> those?
>>
>> No, I haven't.  The whole point is that we're not going to keep 40000
>> lines of code around despite notice for users that don't exist or
>> care.  If there is a regression we'll fix it, but we're not going to
>> make life miserable just because we can.
>
> The pata_ali driver works fine on my UP1500 machine, unless something
> broke recently.  I'll build the latest kernel and report back.

5.11.7 seems fine too.

--=20
M=E5ns Rullg=E5rd
