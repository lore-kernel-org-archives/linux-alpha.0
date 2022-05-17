From: Petr Mladek via Openipmi-developer
 <openipmi-developer@lists.sourceforge.net>
Subject: Re: [PATCH 21/30] panic: Introduce the panic
 pre-reboot notifier list
Date: Tue, 17 May 2022 16:11:00 +0200
Message-ID: <YoOs9GJ5Ovq63u5Q@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com>
 <YoJgcC8c6LaKADZV@alley>
 <63a74b56-89ef-8d1f-d487-cdb986aab798@igalia.com>
 <bed66b9467254a5a8bafc1983dad643a@intel.com>
 <e895ce94-e6b9-caf6-e5d3-06bf0149445c@igalia.com>
Reply-To: Petr Mladek <pmladek@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <openipmi-developer-bounces@lists.sourceforge.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UazRNADyyJz2HI+RS6R0a4/dm7+XkEeyBn9yGoLISk0=; b=Q8NSaaYBskYxB3RgjtnNmcqeEz
 TGxaQTl2wRTXRGrob9um1NRFB/bx2sWSbEyAiIbR74F2rKfNkgESAcAhbRerq0tOu/Bm+C2iRex8T
 pVtSolDLoyPfLr2LePpeVPOaz2RDInle1Sxr7bk/r6IYqvW14a8/Z8QlepiY1AGenLdE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UazRNADyyJz2HI+RS6R0a4/dm7+XkEeyBn9yGoLISk0=; b=mBX32Q4u7kJE+SPne9S5CqigQN
 YFEA9yxcU2XsM3GPeTCZHVlAt7ajsLyezE9LZ0cBZB50Vhj6MOIx6EUqnO6rkqXFpEaLPsQP9vU/r
 /VKv6DbgD60h5AfCHjhoa7WhQL1NjAVL1nuAuLDHouwgqC8grs/+x/XHHP7X78ZFUxwg=;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1652796665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UazRNADyyJz2HI+RS6R0a4/dm7+XkEeyBn9yGoLISk0=;
 b=BKp7+FEVfq6NcVwdI04E/j1IXhL8fav2W9wQb6/2V+MLS4zVCpGBL04+5kiZPUHpPEWWSJ
 UCuw6cy5UFA5oDKAHRw0jxrGspZnMX7jbttS2tX8QWMEWQryA8mHzjbrpe5MfzzbeKkAE+
 HL6pRS/de3kEkB9TyLHSW9ZDBKYUAwA=
Content-Disposition: inline
In-Reply-To: <e895ce94-e6b9-caf6-e5d3-06bf0149445c@igalia.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/openipmi-developer>, 
 <mailto:openipmi-developer-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=openipmi-developer>
List-Post: <mailto:openipmi-developer@lists.sourceforge.net>
List-Help: <mailto:openipmi-developer-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/openipmi-developer>, 
 <mailto:openipmi-developer-request@lists.sourceforge.net?subject=subscribe>
Errors-To: openipmi-developer-bounces@lists.sourceforge.net
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>, Alexander Gordeev <agordeev@linux.ibm.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "luto@kernel.org" <luto@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, Alex Elder <elder@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>

On Mon 2022-05-16 13:33:51, Guilherme G. Piccoli wrote:
> On 16/05/2022 13:18, Luck, Tony wrote:
> >> [...]
> > Would it be possible to have some global "kdump is configured + enabled" flag?
> > 
> > Then notifiers could make an informed choice on whether to deep dive to
> > get all the possible details (when there is no kdump) or just skim the high
> > level stuff (to maximize chance of getting a successful kdump).
> > 
> > -Tony
> 
> Good idea Tony! What if I wire a kexec_crash_loaded() in the notifier?

I like this idea.

One small problem is that kexec_crash_loaded() has valid result
only under kexec_mutex. On the other hand, it should stay true
once loaded so that the small race window should be innocent.

> With that, are you/Petr/Dinh OK in moving it for the info list?

Sounds good to me.

Best Regards,
Petr
