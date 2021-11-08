From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v0 00/42] notifiers: Return an error when
 callback is already registered
Date: Mon, 8 Nov 2021 15:24:39 +0100
Message-ID: <YYkzJ3+faVga2Tl3@zn.tnic>
References: <20211108101157.15189-1-bp@alien8.de>
 <20211108101924.15759-1-bp@alien8.de>
 <20211108141703.GB1666297@rowland.harvard.edu>
Mime-Version: 1.0
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1636381481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=oQBbYlaqexu4t08cRZdDH3XaT2khXLTGUfDdhXY+o6w=;
 b=BzFVBEJotdv+x1wk5r7BVthkB7IfDjFkcs3Qa23VnQgw6n7GoUvAnfTwnsI1XwsFUQ2pfc
 wTEtmUg2zpiIKZgiV8GtlPXLXcMCnwwX7vbzvuM7Jd46qSvtVDp/eqlUHv6UrUSSdUIxSB
 fTiz2Hj9eXxtQyoPpRyOqBuxOD7Awrk=
Content-Disposition: inline
In-Reply-To: <20211108141703.GB1666297@rowland.harvard.edu>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern@rowland.harvard.edu>
Cc: alsa-devel@alsa-project.org, x86@kernel.org, linux-sh@vger.kernel.org, linux-iio@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org, netdev@vger.kernel.org, Ayush Sawal <ayush.sawal@chelsio.com>, sparclinux@vger.kernel.org, linux-clk@vger.kernel.org, linux-leds@vger.kernel.org, linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, Rohit Maheshwari <rohitm@chelsio.com>, linux-staging@lists.linux.dev, bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org, Vinay Kumar Yadav <vinay.yadav@chelsio.com>, linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>, rcu@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-tegra@vger.kernel.org, openipmi-developer@lists.sourceforge.

On Mon, Nov 08, 2021 at 09:17:03AM -0500, Alan Stern wrote:
> What reason is there for moving the check into the callers?  It seems 
> like pointless churn.  Why not add the error return code, change the 
> WARN to pr_warn, and leave the callers as they are?  Wouldn't that end 
> up having exactly the same effect?
> 
> For that matter, what sort of remedial action can a caller take if the 
> return code is -EEXIST?  Is there any point in forcing callers to check 
> the return code if they can't do anything about it?

See my reply to Geert from just now:

https://lore.kernel.org/r/YYkyUEqcsOwQMb1S@zn.tnic

I guess I can add another indirection to notifier_chain_register() and
avoid touching all the call sites.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
