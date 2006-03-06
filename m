From: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Subject: Re: Problem on Alpha with "convert to generic irq framework"
Date: Mon, 6 Mar 2006 19:13:24 +0300
Message-ID: <20060306191324.A1502@jurassic.park.msu.ru>
References: <20060304111219.GA10532@localhost> <20060306155114.A8425@jurassic.park.msu.ru> <20060306135434.GA12829@localhost>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060306135434.GA12829@localhost>; from mchouque@free.fr on Mon, Mar 06, 2006 at 02:54:34PM +0100
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Chouquet-Stringer <mchouque@free.fr>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Richard Henderson <rth@twiddle.net>, Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>

On Mon, Mar 06, 2006 at 02:54:34PM +0100, Mathieu Chouquet-Stringer wrote:
> Too bad my alpha doesn't support SRM (it's really a modified LX164
> board).
> 
> Is there anything I can do to help debug the problem?

No, thanks. I've finally found the AlphaBIOS ROM image for lx164,
that was most difficult part of the work. ;-)
Now I'm able to kill the box in just one second with 'ping -f'...
Will look into this tomorrow.

Ivan.
