From: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH v2] Implement close-on-fork
Date: Fri, 15 May 2020 17:53:20 +0100
Message-ID: <197934.1589561600@warthog.procyon.org.uk>
References: <954ef5ce2e47472f8b41300bf59209c5@garmin.com> <20200515152321.9280-1-nate.karstens@garmin.com> <20200515160342.GE23230@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589561610;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gN8Ffkm75Z04j5uijHXbjpI4CgfRAT5o0xWHEAmKzV4=;
        b=LTQTy1Hp92ZH/93lZOVcssDrHZur8fZalYvnHhDcQOHRx/xRm5nkVWzhpZw7UQ7ecHssr5
        ZCX5icXjuIUkCjslivb93FcD3ED4yvjemZ7/hfuvxk+5HDYmz5yWDwL5stWTkDQERkN0Hu
        HBd3E+kv2gkUBSQ3zbHG6qdDS0cw1TI=
In-Reply-To: <954ef5ce2e47472f8b41300bf59209c5@garmin.com>
Content-ID: <197933.1589561600.1@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: "Karstens, Nate" <Nate.Karstens@garmin.com>
Cc: dhowells@redhat.com, Al Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>, "J. Bruce Fields" <bfields@fieldses.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, David Laight <David.Laight@aculab.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.o>

Karstens, Nate <Nate.Karstens@garmin.com> wrote:

> > already has a portable solution
> 
> What is the solution?

sys_spawn(const char *path, const char **argv, const char **envv,
	  unsigned long clone_flags, unsigned int nfds, int *fds);

maybe?

David

