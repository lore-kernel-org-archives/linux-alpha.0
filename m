From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: recent udev upgrade failure on alpha
Date: Thu, 24 Feb 2011 22:54:27 +1300
Message-ID: <4D662AD3.5000700@orcon.net.nz>
References: <20110224070203.GA28419@gherkin.frus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
In-Reply-To: <20110224070203.GA28419@gherkin.frus.com>
Resent-Message-ID: <30eIS8QbDLN.A.vY.v8iZNB@liszt>
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: debian-alpha@lists.debian.org
Cc: rct@gherkin.frus.com, mattst88@gmail.com, linux-alpha@vger.kernel.org

On 24/02/11 20:02, Bob Tracy wrote:
> Well...  Yes, "sid" is cantankerous and known to occasionally break
> working systems, but this is the first time the thermonuclear software
> upgrade option has been used effectively on my poor Alpha :-(.
>
> Specifically, I've got about 50 installed but unconfigured packages and
> an almost unbootable (single-user mode only) machine because udev 166-1
> absolutely requires inotify support,

Oops, sorry, I should've sent a message to the list to warn people of this!

As you have identified the problem is that the syscall inotify_init1() 
is not implemented in the Debian supplied kernel.  It did not make it 
into the kernel until version 2.6.33. I did submit a bug report and a 
patch to update the kernel to the Debian bugzilla but I was too late and 
the Squeeze freeze beat me to it and it didn't get included.

So unless you are prepared to:

1) Download a new kernel and compile and install it yourself,

2) run "make headers_install" in the kernel and copy the file 
usr/include/asm/unistd.h header from the kernel sources to the system 
/usr/include/asm/unistd.h,

3) and rebuild libc6.1 from source (which is a time consuming build) and 
install it

don't upgrade to Sid!!!  I think a new kernel may have appeared in Sid 
in the last day or two so the first two steps above may no longer be 
needed, but the third step is needed until a new libc6.1 package comes 
through.

And if you have upgraded to Sid in the last week (or so) and hit the 
unconfigured udev problem don't switch off or reboot your machine until 
you have done all the above steps else you may find your Alpha unbootable.

And the other problem I have hit is that the upgraded apt and apt-utils 
packages are broken and it leaves one unable to upgrade their system! So 
make sure you have copies of the deb files for apt and apt-utils for the 
latest version that made it into Squeeze on hand.  I think I have placed 
a hold on apt and apt-utils at version 0.8.10.3.   I hadn't made a bug 
report at the time I encountered this problem as there were other bug 
reports already made that looked a little similar.  But the apt that I 
got a couple of days ago was still borked.

Cheers
Michael.

