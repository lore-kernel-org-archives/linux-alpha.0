From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] Fix for 2.6.6 Makefiles to get KBUILD_OUTPUT working
Date: Tue, 18 May 2004 17:28:34 +0200
Sender: linux-mips-bounce@linux-mips.org
Message-ID: <20040518152834.GA2635@mars.ravnborg.org>
References: <20040516012245.GA11733@localhost> <20040516203322.GA4784@mars.ravnborg.org> <20040517152311.GA29999@localhost>
Mime-Version: 1.0
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <20040517152311.GA29999@localhost>
Errors-to: linux-mips-bounce@linux-mips.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Chouquet-Stringer <mchouque@online.fr>, linux-kernel@vger.kernel.org, rth@twiddle.net, linux-alpha@vger.kernel.org, ralf@gnu.org, linux-mips@linux-mips.org, akpm@osdl.org, bjornw@axis.com, dev-etrax@axis.com, mikael.starvik@axis.com, sam@ravnborg.org

> > Hereby the '+' sign is no longer needed (used today where makeboot is used.
> 
> Ok, I applied the changes you requested, please check the diff for mips as
> I had to modify some other lines too.

Looks goood, but the cris part is missing?
Please pass on current patch to Andrew with a nice changelog entry.
The cris part we can take later if Mikael does not surface.

	Sam

