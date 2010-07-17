From: Mikael Pettersson <mikpe@it.uu.se>
Subject: cvtqt traps, math-emu, and a request for running a test
Date: Sat, 17 Jul 2010 17:05:15 +0200
Message-ID: <19521.50859.92316.988824@pilspetsen.it.uu.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org

The background for this message is that I'm looking at an apparent
boundary case bug in the kernel's math emulation code, specifically
FP_FROM_INT_D(), which breaks gcc on sparc64 (PR44631).  Alpha uses
the same math emulation code so it may also be affected.

Does anyone know under what circumstances the Alpha cvtqt instruction
(which converts a 64-bit integer to a 64-bit IEEE double) will trap to
the kernel and be completed by arch/alpha/math-emu/ code?  Is it just
a function of the integer value, or does it require a qualifier like
/SUI?  If a qualifier is required, will gcc emit one by default, or
does it require a specific option?

Included below is a test program which converts a set of large-magnitude
integers to double and back again, and prints their representations
and how much the final values differ from the original ones.  I'd like
to ask someone with access to Alpha hardware to run this for me and
post the program's output.  If cvtqt trapping to kernel is non-default
and requires a gcc option, I'd like the program to be compiled and
run twice, with and without that option.  Please also verify that gcc
emits a cvtqt in the lltod() function (my gcc cross to alpha does so).

In the case of sparc64, most of the values in the program's test vector
require kernel assistance, and I see a discontinuity where FP_FROM_INT_D()
constructs bogus <exponent,fraction> pairs from 0x0100000000000000 and
values close to it.  This then results in double values that are off by
a factor of two or so.

/Mikael

=== cut here ===

/* pr44631v3.c */
#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>

void __attribute__((noinline)) lltod(const int64_t *ll, double *d)
{
    *d = (double)*ll;
}

void __attribute__((noinline)) dtoll(const double *d, int64_t *ll)
{
    *ll = (int64_t)*d;
}

const int64_t tests[] = {
    /* a set of power-of-2 test vectors <= INT64_MAX, these should all
       convert without precision loss if the HW and SW is correct */
    0x4000000000000000LL,
    0x2000000000000000LL,
    0x1000000000000000LL,
    0x0800000000000000LL,
    0x0400000000000000LL,
    0x0200000000000000LL,
    0x0100000000000000LL, /* the Linux/SPARC kernel FXTOD emulation gets this one horribly wrong */
    0x0080000000000000LL,
    0x0040000000000000LL,
    0x0020000000000000LL,
    0x0010000000000000LL,
    0x0008000000000000LL,
    0x0004000000000000LL,
    0x0002000000000000LL,
    0x0001000000000000LL,
    /* a range of test vectors around the first point where the
       Linux/SPARC kernel FXTOD emulation goes wrong */
    0x0100000000000010LL, /* expect: diff 0 */
    0x0100000000000008LL, /* expect: diff -8 */
    0x0100000000000004LL, /* expect: diff -4 */
    0x0100000000000002LL, /* expect: diff -2 */
    0x0100000000000001LL, /* expect: diff -1 */
    0x0100000000000000LL, /* expect: diff 0 */
    0x00ffffffffffffffLL, /* expect: diff 1 */
    0x00fffffffffffffeLL, /* expect: diff 2 */
    0x00fffffffffffffcLL, /* expect: diff 4 */
    0x00fffffffffffff8LL, /* expect: diff 0 */
};

int main(void)
{
    unsigned int i;
    union {
	double d;
	uint64_t ull;
    } res1;
    int64_t res2;

    for (i = 0; i < sizeof(tests)/sizeof(tests[0]); ++i) {
	lltod(&tests[i], &res1.d);
	dtoll(&res1.d, &res2);
	printf("0x%016" PRIx64 " -> %#5g (0x%016" PRIx64 ") -> 0x%016" PRIx64 ", diff %" PRId64 "\n",
	       tests[i], res1.d, res1.ull, res2, res2 - tests[i]);
    }
    return 0;
}
