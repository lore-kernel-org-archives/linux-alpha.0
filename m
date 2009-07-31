From: Richard Henderson <rth@twiddle.net>
Subject: Re: Help on memchr() EGLIBC assembly code
Date: Fri, 31 Jul 2009 16:25:46 -0700
Message-ID: <4A737D7A.8010304@twiddle.net>
References: <20090713173104.GA13883@hall.aurel32.net> <119aab440907131124r3fd333d3n967cdde2cf3c2e1b@mail.gmail.com> <20090713211723.GE10110@hall.aurel32.net> <b4198de60907131516t384446e6na6cf15e7ebb1fc83@mail.gmail.com> <4A5E3272.4040904@gmail.com> <20090719142933.GO18682@hall.aurel32.net> <20090726234506.GB13723@volta.aurel32.net> <4A70E85B.7090806@gmail.com> <20090730162915.GM5127@volta.aurel32.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040109000701030008070400"
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20090730162915.GM5127@volta.aurel32.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: Matt Turner <mattst88@gmail.com>, Carlos O'Donell <carlos@systemhalted.org>, debian-alpha@lists.debian.org, debian-glibc@lists.debian.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>

This is a multi-part message in MIME format.
--------------040109000701030008070400
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

On 07/30/2009 09:29 AM, Aurelien Jarno wrote:
> Thanks for this patch I have tried it, and it does not have the original
> problem I have reported. Unfortunately it does not pass the glibc
> testsuite. I'll try to debug the problem later (I don't own an alpha
> machine, and need to have internet access to debug it remotely).
>

This one passes the test suite (on x86, with replacements for the alpha 
builtins).


r~

--------------040109000701030008070400
Content-Type: text/x-csrc;
 name="memchr.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="memchr.c"

typedef unsigned long word;

#ifdef __alpha__
#define cmpbeq0(X)	__builtin_alpha_cmpbge(0, (X))
#define extql		__builtin_alpha_extql
#define extqh		__builtin_alpha_extqh
#define insbl		__builtin_alpha_insbl
#define zap		__builtin_alpha_zap
#else
static word
cmpbeq0(word y)
{
  word i, r = 0;
  for (i = 0; i < 8; ++i)
    {
      unsigned char yc = (y >> i*8);
      if (yc == 0)
	r |= 1 << i;
    }
  return r;
}

static word
extql(word x, word y)
{
  return x >> ((y & 7) * 8);
}

static word
extqh(word x, word y)
{
  return x << (64 - ((y & 7) * 8));
}

static word
zap(word x, word y)
{
  word i, mask = 0;
  for (i = 0; i < 8; ++i)
    if (y & (1 << i))
      mask |= (word)0xff << (i * 8);
  return x & ~mask;
}

static word
insbl(word x, word y)
{
  word byte_mask = 1ul << (y & 7);
  word byte_loc = (y & 7) * 8;
  return zap (x << byte_loc, ~byte_mask);
}
#endif

static inline word
ldq_u(word s)
{
  return *(const word *)(s & -8);
}

#define unlikely(X)	__builtin_expect ((X), 0)
#define prefetch(X)	__builtin_prefetch ((void *)(X), 0)

#define find(X, Y)	cmpbeq0 ((X) ^ (Y))

void *
memchr (const void *xs, int xc, word n)
{
  const word *s_align;
  const word s = (word) xs;
  word t, current, found;

  if (unlikely (n == 0))
    return 0;

  current = ldq_u (s);

  /* Replicate low byte of XC into all bytes of C.  */
  t = insbl (xc, 1);			/* 000000c0 */
  t = (xc & 0xff) | t;			/* 000000cc */
  t = (t << 16) | t;			/* 0000cccc */
  const word c = (t << 32) | t;		/* cccccccc */

  /* When N <= 8, we can perform the entire comparison in one go.
     Load the N bytes into the low part of CURRENT, via an unaligned
     quadword load sequence, and treat it as the last aligned word read.  */
  if (unlikely (n <= 8))
    {
      /* Tweak the standard unaligned quadword load sequence by issuing
	 the second ldq_u at (s + n - 1) instead of (s + 8 - 1).  This
	 avoids crossing a page boundary when S+N doesn't.  */
      word last = extqh (ldq_u (s + n - 1), s);
      word first = extql (current, s);
      current = first | last;
      s_align = (const word *) s;
      goto last_quad;
    }

  /* Align the source, and decrement the count by the number
     of bytes searched in the first word.  */
  s_align = (const word *)(s & -8);
  n += (s & 7);

  /* Deal with misalignment in the first word for the comparison.  */
  {
    word mask = -1ul << (s & 7);
    found = find (current, c) & mask;
    if (unlikely (found))
      goto found_it;
  }

  s_align++;
  n -= 8;

  /* If the block is sufficiently large, align to cacheline and prefetch.  */
  if (unlikely (n >= 256))
    {
      /* Prefetch 3 cache lines beyond the one we're working on.  */
      prefetch (s_align + 8);
      prefetch (s_align + 16);
      prefetch (s_align + 24);

      while ((word)s_align & 63)
	{
	  current = *s_align;
	  found = find (current, c);
	  if (found)
	    goto found_it;
	  s_align++;
	  n -= 8;
	}

	/* Within each cacheline, advance the load for the next word
	   before the test for the previous word is complete.  This
	   allows us to hide the 3 cycle L1 cache load latency.  We
	   only perform this advance load within a cacheline to prevent
	   reading across page boundary.  */
#define CACHELINE_LOOP				\
	do {					\
	  word i, next = s_align[0];		\
	  for (i = 0; i < 7; ++i)		\
	    {					\
	      current = next;			\
	      next = s_align[1];		\
	      found = find (current, c);	\
	      if (unlikely (found))		\
		goto found_it;			\
	      s_align++;			\
	    }					\
	  current = next;			\
	  found = find (current, c);		\
	  if (unlikely (found))			\
	    goto found_it;			\
	  s_align++;				\
	  n -= 64;				\
	} while (0)
      
      /* While there's still lots more data to potentially be read,
	 continue issuing prefetches for the 4th cacheline out.  */
      while (n >= 256)
	{
	  prefetch (s_align + 24);
	  CACHELINE_LOOP;
	}

      /* Up to 3 cache lines remaining.  Continue issuing advanced
	 loads, but stop prefetching.  */
      while (n >= 64)
	CACHELINE_LOOP;
    }

  /* Quadword aligned loop.  */
  current = *s_align;
  while (n > 8)
    {
      found = find (current, c);
      if (unlikely (found))
	goto found_it;
      current = *++s_align;
      n -= 8;
    }

 last_quad:
  {
    word mask = -1ul << n;
    found = find (current, c) & ~mask;
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

    return (void *)((word)s_align + offset);
  }
}

--------------040109000701030008070400--
