From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH] vfs: move getname() from callers to do_mount()
Date: Mon, 15 Sep 2014 06:18:50 +0100
Message-ID: <20140915051850.GT7996@ZenIV.linux.org.uk>
References: <1410537212-3153-1-git-send-email-waydi1@gmail.com>
 <1410700510-15408-1-git-send-email-waydi1@gmail.com>
 <20140914181259.GQ7996@ZenIV.linux.org.uk>
 <CA+LGb9aaMpiotK7-NUv4hKcJHbuWQE=DC=p=90ZguWqn44qcTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+LGb9aaMpiotK7-NUv4hKcJHbuWQE=DC=p=90ZguWqn44qcTQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Seunghun Lee <waydi1@gmail.com>
Cc: Bruce Fields <bfields@fieldses.org>, ink@jurassic.park.msu.ru, jlayton@poochiereds.net, linux-fsdevel@vger.kernel.org, linux-alpha@vger.kernel.org, mattst88@gmail.com, rth@twiddle.net, linux-kernel@vger.kernel.org

On Mon, Sep 15, 2014 at 01:39:19PM +0900, Seunghun Lee wrote:
> 2014. 9. 15. =EC=98=A4=EC=A0=84 3:13=EC=97=90 "Al Viro" <viro@zeniv.l=
inux.org.uk> wrote:
> > Applied with one modification: this getname/kern_path/putname is

> Ok, I will resend it after modification.

See above...  It's already in vfs.git#for-next.  The last commit of the
branch at the moment.  The change was trivial - done it while applying =
the
patch.
