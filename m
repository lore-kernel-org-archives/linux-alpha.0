From: Richard Henderson <rth7680@gmail.com>
Subject: Re: Help on memchr() EGLIBC assembly code
Date: Wed, 29 Jul 2009 17:24:59 -0700
Message-ID: <4A70E85B.7090806@gmail.com>
References: <20090713173104.GA13883@hall.aurel32.net> <119aab440907131124r3fd333d3n967cdde2cf3c2e1b@mail.gmail.com> <20090713211723.GE10110@hall.aurel32.net> <b4198de60907131516t384446e6na6cf15e7ebb1fc83@mail.gmail.com> <4A5E3272.4040904@gmail.com> <20090719142933.GO18682@hall.aurel32.net> <20090726234506.GB13723@volta.aurel32.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050204030906090703090203"
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type;
        bh=Hv/vfwUAxajC0imBHfXfNyL46h3LtnqHtYe7mwTY9Ek=;
        b=AiuTUX0JWHUD34ftQndYRRH/DUpWanZ9yGuyi0hrrEnOPCBteHppDW4IzlZVXTrn+m
         eW7SRal2nOcdEh13KCnqSy+88HSa1LNmsd6CLJqohQUpnG/RuPlEaLhvTcGLKq0Dfhqb
         66QuCfV0jXUlRwzYgkIdKnpP298LRoxMNdjHc=
In-Reply-To: <20090726234506.GB13723@volta.aurel32.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: Matt Turner <mattst88@gmail.com>, Carlos O'Donell <carlos@systemhalted.org>, debian-alpha@lists.debian.org, debian-glibc@lists.debian.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org

This is a multi-part message in MIME format.
--------------050204030906090703090203
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

On 07/26/2009 04:45 PM, Aurelien Jarno wrote:
> Knowing that $31 could be used for prefetch, I have modified the
> assembly code from memchr.S to use it. It passes all the testsuite.
>

This isn't intended to be a prefetch instruction, it's
meant to be fetching the data for the next word.  I.e.
we've unrolled the loop and there's at least 8 bytes
left in the search.

Note the

         # At least two quads remain to be accessed.

comment.  At that point we're supposed to be more
than 16 bytes away from the end of the input buffer.

Actually, the confusion I see is farther upthread:

> > >>>>> The problem is that the memchr() function on alpha uses 
> prefetch, which
> > >>>>> can cause a page boundary to be crossed, while the standards 
> (POSIX and
> > >>>>> C99) says it should stop when a match is found.

I didn't realize this when I wrote the function.

The entire function should be rewritten, since there's little
point in using a prefetch instruction that close to the load.
Prefetch instructions should be used to move data into the L1
cache, not hide the 3 cycle load delay.  Thus a prefetch, if
used, should be several cache lines ahead, not just a single word.

Perhaps a better solution would be to read words until we get
cacheline aligned, then read the entire line into 8 registers,
prefetch the next line, then process each register one by one.

Try this.


r~

--------------050204030906090703090203
Content-Type: text/x-csrc;
 name="memchr.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="memchr.c"

typedef unsigned long word;

#define ldq(X)		(*(const word *)(X))
#define ldq_u(X)	(*(const word *)((X) & -8))

#define cmpbge		__builtin_alpha_cmpbge
#define extql		__builtin_alpha_extql
#define extqh		__builtin_alpha_extqh
#define insbl		__builtin_alpha_insbl
#define insqh		__builtin_alpha_insqh
#define zap		__builtin_alpha_zap

#define unlikely(X)	__builtin_expect ((X), 0)
#define prefetch(X)	__builtin_prefetch ((void *)(X), 0)

#define find(X, Y)	cmpbge (0, (X) ^ (Y))

void *memchr (const void *xs, int xc, word n)
{
  word s = (word)xs;
  word c;
  word current, found;
  word s_align;

  if (unlikely (n == 0))
    return 0;

  current = ldq_u (s);

  /* Replicate low byte of C into all bytes.  */
  {
    word t = insbl (xc, 1);		/* 000000c0 */
    c = (xc & 0xff) | t;		/* 000000cc */
    c = (c << 16) | c;			/* 0000cccc */
    c = (c << 32) | c;			/* cccccccc */
  }

  if (unlikely (n < 9))
    goto only_quad;

  /* Align the source, and decrement the count by the number
     of bytes searched in the first word.  */
  s_align = s & -8;
  n += (s & 7);
  n -= 8;

  /* Deal with misalignment in the first word for the comparison.  */
  {
    word mask = insqh (-1, s);
    found = cmpbge (0, (current ^ c) | mask);
    if (found)
      goto found_it;
  }

  s_align += 8;

  /* If the block is sufficiently large, align to cacheline (minimum 64-bytes),
     prefetch the next line, and read entire cachelines at a time.  */
  if (unlikely (n >= 256))
    {
      prefetch (s_align + 64);
      while (s_align & 63)
	{
	  current = ldq (s_align);
	  found = find (current, c);
	  if (found)
	    goto found_it;
	  s_align += 8;
	  n -= 8;
	}

      while (n > 64)
	{
	  word c0, c1, c2, c3, c4, c5, c6, c7;

	  prefetch (s_align + 64);
	  c0 = ldq (s_align + 0*8);
	  c1 = ldq (s_align + 1*8);
	  c2 = ldq (s_align + 2*8);
	  c3 = ldq (s_align + 3*8);
	  c4 = ldq (s_align + 4*8);
	  c5 = ldq (s_align + 5*8);
	  c6 = ldq (s_align + 6*8);
	  c7 = ldq (s_align + 7*8);

	  found = find (c0, c);
	  if (unlikely (found))
	    goto found_it;
	  s_align += 8;

	  found = find (c1, c);
	  if (unlikely (found))
	    goto found_it;
	  s_align += 8;

	  found = find (c2, c);
	  if (unlikely (found))
	    goto found_it;
	  s_align += 8;

	  found = find (c3, c);
	  if (unlikely (found))
	    goto found_it;
	  s_align += 8;

	  found = find (c4, c);
	  if (unlikely (found))
	    goto found_it;
	  s_align += 8;

	  found = find (c5, c);
	  if (unlikely (found))
	    goto found_it;
	  s_align += 8;

	  found = find (c6, c);
	  if (unlikely (found))
	    goto found_it;
	  s_align += 8;

	  found = find (c7, c);
	  if (unlikely (found))
	    goto found_it;
	  s_align += 8;
	  n -= 64;
	}
    }

  /* Quadword aligned loop.  */
  while (1)
    {
      current = ldq (s_align);
      if (n < 8)
	goto last_quad;
      found = find (current, c);
      if (found)
	goto found_it;

      s_align += 8;
      n -= 8;
    }

 only_quad:
  {
    word end = zap (n, 0x80) - 1;
    word last = extqh (ldq_u (s + end), s);
    word first = extql (current, s);
    current = first | last;

    /* We've read one word and aligned it in the register.  Thus the 
       bit offset in current is relative to S.  */
    s_align = s;
  }

 last_quad:
  {
    word mask = (-1ul >> -n); 
    found = find (current, c) & mask;
    if (found == 0)
      return 0;
  }

 found_it:
  {
    word offset;

#ifdef __alpha_cix__
    offset = __builtin_alpha_cttz (found);
#else
    /* Extract LSB.  */
    found &= -found;

    /* Binary search for the LSB.  */
    offset  = (found & 0x0f ? 0 : 4);
    offset += (found & 0x33 ? 0 : 2);
    offset += (found & 0x55 ? 0 : 1);
#endif

    return (void *)(s_align + offset);
  }
}

--------------050204030906090703090203--
