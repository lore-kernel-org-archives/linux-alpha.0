From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] treewide: Replace zero-length arrays with
 flexible-array members
Date: Wed, 16 Feb 2022 13:46:09 -0600
Message-ID: <20220216194609.GA903947@embeddedor>
References: <20220215174743.GA878920@embeddedor>
 <202202151016.C0471D6E@keescook>
 <20220215192110.GA883653@embeddedor>
 <Ygv8wY75hNqS7zO6@unreal>
 <20220215193221.GA884407@embeddedor>
 <CAJZ5v0jpAnQk+Hub6ue6t712RW+W0YBjb_gAcZZbUeuYMGv7mg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-acpi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645040312;
        bh=YUNeMwnffWU/vzA+11lFMuMWe0+JjFTHVyeqME5xzxw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RvhRgyEjawXUAql0FqCTCcTpqR6GYBvsqNC9EZPqI5ZukTe3YMkyAiJ+1YKBf+Rlr
         sxewfhO7AtNd8GwQy/RQGGJ/AXgX1LgrWMnZTpDKZCiIl4MoI0X8P3b4yUkf4X3JeP
         l7bOM+By1/829q8HEUDp0joAEckiMlN1bSJeEtmm9DT0v1cg0aKN9haMO+KRTEXTKx
         BIawC1huC6S2hOqZ/gswPro0qF/Bzg0858Vu6QjTMbuvQTz7D1gR8uQt+HV6mEdhmv
         BV4TgmRvjAQDxRzfAaigAGsmsMmR8Yj0ESiy1ZrH3LP0qLNGtaqg4OazRGKQ9Qu6L7
         d13KOv1rLre5w==
Content-Disposition: inline
In-Reply-To: <CAJZ5v0jpAnQk+Hub6ue6t712RW+W0YBjb_gAcZZbUeuYMGv7mg@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>, Kees Cook <keescook@chromium.org>, GR-QLogic-Storage-Upstream@marvell.com, linux-alpha@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>, sparclinux@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, coresight@lists.linaro.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, netdev <netdev@vger.kernel.org>, Linux

On Wed, Feb 16, 2022 at 08:05:47PM +0100, Rafael J. Wysocki wrote:
> On Tue, Feb 15, 2022 at 8:24 PM Gustavo A. R. Silva
> <gustavoars@kernel.org> wrote:
> 
> Can you also send the ACPI patch separately, please?
> 
> We would like to route it through the upstream ACPICA code base.

Yeah; no problem.

Thanks
--
Gustavo
