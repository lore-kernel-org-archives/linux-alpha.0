From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] tty: Fix TIOCGPTPEER ioctl definition
Date: Tue, 11 Jul 2017 09:30:14 +0200
Message-ID: <CAK8P3a1uJc0dNoELw1KWKnc9Lme3HDxR2Coj0-snuCmO4n-81A@mail.gmail.com>
References: <20170711001207.GA11642@glebfm.cloud.tilaa.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=j42UM+l67ybSj9H+sUgHlPehOBQ67zJxoPae4Os7tdM=;
        b=GfTbOHQ4fe9k6y0v0ZPynk8j+4lrTmKrSH5tyT7qRgNUq2EQyJHGBQo+jwSJU4hlQk
         Wp6Kk9OC2GuyzjQiQZ3hmBELPEaJWOxMIoyrOeY4wy9jYPq7RdC08FZ6hOCVYt78knJW
         5mcHvFsdo4C/MZ9ZqZ0o7jvJx2riEm9sdvWrmsoXXGAN4yuXfhhbxnhLrVOtxqiuZh/O
         wP7IV4z84jcZp1VjtUe018eGMaz4gj2POItzrNtID/Fi5UG4daZQ3QiTkD9ZdRfJoULD
         uHjGHC/TA74oOYq1QxN/uXzDGkuhL9GRLeb+5Z0i7/UJEcHtlboVH+lgTvqe3tVDqxYE
         mydQ==
In-Reply-To: <20170711001207.GA11642@glebfm.cloud.tilaa.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>
Cc: Aleksa Sarai <asarai@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Christian Brauner <christian.brauner@ubuntu.com>, Valentin Rothberg <vrothberg@suse.com>, "Dmitry V. Levin" <ldv@altlinux.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org, "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, Parisc List <linux-parisc@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-sh@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>, linux-xtensa@linux-xtensa.org, linux-arch <linux-arch@vger.kernel.org>

On Tue, Jul 11, 2017 at 2:12 AM, Gleb Fotengauer-Malinovskiy
<glebfm@altlinux.org> wrote:
> This ioctl does nothing to justify an _IOC_READ or _IOC_WRITE flag
> because it doesn't copy anything from/to userspace to access the
> argument.
>
> Fixes: 54ebbfb1 ("tty: add TIOCGPTPEER ioctl")
> Signed-off-by: Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>
