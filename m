From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] Slightly outdated CONFIG_SMP documentation fix
Date: Thu, 2 Jan 2014 15:02:19 -0800
Message-ID: <20140102150219.3df32a23cf7dbe9618ea118e@linux-foundation.org>
References: <20131231225921.GA1624@sylph>
 <23596.1388674589@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <23596.1388674589@warthog.procyon.org.uk>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Howells <dhowells@redhat.com>
Cc: linux-m32r-ja@ml.linux-m32r.org, linux-mips@linux-mips.org, linux-sh@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-s390@vger.kernel.org, linux-am33-list@redhat.com, Russell King <linux@arm.linux.org.uk>, Helge Deller <deller@gmx.de>, x86@kernel.org, "James E.J.  Bottomley" <jejb@parisc-linux.org>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Robert Graffham <psquid@psquid.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Al Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>, linux-m32r@ml.linux-m32r.org, linux-parisc@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Paul Mundt <lethal@linux-sh.org>, linux-alpha@vger.kernel.org, Martin

On Thu, 02 Jan 2014 14:56:29 +0000 David Howells <dhowells@redhat.com> wrote:

> Robert Graffham <psquid@psquid.net> wrote:
> 
> > +	  singleprocessor machines. On a singleprocessor machine, the kernel
> 
> "singleprocessor" looks wrong without a hyphen.  How about "uniprocessor"?
> 

Yes please.

Also the patch should have a signed-off-by:, as per
Documentation/SubmittingPatches section 12, please.
