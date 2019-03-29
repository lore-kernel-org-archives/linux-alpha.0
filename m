From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: CONFIG_ARCH_SUPPORTS_INT128: Why not mips, s390, powerpc, and
 alpha?
Date: Sat, 30 Mar 2019 09:00:15 +1300
Message-ID: <20190329200015.ujmjrvn6ta67h74j@tower>
References: <201903291307.x2TD772v013534@sdf.org>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-Disposition: inline
In-Reply-To: <201903291307.x2TD772v013534@sdf.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: George Spelvin <lkml@sdf.org>
Cc: linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org

On Fri, Mar 29, 2019 at 01:07:07PM +0000, George Spelvin wrote:
> I was working on some scaling code that can benefit from 64x64->128-bit
> multiplies.  GCC supports an __int128 type on processors with hardware
> support (including z/Arch and MIPS64), but the support was broken on
> early compilers, so it's gated behind CONFIG_ARCH_SUPPORTS_INT128.
[snip] 
> I don't have easy access to an Alpha cross-compiler to test, but
> as it has UMULH, I suspect it would work, too.

On Debian/Ubuntu it is just a matter of:
apt-get install gcc-alpha-linux-gnu

> Or this handwritten Alpha code:
> 1:
> 	bsr	$26, get_random_u64
> 	mulq	$0, $9, $1	# $9 is range
> 	cmpult	$1, $10, $1	# $10 is lim
> 	bne	$1, 1b
> 	umulh	$0, $9, $0

The compiler produces:

$L2:
	ldq $27,get_random_u64($29)		!literal!2
	jsr $26,($27),get_random_u64		!lituse_jsr!2
	ldah $29,0($26)		!gpdisp!3
	mulq $0,$9,$1
	lda $29,0($29)		!gpdisp!3
	umulh $0,$9,$0
	cmpule $10,$1,$1
	beq $1,$L2

It does move the umulh inside the loop but that seems sensible since
the use of unlikely() implies that the loop is unlikely to be taken
so on average it would be a good bet to start the calculation of
umulh earlier since it has a few cycles latency to get the result,
and it is pipelined so it can be calculated in the shadow of the
mulq instruction on the same execution unit.  On the older CPUs
(before EV6 which are not out-of-order execution) having the umulh
inside the loop may be a net gain.

Cheers,
Michael.
