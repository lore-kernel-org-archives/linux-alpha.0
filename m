From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] alpha: Fix mixed up args in EXC macro in futex operations
Date: Fri, 24 Nov 2017 10:06:45 +0100
Message-ID: <20171124090645.GA6449@kroah.com>
References: <20171124082501.9436-1-mcree@orcon.net.nz>
Mime-Version: 1.0
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171124082501.9436-1-mcree@orcon.net.nz>
Sender: stable-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: linux@vger.kernel.org, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>, stable@vger.kernel.org

On Fri, Nov 24, 2017 at 09:25:01PM +1300, Michael Cree wrote:
> Fix the typo (mixed up arguments) in the EXC macro in the futex
> definitions introduced by commit ca282f697381 (alpha: add a
> helper for emitting exception table entries).
> 
> Signed-off-by: Michael Cree <mcree@orcon.net.nz>
> ---
>  arch/alpha/include/asm/futex.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
