From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] Alpha: Rearrange thread info flags fixing two regressions
Date: Tue, 1 Dec 2009 10:58:47 -0500
Message-ID: <b4198de60912010758k35028979l58edca699d2b20b0@mail.gmail.com>
References: <4AE8D005.1030302@twiddle.net>
	 <1256956383-2652-1-git-send-email-mcree@orcon.net.nz>
	 <b4198de60911302006u43f52bd5xe198615971352696@mail.gmail.com>
	 <20091201123130.GA23323@infradead.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=0lMR3wuh7tEltLSunB7oqMh2eIYx+lNXSkaS1G7N80I=;
        b=stEQIRUvnvK63QXGMD5+PwQWvqWwrYSGnBCM6X3Lq0jU+C6OPwtFQfWBd9bwyhgn0J
         em5H44Se6jm1ffapFBfn/QvxixNxzO4HQy4jNmOH4NJsWmB3mZzE75NRVE7FMlRLrpuQ
         2Gj2toqVp6pBm+Sk6HGkbsd2LZTMH9Fh14L5E=
In-Reply-To: <20091201123130.GA23323@infradead.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@infradead.org>
Cc: Michael Cree <mcree@orcon.net.nz>, Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, ink@jurassic.park.msu.ru, David Howells <dhowells@redhat.com>

On Tue, Dec 1, 2009 at 7:31 AM, Christoph Hellwig <hch@infradead.org> wrote:
> On Mon, Nov 30, 2009 at 11:06:52PM -0500, Matt Turner wrote:
>> Applied to alpha-2.6.git. Thanks!
>
> Can you push this to Linus ASAP so that 2.6.33 will work nicely out of
> the box on alpha?

It's in mainline now. Linus just pulled my tree. :)

Matt
