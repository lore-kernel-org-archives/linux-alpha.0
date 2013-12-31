From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] Slightly outdated CONFIG_SMP documentation fix
Date: Tue, 31 Dec 2013 15:58:53 -0800
Message-ID: <52C35A3D.8090109@zytor.com>
References: <20131231225921.GA1624@sylph>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20131231225921.GA1624@sylph>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-Id: <linux-alpha.vger.kernel.org>
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Content-Type: text/plain; charset="us-ascii"
To: Robert Graffham <psquid@psquid.net>, linux-kernel@vger.kernel.org
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@arm.linux.org.uk>, Hirokazu Takata <takata@linux-m32r.org>, Ralf Baechle <ralf@linux-mips.org>, David Howells <dhowells@redhat.com>, Koichi Yasutake <yasutake.koichi@jp.panasonic.com>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux390@de.ibm.com, Paul Mundt <lethal@linux-sh.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, linux-alph

On 12/31/2013 02:59 PM, Robert Graffham wrote:
> I've removed a reference to "most personal computers" being singleprocessor
> machines in multiple arches' config help, and also brought the arch/arm spacing
> for "singleprocessor" (vs. "single processor" used there originally) in line
> with other arches that had that text.
> 
> The diff is included below, and cleanly applies and builds on my system. I have
> not tested on other systems yet since a documentation fix shouldn't fail to
> build inconsistently, but if that's no excuse, I'll be happy to test further
> when I can.
> 

Acked-by: H. Peter Anvin <hpa@linux.intel.com>



