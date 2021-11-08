From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v0 00/42] notifiers: Return an error when
 callback is already registered
Date: Mon, 8 Nov 2021 17:29:55 +0100
Message-ID: <YYlQg+OvUpUL630W@zn.tnic>
References: <20211108101157.15189-1-bp@alien8.de>
 <20211108101924.15759-1-bp@alien8.de>
 <20211108141703.GB1666297@rowland.harvard.edu>
 <YYkzJ3+faVga2Tl3@zn.tnic> <YYk1xi3eJdMJdjHC@zn.tnic>
 <20211108112313.73d0727e@gandalf.local.home>
Mime-Version: 1.0
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1636388997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=OSbzA4U/ida8aXvLATS9A1smiSvQH5VirglC+wMEOMM=;
 b=pBzIQNPgz9f6MnJz8NuSpWeZa+X2KJ2EY1gkFfqIgUOOdk5ooj7nS3SZlOvvPfnLO1w7js
 1rE5oU8U3sZ2kD0zZzsPOjz5Rjy821j5ugVLv+TE7mQzDtZGil7p5QTxNJmqJYfQhl3i/U
 43Oeu8iAMBrtl8n9GGHPMyt/ODoo1Kk=
Content-Disposition: inline
In-Reply-To: <20211108112313.73d0727e@gandalf.local.home>
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
To: Steven Rostedt <rostedt@goodmis.org>
Cc: alsa-devel@alsa-project.org, x86@kernel.org, linux-sh@vger.kernel.org, linux-iio@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org, netdev@vger.kernel.org, Ayush Sawal <ayush.sawal@chelsio.com>, sparclinux@vger.kernel.org, linux-clk@vger.kernel.org, linux-leds@vger.kernel.org, linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, Rohit Maheshwari <rohitm@chelsio.com>, linux-staging@lists.linux.dev, bcm-kernel-feedback-list@broadcom.com, Geert Uytterhoeven <geert@linux-m68k.org>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org, Vinay Kumar Yadav <vinay.yadav@chelsio.com>, linux-um@lists.infradead.org, rcu@vger.kernel.org, linux-fbdev@vger.kernel.org, xen-devel@lists.xenproject.org, linux-tegra@vger.kernel.org, openipmi-developer@lists.sourcef

On Mon, Nov 08, 2021 at 11:23:13AM -0500, Steven Rostedt wrote:
> Question, how often does this warning trigger? Is it common to see in
> development?

Yeah, haven't seen it myself yet.

But we hashed it out over IRC. :-)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
