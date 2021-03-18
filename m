From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: [PATCH 01/10] alpha: use libata instead of the legacy ide driver
Date: Thu, 18 Mar 2021 17:09:02 +0000
Message-ID: <yw1x1rccie35.fsf@mansr.com>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-2-hch@lst.de>
 <YFLrLwjZubWUvA2J@zeniv-ca.linux.org.uk>
 <20210318060724.GA29117@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xQjzjQtourbXkjh5mFpf8XRwYSgz3gn+gDDYpuqlSTg=; b=cVoXJp5nDJZItS1y4Dso1FlwA
	c5MAyXeqTnSNwf82pQlwl8wFJvYg6Gp0jETjznEutoN0l05JNG8DNadKMBY7wFFDXHpoFFSTAEGBC
	qYzrF0rnPoVWt8EsRPWIpvx3FMz+Gc5sMwA8isGz0op306ZlDjbfh+hBjEm2CD3FjzXP++fihgJ7e
	W0akUrba+gt+mxR12uMKHF9iLmvyo+EH8bJVaxnKJBXT4lRKUKUweHVJQPr+J0aFw+dax5/DPXVXJ
	s6MmFh9r5c8bLjXH37f2Wtge0vUG6Scxj6IawFmcLkkbbOmuRt1Nne3qJLqCwyd46IWonb6ihtlMa
	dU2k5xq+w==;
In-Reply-To: <20210318060724.GA29117@lst.de> (Christoph Hellwig's message of
 "Thu, 18 Mar 2021 07:07:24 +0100")
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: Christoph Hellwig <hch@lst.de>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-doc@vger.kernel.org, Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>

Christoph Hellwig <hch@lst.de> writes:

> On Thu, Mar 18, 2021 at 05:54:55AM +0000, Al Viro wrote:
>> On Thu, Mar 18, 2021 at 05:56:57AM +0100, Christoph Hellwig wrote:
>> > Switch the alpha defconfig from the legacy ide driver to libata.
>> =

>> Umm...  I don't have an IDE alpha box in a usable shape (fans on
>> CPU module shat themselves), and it would take a while to resurrect
>> it, but I remember the joy it used to cause in some versions.
>> =

>> Do you have reports of libata variants of drivers actually tested on
>> those?
>
> No, I haven't.  The whole point is that we're not going to keep 40000
> lines of code around despite notice for users that don't exist or
> care.  If there is a regression we'll fix it, but we're not going to
> make life miserable just because we can.

The pata_ali driver works fine on my UP1500 machine, unless something
broke recently.  I'll build the latest kernel and report back.

-- =

M=E5ns Rullg=E5rd
