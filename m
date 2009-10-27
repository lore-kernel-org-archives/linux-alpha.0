From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] [alpha] Add minimal support for software performance 
	events.
Date: Tue, 27 Oct 2009 14:29:52 -0400
Message-ID: <b4198de60910271129v5765c963rad8d2f4522112986@mail.gmail.com>
References: <1256545926-6972-1-git-send-email-mcree@orcon.net.nz>
	 <20091026084854.GA26990@elte.hu>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=un1a9YzzE3TjXHcwJ+gFyCCVlsaHtJupJA+dfcsygIo=;
        b=vpEUT6AhrDWWxhQDNQNrtmycpqRRfbDjZxqh0vwA/x/t+Lk5g6xsTUZd/X7ubyTUWF
         UcPAHQgPjBu5YreBvs3zYrSo/I4k6QZUJUrRV5/Zvt7Vh5VpEMnsy3mkxfNJVA4UWhOW
         Ok3EqvglfgWisKVcVSVvbnZvrWhGXZyRL5SFg=
In-Reply-To: <20091026084854.GA26990@elte.hu>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: Michael Cree <mcree@orcon.net.nz>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>

On Mon, Oct 26, 2009 at 4:48 AM, Ingo Molnar <mingo@elte.hu> wrote:
> Is there a tree for Alpha bits?

No, but really other than a very few scattered patches we don't have
much activity.

Maybe it's worth creating one at git.kernel.org? I don't think Richard
or Ivan are interested in doing it. Could Michael or I do it without
being maintainers?

Matt
