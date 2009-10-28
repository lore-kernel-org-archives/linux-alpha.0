From: Richard Henderson <rth@twiddle.net>
Subject: Re: Alpha: suspicious compiler warning in entry.S
Date: Wed, 28 Oct 2009 16:13:09 -0700
Message-ID: <4AE8D005.1030302@twiddle.net>
References: <4AE7ECC2.8050202@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <4AE7ECC2.8050202@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michael Cree <mcree@orcon.net.nz>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, ink@jurassic.park.msu.ru, David Howells <dhowells@redhat.com>

On 10/28/2009 12:03 AM, Michael Cree wrote:
> I am wondering whether it might be better
> to rearrange the bits in the thread information flags so that
> _TIF_WORK_MASK
> has a value less than 255 and the single instruction to perform an and
> operation can be maintained.

It would be better to rearrange TIF_NODIFY_RESUME down to 3.

In fact, you might as well rearrange the ones currently occupying
3-7 up to 8 and leave a hole for _TIF_WORK_MASK expansion, and
add a nice comment there at the same time.


r~
