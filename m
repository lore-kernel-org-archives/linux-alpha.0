From: Christoph Lameter <cl@linux.com>
Subject: Re: alpha: Replace __get_cpu_var
Date: Fri, 2 May 2014 10:08:08 -0500 (CDT)
Message-ID: <alpine.DEB.2.10.1405021007150.30890@gentwo.org>
References: <alpine.DEB.2.10.1405011537360.21035@gentwo.org> <20140502081844.GA6891@omega>
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20140502081844.GA6891@omega>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20140121; t=1399043290;
	bh=2XfycJPXTaaG2N2Whw9ZJO4e6ZMaWwnkVS1IQ6nfjbk=;
	h=Received:Received:Received:Received:Date:From:To:Subject:
	 Message-ID:Content-Type;
	b=jCAjLmoKlxiIeb7jc8Q9uWf5fe7/LlIURcqYGQhKl2ocxwSVll7O7hvugqJhoqpdi
	 JIbDQYPgn6uTzmK4kbeULQwugWE/Ft1GbJqnVkW8DAnajYr5pLpk30Xchwa2R5tJ3P
	 /lmN0dN/k/CqMZwRpfufkPF7/rm7LYD2jgQNRNPS+40PR3erpB933yUZ6c2Yt6sxfg
	 hu4I+LMPvZXpDMBIxWp2Bk0/x0Wtc3tlgLwxd0R3wk4fNEbZc8V01zK2S+jFl3DDQa
	 XuxjZLhZwdHx8hl+UMI4bqBUDYIqF7XK4iexUJl8AakONrxeKBkdoAhpFNgGgPcPSa
	 QvfIN5qa83uYw==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

On Fri, 2 May 2014, Michael Cree wrote:

> On Thu, May 01, 2014 at 03:39:28PM -0500, Christoph Lameter wrote:
> > Sorry I have not compiled this code. Could you see if this works?
>
> The patch does not apply cleanly against an up to date pull from Linus'
> tree; the last hunk against /arch/alpha/kernel/perf_event.c fails.
> Fixing that manually then the compilation fails in
> arch/alpha/kernel/time.c with multiple errors due to the changes.
>
> Are there other patches that should be applied first?

Hmmm... it applied yesterday against linux-next. Will rediff against Linus
tree and will have a look at time.c

