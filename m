Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCFA0CD68E0
	for <linux-alpha@archiver.kernel.org>; Tue, 10 Oct 2023 00:16:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379230AbjJJAQJ (ORCPT <rfc822;linux-alpha@archiver.kernel.org>);
        Mon, 9 Oct 2023 20:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379217AbjJJAQI (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Mon, 9 Oct 2023 20:16:08 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2B170E0
        for <linux-alpha@vger.kernel.org>; Mon,  9 Oct 2023 17:16:07 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 96C7B92009C; Tue, 10 Oct 2023 02:16:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 9279292009B;
        Tue, 10 Oct 2023 01:16:03 +0100 (BST)
Date:   Tue, 10 Oct 2023 01:16:03 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     "Guilherme G. Piccoli" <gpiccoli@igalia.com>
cc:     linux-alpha@vger.kernel.org, mattst88@gmail.com,
        linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
        kernel@gpiccoli.net, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Richard Henderson <richard.henderson@linaro.org>,
        Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v5] alpha: Clean-up the panic notifier code
In-Reply-To: <20230902165725.3504046-1-gpiccoli@igalia.com>
Message-ID: <alpine.DEB.2.21.2310100109100.48714@angie.orcam.me.uk>
References: <20230902165725.3504046-1-gpiccoli@igalia.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Sat, 2 Sep 2023, Guilherme G. Piccoli wrote:

> So, let's clean the code and set the notifier to run as the
> latest, following the same approach other architectures are
> doing - also, remove the unnecessary include of a header already
> included indirectly.

 FWIW my understanding is our current policy is not to rely on indirect 
inclusions and if a given source relies on declarations or definitions 
provided by a header, then it is supposed to pull it explicitly.

 And in any case such an unrelated self-contained change is expected to be 
sent as a separate patch, in a series if there's a mechanical dependency.

  Maciej
