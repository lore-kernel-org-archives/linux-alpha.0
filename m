From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: CONFIG_ARCH_SUPPORTS_INT128: Why not mips, s390, powerpc, and
 alpha?
Date: Sat, 30 Mar 2019 09:43:47 +0100
Message-ID: <20190330084346.GA3801@osiris>
References: <201903291307.x2TD772v013534@sdf.org>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-Disposition: inline
In-Reply-To: <201903291307.x2TD772v013534@sdf.org>
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

On Fri, Mar 29, 2019 at 01:07:07PM +0000, George Spelvin wrote:
> (Cross-posted in case there are generic issues; please trim if
> discussion wanders into single-architecture details.)
> 
> I was working on some scaling code that can benefit from 64x64->128-bit
> multiplies.  GCC supports an __int128 type on processors with hardware
> support (including z/Arch and MIPS64), but the support was broken on
> early compilers, so it's gated behind CONFIG_ARCH_SUPPORTS_INT128.
> 
> Currently, of the ten 64-bit architectures Linux supports, that's
> only enabled on x86, ARM, and RISC-V.
> 
> SPARC and HP-PA don't have support.
> 
> But that leaves Alpha, Mips, PowerPC, and S/390x.
> 
> Current mips64, powerpc64, and s390x gcc seems to generate sensible code
> for mul_u64_u64_shr() in <linux/math64.h> if I cross-compile them.
> 
> I don't have easy access to an Alpha cross-compiler to test, but
> as it has UMULH, I suspect it would work, too.
> 
> Is there a reason it hasn't been enabled on these platforms?

It hasn't been enabled on s390 simply because at least I wasn't aware
of this config option. Feel free to send a patch, otherwise I will
enable this. Whatever you prefer.

Thanks for pointing this out!

