From: Falk Hueffner <falk.hueffner@student.uni-tuebingen.de>
Subject: Re: linux-2.6.0-test6 error during linking
Date: 29 Sep 2003 11:02:58 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <87lls8nf0d.fsf@student.uni-tuebingen.de>
References: <3F773C9D.3080009@bmind.it>
	<87d6dk3acp.fsf@student.uni-tuebingen.de>
	<200309291148.14567.rezso@rdsor.ro>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <200309291148.14567.rezso@rdsor.ro>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Balint Cristian <rezso@rdsor.ro>
Cc: Paolo Dovera <pdovera@bmind.it>, linux-alpha@vger.kernel.org

Balint Cristian <rezso@rdsor.ro> writes:

> On Sunday 28 September 2003 23:51, Falk Hueffner wrote:
> > sched_clock is not implemented yet for Alpha. It is supposed to
> > return a high resolution timer. As workaround, you could just copy
> > the implementation from ARM, which simply returns the value based
> > on jiffies.  Ideally, one would take into account the cycle
> > counter, but it wraps every few seconds, which has to be taken
> > care of.
> 
> Can post here a patch based on arm ?

Well, just copy the function:

--- arch/alpha/kernel/time.c~   2003-09-28 02:50:20.000000000 +0200
+++ arch/alpha/kernel/time.c    2003-09-28 13:39:58.000000000 +0200
@@ -570,3 +570,12 @@
 
        return retval;
 }
+
+/*
+ * Scheduler clock - returns current time in nanosec units.
+ * Should probably take rpcc into account for improved resolution
+ */
+unsigned long long sched_clock(void)
+{
+       return (unsigned long long) jiffies * (1000000000 / HZ);
+}

I've not tested this, it should work, but probably scheduling
behaviour will not be as good as it could be, although HZ being 1000
(or larger) on Alpha should help.

> Eventualy post it on linux kernel list or to Richard Henderson ?

Not without testing it, and I have no time for that currently.

-- 
	Falk
