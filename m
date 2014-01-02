From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] Slightly outdated CONFIG_SMP documentation fix
Date: Thu, 2 Jan 2014 15:15:47 -0800
Message-ID: <20140102151547.fde4aa5855cc75e91fea95e5@linux-foundation.org>
References: <20131231225921.GA1624@sylph>
 <23596.1388674589@warthog.procyon.org.uk>
 <20140102150219.3df32a23cf7dbe9618ea118e@linux-foundation.org>
 <CAAJfVc7vK9W9Zy0LvGWSTWMSEb_JEx7FbLECy44QEwj+CWgSGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAAJfVc7vK9W9Zy0LvGWSTWMSEb_JEx7FbLECy44QEwj+CWgSGg@mail.gmail.com>
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
To: Psychedelic Squid <psquid@psquid.net>
Cc: linux-m32r-ja@ml.linux-m32r.org, linux-mips@linux-mips.org, linux-sh@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, David Howells <dhowells@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-s390@vger.kernel.org, linux-am33-list@redhat.com, Russell King <linux@arm.linux.org.uk>, Hirokazu Takata <takata@linux-m32r.org>, x86@kernel.org, "James E.J. Bottomley" <jejb@parisc-linux.org>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Al Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>, linux-m32r@ml.linux-m32r.org, linux-parisc@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Paul Mundt <lethal@linux-sh.org>, linux-alpha@vger.kernel.org

On Thu, 2 Jan 2014 23:08:43 +0000 Psychedelic Squid <psquid@psquid.net> wrote:

> On 2 Jan 2014 23:02, "Andrew Morton" <akpm@linux-foundation.org> wrote:
> >
> > On Thu, 02 Jan 2014 14:56:29 +0000 David Howells <dhowells@redhat.com>
> wrote:
> >
> > > Robert Graffham <psquid@psquid.net> wrote:
> > >
> > > > +     singleprocessor machines. On a singleprocessor machine, the
> kernel
> > >
> > > "singleprocessor" looks wrong without a hyphen.  How about
> "uniprocessor"?
> > >
> >
> > Yes please.
> >
> > Also the patch should have a signed-off-by:, as per
> > Documentation/SubmittingPatches section 12, please.
> >
> 
> The signed-off-by: is already there.

ah, it was appended after the patch.  Don't do that ;)

> I'll get the other changes for the
> revised patch ready shortly, thanks. Also, newbie submitter and l couldn't
> find this in the documentation at a quick glance: should I submit it as a
> new thread, or a continuation of this?

Either is OK.  I tend to prefer continuation-of-this, mainly because it
prevents people from forgetting to cc people who were involved in
earlier discussion.

(Of course, if the discussion graph was complex, no reply-to-all will
capture all participants.  Nobody bothers to go through the discussion
gathering the names of all participants so I often end up doing this
when putting the final patch together)
