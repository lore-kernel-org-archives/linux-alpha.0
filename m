From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
Date: Fri, 29 Apr 2022 16:34:23 -0300
Message-ID: <5af45ed0-7b0a-5664-a9d3-c53ea001a35e@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com>
 <CAMo8BfKzA+oy-Qun9-aO3xCr4Jy_rfdjYqMX=W9xONCSX8O51Q@mail.gmail.com>
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
	List-Owner; bh=nKOgV4qmoW5fz8Knd6MyOC76eLh8i4qx/UA+xM8WsUY=; b=vyp95vFmS2y+cl
	nQfV6/viF6AesDbWxLhDped3gU/CNSvQvfv8uNbAxDzQBHLygh1IjBalAHjRXFspzL9Jx3VUFUr+3
	Mn8ViSlA3Elv4SrcvnLCeOjX7A9nF4MKLc4qlqASfV+JcXB0g+uPJls9dzqDKgahJXHav2eIldUC9
	oVIlZxJXCYLggwKlkwO931h43kmNjgettEYoQ+DhnGjjB01mLDHOWTlxHA3lZC6xCwSjiLTcDA8IW
	oFHbysrQ29qh8EqpAsYCxE4mG99C22jlgd7N+DR+slyLzF6NvGlmQSaCbFIzK1jLqDn9hQcYZasRi
	CLr3DVbAFq1v2A9GBUMQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lwmIjCyQy1cvf/HfruQUsqg2HO2zLsQJj36FVBjRlMY=; b=FMeK+qaOrNt+CW3KPA3fG+Sm88
 9dOTCLRIKwFZQHJ+4m/FuvGgtzWqdtsbg7jNNtnRqzh6mH5yhN/kcNgqlSXGFzr+Is403C8lKfeIe
 GFE0d2xZtQSLJr4I8RU79yspLu2jmEMkBcLB9rf7ILb4vrthTaqCp6aHTQGFnReVgkS13mVrLfnHx
 HX+CWHd9YGmcd+hSxhVaiC1N67Jxo0tAWbskOVNhQbgFNnliiB3BK9xH4rhhSehlShKQIEHmaxjCC
 oWiRKIIVo1UNa1pRoT5oqrZz7cmRkXzPYEYIQdMbmHXt76jbfgPiC/AOizH1U1QXiwvnp20pJNRvp
 Fw18KdiA==;
Content-Language: en-US
In-Reply-To: <CAMo8BfKzA+oy-Qun9-aO3xCr4Jy_rfdjYqMX=W9xONCSX8O51Q@mail.gmail.com>
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
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, bhe@redhat.com, Petr Mladek <pmladek@suse.com>, kexec@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org, "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390 <linux-s390@vger.kernel.org>, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, netdev <netdev@vger.kernel.org>, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>, xen-devel@lists.xenproject.or

On 29/04/2022 13:04, Max Filippov wrote:
> [...]
>>  arch/xtensa/platforms/iss/setup.c     |  4 ++--For xtensa:
> 
> For xtensa:
> Acked-by: Max Filippov <jcmvbkbc@gmail.com>
> 

Perfect, thanks Max!
Cheers,


Guilherme
