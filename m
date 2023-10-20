Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34218C001DF
	for <linux-alpha@archiver.kernel.org>; Fri, 20 Oct 2023 14:07:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377517AbjJTOHg (ORCPT <rfc822;linux-alpha@archiver.kernel.org>);
        Fri, 20 Oct 2023 10:07:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377512AbjJTOHf (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 20 Oct 2023 10:07:35 -0400
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CFA418F;
        Fri, 20 Oct 2023 07:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=2v/Dgi6Kg+1wMr9J+wUGpxFDvsHZRnzu3RySV36izb4=; b=SVsqfLjFcGu7Zato1G4ATefA1s
        TPHeCOrYzCyej17j26NNK8n8dChqAifeTrrYgHkhzRIEcnZnlsKw7+zP1ffFPSftvVdpFpNMLPczN
        cUEXmrs8PBUpOMA3TVAuUtCbUsotWSt7KbhQIWuQpc3ED1E+kJEY4hArc6OVbwA7FCPEQIdv0ynfh
        1ykEUpWNLoMY38yy169dd7YofHyQ3KcBYJOoz4/S+O5qXuX7QrSsGXE/GGGcjA2knkZbPSH8CSfZX
        5dmBvnAO5+wB+qZmnXrtsOkfDmmiHKAAPCy1uCi8ykXQL8wxUjh3VxyujChHOEuxezIDYtic4qX+Q
        ud0eNLlg==;
Received: from [192.168.13.184]
        by fanzine2.igalia.com with esmtpsa 
        (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
        id 1qtq9t-0038YA-8Z; Fri, 20 Oct 2023 16:07:25 +0200
Message-ID: <cb9ecb15-1d86-2544-5cb0-cd2dc8ad4c5f@igalia.com>
Date:   Fri, 20 Oct 2023 16:07:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5] alpha: Clean-up the panic notifier code
To:     Petr Mladek <pmladek@suse.com>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     linux-alpha@vger.kernel.org, mattst88@gmail.com,
        linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
        kernel@gpiccoli.net, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Richard Henderson <richard.henderson@linaro.org>
References: <20230902165725.3504046-1-gpiccoli@igalia.com>
 <alpine.DEB.2.21.2310100109100.48714@angie.orcam.me.uk>
 <f5837e2d-2fbd-34f2-37eb-11701db4464e@igalia.com> <ZTIx4-Sn3mzYFzke@alley>
Content-Language: en-US
From:   "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <ZTIx4-Sn3mzYFzke@alley>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On 20/10/2023 09:53, Petr Mladek wrote:
> [...]

OK, thanks folks! I'll resubmit without the includes change =)

Cheers!
