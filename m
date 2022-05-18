From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 19/30] panic: Add the panic hypervisor notifier list
Date: Wed, 18 May 2022 10:24:39 -0300
Message-ID: <5ed2ca7a-5bf3-f101-a1f4-9a320c79f5a0@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-20-gpiccoli@igalia.com> <YoJZVZl/MH0KiE/J@alley>
 <ad082ce7-db50-13bb-3dbb-9b595dfa78be@igalia.com>
 <CAE=gft7ds+dHfEkRz8rnSH1EbTpGTpKbi5Wxj9DW0Jr5mX_j4w@mail.gmail.com>
 <YoOi9PFK/JnNwH+D@alley> <b9ec2fc8-216f-f261-8417-77b6dd95e25c@igalia.com>
 <YoShZVYNAdvvjb7z@alley>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eQn7tn+LAXQvaWaOJjs7A40WGwRH89xC92ZZiMNkn9M=; b=GAmZTm+DFJs/I3
	1F1WZ+SjC4PwtujnP1urVtJT1fNyudvPuNt5oFKpJWIRgNxT+QEL+9gdcsuysC5VseUL5mZzPkn4a
	MxFT+jxXslMS/w0RnwvW5R66PNRLAaoiE8PlLIyPVWgQHmlqI1ir3kPKwQhmAvroVrcw41mLEdSmX
	JxdsdEWmdk3AYDHqtQy5qenVOwtJ1QIGq4iA7u2cXkr6qHLzARUctELJ/KiyUNs6+Vz2ZhrFFEMgf
	6iCzXJXF0d6LIyeOOJs6c3RXKRqmCw++XpT4oIYGDM0h0vDuSPflgGNeYlxBOuuDRcV1uG2NRre2w
	P8qyCTsepmQdjbgKTAWQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aBHSQ74cshobrBoDeAcAwH8dbmp4ORux6n0j1EJ9zhs=; b=PbQX6jJxrSTFYuY1QkUAm5HHAj
 4zjhUqw9dZUmp+/h7FpyGsMd9T7KC01Lk8wihlfsVt15sYS07bd4AGqx/olI4ChlgEfTgoKgt6ghF
 u4Ul+3a/u8AC1yN3var2ePdBq3yJ0QNuCnzFCU2AsJ1yN+Ew0qnuNx0AKJJMSgaFsHSKjAS/RJyRX
 nQBP35ba/Mxst73B+b2bL1GyLemevCz0TIExKe/iFre2S2JyltNIOuuqHTXgx4xNR3AtqS8MDXev4
 Htu1aPv+rb/vlxpa70azlfd8R3qZ4EjVERsEcfu9NCpHDF7PwWBcLltMr6Fz/cDtJaPv3zZndTfPs
 +f+vkTJA==;
Content-Language: en-US
In-Reply-To: <YoShZVYNAdvvjb7z@alley>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-um/>
List-Post: <mailto:linux-um@lists.infradead.org>
List-Help: <mailto:linux-um-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=subscribe>
Sender: "linux-um" <linux-um-bounces@lists.infradead.org>
Errors-To: linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org
To: Petr Mladek <pmladek@suse.com>
Cc: Evan Green <evgreen@chromium.org>, David Gow <davidgow@google.com>, Julius Werner <jwerner@chromium.org>, Scott Branden <scott.branden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Sebastian Reichel <sre@kernel.org>, Linux PM <linux-pm@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, bhe@redhat.com, kexec@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-dev

On 18/05/2022 04:33, Petr Mladek wrote:
> [...]
> Anyway, I would distinguish it the following way.
> 
>   + If the notifier is preserving kernel log then it should be ideally
>     treated as kmsg_dump().
> 
>   + It the notifier is saving another debugging data then it better
>     fits into the "hypervisor" notifier list.
> 
>

Definitely, I agree - it's logical, since we want more info in the logs,
and happens some notifiers running in the informational list do that,
like ftrace_on_oops for example.


> Regarding the reliability. From my POV, any panic notifier enabled
> in a generic kernel should be reliable with more than 99,9%.
> Otherwise, they should not be in the notifier list at all.
> 
> An exception would be a platform-specific notifier that is
> called only on some specific platform and developers maintaining
> this platform agree on this.
> 
> The value "99,9%" is arbitrary. I am not sure if it is realistic
> even in the other code, for example, console_flush_on_panic()
> or emergency_restart(). I just want to point out that the border
> should be rather high. Otherwise we would back in the situation
> where people would want to disable particular notifiers.
> 

Totally agree, these percentages are just an example, 50% is ridiculous
low reliability in my example heheh

But some notifiers deep dive in abstraction layers (like regmap or GPIO
stuff) and it's hard to determine the probability of a lock issue (take
a spinlock already taken inside regmap code and live-lock forever, for
example). These are better to run, if possible, later than kdump or even
info list.

Thanks again for the good analysis Petr!
Cheers,


Guilherme
