From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH] llist: Fix missing lockless_dereference()
Date: Sat, 7 Feb 2015 22:30:44 +0000 (UTC)
Message-ID: <1117480383.90061.1423348244225.JavaMail.zimbra@efficios.com>
References: <1423274934-10625-1-git-send-email-mathieu.desnoyers@efficios.com> <20150207221625.GB31119@kroah.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150207221625.GB31119@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg KH <gregkh@linuxfoundation.org>, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: Huang Ying <ying.huang@intel.com>, linux-kernel@vger.kernel.org, Paul McKenney <paulmck@linux.vnet.ibm.com>, David Howells <dhowells@redhat.com>, Pranith Kumar <bobby.prani@gmail.com>, stable@vger.kernel.org

----- Original Message -----
> From: "Greg KH" <gregkh@linuxfoundation.org>
> To: "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>
> Cc: "Huang Ying" <ying.huang@intel.com>, linux-kernel@vger.kernel.org, "Paul McKenney" <paulmck@linux.vnet.ibm.com>,
> "David Howells" <dhowells@redhat.com>, "Pranith Kumar" <bobby.prani@gmail.com>, stable@vger.kernel.org
> Sent: Saturday, February 7, 2015 5:16:25 PM
> Subject: Re: [PATCH] llist: Fix missing lockless_dereference()
> 
> On Fri, Feb 06, 2015 at 09:08:21PM -0500, Mathieu Desnoyers wrote:
> > A lockless_dereference() appears to be missing in llist_del_first().
> > It should only matter for Alpha in practice.
> 
> Meta-comment, do we really care about Alpha anymore?  Is it still
> consered an "active" arch we support?  I haven't seen a single
> alpha-related stable patch in _years_ if at all, which implies to me
> that no one is even using it.
> 
> Not that stable patches for architectures are a valid reference for how
> much they are used, but it does give me a good indication of what arches
> have users that actually care about a modern (i.e. within the past 5
> years) kernel.

Good question. Adding the Alpha maintainers to the CC.

Thanks,

Mathieu

> 
> thanks,
> 
> greg k-h
> 

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
