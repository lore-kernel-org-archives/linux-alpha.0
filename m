From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: CONFIG_ARCH_SUPPORTS_INT128: Why not mips, s390, powerpc,
 and alpha?
Date: Sat, 30 Mar 2019 19:30:21 -0500
Message-ID: <20190331003020.GO3969@gate.crashing.org>
References: <20190330084346.GA3801@osiris>
 <201903301030.x2UAUNOg026448@sdf.org>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-Disposition: inline
In-Reply-To: <201903301030.x2UAUNOg026448@sdf.org>
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
Cc: linux-s390@vger.kernel.org, linux-alpha@vger.kernel.org, heiko.carstens@de.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org

On Sat, Mar 30, 2019 at 10:30:23AM +0000, George Spelvin wrote:
> For s390, that was added on 24 March 2017 by
> https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=246457
> which is part of GCC 7.
> 
> It also only applies to TARGET_ARCH12, which I am guessing
> corresponds to HAVE_MARCH_ZEC12_FEATURES.

zEC12 is arch10, while z14 is arch12.  See
https://sourceware.org/binutils/docs-2.32/as/s390-Options.html#s390-Options
for example; it lists the correspondences, and states "The processor names
starting with arch refer to the edition number in the Principle of
Operations manual.  They can be used as alternate processor names and have
been added for compatibility with the IBM XL compiler."

Newer GCC does not use the somewhat confusing TARGET_ARCH12 name anymore;
see https://gcc.gnu.org/r264796 .


Segher
