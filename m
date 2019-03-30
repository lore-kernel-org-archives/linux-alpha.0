From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: CONFIG_ARCH_SUPPORTS_INT128: Why not mips, s390, powerpc,
 and alpha?
Date: Sat, 30 Mar 2019 18:52:06 -0500
Message-ID: <20190330235205.GN3969@gate.crashing.org>
References: <20190329202557.GL3969@gate.crashing.org>
 <201903301128.x2UBSLNH017484@sdf.org>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-Disposition: inline
In-Reply-To: <201903301128.x2UBSLNH017484@sdf.org>
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

On Sat, Mar 30, 2019 at 11:28:21AM +0000, George Spelvin wrote:
> >> I like that the MIPS code leaves the high half of the product in
> >> the hi register until it tests the low half; I wish PowerPC would
> >> similarly move the mulhdu *after* the loop,
> 
> > The MIPS code has the multiplication inside the loop as well, and even
> > the mfhi I think: MIPS has delay slots.
> 
> Yes, it's in the delay slot, which is fine (the branch is unlikely,
> after all).  But it does the compare (sltu) before accessing %hi, which
> is good as %hi often has a longer latency than %lo.  (On out-of-order
> cores, of course, none of this matters.)

Yes.  But it does the mfhi on every iteration, while it only needs it for
the last one (or after the last one).  This may not be more expensive for
the actual hardware, but it is for GCC's cost model

> > GCC treats the int128 as one register until it has expanded to RTL, and it
> > does not do such loop optimisations after that, apparently.
> > 
> > File a PR please?  https://gcc.gnu.org/bugzilla/
> 
> Er...  about what?  The fact that the PowerPC code is not
> >> PowerPC:
> >> .L9:
> >> 	bl get_random_u64
> >> 	nop
> >> 	mulld 9,3,31
> >> 	cmpld 7,30,9
> >> 	bgt 7,.L9
> >> 	mulhdu 3,3,31
> 
> I'm not sure quite how to explain it in gcc-ese.

Yeah, exactly, like that.  This transformation is called "loop sinking"
usually: if anything that is set within a loop is only used after the loop,
it can be set after the loop (provided you keep the set's sources alive).


Segher
