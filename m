From: Tobias Klausmann <klausman@schwarzvogel.de>
Subject: Re: cvtqt traps, math-emu, and a request for running a test
Date: Sat, 17 Jul 2010 17:27:30 +0200
Message-ID: <20100717152729.GA29118@kaini.schwarzvogel.de>
References: <19521.50859.92316.988824@pilspetsen.it.uu.se>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <19521.50859.92316.988824@pilspetsen.it.uu.se>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

Hi! 

On Sat, 17 Jul 2010, Mikael Pettersson wrote:
> Included below is a test program which converts a set of large-magnitude
> integers to double and back again, and prints their representations
> and how much the final values differ from the original ones.  I'd like
> to ask someone with access to Alpha hardware to run this for me and
> post the program's output.  If cvtqt trapping to kernel is non-default
> and requires a gcc option, I'd like the program to be compiled and
> run twice, with and without that option.  Please also verify that gcc
> emits a cvtqt in the lltod() function (my gcc cross to alpha does so).

Here's the output from an ES40 (EV68AL):
0x4000000000000000 -> 4.61169e+18 (0x43d0000000000000) -> 0x4000000000000000, diff 0
0x2000000000000000 -> 2.30584e+18 (0x43c0000000000000) -> 0x2000000000000000, diff 0
0x1000000000000000 -> 1.15292e+18 (0x43b0000000000000) -> 0x1000000000000000, diff 0
0x0800000000000000 -> 5.76461e+17 (0x43a0000000000000) -> 0x0800000000000000, diff 0
0x0400000000000000 -> 2.88230e+17 (0x4390000000000000) -> 0x0400000000000000, diff 0
0x0200000000000000 -> 1.44115e+17 (0x4380000000000000) -> 0x0200000000000000, diff 0
0x0100000000000000 -> 7.20576e+16 (0x4370000000000000) -> 0x0100000000000000, diff 0
0x0080000000000000 -> 3.60288e+16 (0x4360000000000000) -> 0x0080000000000000, diff 0
0x0040000000000000 -> 1.80144e+16 (0x4350000000000000) -> 0x0040000000000000, diff 0
0x0020000000000000 -> 9.00720e+15 (0x4340000000000000) -> 0x0020000000000000, diff 0
0x0010000000000000 -> 4.50360e+15 (0x4330000000000000) -> 0x0010000000000000, diff 0
0x0008000000000000 -> 2.25180e+15 (0x4320000000000000) -> 0x0008000000000000, diff 0
0x0004000000000000 -> 1.12590e+15 (0x4310000000000000) -> 0x0004000000000000, diff 0
0x0002000000000000 -> 5.62950e+14 (0x4300000000000000) -> 0x0002000000000000, diff 0
0x0001000000000000 -> 2.81475e+14 (0x42f0000000000000) -> 0x0001000000000000, diff 0
0x0100000000000010 -> 7.20576e+16 (0x4370000000000001) -> 0x0100000000000010, diff 0
0x0100000000000008 -> 7.20576e+16 (0x4370000000000000) -> 0x0100000000000000, diff -8
0x0100000000000004 -> 7.20576e+16 (0x4370000000000000) -> 0x0100000000000000, diff -4
0x0100000000000002 -> 7.20576e+16 (0x4370000000000000) -> 0x0100000000000000, diff -2
0x0100000000000001 -> 7.20576e+16 (0x4370000000000000) -> 0x0100000000000000, diff -1
0x0100000000000000 -> 7.20576e+16 (0x4370000000000000) -> 0x0100000000000000, diff 0
0x00ffffffffffffff -> 7.20576e+16 (0x4370000000000000) -> 0x0100000000000000, diff 1
0x00fffffffffffffe -> 7.20576e+16 (0x4370000000000000) -> 0x0100000000000000, diff 2
0x00fffffffffffffc -> 7.20576e+16 (0x4370000000000000) -> 0x0100000000000000, diff 4
0x00fffffffffffff8 -> 7.20576e+16 (0x436fffffffffffff) -> 0x00fffffffffffff8, diff 0

En/Disabling -mieee doesn't make a difference (as expected on this hardware).

HTH,
Tobias

-- 
Sent from aboard the Culture ship
	ROU (Torturer Class) Nuisance Value
