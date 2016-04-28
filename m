From: Josh Juran <jjuran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch V3] lib: GCD: add binary GCD algorithm
Date: Thu, 28 Apr 2016 13:10:52 -0400
Message-ID: <6FAE0D2C-A593-488B-AE26-E462AF372D8E@gmail.com>
References: <1461843824-19853-1-git-send-email-zengzhaoxiu@163.com>
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
Content-Transfer-Encoding: 7bit
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Fk9LM4LBIBfNYkQkgWTgZE0g39BgDi4WAfmUj9hduZA=;
        b=djdGnM0GYTkCWBNhXPYmGYRnOdgTwy5Lvu7otvdHbFkMVj1NwveNdaag97Z+JLbL6g
         l82rcJITZ3e9YsA3C4a22Me0Exou6NlMaG87V3nVAskd5dyafCbQiW2Syb7mmqZMAR/8
         a2ZZ9gKTeDtlC9/lfv51BpxH4Yp44hmxdEjE1gVNNFIfWW+y+ift4zdLvmWNnF3R/SNH
         uqYTPVKnX5J6Tfp4vIlZSth+lC49etLNr8ZwHS/+ZozCAPoWeEihKsn48131oj/E0nxq
         2phSdVqvgMO/cUujahpMcvbXdpcu3+DLHwhrpduGbk5uR5yO1e7E+MnoVQaP6pJRzAuJ
         yreQ==
In-Reply-To: <1461843824-19853-1-git-send-email-zengzhaoxiu-9Onoh4P/yGk@public.gmane.org>
Sender: linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zengzhaoxiu-9Onoh4P/yGk@public.gmane.org
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, Zhaoxiu Zeng <zhaoxiu.zeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Henderson <rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org>, Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>, Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Yoshinori Sato <ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>, "James E.J. Bottomley" <jejb-6jwH94ZQLHl74goWV3ctuw@public.gmane.org>, Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>, Chen Liqin <liqin.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lennox Wu <lennox.wu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, uclinux-h8-devel-5NWGOfrQmneRv+LV9MX5uooqe+aC9MnS@public.gmane.org

On Apr 28, 2016, at 7:43 AM, zengzhaoxiu-9Onoh4P/yGk@public.gmane.org wrote:

> + * This implements the binary GCD algorithm. (Often attributed to Stein,
> + * but as Knuth has noted, appears a first-century Chinese math text.)

Should this be "appears in a"?

Josh
