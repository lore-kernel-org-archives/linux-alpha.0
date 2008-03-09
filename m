From: rct@frus.com (Bob Tracy)
Subject: Re: [regression] 2.6.25-rc4 snd-es18xx broken on Alpha
Date: Sun, 9 Mar 2008 18:57:59 -0500 (CDT)
Message-ID: <20080309235800.17D26DBA2@gherkin.frus.com>
References: <20080309153425.GA1391@jurassic.park.msu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20080309153425.GA1391@jurassic.park.msu.ru> "from Ivan Kokshaysky
 at Mar 9, 2008 06:34:25 pm"
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Bob Tracy <rct@frus.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

Ivan Kokshaysky wrote:
> Sounds like a DMA screwup.

Agreed.  There's a comment line near the top of the es18xx.c that has
been there for a *long* time:

	Support for 16 bit DMA seems to be broken. I've no hardware
	to tune it.

Supposedly with the ES1888, dma1 is for capture, dma2 is for playback.
dma2 == 5 is a 16-bit channel, yes?  That could explain much...

As for the values "chosen" for dma1 and dma2, they are the ones that
keep showing up in the Alpha sound "howto" postings/documents.  The
driver can cope with dma1 == dma2 by enforcing half-duplex mode in
software, but the OSS "sb" driver works fine with the indicated DMA
channel values.  Besides, if the ES1888 is really capable of full-duplex
operation, a potential half-duplex workaround doesn't have much appeal.

> I wonder if it still works on x86 - perhaps you ought to ask ALSA folks.

I tried contacting the driver authors as indicated in the driver source
file.  Christian Fischbach seems to have disappeared.  Still waiting to
hear from Abramo Bagnara.

-- 
------------------------------------------------------------------------
Bob Tracy          |  "I was a beta tester for dirt.  They never did
rct@frus.com       |   get all the bugs out." - Steve McGrew on /.
------------------------------------------------------------------------
