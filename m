From: David Howells <dhowells@redhat.com>
Subject: Re: Alpha: suspicious compiler warning in entry.S
Date: Fri, 30 Oct 2009 13:16:59 +0000
Message-ID: <5962.1256908619@redhat.com>
References: <4AE7ECC2.8050202@orcon.net.nz>
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <4AE7ECC2.8050202@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: dhowells@redhat.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, rth@twiddle.net, ink@jurassic.park.msu.ru

Michael Cree <mcree@orcon.net.nz> wrote:

> On the assumption that it is important to include the TIF_NOTIFY_RESUME bit
> one might be tempted to modify the code to:
> 
>    lda    $2, _TIF_WORK_MASK
>    and    $5, $2, $2
> 
> but this is time critical code.  I am wondering whether it might be better
> to rearrange the bits in the thread information flags so that _TIF_WORK_MASK
> has a value less than 255 and the single instruction to perform an and
> operation can be maintained.

Unless the LDA can be interleaved around some memory accesses, then yes,
compressing _TIF_WORK_MASK would be good.

David
