From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Question about DEC Alpha memory ordering
Date: Mon, 13 Feb 2017 10:39:20 -0800
Message-ID: <20170213183920.GA25191@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com
Cc: stern@rowland.harvard.edu, j.alglave@ucl.ac.uk, luc.maranget@inria.fr, parri.andrea@gmail.com, will.deacon@arm.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Hello!

We have a question about DEC Alpha memory ordering.  Given the litmus test
shown at the end of this email, some of us believe that DEC Alpha won't
ever have both P0()'s and P1()'s READ_ONCE() calls return 1, but others
believe otherwise.  Our current Linux-kernel memory model assumes that
it cannot, though we are not aware of any Linux-kernel code that cares.

In this litmus test, the "C auto/C-LB-LRW+OB-Ov" and the empty pair
of curly braces can be ignored.  P0() and P1() run concurrently, and
are passed pointer to the two shared variables that they are accessing
(u0 and x1, and yes, this test was automatically generated -- why do
you ask?).  The "exists" clause at the end is evaluated at the end of
time, after all the dust has settled.  Note that the undeclared "r1"
variables are local to their respective functions, and that "0:r1" in
the "exists" clause accesses P0()'s instance of "r1", and that "1:r1"
similarly accesses P1()'s "r1".

So, can real DEC Alpha hardware end up with both instances of "r1"
having the value 1?

							Thanx, Paul

------------------------------------------------------------------------

C auto/C-LB-LRW+OB-Ov
{
}

P0(int *u0, int *x1)
{
	r1 = READ_ONCE(*u0);
	smp_mb();
	WRITE_ONCE(*x1, 1);
}


P1(int *u0, int *x1)
{
	r1 = READ_ONCE(*x1);
	WRITE_ONCE(*u0, r1);
}

exists
(0:r1=1 /\ 1:r1=1)

