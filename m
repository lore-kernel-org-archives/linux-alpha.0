From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: CONFIG_ARCH_SUPPORTS_INT128: Why not mips, s390, powerpc,
 and alpha?
Date: Sat, 30 Mar 2019 18:14:03 -0500
Message-ID: <20190330231402.GM3969@gate.crashing.org>
References: <201903291307.x2TD772v013534@sdf.org>
 <20190329200015.ujmjrvn6ta67h74j@tower>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-Disposition: inline
In-Reply-To: <20190329200015.ujmjrvn6ta67h74j@tower>
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
To: Michael Cree <mcree@orcon.net.nz>, George Spelvin <lkml@sdf.org>, linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

On Sat, Mar 30, 2019 at 09:00:15AM +1300, Michael Cree wrote:
> It does move the umulh inside the loop but that seems sensible since
> the use of unlikely() implies that the loop is unlikely to be taken
> so on average it would be a good bet to start the calculation of
> umulh earlier since it has a few cycles latency to get the result,
> and it is pipelined so it can be calculated in the shadow of the
> mulq instruction on the same execution unit.

That may make sense, but it is not what happens, sorry.  It _starts off_
as part of the loop, and it is never moved outside.

The only difference between a likely loop and an unlikely loop here I've
seen (on all targets I tried) is that with a likely loop the loop target
is aligned, while with an unlikely loop it isn't.

> On the older CPUs
> (before EV6 which are not out-of-order execution) having the umulh
> inside the loop may be a net gain.

Yes.  Similarly, on Power you can often calculate the high mul at the same
time as the low mul, for no extra cost.  This may be true on many archs.


Segher
