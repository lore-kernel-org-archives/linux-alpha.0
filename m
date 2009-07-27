From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: Help on memchr() EGLIBC assembly code
Date: Mon, 27 Jul 2009 11:29:53 +0200
Message-ID: <20090727092953.GA24756@volta.aurel32.net>
References: <20090713173104.GA13883@hall.aurel32.net> <119aab440907131124r3fd333d3n967cdde2cf3c2e1b@mail.gmail.com> <20090713211723.GE10110@hall.aurel32.net> <b4198de60907131516t384446e6na6cf15e7ebb1fc83@mail.gmail.com> <4A5E3272.4040904@gmail.com> <20090719142933.GO18682@hall.aurel32.net> <20090726234506.GB13723@volta.aurel32.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090726234506.GB13723@volta.aurel32.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth7680@gmail.com>
Cc: Matt Turner <mattst88@gmail.com>, Carlos O'Donell <carlos@systemhalted.org>, debian-alpha@lists.debian.org, debian-glibc@lists.debian.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org

On Mon, Jul 27, 2009 at 01:45:06AM +0200, Aurelien Jarno wrote:
> On Sun, Jul 19, 2009 at 04:29:33PM +0200, Aurelien Jarno wrote:
> > On Wed, Jul 15, 2009 at 12:48:02PM -0700, Richard Henderson wrote:
> > > On 07/13/2009 03:16 PM, Matt Turner forwarded:
> > >>>>> The problem is that the memchr() function on alpha uses prefetch, which
> > >>>>> can cause a page boundary to be crossed, while the standards (POSIX and
> > >>>>> C99) says it should stop when a match is found.
> > >
> > > That's not supposed to matter -- faults from prefetch are supposed to be  
> > > ignored; see do_page_fault:
> > 
> > The problem is that the "prefech" is not done with $31, but using $1 and
> > $3. It is called "prefetch" in the code, but it is more like "read a value
> > in advance".
> > 
> 
> Knowing that $31 could be used for prefetch, I have modified the
> assembly code from memchr.S to use it. It passes all the testsuite.
> 
> Comments are welcome. Then I'll do the alphaev6 version.

Here is the alphaev6 version:

--- a/sysdeps/alpha/alphaev6/memchr.S
+++ b/sysdeps/alpha/alphaev6/memchr.S
@@ -127,7 +127,7 @@ $first_quad:
         cmpbge  $31, $1, $2	# E :
         bne     $2, $found_it	# U :
 	# At least one byte left to process.
-	ldq	$1, 8($0)	# L :
+	ldq	$31, 8($0)	# L :
 	subq	$5, 1, $18	# E : U L U L
 
 	addq	$0, 8, $0	# E :
@@ -143,38 +143,38 @@ $first_quad:
 	and	$4, 8, $4	# E : odd number of quads?
 	bne	$4, $odd_quad_count # U :
 	# At least three quads remain to be accessed
-	mov	$1, $4		# E : L U L U : move prefetched value to correct reg
+	nop			# E : L U L U : move prefetched value to correct reg
 
 	.align	4
 $unrolled_loop:
-	ldq	$1, 8($0)	# L : prefetch $1
-	xor	$17, $4, $2	# E :
-	cmpbge	$31, $2, $2	# E :
-	bne	$2, $found_it	# U : U L U L
+	ldq	$1, 0($0)	# L : load quad
+	xor	$17, $1, $2	# E :
+	ldq	$31, 8($0)	# L : prefetch next quad
+	cmpbge	$31, $2, $2	# E : U L U L
 
+	bne	$2, $found_it	# U :
 	addq	$0, 8, $0	# E :
 	nop			# E :
 	nop			# E :
-	nop			# E :
 
 $odd_quad_count:
+	ldq	$1, 0($0)	# L : load quad
 	xor	$17, $1, $2	# E :
-	ldq	$4, 8($0)	# L : prefetch $4
+	ldq	$31, 8($0)	# L : prefetch $4
 	cmpbge	$31, $2, $2	# E :
-	addq	$0, 8, $6	# E :
 
+	addq	$0, 8, $6	# E :
 	bne	$2, $found_it	# U :
 	cmpult	$6, $18, $6	# E :
 	addq	$0, 8, $0	# E :
-	nop			# E :
 
 	bne	$6, $unrolled_loop # U :
-	mov	$4, $1		# E : move prefetched value into $1
 	nop			# E :
 	nop			# E :
-
-$final:	subq	$5, $0, $18	# E : $18 <- number of bytes left to do
 	nop			# E :
+
+$final:	ldq	$1, 0($0)	# L : load last quad
+	subq	$5, $0, $18	# E : $18 <- number of bytes left to do
 	nop			# E :
 	bne	$18, $last_quad	# U :
 


-- 
Aurelien Jarno                          GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net
