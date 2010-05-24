From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 016/199] arch/alpha/boot/bootp.c: Checkpatch cleanup
Date: Mon, 24 May 2010 21:26:44 +0200
Message-ID: <20100524192644.GA9766@merkur.ravnborg.org>
References: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrea Gelmini <andrea.gelmini@gelma.net>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Tejun Heo <tj@kernel.org>, Michal Marek <mmarek@suse.cz>, Christoph Lameter <cl@linux-foundation.org>, linux-alpha@vger.kernel.org

On Sun, May 23, 2010 at 09:54:03PM +0200, Andrea Gelmini wrote:
> arch/alpha/boot/bootp.c:25: WARNING: externs should be avoided in .c files
> arch/alpha/boot/bootp.c:26: ERROR: "foo * bar" should be "foo *bar"
> arch/alpha/boot/bootp.c:29: WARNING: externs should be avoided in .c files
> arch/alpha/boot/bootp.c:51: ERROR: trailing whitespace
> arch/alpha/boot/bootp.c:71: ERROR: "foo * bar" should be "foo *bar"
> arch/alpha/boot/bootp.c:72: ERROR: "foo * bar" should be "foo *bar"
> arch/alpha/boot/bootp.c:103: CHECK: multiple assignments should be avoided
> arch/alpha/boot/bootp.c:129: WARNING: externs should be avoided in .c files
> arch/alpha/boot/bootp.c:155: ERROR: code indent should use tabs where possible
> arch/alpha/boot/bootp.c:165: ERROR: trailing whitespace
> arch/alpha/boot/bootp.c:180: WARNING: braces {} are not necessary for single statement blocks
> arch/alpha/boot/bootp.c:203: ERROR: code indent should use tabs where possible
> arch/alpha/boot/bootp.c:204: ERROR: code indent should use tabs where possible
> arch/alpha/boot/bootp.c:206: ERROR: "(foo*)" should be "(foo *)"
> arch/alpha/boot/bootp.c:207: ERROR: "(foo*)" should be "(foo *)"

If you are touching these files then please do us
all and do it properly.

1) One patch to cover arch/alpha/boot
2) Use the fact that checkpatch warns as an indication that these files could use
some attention.

A few examples..

> 
> Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
> ---
>  arch/alpha/boot/bootp.c |   23 +++++++++++------------
>  1 files changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/alpha/boot/bootp.c b/arch/alpha/boot/bootp.c
> index 3c8d1b2..a85041a 100644
> --- a/arch/alpha/boot/bootp.c
> +++ b/arch/alpha/boot/bootp.c
> @@ -23,7 +23,7 @@
>  #include "ksize.h"
>  
>  extern unsigned long switch_to_osf_pal(unsigned long nr,
> -	struct pcb_struct * pcb_va, struct pcb_struct * pcb_pa,
> +	struct pcb_struct *pcb_va, struct pcb_struct *pcb_pa,
>  	unsigned long *vptb);
The function is used by bootp.c and bootz.c - so move it to boot.h (new file).

VPTB (last argument in this function) is a constant defined 
to the same value in three files.
Move it to boot.h too.

And bonus points if you drop the last argument to switch_to_osf_pal()
as it is always the same.


>  
>  extern void move_stack(unsigned long new_stack);

Same story as above,

From same file:
struct hwrpb_struct *hwrpb = INIT_HWRPB;

Seems unused - can it be dropped?

find_pa()
Drop empty line between comment and function.
Prototype in one line

[prototype in one line is general for the files]


Took a short look at main.c too.
Prototype for vsprintf() is unused - dropt it.

Some functions looks to be the same as used in other files.
Maybe worth sharing.


The message here is that it is better to actually look at the stuff you change
rather than doing mechanical "fix checkpatch warnings" type of things.

It is obvious that this takes a magnitude longer and is also a magnitude more complex.

The result may by the way be a number of patches doing small steps each.

Doing it properly is worth the effort in the end.

	Sam
