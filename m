From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: Help on memchr() EGLIBC assembly code
Date: Mon, 27 Jul 2009 01:45:06 +0200
Message-ID: <20090726234506.GB13723@volta.aurel32.net>
References: <20090713173104.GA13883@hall.aurel32.net> <119aab440907131124r3fd333d3n967cdde2cf3c2e1b@mail.gmail.com> <20090713211723.GE10110@hall.aurel32.net> <b4198de60907131516t384446e6na6cf15e7ebb1fc83@mail.gmail.com> <4A5E3272.4040904@gmail.com> <20090719142933.GO18682@hall.aurel32.net>
Mime-Version: 1.0
Return-path: <bounce-debian-glibc=debian-glibc=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <20090719142933.GO18682@hall.aurel32.net>
Resent-Message-ID: <LKAc741oNtP.A.3rG.XqObKB@liszt>
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:debian-glibc@lists.debian.org>
List-Help: <mailto:debian-glibc-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-glibc-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-glibc-request@lists.debian.org?subject=unsubscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth7680@gmail.com>
Cc: Matt Turner <mattst88@gmail.com>, Carlos O'Donell <carlos@systemhalted.org>, debian-alpha@lists.debian.org, debian-glibc@lists.debian.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org

On Sun, Jul 19, 2009 at 04:29:33PM +0200, Aurelien Jarno wrote:
> On Wed, Jul 15, 2009 at 12:48:02PM -0700, Richard Henderson wrote:
> > On 07/13/2009 03:16 PM, Matt Turner forwarded:
> >>>>> The problem is that the memchr() function on alpha uses prefetch, which
> >>>>> can cause a page boundary to be crossed, while the standards (POSIX and
> >>>>> C99) says it should stop when a match is found.
> >
> > That's not supposed to matter -- faults from prefetch are supposed to be  
> > ignored; see do_page_fault:
> 
> The problem is that the "prefech" is not done with $31, but using $1 and
> $3. It is called "prefetch" in the code, but it is more like "read a value
> in advance".
> 

Knowing that $31 could be used for prefetch, I have modified the
assembly code from memchr.S to use it. It passes all the testsuite.

Comments are welcome. Then I'll do the alphaev6 version.

diff --git a/sysdeps/alpha/memchr.S b/sysdeps/alpha/memchr.S
index 5d713d5..87c7fb1 100644
--- a/sysdeps/alpha/memchr.S
+++ b/sysdeps/alpha/memchr.S
@@ -119,7 +119,7 @@ $first_quad:
 
 	# At least one byte left to process.
 
-	ldq	t0, 8(v0)	# e0	:
+	ldq	zero, 8(v0)	# e0	: prefetch next quad
 	subq	t4, 1, a2	# .. e1 :
 	addq	v0, 8, v0	#-e0	:
 
@@ -138,19 +138,19 @@ $first_quad:
 
 	# At least three quads remain to be accessed
 
-	mov	t0, t3		# e0	: move prefetched value to correct reg
-
 	.align	4
 $unrolled_loop:
-	ldq	t0, 8(v0)	#-e0	: prefetch t0
-	xor	a1, t3, t1	# .. e1 :
-	cmpbge	zero, t1, t1	# e0	:
-	bne	t1, $found_it	# .. e1 :
+	ldq	t0, 0(v0)	# e0	: load quad
+	xor	a1, t0, t1	# .. e1 :
+	ldq	zero, 8(v0)	# e0	: prefetch next quad
+	cmpbge	zero, t1, t1	# .. e1:
+	bne	t1, $found_it	# e0    :
 
-	addq	v0, 8, v0	#-e0	:
+	addq	v0, 8, v0	#    e1	:
 $odd_quad_count:
+	ldq	t0, 0(v0)	# e0	: load quad
 	xor	a1, t0, t1	# .. e1 :
-	ldq	t3, 8(v0)	# e0	: prefetch t3
+	ldq	zero, 8(v0)	# e0	: prefetch next quad
 	cmpbge	zero, t1, t1	# .. e1 :
 	addq	v0, 8, t5	#-e0	:
 	bne	t1, $found_it	# .. e1	:
@@ -159,8 +159,8 @@ $odd_quad_count:
 	addq	v0, 8, v0	# .. e1 :
 	bne	t5, $unrolled_loop #-e1 :
 
-	mov	t3, t0		# e0	: move prefetched value into t0
-$final:	subq	t4, v0, a2	# .. e1	: a2 <- number of bytes left to do
+$final:	ldq	t0, 0(v0)	# e0	: load last quad
+	subq	t4, v0, a2	# .. e1	: a2 <- number of bytes left to do
 	bne	a2, $last_quad	# e1	:
 
 $not_found:

-- 
Aurelien Jarno                          GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net

