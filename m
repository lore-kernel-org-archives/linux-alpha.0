From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
Date: Thu, 02 Feb 2023 10:56:50 +0100
Message-ID: <2f35cecff35cbdaedde712c7bcd00fa4bcaff868.camel@physik.fu-berlin.de>
References: <Y9lz6yk113LmC9SI@ZenIV>
         <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
         <Y9mD1qp/6zm+jOME@ZenIV>
         <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
         <Y9te+4n4ajSF++Ex@ZenIV> <Y9t6Swqt+A9noVIf@creeky>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <Y9t6Swqt+A9noVIf@creeky>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Cree <mcree@orcon.net.nz>, Al Viro <viro@zeniv.linux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Peter Xu <peterx@redhat.com>, linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>

Hi Michael!

On Thu, 2023-02-02 at 21:54 +1300, Michael Cree wrote:
> I have never noticed because I haven't been able to run a 5.9 or
> newer kernel on Alpha reliably so have been running a 5.8 kernel
> for quite some time.

Didn't people on the debian-alpha mailing list report that newer 6.x
kernels work fine on alpha again? Did you try a recent kernel yourself?

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
