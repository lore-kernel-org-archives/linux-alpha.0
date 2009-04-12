From: Tobias Klausmann <klausman@schwarzvogel.de>
Subject: Re: alpha: half done futex implementation
Date: Sun, 12 Apr 2009 15:49:02 +0200
Message-ID: <20090412134902.GA3760@eric.schwarzvogel.de>
References: <b4198de60904111755u5c2078c7xcc689dbd78aeb957@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b4198de60904111755u5c2078c7xcc689dbd78aeb957@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

Hi! 

30-rc1 doesn't compile on alpha:

net/socket.c: In function 'sock_alloc':
net/socket.c:496: error: implicit declaration of function 'percpu_add'
net/socket.c:496: error: 'sockets_in_use' undeclared (first use in this function)
net/socket.c:496: error: (Each undeclared identifier is reported only once
net/socket.c:496: error: for each function it appears in.)
net/socket.c: In function 'sock_release':
net/socket.c:538: error: implicit declaration of function 'percpu_sub'
net/socket.c:538: error: 'sockets_in_use' undeclared (first use in this function)

I vaguely remember seeing discussion about this on lkml, but I
can't find it right now.

gcc is 4.3.3. Distro is Gentoo, machine is a UP1500 (Nautilus).

Regards,
Tobias

-- 
Save a tree - disband an ISO working group today.
